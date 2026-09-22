package com.wild_tour.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wild_tour.dto.Packages;

import junit.framework.TestCase;

public class PackagesDAOImplTest extends TestCase {

    private Packages createPackage() {
        Packages p = new Packages();
        p.setPackage_id(1);
        p.setName("Wildlife Explorer");
        p.setImage_url("wildlife.jpg");
        p.setPrice(2500.50);
        p.setDescription("A wildlife tour package");
        return p;
    }

    private Map<String, Object> packageRow() {
        Map<String, Object> row = new HashMap<String, Object>();
        row.put("package_id", 1);
        row.put("name", "Wildlife Explorer");
        row.put("image_url", "wildlife.jpg");
        row.put("price", 2500.50);
        row.put("description", "A wildlife tour package");
        return row;
    }

    public void testInsertTourPackageSuccess() {
        PackagesDAOImpl dao =
            new PackagesDAOImpl(DaoTestSupport.emptyConnection(1));

        assertTrue(dao.insertTourPackage(createPackage()));
    }

    public void testInsertTourPackageFailure() {
        PackagesDAOImpl dao =
            new PackagesDAOImpl(DaoTestSupport.emptyConnection(0));

        assertFalse(dao.insertTourPackage(createPackage()));
    }

    public void testUpdateTourPackageSuccess() {
        PackagesDAOImpl dao =
            new PackagesDAOImpl(DaoTestSupport.emptyConnection(1));

        assertTrue(dao.updateTourPackage(createPackage()));
    }

    public void testDeleteTourPackageSuccess() {
        PackagesDAOImpl dao =
            new PackagesDAOImpl(DaoTestSupport.emptyConnection(1));

        assertTrue(dao.deleteTourPackage(1));
    }

    public void testDeleteTourPackageFailure() {
        PackagesDAOImpl dao =
            new PackagesDAOImpl(DaoTestSupport.emptyConnection(0));

        assertFalse(dao.deleteTourPackage(1));
    }

    public void testGetTourPackageFound() {
        List<Map<String, Object>> rows =
            Collections.singletonList(packageRow());

        PackagesDAOImpl dao =
            new PackagesDAOImpl(DaoTestSupport.fakeConnection(0, rows));

        Packages result = dao.getTourPackage(1);

        assertNotNull(result);
        assertEquals(1, result.getPackage_id());
        assertEquals("Wildlife Explorer", result.getName());
        assertEquals("wildlife.jpg", result.getImage_url());
        assertEquals(2500.50, result.getPrice(), 0.001);
        assertEquals("A wildlife tour package", result.getDescription());
    }

    public void testGetTourPackageNotFound() {
        PackagesDAOImpl dao =
            new PackagesDAOImpl(DaoTestSupport.emptyConnection(0));

        assertNull(dao.getTourPackage(999));
    }

    public void testGetAllTourPackagesEmpty() {
        PackagesDAOImpl dao =
            new PackagesDAOImpl(DaoTestSupport.emptyConnection(0));

        ArrayList<Packages> result = dao.getAllTourPackages();

        assertNotNull(result);
        assertTrue(result.isEmpty());
    }

    public void testGetAllTourPackagesPopulated() {
        Map<String, Object> first = packageRow();

        Map<String, Object> second = new HashMap<String, Object>();
        second.put("package_id", 2);
        second.put("name", "Forest Adventure");
        second.put("image_url", "forest.jpg");
        second.put("price", 1800.0);
        second.put("description", "A forest adventure");

        List<Map<String, Object>> rows =
            Arrays.asList(first, second);

        PackagesDAOImpl dao =
            new PackagesDAOImpl(DaoTestSupport.fakeConnection(0, rows));

        ArrayList<Packages> result = dao.getAllTourPackages();

        assertEquals(2, result.size());
        assertEquals("Wildlife Explorer", result.get(0).getName());
        assertEquals("Forest Adventure", result.get(1).getName());
        assertEquals(2, result.get(1).getPackage_id());
    }
}
