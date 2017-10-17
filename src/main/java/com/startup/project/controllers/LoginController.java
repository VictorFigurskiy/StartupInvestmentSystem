package com.startup.project.controllers;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Sonik on 19.09.2017.
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController {

    private static final Logger LOGGER = Logger.getLogger(LoginController.class);

    /**
     * This method shows login form for enter to our Startup service by user.
     *
     * @return visual display of login form.
     */
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView loginPage() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        modelAndView.addObject("errorLogin", "");
        LOGGER.info("Method 'loginPage' worked successfully");
        return modelAndView;
    }
}
