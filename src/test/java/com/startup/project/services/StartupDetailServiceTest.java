package com.startup.project.services;

import com.startup.project.dao.Impl.StartupDetailDaoImpl;
import com.startup.project.dao.StartupDetailDao;
import com.startup.project.entities.StartupDetail;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import java.util.List;
import static org.junit.Assert.*;
import static org.mockito.Mockito.*;


public class StartupDetailServiceTest {

    private StartupDetail startupDetail;
    private StartupDetailDao startupDetailDao;
    private StartupDetailService startupDetailService;

    @Before
    public void setUp() throws Exception {
        startupDetail = Mockito.mock(StartupDetail.class);
        startupDetailDao = Mockito.mock(StartupDetailDaoImpl.class);
        startupDetailService = new StartupDetailService(startupDetailDao);

        when(startupDetail.getId()).thenReturn(1);
    }


    @Test
    public void getById() throws Exception {
        Integer id = 1;
        when(startupDetailDao.getById(StartupDetail.class, id)).thenReturn(startupDetail);
        assertEquals(id, startupDetail.getId());
        assertEquals(startupDetail, startupDetailService.getById(id));
        verify(startupDetailDao, atLeast(1)).getById(StartupDetail.class, 1);
    }

    @Test
    public void getAll() throws Exception {
        List<StartupDetail> startupDetails = mock(List.class);
        when(startupDetailDao.getAll(StartupDetail.class)).thenReturn(startupDetails);

        assertEquals(startupDetails, startupDetailService.getAll());

        verify(startupDetailDao, atLeast(1)).getAll(StartupDetail.class);
    }

    @Test
    public void save() throws Exception {
        when(startupDetail.getBusinessModel()).thenReturn("BusinessModel");
        doAnswer(invocationOnMock -> {
            StartupDetail startupSave = invocationOnMock.getArgument(0);
            assertEquals("BusinessModel", startupSave.getBusinessModel());
            return null;
        }).when(startupDetailDao).save(startupDetail);
        startupDetailService.save(startupDetail);
        verify(startupDetailDao, atLeastOnce()).save(startupDetail);
    }

    @Test
    public void update() throws Exception {
        doAnswer(invocationOnMock -> null).when(startupDetailDao).update(startupDetail);
        startupDetailService.update(startupDetail);
        verify(startupDetailDao, atLeastOnce()).update(startupDetail);
    }

    @Test
    public void delete() throws Exception {
        doAnswer(invocationOnMock -> null).when(startupDetailDao).delete(startupDetail);
        startupDetailService.delete(startupDetail);
        verify(startupDetailDao, times(1)).delete(startupDetail);
    }

}