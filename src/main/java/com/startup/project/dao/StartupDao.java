package com.startup.project.dao;

import com.startup.project.entities.Startup;

import java.util.List;

/**
 * Created by Sonik on 13.09.2017.
 */
public interface StartupDao extends GeneralDao<Integer, Startup> {

    List<Startup> getStartupOnPage(int page, int size);
}
