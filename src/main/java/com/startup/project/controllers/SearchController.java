package com.startup.project.controllers;

import com.startup.project.entities.Startup;
import com.startup.project.services.StartupService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


/**
 * Created by Sonik on 01.10.2017.
 */
@Controller
@RequestMapping(value = "/search")
public class SearchController {

    private static final Logger LOGGER = Logger.getLogger(SearchController  .class);

    @Autowired
    private StartupService startupService;

    /**
     * This method shows form for search startup by name.
     *
     * @param name - criteria(name) for our search.
     * @return visual display of form search by name.
     */
    @RequestMapping(value = "/byName", method = RequestMethod.GET)
    public ModelAndView findByName(@RequestParam("name") String name) {
        ModelAndView modelAndView = new ModelAndView();
        List<Startup> startupList = startupService.searchByName(name);
        modelAndView.addObject("startupList", startupList);
        modelAndView.setViewName("index");
        LOGGER.info("Method 'findByName' worked successfully");
        return modelAndView;
    }

    /**
     * * This method shows form for search startup by country.
     *
     * @param country - criteria(country) for our search.
     * @return visual display of form search by country.
     */
    @RequestMapping(value = "/byCountry", method = RequestMethod.GET)
    public ModelAndView findByCountry(@RequestParam(value = "country") String country) {
        ModelAndView modelAndView = new ModelAndView();
        List<Startup> startupList = startupService.searchByCounty(country);
        modelAndView.addObject("startupList", startupList);
        modelAndView.setViewName("index");
        LOGGER.info("Method 'findByCountry' worked successfully");
        return modelAndView;
    }
}
