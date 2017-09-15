package com.startup.project.dao.Impl;

import com.startup.project.dao.StartupDao;
import com.startup.project.entities.Startup;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by Sonik on 13.09.2017.
 */
@Repository
public class StartupDaoImpl extends AbstractGenericDaoImpl<Integer, Startup> implements StartupDao {

    @Autowired
    public StartupDaoImpl(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
