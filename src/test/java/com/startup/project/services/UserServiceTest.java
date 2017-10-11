package com.startup.project.services;

import com.startup.project.dao.UserDao;
import com.startup.project.dao.UserRoleDao;
import com.startup.project.entities.User;
import com.startup.project.entities.UserRole;
import org.junit.Before;
import org.junit.Test;
import org.springframework.security.crypto.password.PasswordEncoder;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;


public class UserServiceTest {

    private UserDao userDao;
    private User user;
    private UserRole userRole;
    private UserService userService;
    private UserRoleDao userRoleDao;
    private PasswordEncoder passwordEncoder;

    @Before
    public void setUp() throws Exception {
        user = mock(User.class);
        userRole = mock(UserRole.class);

        passwordEncoder = mock(PasswordEncoder.class);
        userDao = mock(UserDao.class);

        userRoleDao = mock(UserRoleDao.class);
        userService = new UserService(userDao, userRoleDao, passwordEncoder);

        when(user.getEmail()).thenReturn("email");
        when(user.getId()).thenReturn(55);
        when(user.getFirstName()).thenReturn("name");
    }


    @Test
    public void getByEmail() throws Exception {
        when(userDao.getByEmail("email")).thenReturn(user);
        assertEquals("email", user.getEmail());
        assertEquals(user, userService.getByEmail("email"));
        verify(userDao, atLeast(1)).getByEmail("email");
    }

    @Test
    public void getById() throws Exception {
        Integer id = 55;
        when(userDao.getById(User.class, id)).thenReturn(user);
        assertEquals(id, user.getId());
        assertEquals(user, userService.getById(55));
        verify(userDao, atLeast(1)).getById(User.class, 55);
    }

    @Test
    public void getAll() throws Exception {
        List<User> users = new ArrayList();
        when(userDao.getAll(User.class)).thenReturn(users);
        assertEquals(users, userService.getAll());
        verify(userDao, atLeast(1)).getAll(User.class);
    }

    @Test
    public void save() throws Exception {
        when(userRoleDao.getById(UserRole.class,1)).thenReturn(userRole);
        Set<UserRole> spySet = spy(new HashSet<>());
        spySet.add(userRole);
        when(user.getPassword()).thenReturn("123");
        when(passwordEncoder.encode("123")).thenReturn("coded123");

        doAnswer(invocation -> null).when(user).setUserRoles(spySet);
        doAnswer(invocation -> null).when(user).setPassword("coded123");

        when(user.getFirstName()).thenReturn("name");

        doAnswer(invocationOnMock -> {
            User userSave = invocationOnMock.getArgument(0);
            assertEquals("name", userSave.getFirstName());
            return null;
        }).when(userDao).save(user);

        userService.save(user);

        verify(userDao, atLeastOnce()).save(user);
    }

    @Test
    public void updatePassword() throws Exception {
        when(user.getPassword()).thenReturn("123");
        when(passwordEncoder.encode("123")).thenReturn("coded123");

        doAnswer(invocation -> null).when(user).setPassword("coded123");

        doAnswer(invocationOnMock -> null).when(userDao).update(user);

        userService.updatePassword(user);
        verify(userDao, atLeastOnce()).update(user);
    }

    @Test
    public void delete() throws Exception {
        doAnswer(invocationOnMock -> null).when(userDao).delete(user);
        userService.delete(user);
        verify(userDao, times(1)).delete(user);
    }

}