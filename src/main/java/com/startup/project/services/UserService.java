package com.startup.project.services;

import com.startup.project.dao.UserDao;
import com.startup.project.dao.UserRoleDao;
import com.startup.project.entities.User;
import com.startup.project.entities.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by Sonik on 14.09.2017.
 */
@Service
public class UserService {

    private UserDao userDao;
    private UserRoleDao userRoleDao;
    private PasswordEncoder passwordEncoder;
    private final int PASSWORD_LENGTH = 30;

    @Autowired
    public UserService(UserDao userDao, UserRoleDao userRoleDao, PasswordEncoder passwordEncoder) {
        this.userDao = userDao;
        this.userRoleDao = userRoleDao;
        this.passwordEncoder = passwordEncoder;
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
        UserRole userRole = userRoleDao.getById(UserRole.class, 1);
        Set<UserRole> userRoleSet = new HashSet<>();
        userRoleSet.add(userRole);
        entity.setUserRoles(userRoleSet);
        entity.setPassword(passwordEncoder.encode(entity.getPassword()));
        userDao.save(entity);
    }

    @Transactional
    public void update(User entity) {
        entity.setPassword(passwordEncoder.encode(entity.getPassword()));
        userDao.update(entity);
    }

    @Transactional
    public void delete(User entity) {
        userDao.delete(entity);
    }
}
