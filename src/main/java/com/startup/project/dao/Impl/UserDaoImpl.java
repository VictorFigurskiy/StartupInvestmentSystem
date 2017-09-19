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
    public UserDaoImpl(SessionFactory sessionFactory) {
        super(sessionFactory);
        this.sessionFactory = sessionFactory;
    }

    @Override
    public User getByEmail(String email) {
        User userById = sessionFactory.getCurrentSession()
                .createQuery("select user from User user where user.email = :email", User.class)
                .setParameter("email", email).uniqueResult();
        if (userById != null) {
            getLogger().info("User with email: " + email + " found!");
        } else {
            getLogger().warn("User with email: " + email + "not found!");
        }
        return userById;
    }
}
