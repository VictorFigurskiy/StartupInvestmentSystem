package com.startup.project.dao.Impl;

import com.startup.project.dao.GeneralDao;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.io.Serializable;
import java.util.List;

/**
 * The {@link AbstractGenericDaoImpl} abstract class provide CRUD & getAll operations for {@link com.startup.project.services.InvestorService},
 * {@link com.startup.project.services.StartupService}
 * {@link com.startup.project.services.StartupDetailService}
 * {@link com.startup.project.services.UserService}
 * {@link com.startup.project.services.UserDetailedServiceImpl}
 * {@link com.startup.project.services.UserRoleService} services and based on generic types
 * <p>
 * The {@link AbstractGenericDaoImpl} implements {@link GeneralDao} what provide us all necessary CRUD methods
 *
 * @param <K> key need for some operations that work with unique database values(id)
 * @param <V> this param define entity class with which {@link AbstractGenericDaoImpl} class will work
 * @author Sonik
 * @since 13.09.2017
 */
public abstract class AbstractGenericDaoImpl<K extends Serializable, V> implements GeneralDao<K, V> {

    /**
     * The LOGGER need that would create logs for V type entity class
     */
    protected final Logger LOGGER = Logger.getLogger(this.getClass().getSimpleName());


    /**
     * Create a {@link Session}'s for each @methods
     */
    private SessionFactory sessionFactory;


    /**
     * Initializes a new instance class that extended  from {@link AbstractGenericDaoImpl}
     *
     * @param sessionFactory initial value
     */
    public AbstractGenericDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    /**
     * Search entity(V type) in database with exactly id
     *
     * @param entityClass {@link Class} of generic value V
     * @param id          unique value of entity for database
     * @return Entity instance class what define in @param V generic type
     */
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


    /**
     * Search all records in database V type {@link Class}
     *
     * @param entityClass {@link Class} of generic value V
     * @return {@link List} that contains entities of V generic type
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<V> getAll(Class<? extends V> entityClass) {
        List<V> entityList = getSession().createCriteria(entityClass).list();
        if (entityList != null) {
            LOGGER.info(entityClass.getSimpleName() + " list 'getAll' contains " + entityList.size() + " elements!");
        } else {
            LOGGER.info(entityClass.getSimpleName() + " list is empty!");
        }
        return entityList;
    }


    /**
     * Save entity of V generic type into database
     *
     * @param entity entity V type
     */
    @Override
    public void save(V entity) {
        getSession().save(entity);
        LOGGER.info(entity.getClass().getSimpleName() + " saved successfully!");
    }


    /**
     * Update entity of V generic type in database
     *
     * @param entity entity V type
     */
    @Override
    public void update(V entity) {
        getSession().update(entity);
        LOGGER.info(entity.getClass().getSimpleName() + " updated successfully!");
    }


    /**
     * Delete entity of V generic type in database
     *
     * @param entity entity V type
     */
    @Override
    public void delete(V entity) {
        getSession().delete(entity);
        LOGGER.info(entity.getClass().getSimpleName() + " deleted successfully!");
    }


    /**
     * Provide a current session from datasource
     *
     * @return {@link Session}
     */
    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

}
