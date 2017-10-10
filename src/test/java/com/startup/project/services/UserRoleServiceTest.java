package com.startup.project.services;

import com.startup.project.dao.Impl.UserRoleDaoImpl;
import com.startup.project.dao.Impl.configuration.TestConfiguration;
import com.startup.project.dao.UserRoleDao;
import com.startup.project.entities.User;
import com.startup.project.entities.UserRole;
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

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;


public class UserRoleServiceTest {


    private UserRoleService userRoleService;
    private UserRoleDao userRoleDao;
    private UserRole userRole;

    @Before
    public void setUp() throws Exception {
        userRole = Mockito.mock(UserRole.class);
        userRoleDao = Mockito.mock(UserRoleDao.class);

        userRoleService = new UserRoleService(userRoleDao);

        when(userRole.getId()).thenReturn(1);
        when(userRole.getRoleType()).thenReturn("role");
    }


    @Test
    public void getById() throws Exception {
        Integer id = 1;
        when(userRoleDao.getById(UserRole.class, id)).thenReturn(userRole);
        assertEquals(id, userRole.getId());
        assertEquals(userRole, userRoleDao.getById(UserRole.class, id));
        verify(userRoleDao, atLeast(1)).getById(UserRole.class, id);
    }

    @Test
    public void getAll() throws Exception {
        List<UserRole> users = new ArrayList();
        when(userRoleDao.getAll(UserRole.class)).thenReturn(users);
        assertEquals(users, userRoleDao.getAll(UserRole.class));
        verify(userRoleDao, atLeast(1)).getAll(UserRole.class);
    }

    @Test
    public void save() throws Exception {
        when(userRole.getRoleType()).thenReturn("role");
        doAnswer(invocationOnMock -> {
            UserRole userRoleSave = invocationOnMock.getArgument(0);
            assertEquals("role", userRoleSave.getRoleType());
            return null;
        }).when(userRoleDao).save(userRole);

        userRoleService.save(userRole);
        verify(userRoleDao, atLeast(1)).save(userRole);
    }

    @Test
    public void update() throws Exception {
        doAnswer(invocationOnMock -> null).when(userRoleDao).update(userRole);
        userRoleService.update(userRole);
        verify(userRoleDao, atLeastOnce()).update(userRole);
    }

    @Test
    public void delete() throws Exception {
        doAnswer(invocationOnMock -> null).when(userRoleDao).delete(userRole);
        userRoleService.delete(userRole);
        verify(userRoleDao, times(1)).delete(userRole);
    }

}