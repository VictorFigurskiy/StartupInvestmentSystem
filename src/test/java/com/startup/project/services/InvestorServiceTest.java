package com.startup.project.services;

import com.startup.project.dao.InvestorDao;
import com.startup.project.entities.wrappers.Investment;
import com.startup.project.entities.Investor;
import com.startup.project.entities.Startup;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;
import static org.mockito.Mockito.atLeastOnce;


public class InvestorServiceTest {
    private Investor investor;
    private InvestorDao investorDao;
    private InvestorService investorService;


    @Before
    public void setUp() throws Exception {
        investor = Mockito.mock(Investor.class);

        investorDao = Mockito.mock(InvestorDao.class);

        investorService = new InvestorService(investorDao);
        when(investor.getId()).thenReturn(1);
    }

    @Test
    public void getById() throws Exception {
        Integer id = 1;
        when(investorDao.getById(Investor.class, id)).thenReturn(investor);
        assertEquals(id, investor.getId());
        assertEquals(investor, investorService.getById(1));
        verify(investorDao, atLeast(1)).getById(Investor.class, 1);
    }

    @Test
    public void getAll() throws Exception {
        List<Investor> spyList = spy(new ArrayList<>());
        when(investorDao.getAll(Investor.class)).thenReturn(spyList);

        assertEquals(spyList, investorService.getAll());

        verify(investorDao, atLeast(1)).getAll(Investor.class);
    }

    @Test
    public void save() throws Exception {
        List<Startup> startups = new ArrayList<>();
        when(investor.getStartupList()).thenReturn(startups);
        doAnswer(invocationOnMock -> {
            Investor investor = invocationOnMock.getArgument(0);
            assertEquals(startups, investor.getStartupList());
            return null;
        }).when(investorDao).save(investor);
        investorService.save(investor);
        verify(investorDao, atLeastOnce()).save(investor);
    }

    @Test
    public void update() throws Exception {
        doAnswer(invocationOnMock -> null).when(investorDao).update(investor);
        investorService.update(investor);
        verify(investorDao, atLeastOnce()).update(investor);
    }

    @Test
    public void delete() throws Exception {
        doAnswer(invocationOnMock -> null).when(investorDao).delete(investor);
        investorService.delete(investor);
        verify(investorDao, times(1)).delete(investor);
    }

    @SuppressWarnings("unchecked")
    @Test
    public void getInvestment() throws Exception {
        List<Investment> investment = mock(List.class);

        when(investorDao.getStartUpSumInvest(1)).thenReturn(investment);

        assertEquals(investment, investorService.getInvestment(1));

        verify(investorDao, atLeast(1)).getStartUpSumInvest(1);
    }

    @Test
    public void deleteInvestorByUserId() throws Exception {

        doAnswer(invocationOnMock -> null).when(investorDao).deleteInvestorByUserId(1);
        investorService.deleteInvestorByUserId(1);
        verify(investorDao, times(1)).deleteInvestorByUserId(1);
    }
}