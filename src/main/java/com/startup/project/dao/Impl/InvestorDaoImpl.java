package com.startup.project.dao.Impl;

import com.startup.project.dao.InvestorDao;
import com.startup.project.entities.Investment;
import com.startup.project.entities.Investor;
import com.startup.project.entities.Startup;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.*;

/**
 * Created by Sonik on 14.09.2017.
 */
@Repository
public class InvestorDaoImpl extends AbstractGenericDaoImpl<Integer, Investor> implements InvestorDao {

    private SessionFactory sessionFactory;

    @Autowired
    public InvestorDaoImpl(SessionFactory sessionFactory) {
        super(sessionFactory);
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Investment> getStartUpSumInvest(int userId) {
        Session currentSession = sessionFactory.getCurrentSession();

        List<Investment> investmentList = Collections.emptyList();

        List<Startup> startupList = currentSession.createQuery
                ("select startup from Startup as startup left join startup.investorList as investor " +
                        "where investor.investorUser.id=:id group by startup.id", Startup.class)
                .setParameter("id", userId)
                .list();

        getLogger().info("HQL query is done successfully!");

        if (startupList != null) {
            Investment[] investments = startupList.stream()
                    .map(startup -> {
                        double sum = startup.getInvestorList().stream()
                                .filter(investor -> investor.getInvestorUser().getId() == userId)
                                .map(Investor::getInvestments)
                                .mapToDouble(BigDecimal::doubleValue)
                                .sum();
                        return new Investment(startup.getId(), startup.getStartupName(), new BigDecimal(sum));
                    }).toArray(Investment[]::new);

            investmentList = new ArrayList<>(Arrays.asList(investments));

            getLogger().info("Investments list is not empty!");
        } else {
            getLogger().warn("Investments list is empty!!!");
        }

        return investmentList;
    }

    @Override
    public void deleteInvestorByUserId(Integer id) {
        Session session = sessionFactory.getCurrentSession();

        session.createQuery("delete from Investor investor where investor.investorUser.id=:id")
                .setParameter("id", id);

        getLogger().info("Investor with id:"+id+" deleted successfully!");
    }
}
