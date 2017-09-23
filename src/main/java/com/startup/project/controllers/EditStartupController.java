package com.startup.project.controllers;

import com.startup.project.entities.Startup;
import com.startup.project.entities.StartupDetail;
import com.startup.project.services.StartupDetailService;
import com.startup.project.services.StartupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/update")
public class EditStartupController {

    @Autowired
    private StartupService startupService;
    @Autowired
    private StartupDetailService startupDetailService;

//    @RequestMapping(value = "{id}", method = RequestMethod.GET)
//    public ModelAndView editStartupPage(@PathVariable("id") String id){
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.setViewName("edit_startup");
//        Startup startup = startupService.getById(Integer.parseInt(id));
//        StartupDetail startupDetail = startup.getStartupDetail();
//        modelAndView.addObject("startup",startup);
//        modelAndView.addObject("startupDetail", startupDetail);
//        return modelAndView;
//    }

    @RequestMapping(method = RequestMethod.POST)
    public String updateStartup(@ModelAttribute("Startup") Startup startup,
                                @ModelAttribute("StartupDetail") StartupDetail startupDetail){



        return "redirect:/account";
    }
}
