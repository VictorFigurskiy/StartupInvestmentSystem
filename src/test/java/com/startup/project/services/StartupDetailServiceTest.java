package com.startup.project.services;

import com.startup.project.dao.Impl.StartupDaoImpl;
import com.startup.project.dao.Impl.configuration.TestConfiguration;
import com.startup.project.dao.StartupDao;
import com.startup.project.entities.Startup;
import com.startup.project.entities.StartupDetail;
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

import javax.swing.*;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;


public class StartupDetailServiceTest {

    private Startup startup;
    private StartupDao startupDao;
    private StartupService startupService;

    @Before
    public void setUp() throws Exception {
        startup = Mockito.mock(Startup.class);
        startupDao = Mockito.mock(StartupDao.class);
        startupService = new StartupService(startupDao);


        when(startup.getId()).thenReturn(1);

    }


    @Test
    public void getById() throws Exception {
        Integer id = 1;
        when(startupDao.getById(Startup.class, id)).thenReturn(startup);
        assertEquals(id, startup.getId());
        assertEquals(startup, startupService.getById(id));
        verify(startupDao, atLeast(1)).getById(Startup.class, 1);
    }

    @Test
    public void getAll() throws Exception {
        List<Startup> startupDetails = new ArrayList<>();
        when(startupDao.getAll(Startup.class)).thenReturn(startupDetails);
        assertEquals(startupDetails, startupService.getAll());
        verify(startupDao, atLeast(1)).getAll(Startup.class);
    }

    @Test
    public void save() throws Exception {
        when(startup.getStartupName()).thenReturn("startupName");
        doAnswer(invocationOnMock -> {
            Startup startupSave = invocationOnMock.getArgument(0);
            assertEquals("startupName", startupSave.getStartupName());
            return null;
        }).when(startupDao).save(startup);
        startupService.save(startup);
        verify(startupDao, atLeastOnce()).save(startup);
    }

    @Test
    public void update() throws Exception {
        doAnswer(invocationOnMock -> null).when(startupDao).update(startup);
        startupService.update(startup);
        verify(startupDao, atLeastOnce()).update(startup);
    }

    @Test
    public void delete() throws Exception {
        doAnswer(invocationOnMock -> null).when(startupDao).delete(startup);
        startupService.delete(startup);
        verify(startupDao, times(1)).delete(startup);
    }

}