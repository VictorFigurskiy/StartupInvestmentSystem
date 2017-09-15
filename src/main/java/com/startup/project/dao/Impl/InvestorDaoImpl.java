package com.startup.project.dao.Impl;

import com.startup.project.dao.InvestorDao;
import com.startup.project.entities.Investor;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by Sonik on 14.09.2017.
 */
@Repository
public class InvestorDaoImpl extends AbstractGenericDaoImpl<Integer, Investor> implements InvestorDao {

    @Autowired
    public InvestorDaoImpl(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
