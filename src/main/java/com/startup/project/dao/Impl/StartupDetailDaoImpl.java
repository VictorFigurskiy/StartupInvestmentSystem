package com.startup.project.dao.Impl;

import com.startup.project.dao.StartupDetailDao;
import com.startup.project.entities.StartupDetail;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by Sonik on 14.09.2017.
 */
@Repository
public class StartupDetailDaoImpl extends AbstractGenericDaoImpl<Integer, StartupDetail> implements StartupDetailDao {

    @Autowired
    public StartupDetailDaoImpl(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
