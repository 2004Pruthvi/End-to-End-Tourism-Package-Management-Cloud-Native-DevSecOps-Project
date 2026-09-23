
package com.wild_tour.servlet;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;

import com.wild_tour.dao.UserDAO;
import com.wild_tour.dto.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import junit.framework.TestCase;

public class ForgotPasswordTest extends TestCase {

    private User existingUser;
    private UserDAO userDAO;

    private Map<String, String> parameters;
    private Map<String, Object> attributes;

    private String forwardedPath;
    private boolean forwarded;

    private boolean updateResult;
    private boolean updateCalled;
    private User updatedUser;

    private long capturedPhone;
    private String capturedEmail;

    private ForgotPassword servlet;

    @Override
    protected void setUp() {
        existingUser = new User();

        parameters = new HashMap<String, String>();
        parameters.put("phone", "9876543210");
        parameters.put("email", "test@example.com");
        parameters.put("password", "newPassword123");
        parameters.put("cpassword", "newPassword123");

        attributes = new HashMap<String, Object>();

        forwardedPath = null;
        forwarded = false;
        updateResult = true;
        updateCalled = false;
        updatedUser = null;

        capturedPhone = 0;
        capturedEmail = null;

        createDAO(existingUser);
        servlet = new ForgotPassword(userDAO);
    }

    private void createDAO(final User userToReturn) {
        userDAO = (UserDAO) Proxy.newProxyInstance(
                UserDAO.class.getClassLoader(),
                new Class<?>[] { UserDAO.class },
                new InvocationHandler() {
                    @Override
                    public Object invoke(
                            Object proxy, Method method, Object[] args) {

                        if ("getUser".equals(method.getName())) {
                            capturedPhone = (Long) args[0];
                            capturedEmail = (String) args[1];
                            return userToReturn;
                        }

                        if ("updateUser".equals(method.getName())) {
                            updateCalled = true;
                            updatedUser = (User) args[0];
                            return updateResult;
                        }

                        return defaultValue(method.getReturnType());
                    }
                });
    }

    private HttpServletRequest createRequest() {
        final RequestDispatcher dispatcher =
                (RequestDispatcher) Proxy.newProxyInstance(
                        RequestDispatcher.class.getClassLoader(),
                        new Class<?>[] { RequestDispatcher.class },
                        new InvocationHandler() {
                            @Override
                            public Object invoke(
                                    Object proxy,
                                    Method method,
                                    Object[] args) {

                                if ("forward".equals(method.getName())) {
                                    forwarded = true;
                                }

                                return null;
                            }
                        });

        return (HttpServletRequest) Proxy.newProxyInstance(
                HttpServletRequest.class.getClassLoader(),
                new Class<?>[] { HttpServletRequest.class },
                new InvocationHandler() {
                    @Override
                    public Object invoke(
                            Object proxy, Method method, Object[] args) {

                        String name = method.getName();

                        if ("getParameter".equals(name)) {
                            return parameters.get((String) args[0]);
                        }

                        if ("setAttribute".equals(name)) {
                            attributes.put(
                                    (String) args[0], args[1]);
                            return null;
                        }

                        if ("getRequestDispatcher".equals(name)) {
                            forwardedPath = (String) args[0];
                            return dispatcher;
                        }

                        return defaultValue(method.getReturnType());
                    }
                });
    }

    private HttpServletResponse createResponse() {
        return (HttpServletResponse) Proxy.newProxyInstance(
                HttpServletResponse.class.getClassLoader(),
                new Class<?>[] { HttpServletResponse.class },
                new InvocationHandler() {
                    @Override
                    public Object invoke(
                            Object proxy, Method method, Object[] args) {
                        return defaultValue(method.getReturnType());
                    }
                });
    }

    private Object defaultValue(Class<?> type) {
        if (!type.isPrimitive() || type == void.class) {
            return null;
        }

        if (type == boolean.class) return false;
        if (type == byte.class) return (byte) 0;
        if (type == short.class) return (short) 0;
        if (type == int.class) return 0;
        if (type == long.class) return 0L;
        if (type == float.class) return 0F;
        if (type == double.class) return 0D;
        if (type == char.class) return '\0';

        return null;
    }

    private void executeServlet() throws Exception {
        servlet.doPost(createRequest(), createResponse());
    }

    public void testPasswordUpdateSuccess() throws Exception {
        executeServlet();

        assertTrue(updateCalled);
        assertEquals("Password updated Successfully",
                attributes.get("success"));
        assertEquals("forgot.jsp", forwardedPath);
        assertTrue(forwarded);
    }

    public void testPasswordUpdateFailure() throws Exception {
        updateResult = false;
        executeServlet();

        assertTrue(updateCalled);
        assertEquals("Fail to update Password",
                attributes.get("error"));
        assertEquals("forgot.jsp", forwardedPath);
        assertTrue(forwarded);
    }

    public void testPasswordMismatchDoesNotUpdate() throws Exception {
        parameters.put("cpassword", "differentPassword");

        executeServlet();

        assertFalse(updateCalled);
        assertEquals("mismatch", attributes.get("error"));
        assertEquals("forgot.jsp", forwardedPath);
        assertTrue(forwarded);
    }

    public void testUserNotFound() throws Exception {
        createDAO(null);
        servlet = new ForgotPassword(userDAO);

        executeServlet();

        assertFalse(updateCalled);
        assertEquals("user not found", attributes.get("error"));
        assertEquals("forgot.jsp", forwardedPath);
        assertTrue(forwarded);
    }

    public void testPhoneAndEmailPassedToDAO() throws Exception {
        executeServlet();

        assertEquals(9876543210L, capturedPhone);
        assertEquals("test@example.com", capturedEmail);
    }

    public void testNewPasswordSetBeforeUpdatingUser()
            throws Exception {
        executeServlet();

        assertTrue(updateCalled);
        assertNotNull(updatedUser);
        assertEquals("newPassword123", updatedUser.getPassword());
    }
}
