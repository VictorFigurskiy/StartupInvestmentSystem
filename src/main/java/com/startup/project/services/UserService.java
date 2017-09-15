package com.startup.project.services;

import com.startup.project.dao.UserDao;
import com.startup.project.entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Sonik on 14.09.2017.
 */
@Service
public class UserService {

    private UserDao userDao;

    @Autowired
    public UserService(UserDao userDao) {
        this.userDao = userDao;
    }

    @Transactional(readOnly = true)
    public User getByEmail(String email) {
        return userDao.getByEmail(email);
    }

    @Transactional(readOnly = true)
    public User getById(Integer id) {
        return userDao.getById(User.class, id);
    }

    @Transactional(readOnly = true)
    public List<User> getAll() {
        return userDao.getAll(User.class);
    }

    @Transactional
    public void save(User entity) {
        userDao.save(entity);
    }

    @Transactional
    public void update(User entity) {
        userDao.update(entity);
    }

    @Transactional
    public void delete(User entity) {
        userDao.delete(entity);
    }
}
