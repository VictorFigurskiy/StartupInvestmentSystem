package com.startup.project.dao.Impl;

import com.startup.project.dao.UserDao;
import com.startup.project.entities.User;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * This class is extended from {@link AbstractGenericDaoImpl} and provide CRUD methods for working with database
 * also he implements {@link UserDao} with the same abstract method and gives us the opportunity to add custom
 * methods. This class is defined with generic types of {@code AbstractGenericDaoImpl<K,V>}
 * K - {@link Integer}
 * V - {@link User}
 *
 * @author Sonik
 * @since 13.09.2017
 */
@Repository
public class UserDaoImpl extends AbstractGenericDaoImpl<Integer, User> implements UserDao {

    private SessionFactory sessionFactory;


    /**
     * Initializes a new instance {@link UserDaoImpl}
     *
     * @param sessionFactory initial value
     */
    @Autowired
    public UserDaoImpl(SessionFactory sessionFactory) {
        super(sessionFactory);
        this.sessionFactory = sessionFactory;
    }


    /**
     * Searching {@link User} by unique email
     *
     * @param email email
     * @return {@code User} or null if user not exist
     */
    @Override
    public User getByEmail(String email) {
        User userById = sessionFactory.getCurrentSession()
                .createQuery("select user from User user where user.email = :email", User.class)
                .setParameter("email", email).uniqueResult();
        if (userById != null) {
            LOGGER.info("User with email: " + email + " found!");
        } else {
            LOGGER.warn("User with email: " + email + " not found!");
        }
        return userById;
    }
}
