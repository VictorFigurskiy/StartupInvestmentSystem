package com.startup.project.dao.Impl;

import com.startup.project.dao.Impl.config.TestConfiguration;
import com.startup.project.dao.InvestorDao;
import com.startup.project.entities.wrappers.Investment;
import com.startup.project.entities.Investor;
import com.startup.project.entities.Startup;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import static org.mockito.Mockito.*;

/**
 * Created by Sonik on 06.10.2017.
 */
@RunWith(SpringRunner.class)
@ContextConfiguration(classes = TestConfiguration.class)
public class InvestorDaoImplTest {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Investor investor;
    private Investment investment;
    private Startup startup;
    private InvestorDao investorDao;

    @Before
    public void setUp() throws Exception {
        session = mock(Session.class);
        when(sessionFactory.getCurrentSession()).thenReturn(session);
        investor = mock(Investor.class);
        startup = mock(Startup.class);
        investment = mock(Investment.class);
        investorDao = new InvestorDaoImpl(sessionFactory);
    }

//    @SuppressWarnings("unchecked")
//    @Test
//    public void getStartUpSumInvest() throws Exception {
//        Query<Startup> query = mock(Query.class);
//
//        List<Startup> list = new ArrayList<>();
//        List<Startup> spyList = spy(list);
//        spyList.add(startup);
//
//        when(session.createQuery("select startup from Startup as startup left join startup.investorList as investor " +
//                "where investor.investorUser.id=:id group by startup.id", Startup.class)).thenReturn(query);
//        when(query.setParameter("id", 1)).thenReturn(query);
//        when(query.list()).thenReturn(spyList);
//
//        Stream<Startup> stream  = mock(Stream.class);
//        Stream<Investment> stream2  = mock(Stream.class);
//        Investment[] investments = new Investment[1];
//        Investment[] spyInvestments = spy(investments);
//        spyInvestments[0] = investment;
//
//        when(stream.map(investor -> investment)).thenReturn(stream2);
//        when(stream2.toArray()).thenReturn(spyInvestments);
//
//        List<Investment> investmentList = new ArrayList<>();
//        List<Investment> spyInvestmentList = spy(investmentList);
//        spyInvestmentList.addAll(Arrays.asList(spyInvestments));
//
//        assertEquals(spyInvestmentList, investorDao.getStartUpSumInvest(1));
//
//    }

    @SuppressWarnings("unchecked")
    @Test
    public void deleteInvestorByUserId() throws Exception {
        Query<Investor> query = mock(Query.class);

        when(session.createQuery("delete from Investor investor where investor.investorUser.id=:id")).thenReturn(query);

        doAnswer(invocation -> null).when(query).setParameter("id", 1);

        investorDao.deleteInvestorByUserId(1);

        verify(session, atLeastOnce()).createQuery("delete from Investor investor where investor.investorUser.id=:id");
        verify(query, atLeastOnce()).setParameter("id", 1);
    }

}