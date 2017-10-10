package com.startup.project.application;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;
import org.springframework.web.filter.CharacterEncodingFilter;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;

/**
 * Created by Sonik on 14.09.2017.
 */
public class WebSecurityInitializer extends AbstractSecurityWebApplicationInitializer {

//    /**
//     * // Set encoding to UTF-8 from jsp.
//     * @param servletContext
//     */
//    @Override
//    protected void beforeSpringSecurityFilterChain(ServletContext servletContext) {
//        FilterRegistration.Dynamic characterEncodingFilter = servletContext.addFilter("encodingFilter", new CharacterEncodingFilter());
//        characterEncodingFilter.setInitParameter("encoding","UTF-8");
//        characterEncodingFilter.setInitParameter("forceEncoding", "true");
//        characterEncodingFilter.addMappingForUrlPatterns(null,false,"/*" );
//    }
}
