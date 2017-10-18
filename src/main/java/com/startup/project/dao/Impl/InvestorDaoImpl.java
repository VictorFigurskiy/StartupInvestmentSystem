package com.startup.project.dao.Impl;

import com.startup.project.dao.InvestorDao;
import com.startup.project.entities.wrappers.Investment;
import com.startup.project.entities.Investor;
import com.startup.project.entities.Startup;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.*;


/**
 * This class is extended from {@link AbstractGenericDaoImpl} and provide CRUD methods for working with database
 * also he implements {@link InvestorDao} with the same abstract method and gives us the opportunity add custom
 * methods. This class is defined with generic types of {@link AbstractGenericDaoImpl}
 * K - {@link Integer}
 * V - {@link Investor}
 *
 * @author Sonik
 * @since 14.09.2017
 */
@Repository
public class InvestorDaoImpl extends AbstractGenericDaoImpl<Integer, Investor> implements InvestorDao {

    private SessionFactory sessionFactory;


    /**
     * Initializes a new instance {@link InvestorDaoImpl}
     *
     * @param sessionFactory initial value
     */
    @Autowired
    public InvestorDaoImpl(SessionFactory sessionFactory) {
        super(sessionFactory);
        this.sessionFactory = sessionFactory;
    }


    /**
     * Calculating of total cost of all investments of a particular user
     *
     * @param userId user Id in database
     * @return {@link List} of {@link Investment} that contains amount of investment and name
     */
    @Override
    public List<Investment> getStartUpSumInvest(int userId) {
        Session currentSession = sessionFactory.getCurrentSession();

        List<Investment> investmentList = Collections.emptyList();

        List<Startup> startupList = currentSession.createQuery
                ("select startup from Startup as startup left join startup.investorList as investor " +
                        "where investor.investorUser.id=:id group by startup.id", Startup.class)
                .setParameter("id", userId)
                .list();

        LOGGER.info("Hibernate query 'getStartUpSumInvest' is done successfully!");

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

            LOGGER.info("Investments list contains " + investmentList.size() + " elements!");
        } else {
            LOGGER.info("Investments list is empty!!!");
        }

        return investmentList;
    }


    /**
     * Delete all investment by user Id
     *
     * @param id user Id
     */
    @Override
    public void deleteInvestorByUserId(Integer id) {
        Session session = sessionFactory.getCurrentSession();

        session.createQuery("delete from Investor investor where investor.investorUser.id=:id")
                .setParameter("id", id);

        LOGGER.info("Investor with id: " + id + " deleted successfully!");
    }
}
