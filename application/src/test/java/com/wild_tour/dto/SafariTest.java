package com.wild_tour.dto;

import junit.framework.TestCase;

public class SafariTest extends TestCase {

    public void testSafariGettersAndSetters() {
        Safari safari = new Safari();

        safari.setSafari_id(1);
        safari.setName("Jungle Safari");
        safari.setImage_url("jungle.jpg");
        safari.setPrice_per_seat(1200.50);
        safari.setDescription("Wildlife safari experience");

        assertEquals(1, safari.getSafari_id());
        assertEquals("Jungle Safari", safari.getName());
        assertEquals("jungle.jpg", safari.getImage_url());
        assertEquals(1200.50, safari.getPrice_per_seat(), 0.001);
        assertEquals("Wildlife safari experience",
                safari.getDescription());
    }

    public void testSafariToString() {
        Safari safari = new Safari();

        safari.setSafari_id(1);
        safari.setName("Jungle Safari");
        safari.setImage_url("jungle.jpg");
        safari.setPrice_per_seat(1200.50);
        safari.setDescription("Wildlife safari experience");

        String expected = "Safari [safari_id=1, name=Jungle Safari, "
                + "image_url=jungle.jpg, price_per_seat=1200.5, "
                + "description=Wildlife safari experience]";

        assertEquals(expected, safari.toString());
    }
}
