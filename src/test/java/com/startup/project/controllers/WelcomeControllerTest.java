package com.startup.project.controllers;

import com.startup.project.configurations.MvcConfiguration;
import com.startup.project.configurations.SecurityConfiguration;
import com.startup.project.controllers.config.TestAppModelConfiguration;
import com.startup.project.entities.Startup;
import com.startup.project.services.StartupService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
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

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

/**
 * Created by Sonik on 11.10.2017.
 */
@RunWith(SpringRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = {
        TestAppModelConfiguration.class,
        MvcConfiguration.class,
        SecurityConfiguration.class})
public class WelcomeControllerTest {

    private MockMvc mvc;

    @Autowired
    private WebApplicationContext context;
    @Autowired
    private StartupService startupService;
    private Startup startup;

    @Before
    public void setUp() throws Exception {
        startup = mock(Startup.class);
        mvc = MockMvcBuilders
                .webAppContextSetup(context)
                .apply(SecurityMockMvcConfigurers.springSecurity())
                .build();
    }

    @Test
    public void welcome() throws Exception {
        List<Startup> spyList = spy(new ArrayList<>());
        spyList.add(startup);

        when(startupService.getAll()).thenReturn(spyList);

        mvc.perform(MockMvcRequestBuilders.get("/").with(SecurityMockMvcRequestPostProcessors.user("someUser").roles("USER")))
                .andExpect(MockMvcResultMatchers.view().name("index"))
                .andExpect(MockMvcResultMatchers.model().attribute("startupList",spyList))
                .andExpect(MockMvcResultMatchers.status().isOk());

        verify(startupService, atLeastOnce()).getAll();
    }

    @Test
    public void mainPage() throws Exception {
        mvc.perform(MockMvcRequestBuilders.post("/").with(SecurityMockMvcRequestPostProcessors.user("someUser").roles("USER")))
                .andExpect(MockMvcResultMatchers.redirectedUrl("/"))
                .andExpect(MockMvcResultMatchers.status().is3xxRedirection());
    }

    @Test
    public void errorPage() throws Exception {
        mvc.perform(MockMvcRequestBuilders.get("/login_error").with(SecurityMockMvcRequestPostProcessors.user("someUser").roles("USER")))
                .andExpect(MockMvcResultMatchers.view().name("login"))
                .andExpect(MockMvcResultMatchers.model().attribute("errorLogin","Неправильно введены данные логина или пароля, попробуйте еще раз!"))
                .andExpect(MockMvcResultMatchers.status().isOk());
    }

    @Test
    public void logout() throws Exception {
        mvc.perform(MockMvcRequestBuilders.post("/logout").with(SecurityMockMvcRequestPostProcessors.user("someUser").roles("USER")))
                .andExpect(MockMvcResultMatchers.redirectedUrl("/"))
                .andExpect(MockMvcResultMatchers.status().isFound());
    }

}