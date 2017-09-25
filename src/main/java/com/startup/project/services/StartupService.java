package com.startup.project.services;

import com.startup.project.dao.StartupDao;
import com.startup.project.entities.Startup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Sonik on 15.09.2017.
 */
@Service
public class StartupService {

    private StartupDao dao;

    @Autowired
    public StartupService(StartupDao dao) {
        this.dao = dao;
    }

    @Transactional(readOnly = true)
    public List<Startup> getStartupOnPage(int page, int size) {
        return dao.getStartupOnPage(page, size);
    }

    @Transactional(readOnly = true)
    public Startup getById(Integer id) {
        return dao.getById(Startup.class, id);
    }

    @Transactional(readOnly = true)
    public List<Startup> getAll() {
        return dao.getAll(Startup.class);
    }

    @Transactional
    public void save(Startup entity) {
        dao.save(entity);
    }

    @Transactional
    public void update(Startup entity) {
        dao.update(entity);
    }

    @Transactional
    public void delete(Startup entity) {
        dao.delete(entity);
    }
}
