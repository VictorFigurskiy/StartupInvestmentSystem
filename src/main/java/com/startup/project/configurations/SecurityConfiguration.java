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
                .antMatchers("/", "/static/**", "/login", "/registration", "/startup_description/*", "/search/**").permitAll()
                .antMatchers("/account/**","/add_startup","/edit_startup/**", "/investment/**").hasAnyRole("USER", "OWNER")
                .antMatchers("/jpeg/**").authenticated()
                .anyRequest().denyAll()
             .and()
                .formLogin()
                .loginPage("/")
                .loginPage("/login")
                .successForwardUrl("/")
                .loginProcessingUrl("/j_spring_security_check")
                .failureUrl("/login_error")
                .usernameParameter("j_username")
                .passwordParameter("j_password")
                .permitAll()
             .and()
                .logout()
                .permitAll()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/")
                .invalidateHttpSession(true)
             .and()
                .csrf().disable();
    }
}
