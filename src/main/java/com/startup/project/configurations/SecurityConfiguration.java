package com.startup.project.configurations;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 * Created by Sonik on 14.09.2017.
 */
@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/", "/static/**").permitAll()
                .antMatchers("/index").hasRole("USER")
                .antMatchers("/jpeg/**").authenticated()
                .anyRequest().denyAll()
             .and()
                .formLogin()
//                .loginPage()
//                .successForwardUrl()
//                .loginProcessingUrl()
//                .failureUrl()
//                .usernameParameter()
//                .passwordParameter()
//                .permitAll()
             .and()
                .logout()
                .permitAll()
//                .logoutUrl()
//                .logoutSuccessUrl()
                .invalidateHttpSession(true)
             .and()
                .csrf().disable();
    }
}
