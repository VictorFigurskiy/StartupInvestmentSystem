package com.startup.project.dao.Impl;

import com.startup.project.dao.Impl.config.TestConfiguration;
import com.startup.project.dao.StartupDetailDao;
import com.startup.project.entities.StartupDetail;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

/**
 * Created by Sonik on 05.10.2017.
 */
@RunWith(SpringRunner.class)
@ContextConfiguration(classes = TestConfiguration.class)
public class StartupDetailDaoImplTest {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private StartupDetailDao startupDetailDao;
    private StartupDetail startupDetail;

    @Before
    public void setUp() throws Exception {
        session = mock(Session.class);
        when(sessionFactory.getCurrentSession()).thenReturn(session);
        startupDetail = mock(StartupDetail.class);
        startupDetailDao = new StartupDetailDaoImpl(sessionFactory);
    }

    @After
    public void tearDown() throws Exception {
        session.close();
        sessionFactory.close();
    }

    @Test
    public void getById() throws Exception {
        when(session.get(StartupDetail.class, 1)).thenReturn(startupDetail);

        assertEquals("Must get startupDetail", startupDetail, startupDetailDao.getById(StartupDetail.class, 1));

        verify(session, times(1)).get(StartupDetail.class, 1);
    }

    @Test(expected = NullPointerException.class)
    public void getByIdException() throws Exception {
        when(session.get(StartupDetail.class, 0)).thenReturn(null);
        when(startupDetail.getBusinessModel()).thenThrow(new NullPointerException());

        assertNull("Must get NullPointerException", startupDetailDao.getById(StartupDetail.class, 0));

        verify(session, atLeastOnce()).get(StartupDetail.class, 0);
        startupDetail.getBusinessModel();
    }

    @Test
    public void getAll() throws Exception {
        List<StartupDetail> mockList = mock(List.class);
        when(mockList.get(0)).thenReturn(startupDetail);
        when(mockList.get(1)).thenReturn(null);

        Criteria criteria = mock(Criteria.class);

        when(session.createCriteria(StartupDetail.class)).thenReturn(criteria);
        when(criteria.list()).thenReturn(mockList);

        assertEquals("Must get list", mockList, startupDetailDao.getAll(StartupDetail.class));
        assertFalse(mockList.isEmpty());
        assertNull("Here must be null", mockList.get(1));
        assertNotNull("Here is a product", mockList.get(0));
        assertEquals(startupDetail, mockList.get(0));

        verify(criteria, times(1)).list();
        verify(mockList, atLeast(2)).get(0);
        verify(session, atMost(1)).createCriteria(StartupDetail.class);
    }

    @Test
    public void save() throws Exception {
        when(startupDetail.getProperty()).thenReturn("TOB");

        doAnswer(invocation -> {
            StartupDetail startupDetail = invocation.getArgument(0);
            assertEquals("TOB", startupDetail.getProperty());
            return null;
        }).when(session).save(startupDetail);

        startupDetailDao.save(startupDetail);

        verify(session, atLeastOnce()).save(startupDetail);
    }

    @Test(expected = SecurityException.class)
    public void saveException() throws Exception {

        doThrow(new SecurityException()).when(session).save(startupDetail);

        startupDetailDao.save(startupDetail);
    }

    @Test(timeout = 600)
    public void SaveSpy() throws Exception {
        StartupDetailDao dao = new StartupDetailDaoImpl(sessionFactory);
        dao = spy(dao);

        doAnswer(invocation -> null).when(dao).save(startupDetail);

        dao.save(startupDetail);

        verify(dao, atLeastOnce()).save(startupDetail);
    }

    @Test
    public void update() throws Exception {
        doAnswer(invocation -> null).when(session).update(startupDetail);
        startupDetailDao.update(startupDetail);
        verify(session, times(1)).update(startupDetail);
    }

    @Test
    public void delete() throws Exception {
        doAnswer(invocation -> null).when(session).delete(startupDetail);
        startupDetailDao.delete(startupDetail);
        verify(session, timeout(200)).delete(startupDetail);
    }

}