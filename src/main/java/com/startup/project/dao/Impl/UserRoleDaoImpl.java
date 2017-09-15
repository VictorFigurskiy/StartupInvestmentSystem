package com.startup.project.dao.Impl;

import com.startup.project.dao.GeneralDao;
import com.startup.project.dao.UserRoleDao;
import com.startup.project.entities.UserRole;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by Sonik on 13.09.2017.
 */
@Repository
public class UserRoleDaoImpl extends AbstractGenericDaoImpl<Integer, UserRole> implements UserRoleDao {

    @Autowired
    public UserRoleDaoImpl(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
