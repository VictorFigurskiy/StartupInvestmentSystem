package com.startup.project.controllers;

import com.startup.project.dao.StartupDao;
import com.startup.project.entities.Startup;
import com.startup.project.services.StartupService;
import com.startup.project.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Sonik on 16.09.2017.
 */
@Controller
@RequestMapping(value = "/")
public class WelcomeController {

    @Autowired
    private StartupService startupService;

    @GetMapping
    public ModelAndView welcome() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        List<Startup> startupList = startupService.getAll();
        modelAndView.addObject("startupList",startupList);
        return modelAndView;
    }

    @PostMapping
    public String mainPage() {
        return "redirect:/";
    }

    @RequestMapping(value = "/404", method = RequestMethod.GET)
    public String errorPage(Model model) {
        return "404";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public String logout() {
        return "redirect:/";
    }

}
