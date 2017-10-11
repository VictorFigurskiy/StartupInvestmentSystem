package com.startup.project.services;

import com.startup.project.dao.UserDao;
import com.startup.project.dao.UserRoleDao;
import com.startup.project.entities.User;
import org.junit.Before;
import org.junit.Test;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

/**
 * Created by Sonik on 11.10.2017.
 */
public class UserDetailedServiceImplTest {

    private UserService userService;
    private UserDetailsService userDetailsService;
    private UserDao userDao;
    private User user;
    private UserRoleDao userRoleDao;
    private PasswordEncoder passwordEncoder;

    @Before
    public void setUp() throws Exception {
        userDao = mock(UserDao.class);
        userRoleDao = mock(UserRoleDao.class);
        passwordEncoder = mock(PasswordEncoder.class);
        user = mock(User.class);

        userService = new UserService(userDao, userRoleDao, passwordEncoder);
        userDetailsService = new UserDetailedServiceImpl(userService);
    }

    @Test
    public void loadUserByUsername() throws Exception {
        when(user.getEmail()).thenReturn("email");
        when(user.getPassword()).thenReturn("password");
        when(userDao.getByEmail("email")).thenReturn(user);

        UserDetails userDetails = userDetailsService.loadUserByUsername("email");

        assertEquals("email", userDetails.getUsername());
        assertEquals("password", userDetails.getPassword());
        assertTrue(userDetails.isAccountNonExpired());
    }

    @Test(expected = UsernameNotFoundException.class)
    public void testUserNotExists() {
        when(userDao.getByEmail("B")).thenReturn(null);
        userDetailsService.loadUserByUsername("B");
    }

}