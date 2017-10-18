package com.startup.project.dao.Impl;

import com.startup.project.dao.StartupDao;
import com.startup.project.entities.Startup;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * This class is extended from {@link AbstractGenericDaoImpl} and provide CRUD methods for working with database
 * also he implements {@link StartupDao} with the same abstract method and gives us the opportunity to add custom
 * methods. This class is defined with generic types of {@code AbstractGenericDaoImpl<K,V>}
 * K - {@link Integer}
 * V - {@link Startup}
 *
 * @author Sonik
 * @since 13.09.2017
 */
@Repository
public class StartupDaoImpl extends AbstractGenericDaoImpl<Integer, Startup> implements StartupDao {

    private SessionFactory sessionFactory;


    /**
     * Initializes a new instance {@link StartupDaoImpl}
     *
     * @param sessionFactory initial value
     */
    @Autowired
    public StartupDaoImpl(SessionFactory sessionFactory) {
        super(sessionFactory);
        this.sessionFactory = sessionFactory;
    }


    /**
     * With helpful this method, we can implement paging of {@link Startup} records on website
     *
     * @param page number of page
     * @param size count of records what we want to show
     * @return {@code List<Startup>} result list
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Startup> getStartupOnPage(int page, int size) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Startup.class);
        criteria.setFirstResult((page - 1) * size);
        criteria.setMaxResults(size);
        LOGGER.info("Hibernate query 'getStartupOnPage' is done successfully");
        List<Startup> startupList = criteria.list();
        if (startupList.isEmpty()) {
            LOGGER.info("Startup list 'getStartupOnPage' is empty!");
        } else {
            LOGGER.info("Startup list 'getStartupOnPage' contains " + startupList.size() + " elements!");
        }
        return startupList;
    }


    /**
     * With helpful this method we can do a custom select of {@code Startup} by industry
     *
     * @param industry  industry name of {@link com.startup.project.entities.StartupDetail}
     *                  that contain in {@code Startup}
     * @param limit     count of records what we want to see
     * @param excludeId {@code Startup} Id that will exclude him in result list
     * @return {@code List<Startup>} result list
     */
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
            LOGGER.info("Startup list 'searching by industry' contains " + startupList.size() + " elements!");
        }
        return startupList;
    }


    /**
     * Searching {@code Startup}'s by matching in name
     *
     * @param name name that we type for searching
     * @return {@code List<Startup>} result list
     */
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
            LOGGER.info("Startup list 'searching by name' contains " + startupList.size() + " elements!");
        }
        return startupList;
    }


    /**
     * Searching {@code Startup}'s by country
     *
     * @param county name of country that we choose for searching
     * @return {@code List<Startup>} result list
     */
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
            LOGGER.info("Startup list 'searching by country' contains" + startupList.size() + " elements!");
        }
        return startupList;
    }
}
