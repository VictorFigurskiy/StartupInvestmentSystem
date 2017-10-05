package com.startup.project.dao.Impl.config;

import org.hibernate.SessionFactory;
import org.mockito.Mockito;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Created by Sonik on 05.10.2017.
 */
@Configuration
public class TestConfiguration {

    @Bean
    public SessionFactory sessionFactory(){
        return Mockito.mock(SessionFactory.class);
    }
}
