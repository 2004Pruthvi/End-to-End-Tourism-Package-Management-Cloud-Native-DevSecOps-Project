package com.wild_tour.dto;

import junit.framework.TestCase;

public class PackagesTest extends TestCase {

    public void testPackagesGettersAndSetters() {
        Packages packages = new Packages();

        packages.setPackage_id(1);
        packages.setName("Wildlife Safari");
        packages.setImage_url("safari.jpg");
        packages.setPrice(2500.50);
        packages.setDescription("A wildlife tour package");

        assertEquals(1, packages.getPackage_id());
        assertEquals("Wildlife Safari", packages.getName());
        assertEquals("safari.jpg", packages.getImage_url());
        assertEquals(2500.50, packages.getPrice(), 0.001);
        assertEquals("A wildlife tour package",
                packages.getDescription());
    }

    public void testPackagesToString() {
        Packages packages = new Packages();

        packages.setPackage_id(1);
        packages.setName("Wildlife Safari");
        packages.setImage_url("safari.jpg");
        packages.setPrice(2500.50);
        packages.setDescription("A wildlife tour package");

        String expected = "Packages [package_id=1, name=Wildlife Safari, "
                + "image_url=safari.jpg, price=2500.5, "
                + "description=A wildlife tour package]";

        assertEquals(expected, packages.toString());
    }
}
