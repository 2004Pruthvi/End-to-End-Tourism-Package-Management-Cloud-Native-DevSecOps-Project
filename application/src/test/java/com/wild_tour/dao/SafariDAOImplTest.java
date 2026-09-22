package com.wild_tour.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wild_tour.dto.Safari;

import junit.framework.TestCase;

public class SafariDAOImplTest extends TestCase {

    private Safari createSafari() {
        Safari s = new Safari();
        s.setSafari_id(1);
        s.setName("Jungle Safari");
        s.setImage_url("safari.jpg");
        s.setPrice_per_seat(1500.50);
        s.setDescription("A jungle safari experience");
        return s;
    }

    private Map<String, Object> safariRow() {
        Map<String, Object> row = new HashMap<String, Object>();
        row.put("safari_id", 1);
        row.put("name", "Jungle Safari");
        row.put("image_url", "safari.jpg");
        row.put("price_per_seat", 1500.50);
        row.put("description", "A jungle safari experience");
        return row;
    }

    public void testInsertSafariSuccess() {
        SafariDAOImpl dao =
            new SafariDAOImpl(DaoTestSupport.emptyConnection(1));

        assertTrue(dao.insertSafari(createSafari()));
    }

    public void testInsertSafariFailure() {
        SafariDAOImpl dao =
            new SafariDAOImpl(DaoTestSupport.emptyConnection(0));

        assertFalse(dao.insertSafari(createSafari()));
    }

    public void testUpdateSafariSuccess() {
        SafariDAOImpl dao =
            new SafariDAOImpl(DaoTestSupport.emptyConnection(1));

        assertTrue(dao.updateSafari(createSafari()));
    }

    public void testDeleteSafariSuccess() {
        SafariDAOImpl dao =
            new SafariDAOImpl(DaoTestSupport.emptyConnection(1));

        assertTrue(dao.deleteSafari(1));
    }

    public void testDeleteSafariFailure() {
        SafariDAOImpl dao =
            new SafariDAOImpl(DaoTestSupport.emptyConnection(0));

        assertFalse(dao.deleteSafari(1));
    }

    public void testGetSafariFound() {
        List<Map<String, Object>> rows =
            Collections.singletonList(safariRow());

        SafariDAOImpl dao =
            new SafariDAOImpl(DaoTestSupport.fakeConnection(0, rows));

        Safari result = dao.getSafari(1);

        assertNotNull(result);
        assertEquals(1, result.getSafari_id());
        assertEquals("Jungle Safari", result.getName());
        assertEquals("safari.jpg", result.getImage_url());
        assertEquals(1500.50, result.getPrice_per_seat(), 0.001);
        assertEquals("A jungle safari experience", result.getDescription());
    }

    public void testGetSafariNotFound() {
        SafariDAOImpl dao =
            new SafariDAOImpl(DaoTestSupport.emptyConnection(0));

        assertNull(dao.getSafari(999));
    }

    public void testGetAllSafarisEmpty() {
        SafariDAOImpl dao =
            new SafariDAOImpl(DaoTestSupport.emptyConnection(0));

        ArrayList<Safari> result = dao.getAllSafaris();

        assertNotNull(result);
        assertTrue(result.isEmpty());
    }

    public void testGetAllSafarisPopulated() {
        Map<String, Object> first = safariRow();

        Map<String, Object> second = new HashMap<String, Object>();
        second.put("safari_id", 2);
        second.put("name", "Elephant Safari");
        second.put("image_url", "elephant.jpg");
        second.put("price_per_seat", 2000.0);
        second.put("description", "An elephant safari");

        List<Map<String, Object>> rows =
            Arrays.asList(first, second);

        SafariDAOImpl dao =
            new SafariDAOImpl(DaoTestSupport.fakeConnection(0, rows));

        ArrayList<Safari> result = dao.getAllSafaris();

        assertEquals(2, result.size());
        assertEquals("Jungle Safari", result.get(0).getName());
        assertEquals("Elephant Safari", result.get(1).getName());
        assertEquals(2, result.get(1).getSafari_id());
    }
}
