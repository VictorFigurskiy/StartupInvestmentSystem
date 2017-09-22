package com.startup.project.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Sonik on 19.09.2017.
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController {

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView loginPage(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        modelAndView.addObject("errorLogin", "");
        return modelAndView;
    }
}
