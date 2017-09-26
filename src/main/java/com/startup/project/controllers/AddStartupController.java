package com.startup.project.controllers;

import com.startup.project.entities.Investment;
import com.startup.project.entities.Startup;
import com.startup.project.entities.StartupDetail;
import com.startup.project.entities.User;
import com.startup.project.services.StartupDetailService;
import com.startup.project.services.StartupService;
import com.startup.project.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/add_startup")
public class AddStartupController {

    @Autowired
    private StartupService startupService;

    @Autowired
    private StartupDetailService startupDetailService;

    @Autowired
    private UserService userService;


    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView setStartupModel() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("add_startup");
        modelAndView.addObject("startupReg", new Startup());
        modelAndView.addObject("startupDetailReg", new StartupDetail());
        return modelAndView;
    }

    @PostMapping
    public String addStartup(
            @ModelAttribute("startupReg") Startup startup,
            @ModelAttribute("startupDetailReg") StartupDetail startupDetail) {

        startupDetailService.save(startupDetail);
        startup.setStartupDetail(startupDetail);
        UserDetails principal = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userService.getByEmail(principal.getUsername());
        startup.setOwnerUser(user);
        startupService.save(startup);


        return "redirect:/account";
    }

}
