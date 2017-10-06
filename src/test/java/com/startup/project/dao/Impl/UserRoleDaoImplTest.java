package com.startup.project.dao.Impl;

import com.startup.project.dao.Impl.config.TestConfiguration;
import com.startup.project.dao.UserRoleDao;
import com.startup.project.entities.UserRole;
import com.startup.project.entities.UserRoleType;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.mockito.Mockito.*;


@RunWith(value = SpringRunner.class)
@ContextConfiguration(classes = TestConfiguration.class)
public class UserRoleDaoImplTest {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private UserRoleDao userRoleDAO;
    private UserRole userRole;

    @Before
    public void setUp() throws Exception {
        session = mock(Session.class);
        when(sessionFactory.getCurrentSession()).thenReturn(session);
        userRoleDAO = new UserRoleDaoImpl(sessionFactory);
        userRole = mock(UserRole.class);
    }

    @Test
    public void sessionTest() {
        when(userRole.getRoleType()).thenReturn(UserRoleType.OWNER.name());
        when(session.get(UserRole.class, 1)).thenReturn(userRole);

        assertEquals(userRole, userRoleDAO.getById(UserRole.class, 1));
        verify(session, timeout(100)).get(UserRole.class, 1);

        assertEquals("OWNER", userRole.getRoleType());
    }

    @Test
    public void nullTest() {
        when(session.get(UserRole.class, 1)).thenReturn(null);

        assertNull(userRoleDAO.getById(UserRole.class, 1));
        verify(session, timeout(100)).get(UserRole.class, 1);
    }

    @Test(expected = Exception.class)
    public void exceptionTest() {
        when(session.get(UserRole.class, -1)).thenThrow(new Exception());

        userRoleDAO.getById(UserRole.class, -1);
    }
}
