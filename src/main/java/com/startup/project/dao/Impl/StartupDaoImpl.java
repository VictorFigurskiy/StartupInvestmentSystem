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
        criteria.setFirstResult((page - 1) * size);
        criteria.setMaxResults(size);
        return (List<Startup>) criteria.list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Startup> getByIndustry(String industry, int limit, int excludeId) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("FROM Startup startup WHERE startup.industry=? and startup.id!=? order by id asc ", Startup.class)
                .setParameter(0 , industry)
                .setParameter(1 , excludeId)
                .setMaxResults(limit)
                .list();
    }
}
