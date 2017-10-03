package com.startup.project.dao.Impl;

import com.startup.project.dao.GeneralDao;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import java.io.Serializable;
import java.util.List;

/**
 * Created by Sonik on 13.09.2017.
 */
public abstract class AbstractGenericDaoImpl<K extends Serializable, V> implements GeneralDao<K, V> {

    private final Logger LOGGER = Logger.getLogger(this.getClass().getSimpleName());

    private SessionFactory sessionFactory;

    public AbstractGenericDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Logger getLOGGER() {
        return LOGGER;
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public V getById(Class<? extends V> entityClass, K id) {
        V entity = getSession().get(entityClass, id);
        if (entity != null) {
            LOGGER.info(entityClass.getSimpleName() + " with id: " + id + " found!");
        } else {
            LOGGER.warn(entityClass.getSimpleName() + " with id: " + id + " not found!");
        }
        return entity;

    }

    @SuppressWarnings("unchecked")
    @Override
    public List<V> getAll(Class<? extends V> entityClass) {
        List<V> entityList = getSession().createCriteria(entityClass).list();
        if (entityList != null) {
            LOGGER.info(entityClass.getSimpleName() +" list 'getAll' contains "+entityList.size()+" elements!");
        } else {
            LOGGER.info(entityClass.getSimpleName() +" list is empty!");
        }
        return entityList;
    }

    @Override
    public void save(V entity) {
        getSession().save(entity);
        LOGGER.info(entity.getClass().getSimpleName() +" saved successfully!");
    }

    @Override
    public void update(V entity) {
        getSession().update(entity);
        LOGGER.info(entity.getClass().getSimpleName() +" updated successfully!");
    }

    @Override
    public void delete(V entity) {
        getSession().delete(entity);
        LOGGER.info(entity.getClass().getSimpleName() +" deleted successfully!");
    }
}
