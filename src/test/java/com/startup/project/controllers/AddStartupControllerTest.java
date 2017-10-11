package com.startup.project.controllers;

import com.startup.project.configurations.MvcConfiguration;
import com.startup.project.configurations.SecurityConfiguration;
import com.startup.project.controllers.config.TestAppModelConfiguration;
import com.startup.project.entities.Startup;
import com.startup.project.entities.StartupDetail;
import com.startup.project.entities.User;
import com.startup.project.services.StartupService;
import com.startup.project.services.UserService;
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
import org.springframework.web.servlet.ModelAndView;

import static org.mockito.Mockito.*;


@RunWith(SpringRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = {
        TestAppModelConfiguration.class,
        MvcConfiguration.class,
        SecurityConfiguration.class})
public class AddStartupControllerTest {

    private MockMvc mockMvc;

    @Autowired
    private WebApplicationContext applicationContext;

    @Autowired
    private UserService userService;

    @Autowired
    private StartupService startupService;

    private User user;

    private Startup startup;

    private StartupDetail startupDetail;


    @Before
    public void setUp() throws Exception {
        user = mock(User.class);
        startup = mock(Startup.class);
        startupDetail = mock(StartupDetail.class);
        mockMvc = MockMvcBuilders
                .webAppContextSetup(applicationContext)
                .apply(SecurityMockMvcConfigurers.springSecurity())
                .build();
    }

    @Test
    public void setStartupModel() throws Exception {

        ModelAndView modelAndView = mock(ModelAndView.class);
        doAnswer(inv -> null).when(modelAndView).setViewName("add_startup");
        when(modelAndView.addObject("startupReg", new Startup())).thenReturn(modelAndView);
        when(modelAndView.addObject("startupDetailReg", new StartupDetail())).thenReturn(modelAndView);

        mockMvc.perform(MockMvcRequestBuilders.get("/add_startup").with(SecurityMockMvcRequestPostProcessors.user("user").roles("USER")))
                .andExpect(MockMvcResultMatchers.view().name("add_startup"))
                .andExpect(MockMvcResultMatchers.model().attribute("startupReg", CoreMatchers.any(Startup.class)))
                .andExpect(MockMvcResultMatchers.model().attribute("startupDetailReg", CoreMatchers.any(StartupDetail.class)))
                .andExpect(MockMvcResultMatchers.status().isOk());
    }

    @Test
    public void addStartup() throws Exception {

        doAnswer(inv -> null).when(startup).setStartupDetail(startupDetail);
        when(userService.getByEmail("email@gmail.com")).thenReturn(user);
        doAnswer(inv -> null).when(startup).setOwnerUser(user);
        doAnswer(inv -> null).when(startupService).save(startup);

        mockMvc.perform(MockMvcRequestBuilders.post("/add_startup")
                .requestAttr("startupReg", startup).requestAttr("startupDetailReg", startupDetail)
                .with(SecurityMockMvcRequestPostProcessors.user("user").roles("USER")))
                .andExpect(MockMvcResultMatchers.redirectedUrl("/account"))
                .andExpect(MockMvcResultMatchers.status().isFound());
    }

}