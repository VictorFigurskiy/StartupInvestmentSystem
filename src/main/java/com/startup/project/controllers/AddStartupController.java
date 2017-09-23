package com.startup.project.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value ="/add_startup")
public class AddStartupController {

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView editStartupPage(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("add_startup");
        return modelAndView;
    }
}
