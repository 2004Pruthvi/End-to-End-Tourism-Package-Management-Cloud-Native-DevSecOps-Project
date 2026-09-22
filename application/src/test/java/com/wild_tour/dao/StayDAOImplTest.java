package com.wild_tour.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wild_tour.dto.Stay;

import junit.framework.TestCase;

public class StayDAOImplTest extends TestCase {

    private Stay createStay() {
        Stay s = new Stay();
        s.setStay_id(1);
        s.setName("Forest Retreat");
        s.setImage_url("stay.jpg");
        s.setPrice_per_night(3000.50);
        s.setDescription("A peaceful forest stay");
        return s;
    }

    private Map<String, Object> stayRow() {
        Map<String, Object> row = new HashMap<String, Object>();
        row.put("stay_id", 1);
        row.put("name", "Forest Retreat");
        row.put("image_url", "stay.jpg");
        row.put("price_per_night", 3000.50);
        row.put("description", "A peaceful forest stay");
        return row;
    }

    public void testInsertStaySuccess() {
        StayDAOImpl dao =
            new StayDAOImpl(DaoTestSupport.emptyConnection(1));

        assertTrue(dao.insertStay(createStay()));
    }

    public void testInsertStayFailure() {
        StayDAOImpl dao =
            new StayDAOImpl(DaoTestSupport.emptyConnection(0));

        assertFalse(dao.insertStay(createStay()));
    }

    public void testUpdateStaySuccess() {
        StayDAOImpl dao =
            new StayDAOImpl(DaoTestSupport.emptyConnection(1));

        assertTrue(dao.updateStay(createStay()));
    }

    public void testDeleteStaySuccess() {
        StayDAOImpl dao =
            new StayDAOImpl(DaoTestSupport.emptyConnection(1));

        assertTrue(dao.deleteStay(1));
    }

    public void testDeleteStayFailure() {
        StayDAOImpl dao =
            new StayDAOImpl(DaoTestSupport.emptyConnection(0));

        assertFalse(dao.deleteStay(1));
    }

    public void testGetStayFound() {
        List<Map<String, Object>> rows =
            Collections.singletonList(stayRow());

        StayDAOImpl dao =
            new StayDAOImpl(DaoTestSupport.fakeConnection(0, rows));

        Stay result = dao.getStay(1);

        assertNotNull(result);
        assertEquals(1, result.getStay_id());
        assertEquals("Forest Retreat", result.getName());
        assertEquals("stay.jpg", result.getImage_url());
        assertEquals(3000.50, result.getPrice_per_night(), 0.001);
        assertEquals("A peaceful forest stay", result.getDescription());
    }

    public void testGetStayNotFound() {
        StayDAOImpl dao =
            new StayDAOImpl(DaoTestSupport.emptyConnection(0));

        assertNull(dao.getStay(999));
    }

    public void testGetAllStaysEmpty() {
        StayDAOImpl dao =
            new StayDAOImpl(DaoTestSupport.emptyConnection(0));

        ArrayList<Stay> result = dao.getAllStays();

        assertNotNull(result);
        assertTrue(result.isEmpty());
    }

    public void testGetAllStaysPopulated() {
        Map<String, Object> first = stayRow();

        Map<String, Object> second = new HashMap<String, Object>();
        second.put("stay_id", 2);
        second.put("name", "River Lodge");
        second.put("image_url", "river.jpg");
        second.put("price_per_night", 2200.0);
        second.put("description", "A lodge beside the river");

        List<Map<String, Object>> rows =
            Arrays.asList(first, second);

        StayDAOImpl dao =
            new StayDAOImpl(DaoTestSupport.fakeConnection(0, rows));

        ArrayList<Stay> result = dao.getAllStays();

        assertEquals(2, result.size());
        assertEquals("Forest Retreat", result.get(0).getName());
        assertEquals("River Lodge", result.get(1).getName());
        assertEquals(2, result.get(1).getStay_id());
    }
}
