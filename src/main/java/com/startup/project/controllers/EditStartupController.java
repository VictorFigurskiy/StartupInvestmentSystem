package com.startup.project.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/edit_startup")
public class EditStartupController {

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView editSrartupDetails(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("edit_startup");
        return modelAndView;
    }
}
