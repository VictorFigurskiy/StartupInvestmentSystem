package com.startup.project.services;

import com.startup.project.dao.Impl.UserDaoImpl;
import com.startup.project.dao.Impl.configuration.TestConfiguration;
import com.startup.project.dao.UserDao;
import com.startup.project.dao.UserRoleDao;
import com.startup.project.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;
@RunWith(value = SpringRunner.class)
@ContextConfiguration(classes = TestConfiguration.class)
public class UserServiceTest {

    private UserDao userDao;
    private User user;
    private UserService userService;
    private UserRoleDao userRoleDao;
    private PasswordEncoder passwordEncoder;

    @Before
    public void setUp() throws Exception {
        user = Mockito.mock(User.class);


        userDao = Mockito.mock(UserDao.class);


        userRoleDao = Mockito.mock(UserRoleDao.class);
        userService = new UserService(userDao, userRoleDao, passwordEncoder);


        when(user.getEmail()).thenReturn("email");
        when(user.getId()).thenReturn(55);
        when(user.getFirstName()).thenReturn("name");


    }


    @Test
    public void getByEmail() throws Exception {
        when(userDao.getByEmail("email")).thenReturn(user);
        //user 4to poluchaem
        assertEquals("email", user.getEmail());
        assertEquals(user, userService.getByEmail("email"));
        //1 -  минимум раз вызовов  метода getByEmail
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
        when(user.getFirstName()).thenReturn("name");
        doAnswer(invocationOnMock -> {
            User userSave = invocationOnMock.getArgument(0);
            assertEquals("name", userSave.getFirstName());
            return null;
        }).when(userDao).save(user);
        userDao.save(user);
        verify(userDao, atLeastOnce()).save(user);
    }

    @Test
    public void update() throws Exception {
        doAnswer(invocationOnMock -> null).when(userDao).update(user);
        userService.updateUserData(user);
        verify(userDao, atLeastOnce()).update(user);
    }

    @Test
    public void delete() throws Exception {
        doAnswer(invocationOnMock -> null).when(userDao).delete(user);
        userService.delete(user);
        verify(userDao, times(1)).delete(user);
    }

}