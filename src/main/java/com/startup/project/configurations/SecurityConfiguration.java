package com.startup.project.configurations;

import com.startup.project.services.UserDetailedServiceImpl;
import com.startup.project.services.UserService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 * Created by Sonik on 14.09.2017.
 */
@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Bean
    public UserDetailsService userDetailsService(UserService userService) {
        return new UserDetailedServiceImpl(userService);
    }

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
