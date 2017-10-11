package com.startup.project.controllers;

import com.startup.project.configurations.MvcConfiguration;
import com.startup.project.configurations.SecurityConfiguration;
import com.startup.project.controllers.config.TestAppModelConfiguration;
import com.startup.project.entities.Investor;
import com.startup.project.entities.Startup;
import com.startup.project.entities.User;
import com.startup.project.services.StartupService;
import com.startup.project.services.UserService;
import org.hamcrest.CoreMatchers;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;

import java.math.BigDecimal;
import java.security.Principal;

import static org.junit.Assert.*;
import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

@RunWith(SpringRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = {
        TestAppModelConfiguration.class,
        MvcConfiguration.class,
        SecurityConfiguration.class})
public class InvestmentControllerTest {

    private MockMvc mockMvc;

    @Autowired
    private UserService userService;

    @Autowired
    private StartupService startupService;

    @Autowired
    private WebApplicationContext applicationContext;

    private User user;
    private Startup startup;

    @Before
    public void setUp() throws Exception {
        user = mock(User.class);
        startup = mock(Startup.class);
        mockMvc = MockMvcBuilders
                .webAppContextSetup(applicationContext)
                .apply(SecurityMockMvcConfigurers.springSecurity())
                .build();
    }


    @Test

    public void investmentPage() throws Exception {

        Principal principal = mock(Principal.class);

        when(startupService.getById(1)).thenReturn(startup);
        when(principal.getName()).thenReturn("user");
        when(userService.getByEmail(principal.getName())).thenReturn(user);


        mockMvc.perform(MockMvcRequestBuilders.post("/investment").param("startup_id", "1")
                .with(SecurityMockMvcRequestPostProcessors.user("user").roles("USER")))
                .andExpect(MockMvcResultMatchers.model().attribute("user", user))
                .andExpect(MockMvcResultMatchers.model().attribute("startup", startup))
                .andExpect(MockMvcResultMatchers.view().name("invest"))
                .andExpect(MockMvcResultMatchers.status().isOk());
    }

    @Test
    public void confirmInvest() throws Exception {

        Principal principal = mock(Principal.class);
        Investor investor = mock(Investor.class);
        when(principal.getName()).thenReturn("name");
        when(userService.getByEmail(principal.getName())).thenReturn(user);
        when(startupService.getById(1)).thenReturn(startup);
        doAnswer(inv -> null).when(investor).setInvestments(new BigDecimal(1));
        doAnswer(inv -> null).when(investor).setInvestorUser(user);

        doAnswer(inv->null).when(startupService).update(startup);

        mockMvc.perform(MockMvcRequestBuilders.post("/investment/confirm")
                .param("startupId", "1").param("sum", "100")
                .with(SecurityMockMvcRequestPostProcessors.user("user").roles("USER")))
                .andExpect(MockMvcResultMatchers.redirectedUrl("/startup_description/1"))
                .andExpect(MockMvcResultMatchers.status().isFound());
    }

}