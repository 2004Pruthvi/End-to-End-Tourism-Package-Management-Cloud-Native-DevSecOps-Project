package com.wild_tour.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wild_tour.dto.Guide;

import junit.framework.TestCase;

public class GuideDAOImplTest extends TestCase {

    private Guide createGuide() {
        Guide g = new Guide();
        g.setId(1);
        g.setName("Ravi Kumar");
        g.setBio("Experienced wildlife guide");
        g.setPrice(1200.50);
        g.setImage("guide.jpg");
        return g;
    }

    private Map<String, Object> guideRow() {
        Map<String, Object> row = new HashMap<String, Object>();
        row.put("id", 1);
        row.put("name", "Ravi Kumar");
        row.put("bio", "Experienced wildlife guide");
        row.put("price", 1200.50);
        row.put("image", "guide.jpg");
        return row;
    }

    public void testInsertGuideSuccess() {
        GuideDAOImpl dao =
            new GuideDAOImpl(DaoTestSupport.emptyConnection(1));

        assertTrue(dao.insertGuide(createGuide()));
    }

    public void testInsertGuideFailure() {
        GuideDAOImpl dao =
            new GuideDAOImpl(DaoTestSupport.emptyConnection(0));

        assertFalse(dao.insertGuide(createGuide()));
    }

    public void testUpdateGuideSuccess() {
        GuideDAOImpl dao =
            new GuideDAOImpl(DaoTestSupport.emptyConnection(1));

        assertTrue(dao.updateGuide(createGuide()));
    }

    public void testDeleteGuideSuccess() {
        GuideDAOImpl dao =
            new GuideDAOImpl(DaoTestSupport.emptyConnection(1));

        assertTrue(dao.deleteGuide(1));
    }

    public void testDeleteGuideFailure() {
        GuideDAOImpl dao =
            new GuideDAOImpl(DaoTestSupport.emptyConnection(0));

        assertFalse(dao.deleteGuide(1));
    }

    public void testGetGuideFound() {
        List<Map<String, Object>> rows =
            Collections.singletonList(guideRow());

        GuideDAOImpl dao =
            new GuideDAOImpl(DaoTestSupport.fakeConnection(0, rows));

        Guide result = dao.getGuide(1);

        assertNotNull(result);
        assertEquals(1, result.getId());
        assertEquals("Ravi Kumar", result.getName());
        assertEquals("Experienced wildlife guide", result.getBio());
        assertEquals(1200.50, result.getPrice(), 0.001);
        assertEquals("guide.jpg", result.getImage());
    }

    public void testGetGuideNotFound() {
        GuideDAOImpl dao =
            new GuideDAOImpl(DaoTestSupport.emptyConnection(0));

        assertNull(dao.getGuide(999));
    }

    public void testGetAllGuidesEmpty() {
        GuideDAOImpl dao =
            new GuideDAOImpl(DaoTestSupport.emptyConnection(0));

        ArrayList<Guide> result = dao.getAllGuides();

        assertNotNull(result);
        assertTrue(result.isEmpty());
    }

    public void testGetAllGuidesPopulated() {
        Map<String, Object> first = guideRow();

        Map<String, Object> second = new HashMap<String, Object>();
        second.put("id", 2);
        second.put("name", "Anil Sharma");
        second.put("bio", "Forest and birding guide");
        second.put("price", 1800.0);
        second.put("image", "anil.jpg");

        List<Map<String, Object>> rows =
            Arrays.asList(first, second);

        GuideDAOImpl dao =
            new GuideDAOImpl(DaoTestSupport.fakeConnection(0, rows));

        ArrayList<Guide> result = dao.getAllGuides();

        assertEquals(2, result.size());
        assertEquals("Ravi Kumar", result.get(0).getName());
        assertEquals("Anil Sharma", result.get(1).getName());
        assertEquals(2, result.get(1).getId());
    }
}
