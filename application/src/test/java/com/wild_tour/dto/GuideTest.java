package com.wild_tour.dto;

import junit.framework.TestCase;

public class GuideTest extends TestCase {

    public void testGuideGettersAndSetters() {
        Guide guide = new Guide();

        guide.setId(1);
        guide.setName("Ravi");
        guide.setBio("Experienced wildlife guide");
        guide.setPrice(1500.50);
        guide.setImage("guide.jpg");

        assertEquals(1, guide.getId());
        assertEquals("Ravi", guide.getName());
        assertEquals("Experienced wildlife guide", guide.getBio());
        assertEquals(1500.50, guide.getPrice(), 0.001);
        assertEquals("guide.jpg", guide.getImage());
    }

    public void testGuideToString() {
        Guide guide = new Guide();

        guide.setId(1);
        guide.setName("Ravi");
        guide.setBio("Experienced wildlife guide");
        guide.setPrice(1500.50);
        guide.setImage("guide.jpg");

        String expected = "Guide [id=1, name=Ravi, bio=Experienced wildlife guide, "
                + "price=1500.5, image=guide.jpg]";

        assertEquals(expected, guide.toString());
    }
}
