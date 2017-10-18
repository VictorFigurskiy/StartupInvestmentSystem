package com.startup.project.dao.Impl;

import com.startup.project.dao.UserRoleDao;
import com.startup.project.entities.UserRole;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * This class is extended from {@link AbstractGenericDaoImpl} and provide CRUD methods for working with database
 * also he implements {@link UserRoleDao} with the same abstract method and gives us the opportunity to add custom
 * methods. This class is defined with generic types of {@code AbstractGenericDaoImpl<K,V>}
 * K - {@link Integer}
 * V - {@link UserRole}
 *
 * @author Sonik
 * @since 13.09.2017
 */
@Repository
public class UserRoleDaoImpl extends AbstractGenericDaoImpl<Integer, UserRole> implements UserRoleDao {


    /**
     * Initializes a new instance {@link UserRoleDaoImpl}
     *
     * @param sessionFactory initial value
     */
    @Autowired
    public UserRoleDaoImpl(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
