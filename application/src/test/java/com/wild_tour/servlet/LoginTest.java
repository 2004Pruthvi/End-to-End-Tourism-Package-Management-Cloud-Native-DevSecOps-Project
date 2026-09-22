package com.wild_tour.servlet;

import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.wild_tour.dao.UserDAO;
import com.wild_tour.dto.User;

import junit.framework.TestCase;

public class LoginTest extends TestCase {

    private static final String EMAIL = "test@example.com";
    private static final String PASSWORD = "test123";

    private FakeUserDAO fakeDAO;
    private Login login;

    private Map<String, Object> requestAttributes;
    private Map<String, Object> sessionAttributes;

    private String[] requestedPage;
    private boolean[] forwardCalled;

    private HttpServletRequest request;
    private HttpServletResponse response;

    @Override
    protected void setUp() {
        fakeDAO = new FakeUserDAO();
        login = new Login(fakeDAO);

        requestAttributes = new HashMap<>();
        sessionAttributes = new HashMap<>();

        requestedPage = new String[1];
        forwardCalled = new boolean[1];

        HttpSession session = (HttpSession) Proxy.newProxyInstance(
                HttpSession.class.getClassLoader(),
                new Class<?>[] { HttpSession.class },
                (proxy, method, args) -> {
                    if ("setAttribute".equals(method.getName())) {
                        sessionAttributes.put(
                                (String) args[0], args[1]);
                    }
                    return defaultValue(method.getReturnType());
                });

        RequestDispatcher dispatcher = (RequestDispatcher) Proxy.newProxyInstance(
                RequestDispatcher.class.getClassLoader(),
                new Class<?>[] { RequestDispatcher.class },
                (proxy, method, args) -> {
                    if ("forward".equals(method.getName())) {
                        forwardCalled[0] = true;
                    }
                    return defaultValue(method.getReturnType());
                });

        request = (HttpServletRequest) Proxy.newProxyInstance(
                HttpServletRequest.class.getClassLoader(),
                new Class<?>[] { HttpServletRequest.class },
                (proxy, method, args) -> {
                    switch (method.getName()) {
                        case "getSession":
                            return session;

                        case "getParameter":
                            if ("mail".equals(args[0])) {
                                return EMAIL;
                            }
                            if ("pass".equals(args[0])) {
                                return PASSWORD;
                            }
                            return null;

                        case "setAttribute":
                            requestAttributes.put(
                                    (String) args[0], args[1]);
                            return null;

                        case "getAttribute":
                            return requestAttributes.get(args[0]);

                        case "getRequestDispatcher":
                            requestedPage[0] = (String) args[0];
                            return dispatcher;

                        default:
                            return defaultValue(method.getReturnType());
                    }
                });

        response = (HttpServletResponse) Proxy.newProxyInstance(
                HttpServletResponse.class.getClassLoader(),
                new Class<?>[] { HttpServletResponse.class },
                (proxy, method, args) ->
                        defaultValue(method.getReturnType()));
    }

    public void testSuccessfulLogin() throws Exception {
        User user = new User(
                1, "Test User", EMAIL, 9876543210L,
                PASSWORD, "Test Address");

        fakeDAO.userToReturn = user;

        login.doPost(request, response);

        assertSame(user, sessionAttributes.get("user"));
        assertEquals("Login Successful!",
                requestAttributes.get("success"));
        assertEquals("dashboard.jsp", requestedPage[0]);
        assertTrue(forwardCalled[0]);
    }

    public void testFailedLogin() throws Exception {
        fakeDAO.userToReturn = null;

        login.doPost(request, response);

        assertEquals("Invalid Email or Password!",
                requestAttributes.get("fail"));
        assertEquals("login.jsp", requestedPage[0]);
        assertTrue(forwardCalled[0]);
        assertNull(sessionAttributes.get("user"));
    }

    public void testLoginPassesEmailAndPasswordToDAO()
            throws Exception {

        fakeDAO.userToReturn = null;

        login.doPost(request, response);

        assertEquals(EMAIL, fakeDAO.receivedEmail);
        assertEquals(PASSWORD, fakeDAO.receivedPassword);
    }

    private static Object defaultValue(Class<?> type) {
        if (!type.isPrimitive() || type == void.class) {
            return null;
        }
        if (type == boolean.class) return false;
        if (type == int.class) return 0;
        if (type == long.class) return 0L;
        if (type == double.class) return 0.0;
        if (type == float.class) return 0.0f;
        if (type == short.class) return (short) 0;
        if (type == byte.class) return (byte) 0;
        if (type == char.class) return '\0';

        return null;
    }

    private class FakeUserDAO implements UserDAO {

        private User userToReturn;
        private String receivedEmail;
        private String receivedPassword;

        @Override
        public User getUser(String email, String password) {
            receivedEmail = email;
            receivedPassword = password;
            return userToReturn;
        }

        @Override
        public boolean insertUser(User user) {
            return false;
        }

        @Override
        public boolean updateUser(User user) {
            return false;
        }

        @Override
        public boolean deleteUser(User user) {
            return false;
        }

        @Override
        public User getUser(long phone, String email) {
            return null;
        }

        @Override
        public ArrayList<User> getAllUsers() {
            return new ArrayList<>();
        }
    }
}
