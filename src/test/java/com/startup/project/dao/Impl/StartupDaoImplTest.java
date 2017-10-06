package com.startup.project.dao.Impl;

import com.startup.project.dao.Impl.config.TestConfiguration;
import com.startup.project.dao.StartupDao;
import com.startup.project.entities.Startup;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

/**
 * Created by Sonik on 06.10.2017.
 */
@RunWith(SpringRunner.class)
@ContextConfiguration(classes = TestConfiguration.class)
public class StartupDaoImplTest {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Startup startup;
    private StartupDao startupDao;

    @Before
    public void setUp() throws Exception {
        session = mock(Session.class);
        when(sessionFactory.getCurrentSession()).thenReturn(session);
        startup = mock(Startup.class);
        startupDao = new StartupDaoImpl(sessionFactory);
    }

    @Test
    public void getStartupOnPage() throws Exception {
        int page = 1;
        int size = 10;

        Criteria criteria = mock(Criteria.class);

        when(session.createCriteria(Startup.class)).thenReturn(criteria);
        when(criteria.setFirstResult((page - 1) * size)).thenReturn(criteria);
        when(criteria.setMaxResults(size)).thenReturn(criteria);

        List<Startup> list = new ArrayList<>();
        List<Startup> spyList = spy(list);
        spyList.add(startup);

        when(criteria.list()).thenReturn(list);

        assertEquals(list, startupDao.getStartupOnPage(page, size));
        assertEquals(startup, spyList.get(0));

        verify(session, atLeastOnce()).createCriteria(Startup.class);
        verify(criteria, times(1)).setFirstResult((page - 1) * size);
        verify(criteria, atLeastOnce()).setMaxResults(size);

    }

    @SuppressWarnings("unchecked")
    @Test
    public void getByIndustry() throws Exception {
        Query<Startup> query = mock(Query.class);

        List<Startup> listMock = mock(List.class);
        when(listMock.get(0)).thenReturn(startup);

        when(session.createQuery("FROM Startup startup WHERE startup.industry=? and startup.id!=? order by id asc", Startup.class)).thenReturn(query);
        when(query.setParameter(0, "someIndustry")).thenReturn(query);
        when(query.setParameter(1, 1)).thenReturn(query);
        when(query.setMaxResults(10)).thenReturn(query);
        when(query.list()).thenReturn(listMock);

        assertEquals(listMock, startupDao.getByIndustry("someIndustry", 10, 1));

        verify(query, atLeastOnce()).setParameter(0, "someIndustry");
        verify(query, atLeastOnce()).setMaxResults(10);
        verify(query, atLeastOnce()).list();
    }

    @SuppressWarnings("unchecked")
    @Test
    public void searchByName() throws Exception {
        Query<Startup> query = mock(Query.class);

        List<Startup> list = new ArrayList<>();
        List<Startup> spyList = spy(list);
        spyList.add(startup);


        when(session.createQuery("from Startup startup where startup.startupName like :name", Startup.class)).thenReturn(query);
        when(query.setParameter("name", "%" + "someName" + "%")).thenReturn(query);
        when(query.list()).thenReturn(spyList);

        assertEquals(spyList, startupDao.searchByName("someName"));
        assertFalse(spyList.isEmpty());

        verify(query, atLeastOnce()).setParameter("name", "%someName%");
        verify(query, atLeastOnce()).list();
    }

    @SuppressWarnings("unchecked")
    @Test
    public void searchByCounty() throws Exception {
        Query<Startup> query = mock(Query.class);

        List<Startup> list = new ArrayList<>();
        List<Startup> spyList = spy(list);
        spyList.add(startup);


        when(session.createQuery("from Startup startup where startup.country like ?", Startup.class)).thenReturn(query);
        when(query.setParameter(0, "%" + "country" + "%")).thenReturn(query);
        when(query.list()).thenReturn(spyList);

        assertEquals(spyList, startupDao.searchByCounty("country"));
        assertEquals(startup, spyList.get(0));

        verify(query, atLeastOnce()).setParameter(0, "%country%");
        verify(query, atLeastOnce()).list();
    }

}