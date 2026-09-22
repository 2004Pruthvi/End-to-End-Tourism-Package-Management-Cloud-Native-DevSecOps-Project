
package com.wild_tour.dao;

import com.wild_tour.dto.User;
import java.lang.reflect.Proxy;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.util.ArrayList;
import junit.framework.TestCase;

public class UserDAOImplTest extends TestCase {

    private Connection fakeConnection(final int updateResult) {
        InvocationHandler handler = new InvocationHandler() {
            public Object invoke(Object proxy, Method method, Object[] args) {
                if (method.getName().equals("prepareStatement")) {

                    final ResultSet fakeResultSet =
                        (ResultSet) Proxy.newProxyInstance(
                            ResultSet.class.getClassLoader(),
                            new Class[] { ResultSet.class },
                            (p, m, a) -> {
                                if (m.getName().equals("next")) {
                                    return false;
                                }
                                return null;
                            }
                        );

                    return Proxy.newProxyInstance(
                        PreparedStatement.class.getClassLoader(),
                        new Class[] { PreparedStatement.class },
                        (p, m, a) -> {
                            if (m.getName().equals("executeUpdate")) {
                                return updateResult;
                            }
                            if (m.getName().equals("executeQuery")) {
                                return fakeResultSet;
                            }
                            return null;
                        }
                    );
                }
                return null;
            }
        };

        return (Connection) Proxy.newProxyInstance(
            Connection.class.getClassLoader(),
            new Class[] { Connection.class },
            handler
        );
    }

    private Connection fakeConnectionWithUser() {
        final boolean[] firstRow = { true };

        final ResultSet fakeResultSet =
            (ResultSet) Proxy.newProxyInstance(
                ResultSet.class.getClassLoader(),
                new Class[] { ResultSet.class },
                (p, m, a) -> {
                    if (m.getName().equals("next")) {
                        if (firstRow[0]) {
                            firstRow[0] = false;
                            return true;
                        }
                        return false;
                    }

                    if (m.getName().equals("getInt")) {
                        return 7;
                    }

                    if (m.getName().equals("getLong")) {
                        return 9876543210L;
                    }

                    if (m.getName().equals("getString")) {
                        switch ((String) a[0]) {
                            case "user_name": return "Test User";
                            case "email": return "test@example.com";
                            case "password": return "test123";
                            case "address": return "Test Address";
                        }
                    }

                    return null;
                }
            );

        return (Connection) Proxy.newProxyInstance(
            Connection.class.getClassLoader(),
            new Class[] { Connection.class },
            (p, m, a) -> {
                if (m.getName().equals("prepareStatement")) {
                    return Proxy.newProxyInstance(
                        PreparedStatement.class.getClassLoader(),
                        new Class[] { PreparedStatement.class },
                        (ps, pm, pa) -> {
                            if (pm.getName().equals("executeQuery")) {
                                return fakeResultSet;
                            }
                            return null;
                        }
                    );
                }
                return null;
            }
        );
    }

    public void testInsertUserReturnsTrueWhenRowInserted() {
        User user = new User();
        user.setUser_name("Test User");
        user.setEmail("test@example.com");
        user.setPassword("test123");
        user.setPhone(9876543210L);
        user.setAddress("Test Address");

        UserDAOImpl dao = new UserDAOImpl(fakeConnection(1));
        assertTrue(dao.insertUser(user));
    }

    public void testInsertUserReturnsFalseWhenNoRowInserted() {
        User user = new User();
        user.setUser_name("Test User");
        user.setEmail("test@example.com");
        user.setPassword("test123");
        user.setPhone(9876543210L);
        user.setAddress("Test Address");

        UserDAOImpl dao = new UserDAOImpl(fakeConnection(0));
        assertFalse(dao.insertUser(user));
    }

    public void testUpdateUserReturnsTrueWhenRowUpdated() {
        User user = new User();
        user.setUserId(1);
        user.setUser_name("Updated User");
        user.setEmail("updated@example.com");
        user.setPassword("test123");
        user.setPhone(9876543210L);
        user.setAddress("Updated Address");

        UserDAOImpl dao = new UserDAOImpl(fakeConnection(1));
        assertTrue(dao.updateUser(user));
    }

    public void testUpdateUserReturnsFalseWhenNoRowUpdated() {
        User user = new User();
        user.setUserId(1);
        user.setUser_name("Updated User");
        user.setEmail("updated@example.com");
        user.setPassword("test123");
        user.setPhone(9876543210L);
        user.setAddress("Updated Address");

        UserDAOImpl dao = new UserDAOImpl(fakeConnection(0));
        assertFalse(dao.updateUser(user));
    }

    public void testDeleteUserReturnsTrueWhenRowDeleted() {
        User user = new User();
        user.setUserId(1);

        UserDAOImpl dao = new UserDAOImpl(fakeConnection(1));
        assertTrue(dao.deleteUser(user));
    }

    public void testDeleteUserReturnsFalseWhenNoRowDeleted() {
        User user = new User();
        user.setUserId(1);

        UserDAOImpl dao = new UserDAOImpl(fakeConnection(0));
        assertFalse(dao.deleteUser(user));
    }

    public void testGetUserReturnsNullWhenUserNotFound() {
        UserDAOImpl dao = new UserDAOImpl(fakeConnection(0));

        User user = dao.getUser("missing@example.com", "wrong123");

        assertNull(user);
    }

    public void testGetUserReturnsUserWhenFound() {
        UserDAOImpl dao = new UserDAOImpl(fakeConnectionWithUser());

        User user = dao.getUser("test@example.com", "test123");

        assertNotNull(user);
        assertEquals(7, user.getUserId());
        assertEquals("Test User", user.getUser_name());
        assertEquals("test@example.com", user.getEmail());
        assertEquals("test123", user.getPassword());
        assertEquals(9876543210L, user.getPhone());
        assertEquals("Test Address", user.getAddress());
    }

    public void testGetAllUsersReturnsEmptyListWhenNoUsersFound() {
        UserDAOImpl dao = new UserDAOImpl(fakeConnection(0));

        ArrayList<User> users = dao.getAllUsers();

        assertNotNull(users);
        assertTrue(users.isEmpty());
    }

    public void testGetAllUsersReturnsUsersWhenFound() {
        UserDAOImpl dao = new UserDAOImpl(fakeConnectionWithUser());

        ArrayList<User> users = dao.getAllUsers();

        assertNotNull(users);
        assertEquals(1, users.size());

        User user = users.get(0);

        assertEquals(7, user.getUserId());
        assertEquals("Test User", user.getUser_name());
        assertEquals("test@example.com", user.getEmail());
        assertEquals("test123", user.getPassword());
        assertEquals(9876543210L, user.getPhone());
        assertEquals("Test Address", user.getAddress());
    }
}

