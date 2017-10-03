package com.startup.project.dao.Impl;

import com.startup.project.dao.StartupDao;
import com.startup.project.entities.Startup;
import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Sonik on 13.09.2017.
 */
@Repository
public class StartupDaoImpl extends AbstractGenericDaoImpl<Integer, Startup> implements StartupDao {

    private SessionFactory sessionFactory;
    private final Logger LOGGER = getLOGGER();

    @Autowired
    public StartupDaoImpl(SessionFactory sessionFactory) {
        super(sessionFactory);
        this.sessionFactory = sessionFactory;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Startup> getStartupOnPage(int page, int size) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Startup.class);
        criteria.setFirstResult((page - 1) * size);
        criteria.setMaxResults(size);
        LOGGER.info("Hibernate query 'getStartupOnPage' is done successfully");
        List<Startup> startupList = criteria.list();
        if (startupList.isEmpty()){
            LOGGER.info("Startup list 'getStartupOnPage' is empty!");
        }else {
            LOGGER.info("Startup list 'getStartupOnPage' contains "+ startupList.size() +" elements!");
        }
        return startupList;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Startup> getByIndustry(String industry, int limit, int excludeId) {
        Session currentSession = sessionFactory.getCurrentSession();
        List<Startup> startupList = currentSession.createQuery("FROM Startup startup WHERE startup.industry=? and startup.id!=? order by id asc", Startup.class)
                .setParameter(0, industry)
                .setParameter(1, excludeId)
                .setMaxResults(limit)
                .list();
        LOGGER.info("Hibernate query 'getByIndustry' is done successfully!");
        if (startupList.isEmpty()) {
            LOGGER.info("Startup list 'searching by industry' is empty!");
        } else {
            LOGGER.info("Startup list 'searching by industry' contains "+ startupList.size() +" elements!");
        }
        return startupList;
    }

    @Override
    public List<Startup> searchByName(String name) {
        Session session = sessionFactory.getCurrentSession();
        List<Startup> startupList = session.createQuery("from Startup startup where startup.startupName like :name", Startup.class)
                .setParameter("name", "%" + name + "%")
                .list();
        LOGGER.info("Hibernate query 'searchByName' is done successfully!");
        if (startupList.isEmpty()) {
            LOGGER.info("Startup list 'searching by name' is empty!");
        } else {
            LOGGER.info("Startup list 'searching by name' contains "+ startupList.size() +" elements!");
        }
        return startupList;
    }

    @Override
    public List<Startup> searchByCounty(String county) {
        Session session = sessionFactory.getCurrentSession();
        List<Startup> startupList = session.createQuery("from Startup startup where startup.country like ?", Startup.class)
                .setParameter(0, "%" + county + "%")
                .list();
        LOGGER.info("Hibernate query 'searchByCounty' is done successfully!");
        if (startupList.isEmpty()) {
            LOGGER.info("Startup list 'searching by country' is empty!");
        } else {
            LOGGER.info("Startup list 'searching by country' contains"+ startupList.size() +" elements!");
        }
        return startupList;
    }
}
