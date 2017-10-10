package com.startup.project.controllers;

import com.startup.project.entities.Startup;
import com.startup.project.services.StartupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.ws.rs.GET;
import java.util.List;


/**
 * Created by Sonik on 01.10.2017.
 */
@Controller
@RequestMapping(value = "/search")
public class SearchController {

    @Autowired
    private StartupService startupService;

    @RequestMapping(value = "/byName", method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public ModelAndView findByName(@RequestParam("name") String name){
        ModelAndView modelAndView = new ModelAndView();
        List<Startup> startupList = startupService.searchByName(name);
        modelAndView.addObject("startupList",startupList);
        modelAndView.setViewName("index");
        return modelAndView;
    }

    @RequestMapping(value = "/byCountry" , method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public ModelAndView findByCountry(@RequestParam(value = "country") String country){
        ModelAndView modelAndView = new ModelAndView();
        List<Startup> startupList = startupService.searchByCounty(country);
        modelAndView.addObject("startupList",startupList);
        modelAndView.setViewName("index");
        return modelAndView;
    }
}
