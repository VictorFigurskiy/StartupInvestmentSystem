package com.startup.project.services;

import com.startup.project.dao.InvestorDao;
import com.startup.project.entities.wrappers.Investment;
import com.startup.project.entities.Investor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Sonik on 15.09.2017.
 */
@Service
public class InvestorService {

    private InvestorDao dao;

    @Autowired
    public InvestorService(InvestorDao dao) {
        this.dao = dao;
    }

    @Transactional(readOnly = true)
    public Investor getById(Integer id) {
        return dao.getById(Investor.class, id);
    }

    @Transactional(readOnly = true)
    public List<Investor> getAll() {
        return dao.getAll(Investor.class);
    }

    @Transactional
    public void save(Investor entity) {
        dao.save(entity);
    }

    @Transactional
    public void update(Investor entity) {
        dao.update(entity);
    }

    @Transactional
    public void delete(Investor entity) {
        dao.delete(entity);
    }

    @Transactional
    public List<Investment> getInvestment(int userId) {
        return dao.getStartUpSumInvest(userId);
    }

    @Transactional
    public void deleteInvestorByUserId(Integer id) {
        dao.deleteInvestorByUserId(id);
    }
}
