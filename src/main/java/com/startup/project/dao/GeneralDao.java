package com.startup.project.dao;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Sonik on 13.09.2017.
 */
public interface GeneralDao<K extends Serializable, V> {

    V getById(Class<? extends V> entityClass, K id);

    List<V> getAll(Class<? extends V> entityClass);

    void save(V entity);

    void update(V entity);

    void delete(V entity);
}
