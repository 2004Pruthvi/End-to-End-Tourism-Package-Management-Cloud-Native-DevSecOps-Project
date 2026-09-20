package com.wild_tour.dto;

import junit.framework.TestCase;

public class UserTest extends TestCase {

    public void testUserConstructorAndGetters() {
        User user = new User(
            1,
            "Pruthvi",
            "pruthvi@example.com",
            9876543210L,
            "password123",
            "Hospet"
        );

        assertEquals(1, user.getUserId());
        assertEquals("Pruthvi", user.getUser_name());
        assertEquals("pruthvi@example.com", user.getEmail());
        assertEquals(9876543210L, user.getPhone());
        assertEquals("password123", user.getPassword());
        assertEquals("Hospet", user.getAddress());
    }

    public void testUserSetters() {
        User user = new User();

        user.setUserId(2);
        user.setUser_name("Test User");
        user.setEmail("test@example.com");
        user.setPhone(9123456780L);
        user.setPassword("test123");
        user.setAddress("Bengaluru");

        assertEquals(2, user.getUserId());
        assertEquals("Test User", user.getUser_name());
        assertEquals("test@example.com", user.getEmail());
        assertEquals(9123456780L, user.getPhone());
        assertEquals("test123", user.getPassword());
        assertEquals("Bengaluru", user.getAddress());
    }
}
