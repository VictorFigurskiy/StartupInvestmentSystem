package com.startup.project.controllers;

import com.startup.project.entities.Startup;
import com.startup.project.services.StartupService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
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

    @RequestMapping(value = "/loginerror", method = RequestMethod.GET)
    public ModelAndView errorPage(ModelAndView modelAndView) {
//        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        modelAndView.addObject("errorLogin", "Неправильно введены данные логина или пароля, попробуйте еще раз!");
        return modelAndView;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public String logout() {
        return "redirect:/";
    }

}
