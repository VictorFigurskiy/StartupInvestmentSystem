package com.startup.project.dao.Impl;

import com.startup.project.dao.GeneralDao;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

/**
 * Created by Sonik on 13.09.2017.
 */
public abstract class AbstractGenericDaoImpl<K extends Serializable, V> implements GeneralDao<K, V> {

    @SuppressWarnings("unchecked")
    private final Logger logger = Logger.getLogger((Class<V>) ((ParameterizedType) this.getClass()
            .getGenericSuperclass())
            .getActualTypeArguments()[1]);

    private SessionFactory sessionFactory;

    public AbstractGenericDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Logger getLogger() {
        return logger;
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public V getById(Class<? extends V> entityClass, K id) {
        V entity = getSession().get(entityClass, id);
        if (entity != null) {
            logger.info(entityClass.getSimpleName() + " with id: " + id + " found!");
        } else {
            logger.warn(entityClass.getSimpleName() + " with id: " + id + " not found!");
        }
        return entity;

    }

    @SuppressWarnings("unchecked")
    @Override
    public List<V> getAll(Class<? extends V> entityClass) {
        List<V> usersList = getSession().createCriteria(entityClass).list();
        if (usersList != null) {
            logger.info("Users list is not empty!");
        } else {
            logger.warn("Users list is empty!");
        }
        return usersList;
    }

    @Override
    public void save(V entity) {
        getSession().save(entity);
        logger.info(entity.getClass().getSimpleName()+" saved successfully!");
    }

    @Override
    public void update(V entity) {
        getSession().update(entity);
        logger.info(entity.getClass().getSimpleName()+" updated successfully!");
    }

    @Override
    public void delete(V entity) {
        getSession().delete(entity);
        logger.info(entity.getClass().getSimpleName()+" deleted successfully!");
    }
}
