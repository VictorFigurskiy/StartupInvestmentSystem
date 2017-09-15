package com.startup.project.services;

import com.startup.project.dao.UserRoleDao;
import com.startup.project.entities.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Sonik on 14.09.2017.
 */
@Service
public class UserRoleService {

    private UserRoleDao dao;

    @Autowired
    public UserRoleService(UserRoleDao dao) {
        this.dao = dao;
    }

    @Transactional(readOnly = true)
    public UserRole getById(Integer id) {
        return dao.getById(UserRole.class, id);
    }

    @Transactional(readOnly = true)
    public List<UserRole> getAll() {
        return dao.getAll(UserRole.class);
    }

    @Transactional
    public void save(UserRole entity) {
        dao.save(entity);
    }

    @Transactional
    public void update(UserRole entity) {
        dao.update(entity);
    }

    @Transactional
    public void delete(UserRole entity) {
        dao.delete(entity);
    }
}
