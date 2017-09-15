package com.startup.project.dao.Impl;

import com.startup.project.dao.BusinessPlanDao;
import com.startup.project.entities.BusinessPlan;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by Sonik on 14.09.2017.
 */
@Repository
public class BusinessPlanDaoImpl extends AbstractGenericDaoImpl<Integer, BusinessPlan> implements BusinessPlanDao {

    @Autowired
    public BusinessPlanDaoImpl(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
