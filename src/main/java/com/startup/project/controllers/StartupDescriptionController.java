package com.startup.project.controllers;

import com.startup.project.entities.Investor;
import com.startup.project.entities.Startup;
import com.startup.project.entities.StartupDetail;
import com.startup.project.services.InvestorService;
import com.startup.project.services.StartupService;
import com.startup.project.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigDecimal;

/**
 * Created by Sonik on 26.09.2017.
 */
@Controller
@RequestMapping("/startup_description")
public class StartupDescriptionController {

    @Autowired
    private StartupService startupService;
    @Autowired
    private UserService userService;
    @Autowired
    private InvestorService investorService;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ModelAndView startupDescription(@PathVariable("id") String id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("single_startup_description");
        Startup startup = startupService.getById(Integer.parseInt(id));
        StartupDetail startupDetail = startup.getStartupDetail();
        double doubleSum = startup.getInvestorList().stream().map(Investor::getInvestments).mapToDouble(BigDecimal::doubleValue).sum();
        BigDecimal investmentsSum = new BigDecimal(doubleSum);
        modelAndView.addObject("investmentsSum",investmentsSum);
        modelAndView.addObject("startup", startup);
        modelAndView.addObject("startupDetail", startupDetail);
        return modelAndView;
    }
}
