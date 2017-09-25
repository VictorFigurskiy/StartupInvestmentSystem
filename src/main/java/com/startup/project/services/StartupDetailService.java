package com.startup.project.services;

import com.startup.project.dao.StartupDetailDao;
import com.startup.project.entities.StartupDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Sonik on 15.09.2017.
 */
@Service
public class StartupDetailService {

    private StartupDetailDao dao;

    @Autowired
    public StartupDetailService(StartupDetailDao dao) {
        this.dao = dao;
    }

    @Transactional(readOnly = true)
    public StartupDetail getById(Integer id) {
        return dao.getById(StartupDetail.class, id);
    }

    @Transactional(readOnly = true)
    public List<StartupDetail> getAll() {
        return dao.getAll(StartupDetail.class);
    }

    @Transactional
    public void save(StartupDetail entity) {
        dao.save(entity);
    }

    @Transactional
    public void update(StartupDetail entity) {
        dao.update(entity);
    }

    @Transactional
    public void delete(StartupDetail entity) {
        dao.delete(entity);
    }
}
