package com.startup.project.controllers;

import com.startup.project.configurations.MvcConfiguration;
import com.startup.project.configurations.SecurityConfiguration;
import com.startup.project.controllers.config.TestAppModelConfiguration;
import com.startup.project.entities.Startup;
import com.startup.project.services.StartupService;
import org.hamcrest.CoreMatchers;
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
import java.util.Collections;
import java.util.List;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

/**
 * Created by Sonik on 12.10.2017.
 */
@RunWith(SpringRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = {
        TestAppModelConfiguration.class,
        MvcConfiguration.class,
        SecurityConfiguration.class})
public class SearchControllerTest {

    private MockMvc mockMvc;

    @Autowired
    private WebApplicationContext applicationContext;
    @Autowired
    private StartupService startupService;

    private Startup startup;

    @SuppressWarnings("unchecked")
    @Before
    public void setUp() throws Exception {
        startup = mock(Startup.class);
        mockMvc = MockMvcBuilders
                .webAppContextSetup(applicationContext)
                .apply(SecurityMockMvcConfigurers.springSecurity())
                .build();

    }

    @Test
    public void findByName() throws Exception {
        when(startupService.searchByName("someName")).thenReturn(Collections.singletonList(startup));

        mockMvc.perform(MockMvcRequestBuilders.get("/search/byName").param("name", "someName")
                .with(SecurityMockMvcRequestPostProcessors.user("user").roles("USER")))
                .andExpect(MockMvcResultMatchers.model().attribute("startupList", CoreMatchers.equalTo(Collections.singletonList(startup))))
                .andExpect(MockMvcResultMatchers.view().name("index"))
                .andExpect(MockMvcResultMatchers.status().isOk());
    }

    @Test
    public void findByCountry() throws Exception {
        when(startupService.searchByCounty("someCountry")).thenReturn(Collections.singletonList(startup));

        mockMvc.perform(MockMvcRequestBuilders.get("/search/byCountry").param("country", "someCountry")
                .with(SecurityMockMvcRequestPostProcessors.user("user").roles("USER")))
                .andExpect(MockMvcResultMatchers.model().attribute("startupList", CoreMatchers.equalTo(Collections.singletonList(startup))))
                .andExpect(MockMvcResultMatchers.view().name("index"))
                .andExpect(MockMvcResultMatchers.status().isOk());
    }

}