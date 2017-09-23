package com.startup.project.controllers;

import com.startup.project.entities.Startup;
import com.startup.project.services.StartupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value ="/add_startup")
public class AddStartupController {

    @Autowired
    private StartupService startupService;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView setStartupModel() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("add_startup");
        modelAndView.addObject("startupReg", new Startup());
        return modelAndView;
    }

    @PostMapping
    public String addNewStartup(@ModelAttribute("startupReg") Startup startup){
        startupService.save(startup);
        return "redirect:/";
    }
}
