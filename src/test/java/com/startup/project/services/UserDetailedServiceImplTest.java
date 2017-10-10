package com.startup.project.services;

import com.startup.project.dao.Impl.configuration.TestConfiguration;
import com.startup.project.dao.UserDao;
import com.startup.project.dao.UserRoleDao;
import com.startup.project.entities.User;
import org.hibernate.SessionFactory;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;
import static org.mockito.Mockito.atLeast;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

public class UserDetailedServiceImplTest {

    private UserRoleDao userRoleDao;
    private UserService userService;
    private UserDao userDao;
    private User user;
    private PasswordEncoder passwordEncoder;
    @Before
    public void setUp() throws Exception {
        passwordEncoder = Mockito.mock(PasswordEncoder.class);
        userDao = Mockito.mock(UserDao.class);
        user= Mockito.mock(User.class);
        userRoleDao = Mockito.mock(UserRoleDao.class);
        userService = new UserService(userDao,userRoleDao,passwordEncoder);

        when(user.getEmail()).thenReturn("email");
    }

    @Test
    public void loadUserByUsername() throws Exception {
        when(userDao.getByEmail("email")).thenReturn(user);
        assertEquals("email", user.getEmail());
        assertEquals(user, userService.getByEmail("email"));
        verify(userDao, atLeast(1)).getByEmail("email");
    }

}