package com.startup.project.controllers;

import com.startup.project.configurations.MvcConfiguration;
import com.startup.project.configurations.SecurityConfiguration;
import com.startup.project.controllers.config.TestAppModelConfiguration;
import com.startup.project.entities.Startup;
import com.startup.project.entities.StartupDetail;
import com.startup.project.services.StartupService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
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

import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

@RunWith(SpringRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = {
        TestAppModelConfiguration.class,
        MvcConfiguration.class,
        SecurityConfiguration.class})
public class EditStartupControllerTest {

    @Autowired
    private StartupService startupService;

    @Autowired
    private WebApplicationContext applicationContext;

    private MockMvc mockMvc;

    private Startup startup;
    private StartupDetail startupDetail;
    private int startupId;

    @Before
    public void setUp() throws Exception {
        startupId = 1;
        startup = mock(Startup.class);
        startupDetail = mock(StartupDetail.class);
        mockMvc = MockMvcBuilders
                .webAppContextSetup(applicationContext)
                .apply(SecurityMockMvcConfigurers.springSecurity())
                .build();
    }

    @Test
    public void editStartupPage() throws Exception {

        when(startupService.getById(startupId)).thenReturn(startup);
        when(startup.getStartupDetail()).thenReturn(startupDetail);

        mockMvc.perform(MockMvcRequestBuilders.post("/edit_startup/update_page").param("id", "1")
                .with(SecurityMockMvcRequestPostProcessors.user("user").roles("USER")))
                .andExpect(MockMvcResultMatchers.model().attribute("startup", startup))
                .andExpect(MockMvcResultMatchers.model().attribute("startupDetail", startupDetail))
                .andExpect(MockMvcResultMatchers.view().name("edit_startup"))
                .andExpect(MockMvcResultMatchers.status().isOk());
    }

    @Test
    public void updateStartup() throws Exception {

        when(startupService.getById(startupId)).thenReturn(startup);
        when(startup.getStartupDetail()).thenReturn(startupDetail);

        mockMvc.perform(MockMvcRequestBuilders.post("/edit_startup/update").contentType(MediaType.APPLICATION_FORM_URLENCODED_VALUE)
                .param("startup_id", "1").requestAttr("Startup", startup).requestAttr("StartupDetail", startupDetail)
                .with(SecurityMockMvcRequestPostProcessors.user("user").roles("USER")))
                .andExpect(MockMvcResultMatchers.redirectedUrl("/account"))
                .andExpect(MockMvcResultMatchers.status().isFound());
    }

    @Test
    public void deleteStartup() throws Exception {

        when(startupService.getById(startupId)).thenReturn(startup);
        doAnswer(inv -> null).when(startupService).delete(startup);

        mockMvc.perform(MockMvcRequestBuilders.post("/edit_startup/delete").param("startup_id", "1")
                .with(SecurityMockMvcRequestPostProcessors.user("user").roles("USER")))
                .andExpect(MockMvcResultMatchers.redirectedUrl("/account"))
                .andExpect(MockMvcResultMatchers.status().isFound());
    }

}