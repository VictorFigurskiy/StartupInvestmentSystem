package com.startup.project.controllers;

import com.startup.project.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Sonik on 16.09.2017.
 */
@Controller
@RequestMapping(value = "/")
public class WelcomeController {

    @GetMapping
    public String welcome() {
        return "index";
    }

    @RequestMapping(value = "/index", method = RequestMethod.POST)
    public String mainPage() {
        return "index";
    }

    @RequestMapping(value = "/404", method = RequestMethod.GET)
    public String errorPage(Model model) {
        return "404";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public String logout() {
        // http://localhost:8080/login?logout
        return "redirect:/login?logout";
    }
}
