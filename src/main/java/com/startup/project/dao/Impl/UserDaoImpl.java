package com.startup.project.dao.Impl;

import com.startup.project.dao.UserDao;
import com.startup.project.entities.User;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by Sonik on 13.09.2017.
 */
@Repository
public class UserDaoImpl extends AbstractGenericDaoImpl<Integer, User> implements UserDao {

    private SessionFactory sessionFactory;

    @Autowired
    public UserDaoImpl(SessionFactory sessionFactory, SessionFactory sessionFactory1) {
        super(sessionFactory);
        this.sessionFactory = sessionFactory1;
    }

    @Override
    public User getByEmail(String email) {
        return sessionFactory.getCurrentSession()
                .createQuery("select user from User user where user.email = :email", User.class)
                .setParameter("email", email).getSingleResult();
    }
}
