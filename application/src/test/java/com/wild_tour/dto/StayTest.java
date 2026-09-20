package com.wild_tour.dto;

import junit.framework.TestCase;

public class StayTest extends TestCase {

    public void testStayGettersAndSetters() {
        Stay stay = new Stay();

        stay.setStay_id(1);
        stay.setName("Forest Resort");
        stay.setImage_url("forest.jpg");
        stay.setPrice_per_night(3500.50);
        stay.setDescription("A peaceful forest stay");

        assertEquals(1, stay.getStay_id());
        assertEquals("Forest Resort", stay.getName());
        assertEquals("forest.jpg", stay.getImage_url());
        assertEquals(3500.50, stay.getPrice_per_night(), 0.001);
        assertEquals("A peaceful forest stay", stay.getDescription());
    }

    public void testStayToString() {
        Stay stay = new Stay();

        stay.setStay_id(1);
        stay.setName("Forest Resort");
        stay.setImage_url("forest.jpg");
        stay.setPrice_per_night(3500.50);
        stay.setDescription("A peaceful forest stay");

        String expected = "Stay [stay_id=1, name=Forest Resort, "
                + "image_url=forest.jpg, price_per_night=3500.5, "
                + "description=A peaceful forest stay]";

        assertEquals(expected, stay.toString());
    }
}
