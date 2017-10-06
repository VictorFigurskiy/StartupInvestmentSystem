package com.startup.project.dao.Impl;


import com.startup.project.dao.Impl.UserDaoImpl;
import com.startup.project.dao.Impl.config.TestConfiguration;
import com.startup.project.dao.UserDao;
import com.startup.project.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;


@RunWith(value = SpringRunner.class)
@ContextConfiguration(classes = TestConfiguration.class)
public class UserDaoImplTest {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private UserDao userDao;
    private User user;


    @Before
    public void setUp() throws Exception {
        session = mock(Session.class);
        when(sessionFactory.getCurrentSession()).thenReturn(session);
        user = mock(User.class);
        userDao = new UserDaoImpl(sessionFactory);

    }


    @Test
    public void getByEmail() throws Exception {
        Query<User> query = mock(Query.class);
        when(session.createQuery("select user from User user where user.email = :email", User.class)).thenReturn(query);
        Query<User> userQuery = mock(Query.class);
        when(query.setParameter("email", "email")).thenReturn(userQuery);
        when(userQuery.uniqueResult()).thenReturn(user);

        assertEquals(user, userDao.getByEmail("email"));
        assertNotNull(user);
        verify(query, atLeastOnce()).setParameter("email", "email");
        verify(userQuery,atLeastOnce()).uniqueResult();

    }

   //@Test(expected = NullPointerException.class)
   //public void getByIdException() throws Exception {
   //    when(session.get(User.class, 0)).thenReturn(null);
   //    when(user.getEmail()).thenThrow(new NullPointerException());

   //    assertNull("Must get NullPointerException", userDao.getById(User.class, 0));

   //    verify(session, atLeastOnce()).get(User.class, 0);
   //    user.getEmail();
   //}


}
