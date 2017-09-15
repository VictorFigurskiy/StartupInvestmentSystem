package com.startup.project.dao.Impl;

import com.startup.project.dao.GeneralDao;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.LoggerFactory;

import javax.persistence.criteria.CriteriaBuilder;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.logging.Logger;

/**
 * Created by Sonik on 13.09.2017.
 */
public abstract class AbstractGenericDaoImpl<K extends Serializable, V> implements GeneralDao<K, V> {

    private Class<V> persistentClass;

//    private static final Logger logger = LoggerFactory.getLogger();

    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public AbstractGenericDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
        this.persistentClass = (Class<V>) ((ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments()[1];
    }

    private Session getSession(){
        return sessionFactory.getCurrentSession();
    }

    @Override
    public V getById(Class<? extends V> entityClass, K id) {
        return getSession().get(entityClass, id);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<V> getAll(Class<? extends V> entityClass) {
        return (List<V>) getSession().createCriteria(entityClass).list();
    }

    @Override
    public void save(V entity) {
        getSession().save(entity);
    }

    @Override
    public void update(V entity) {
        getSession().update(entity);
    }

    @Override
    public void delete(V entity) {
        getSession().delete(entity);
    }
}
