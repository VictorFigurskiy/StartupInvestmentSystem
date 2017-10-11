package com.startup.project.controllers;

import com.startup.project.configurations.MvcConfiguration;
import com.startup.project.configurations.SecurityConfiguration;
import com.startup.project.controllers.config.TestAppModelConfiguration;
import com.startup.project.entities.Investment;
import com.startup.project.entities.User;
import com.startup.project.services.InvestorService;
import com.startup.project.services.UserService;
import org.hamcrest.CoreMatchers;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
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


import java.util.Collections;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;


@RunWith(SpringRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = {
        TestAppModelConfiguration.class,
        MvcConfiguration.class,
        SecurityConfiguration.class})
public class AccountControllerTest {

    private MockMvc mockMvc;

    @Autowired
    private WebApplicationContext applicationContext;

    @Autowired
    private UserService userService;

    @Autowired
    private InvestorService investorService;

    private User user;

    private int id;


    @Before
    public void setUp() throws Exception {
        id = 1;
        user = mock(User.class);
        mockMvc = MockMvcBuilders
                .webAppContextSetup(applicationContext)
                .apply(SecurityMockMvcConfigurers.springSecurity())
                .build();
    }

    @Test
    public void accountPage() throws Exception {
        UserDetails principal = mock(UserDetails.class);
        int id = 1;
        Investment investment = mock(Investment.class);

        when(principal.getUsername()).thenReturn("someUser");
        when(userService.getByEmail(principal.getUsername())).thenReturn(user);
        when(user.getId()).thenReturn(id);
        when(investorService.getInvestment(user.getId())).thenReturn(Collections.singletonList(investment));

        mockMvc.perform(MockMvcRequestBuilders.get("/account")
                .with(SecurityMockMvcRequestPostProcessors.user("someUser").roles("USER")))
                .andExpect(MockMvcResultMatchers.model().attribute("currentUser", user))
                .andExpect(MockMvcResultMatchers.model().attribute("investments", CoreMatchers.equalTo(Collections.singletonList(investment))))
                .andExpect(MockMvcResultMatchers.view().name("account"))
                .andExpect(MockMvcResultMatchers.status().isOk());
    }

    @Test
    public void editUserForm() throws Exception {

        when(userService.getById(id)).thenReturn(user);
        assertEquals(user ,userService.getById(id));
        verify(userService, atLeast(1)).getById(id);

        mockMvc.perform(MockMvcRequestBuilders
                .post("/account/edit-page").param("userId", "1")
                .with(SecurityMockMvcRequestPostProcessors.user("user").roles("USER")))
                .andExpect(MockMvcResultMatchers.model().attribute("userForEdit", user))
                .andExpect(MockMvcResultMatchers.view().name("edit_account"))
                .andExpect(MockMvcResultMatchers.status().isOk());


    }


    @Test
    public void editUserPass() throws Exception {

        when(userService.getById(id)).thenReturn(user);
        assertEquals(user ,userService.getById(id));
        verify(userService, atLeast(1)).getById(id);

        mockMvc.perform(MockMvcRequestBuilders
                .post("/account/edit-password").param("userId", "1")
                .with(SecurityMockMvcRequestPostProcessors.user("user").roles("USER")))
                .andExpect(MockMvcResultMatchers.model().attribute("userForEdit", user))
                .andExpect(MockMvcResultMatchers.view().name("edit_password"))
                .andExpect(MockMvcResultMatchers.status().isOk());
    }

    @Test
    @Ignore
    public void updatePassword() throws Exception {


        mockMvc.perform(MockMvcRequestBuilders.post("/account/editpass").requestAttr("userForEdit", user)
                .with(SecurityMockMvcRequestPostProcessors.user("user").roles("USER")))
                .andExpect(MockMvcResultMatchers.redirectedUrl("/account"))
                .andExpect(MockMvcResultMatchers.status().isFound());

    }

    @Test
    public void updateUser() throws Exception {
    }

    @Test
    public void deleteUser() throws Exception {

        when(userService.getById(id)).thenReturn(user);
        doAnswer(inv->null).when(investorService).deleteInvestorByUserId(id);
        doAnswer(inv->null).when(userService).delete(user);

        mockMvc.perform(MockMvcRequestBuilders.post("/account/delete").param("userId", "1")
                .with(SecurityMockMvcRequestPostProcessors.user("user").roles("USER")))
                .andExpect(MockMvcResultMatchers.redirectedUrl("/"))
                .andExpect(MockMvcResultMatchers.status().isFound());
    }


}