package com.startup.project.controllers;

import com.startup.project.entities.Investor;
import com.startup.project.entities.Startup;
import com.startup.project.entities.User;
import com.startup.project.services.StartupService;
import com.startup.project.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;

/**
 * Created by serhii on 26.09.2017.
 */
@Controller
@RequestMapping("/investment")
public class InvestmentController {

    @Autowired
    private UserService userService;

    @Autowired
    private StartupService startupService;


    @PostMapping
    public String investmentPage(@RequestParam("startup_id") int id, Model model) {
        Startup startUpById = startupService.getById(id);
        UserDetails currentPrincipal = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User currentUserbyEmail = userService.getByEmail(currentPrincipal.getUsername());
        model.addAttribute("startup", startUpById);
        model.addAttribute("user", currentUserbyEmail);
        return "invest";
    }

    @RequestMapping(value = "/confirm", method = RequestMethod.POST)
    public String confirmInvest(@RequestParam("startupId") int startupId, @RequestParam("sum") int sum) {
        UserDetails principal = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User userByEmail = userService.getByEmail(principal.getUsername());
        Startup startupById = startupService.getById(startupId);
        Investor investor = new Investor();

        investor.setInvestments(new BigDecimal(sum));
        investor.setInvestorUser(userByEmail);

        startupById.getInvestorList().add(investor);

        startupService.update(startupById);

        return "redirect:/startup_description/"+startupId;
    }
}