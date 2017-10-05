package com.startup.project.controllers.config;

import com.startup.project.services.*;
import org.mockito.Mockito;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Created by Sonik on 05.10.2017.
 */
@Configuration
public class TestAppModelConfiguration {

    @Bean
    public InvestorService investorService(){
        return Mockito.mock(InvestorService.class);
    }

    @Bean
    public StartupDetailService startupDetailService(){
        return Mockito.mock(StartupDetailService.class);
    }

    @Bean
    public StartupService startupService(){
        return Mockito.mock(StartupService.class);
    }

    @Bean
    public UserDetailedServiceImpl userDetailedService(){
        return Mockito.mock(UserDetailedServiceImpl.class);
    }

    @Bean
    public UserRoleService userRoleService(){
        return Mockito.mock(UserRoleService.class);
    }

    @Bean
    public UserService userService(){
        return Mockito.mock(UserService.class);
    }

}
