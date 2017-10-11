package com.startup.project.dao;

import com.startup.project.entities.wrappers.Investment;
import com.startup.project.entities.Investor;

import java.util.List;

/**
 * Created by Sonik on 13.09.2017.
 */
public interface InvestorDao extends GeneralDao<Integer, Investor> {

    List<Investment> getStartUpSumInvest(int userId);

    void deleteInvestorByUserId(Integer id);
}
