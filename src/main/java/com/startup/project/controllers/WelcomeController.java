package com.startup.project.controllers;

import com.startup.project.entities.Startup;
import com.startup.project.services.StartupService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

    private static final Logger LOGGER = Logger.getLogger(WelcomeController.class);

    @Autowired
    private StartupService startupService;

    /**
     * This method shows all startup on main page.
     *
     * @return visual display of main page with all startups.
     */
    @GetMapping
    public ModelAndView welcome() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        List<Startup> startupList = startupService.getAll();
        modelAndView.addObject("startupList", startupList);
        LOGGER.info("Method 'welcome' worked successfully");
        return modelAndView;
    }

    /**
     * This method shows main page.
     *
     * @return visual display of main page.
     */

    @PostMapping
    public String mainPage() {
        LOGGER.info("Method 'mainPage' worked successfully");
        return "redirect:/";
    }

    /**
     * This method shows form of incorrect login.
     *
     * @param modelAndView - visual display of incorrect login form.
     * @return visual display of incorrect login form.
     */
    @RequestMapping(value = "/login_error", method = RequestMethod.GET)
    public ModelAndView errorPage(ModelAndView modelAndView) {
        modelAndView.setViewName("login");
        modelAndView.addObject("errorLogin", "Неправильно введены данные логина или пароля, попробуйте еще раз!");
        LOGGER.info("Method 'errorPage' worked successfully");
        return modelAndView;
    }

    /**
     * This method makes log out from system.
     *
     * @return main page.
     */
    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public String logout() {
        LOGGER.info("Method 'logout' worked successfully");
        return "redirect:/";
    }

}
