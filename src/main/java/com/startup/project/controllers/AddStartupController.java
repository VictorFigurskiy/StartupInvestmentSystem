package com.startup.project.controllers;

import com.startup.project.entities.Startup;
import com.startup.project.entities.StartupDetail;
import com.startup.project.entities.User;
import com.startup.project.services.StartupService;
import com.startup.project.services.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/add_startup")
public class AddStartupController {

    private static final Logger LOGGER = Logger.getLogger(AddStartupController.class);

    @Autowired
    private StartupService startupService;
    @Autowired
    private UserService userService;

    /**
     * This method shows form for add startup by current user.
     *
     * @return visual display of form for add startup by current user.
     */

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView setStartupModel() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("add_startup");
        modelAndView.addObject("startupReg", new Startup());
        modelAndView.addObject("startupDetailReg", new StartupDetail());
        LOGGER.info("Method 'setStartupModel' worked is successfully");
        return modelAndView;
    }

    /**
     * This method adds new startup to database by current user.
     *
     * @param startup       - entity with main information about startup.
     * @param startupDetail - entity with secondary information about startup.
     * @return page with the name "account".
     */

    @PostMapping(consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String addStartup(@ModelAttribute("startupReg") Startup startup,
                             @ModelAttribute("startupDetailReg") StartupDetail startupDetail) {
        startup.setStartupDetail(startupDetail);
        UserDetails principal = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userService.getByEmail(principal.getUsername());
        startup.setOwnerUser(user);
        startupService.save(startup);
        LOGGER.info("Method 'addStartup' worked is successfully");
        return "redirect:/account";
    }

}
