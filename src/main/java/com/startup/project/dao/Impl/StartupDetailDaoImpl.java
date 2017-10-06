package com.startup.project.dao.Impl;

import com.startup.project.dao.StartupDetailDao;
import com.startup.project.entities.StartupDetail;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * This class is extended from {@link AbstractGenericDaoImpl} and provide CRUD methods for working with database
 * also he implements {@link StartupDetailDao} with the same abstract method and gives us the opportunity to add custom
 * methods. This class is defined with generic types of {@code AbstractGenericDaoImpl<K,V>}
 * K - {@link Integer}
 * V - {@link StartupDetail}
 *
 *
 * @author  Sonik
 * @since   13.09.2017
 */
@Repository
public class StartupDetailDaoImpl extends AbstractGenericDaoImpl<Integer, StartupDetail> implements StartupDetailDao {


    /**
     * Initializes a new instance {@link StartupDetailDaoImpl}
     * @param sessionFactory  initial value
     */
    @Autowired
    public StartupDetailDaoImpl(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
