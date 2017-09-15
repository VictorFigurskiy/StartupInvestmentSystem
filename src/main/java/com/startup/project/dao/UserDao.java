package com.startup.project.dao;

import com.startup.project.entities.User;

/**
 * Created by Sonik on 13.09.2017.
 */
public interface UserDao extends GeneralDao<Integer,User> {

    User getByEmail(String email);
}
