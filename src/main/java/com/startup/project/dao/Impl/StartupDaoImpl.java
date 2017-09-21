package com.startup.project.dao.Impl;

import com.startup.project.dao.StartupDao;
import com.startup.project.entities.Startup;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.awt.print.Book;
import java.awt.print.Pageable;
import java.util.List;

/**
 * Created by Sonik on 13.09.2017.
 */
@Repository
public class StartupDaoImpl extends AbstractGenericDaoImpl<Integer, Startup> implements StartupDao {

    private SessionFactory sessionFactory;

    public StartupDaoImpl(SessionFactory sessionFactory, SessionFactory sessionFactory1) {
        super(sessionFactory);
        this.sessionFactory = sessionFactory1;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Startup> getStartupOnPage(int page, int size) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Startup.class);
        criteria.setFirstResult(page); // TODO need to * 10 for example
        criteria.setMaxResults(size);
        return (List<Startup>) criteria.list();
    }
}
