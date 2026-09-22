package com.wild_tour.servlet;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.wild_tour.dao.UserDAO;
import com.wild_tour.dto.User;

import junit.framework.TestCase;

public class SignupTest extends TestCase {

    private Map<String, String> parameters;
    private Map<String, Object> attributes;

    private String requestedPage;
    private boolean forwarded;

    private User insertedUser;
    private boolean insertResult;
    private int insertCalls;

    private Signup servlet;

    @Override
    protected void setUp() {
        parameters = new HashMap<String, String>();
        attributes = new HashMap<String, Object>();

        requestedPage = null;
        forwarded = false;

        insertedUser = null;
        insertResult = true;
        insertCalls = 0;

        parameters.put("name", "Test User");
        parameters.put("email", "test@example.com");
        parameters.put("phone", "9876543210");
        parameters.put("pass", "Password@123");
        parameters.put("cpass", "Password@123");
        parameters.put("address", "Bengaluru");

        UserDAO fakeDAO = (UserDAO) Proxy.newProxyInstance(
                UserDAO.class.getClassLoader(),
                new Class<?>[] { UserDAO.class },
                new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxy, Method method,
                                         Object[] args) {

                        if ("insertUser".equals(method.getName())) {
                            insertCalls++;
                            insertedUser = (User) args[0];
                            return insertResult;
                        }

                        Class<?> type = method.getReturnType();

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
                });

        servlet = new Signup(fakeDAO);
    }

    public void testSignupSuccessForwardsToLogin() throws Exception {
        insertResult = true;

        servlet.doPost(request(), response());

        assertEquals(1, insertCalls);
        assertEquals("login.jsp", requestedPage);
        assertTrue(forwarded);
        assertEquals("Data saved successfully",
                attributes.get("success"));
        assertNull(attributes.get("error"));
    }

    public void testSignupFailureForwardsToSignup() throws Exception {
        insertResult = false;

        servlet.doPost(request(), response());

        assertEquals(1, insertCalls);
        assertEquals("signup.jsp", requestedPage);
        assertTrue(forwarded);
        assertEquals("Failed to save data", attributes.get("error"));
        assertNull(attributes.get("success"));
    }

    public void testSignupPassesSubmittedUserDetailsToDAO()
            throws Exception {

        servlet.doPost(request(), response());

        assertNotNull(insertedUser);
        assertEquals("Test User", insertedUser.getUser_name());
        assertEquals("test@example.com", insertedUser.getEmail());
        assertEquals(9876543210L, insertedUser.getPhone());
        assertEquals("Password@123", insertedUser.getPassword());
        assertEquals("Bengaluru", insertedUser.getAddress());
    }

    public void testPasswordMismatchDoesNotInsertUser()
            throws Exception {

        parameters.put("cpass", "DifferentPassword");

        servlet.doPost(request(), response());

        assertEquals(0, insertCalls);
        assertNull(requestedPage);
        assertFalse(forwarded);
    }

    private HttpServletRequest request() {
        return (HttpServletRequest) Proxy.newProxyInstance(
                HttpServletRequest.class.getClassLoader(),
                new Class<?>[] { HttpServletRequest.class },
                new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxy, Method method,
                                         Object[] args) {

                        String name = method.getName();

                        if ("getParameter".equals(name)) {
                            return parameters.get((String) args[0]);
                        }

                        if ("setAttribute".equals(name)) {
                            attributes.put((String) args[0], args[1]);
                            return null;
                        }

                        if ("getRequestDispatcher".equals(name)) {
                            requestedPage = (String) args[0];
                            return dispatcher();
                        }

                        return defaultValue(method.getReturnType());
                    }
                });
    }

    private HttpServletResponse response() {
        return (HttpServletResponse) Proxy.newProxyInstance(
                HttpServletResponse.class.getClassLoader(),
                new Class<?>[] { HttpServletResponse.class },
                new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxy, Method method,
                                         Object[] args) {
                        return defaultValue(method.getReturnType());
                    }
                });
    }

    private RequestDispatcher dispatcher() {
        return (RequestDispatcher) Proxy.newProxyInstance(
                RequestDispatcher.class.getClassLoader(),
                new Class<?>[] { RequestDispatcher.class },
                new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxy, Method method,
                                         Object[] args) {

                        if ("forward".equals(method.getName())) {
                            forwarded = true;
                        }

                        return defaultValue(method.getReturnType());
                    }
                });
    }

    private Object defaultValue(Class<?> type) {
        if (!type.isPrimitive() || type == void.class) return null;
        if (type == boolean.class) return false;
        if (type == char.class) return '\0';
        if (type == byte.class) return (byte) 0;
        if (type == short.class) return (short) 0;
        if (type == int.class) return 0;
        if (type == long.class) return 0L;
        if (type == float.class) return 0f;
        if (type == double.class) return 0d;

        return null;
    }
}
