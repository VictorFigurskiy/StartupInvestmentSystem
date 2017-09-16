package com.startup.project.controllers;

import com.startup.project.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Sonik on 16.09.2017.
 */
@Controller
@RequestMapping(value = "/")
public class WelcomeController {

    @Autowired
    private UserService userService;

    @GetMapping
    public String welcome(){
        return "index";
    }
}
