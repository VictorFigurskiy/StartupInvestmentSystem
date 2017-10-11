package com.startup.project.controllers;

import com.startup.project.configurations.MvcConfiguration;
import com.startup.project.configurations.SecurityConfiguration;
import com.startup.project.controllers.config.TestAppModelConfiguration;
import com.startup.project.entities.*;
import com.startup.project.services.StartupService;
import org.hamcrest.CoreMatchers;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors;
import org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.IntStream;
import java.util.stream.Stream;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.spy;
import static org.mockito.Mockito.when;

@RunWith(SpringRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = {
        TestAppModelConfiguration.class,
        MvcConfiguration.class,
        SecurityConfiguration.class})
public class StartupDescriptionControllerTest {

    private MockMvc mockMvc;

    @Autowired
    private WebApplicationContext applicationContext;

    @Autowired
    private StartupService startupService;
    private int startupId;

    @Before
    public void setUp() throws Exception {
        startupId = 1;
        mockMvc = MockMvcBuilders
                .webAppContextSetup(applicationContext)
                .apply(SecurityMockMvcConfigurers.springSecurity())
                .build();
    }


    @Test
    public void startupDescription() throws Exception {
        Startup startup = mock(Startup.class);
        StartupDetail startupDetail = mock(StartupDetail.class);
        String industry = "industry";
        int limit = 4;
        List<Startup> startupList = spy(new ArrayList<>());
        List<Investor> investmentsList = spy(new ArrayList<>());
        Stream<Investor> investorStream = spy(Stream.class);
        Stream<BigDecimal> investmentStream = spy(Stream.class);
        IntStream intStream = spy(IntStream.class);
        Integer investmentsSum = 1000;
        BigDecimal bigDecimal = mock(BigDecimal.class);

        when(startupService.getById(startupId)).thenReturn(startup);
        when(startup.getStartupDetail()).thenReturn(startupDetail);
        when(startup.getIndustry()).thenReturn(industry);
        when(startupService.getByIndustry(startup.getIndustry(), limit, startupId)).thenReturn(startupList);
        when(startup.getInvestorList()).thenReturn(investmentsList);
        when(investmentsList.stream()).thenReturn(investorStream);
        when(investorStream.map(investor -> bigDecimal)).thenReturn(investmentStream);
        when(investmentStream.mapToInt(value -> 10)).thenReturn(intStream);
        when(intStream.sum()).thenReturn(investmentsSum);



        mockMvc.perform(MockMvcRequestBuilders.get("/startup_description/"+startupId)
                .with(SecurityMockMvcRequestPostProcessors.user("user").roles("ROLES")))
                .andExpect(MockMvcResultMatchers.model().attribute("similarStartup", startupList))
                .andExpect(MockMvcResultMatchers.model().attribute("investmentsSum", CoreMatchers.any(Integer.class)))
                .andExpect(MockMvcResultMatchers.model().attribute("startup", startup))
                .andExpect(MockMvcResultMatchers.model().attribute("startupDetail",startupDetail))
                .andExpect(MockMvcResultMatchers.view().name("single_startup_description"))
                .andExpect(MockMvcResultMatchers.status().isOk());
    }

}