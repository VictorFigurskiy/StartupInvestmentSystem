package com.startup.project.controllers;

import com.startup.project.entities.Investor;
import com.startup.project.entities.Startup;
import com.startup.project.entities.StartupDetail;
import com.startup.project.entities.User;
import com.startup.project.services.StartupService;
import com.startup.project.services.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collector;
import java.util.stream.Collectors;

/**
 * Created by Sonik on 26.09.2017.
 */
@Controller
@RequestMapping("/startup_description")
public class StartupDescriptionController {

    private static final Logger LOGGER = Logger.getLogger(StartupDescriptionController.class);

    @Autowired
    private StartupService startupService;

    @Autowired
    private UserService userService;

    /**
     * This method shows full information about startup.
     *
     * @param id - unique value of startup for database.
     * @return visual display of information about startup.
     */

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ModelAndView startupDescription(@PathVariable("id") String id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("single_startup_description");
        Startup startup = startupService.getById(Integer.parseInt(id));
        StartupDetail startupDetail = startup.getStartupDetail();
        Integer investmentsSum = startup.getInvestorList().stream().map(Investor::getInvestments).mapToInt(BigDecimal::intValue).sum();

        List<Startup> similarStartups = startupService.getByIndustry(startup.getIndustry(), 4, Integer.valueOf(id));

        modelAndView.addObject("similarStartup", similarStartups);
        modelAndView.addObject("investmentsSum", investmentsSum);
        modelAndView.addObject("startup", startup);
        modelAndView.addObject("startupDetail", startupDetail);
        LOGGER.info("Method 'startupDescription' worked successfully");
        return modelAndView;
    }

    /**
     * This method needed for represent statistic for each project({@link Startup})
     *
     * @param id    {@code Startup} Id
     * @param model
     * @return {@code String} for passing view(jsp page)
     */
    @RequestMapping(value = "/{id}/investors", method = RequestMethod.GET)
    public String startupInvestors(@PathVariable("id") int id, Model model) {
        UserDetails principal = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User byEmail = userService.getByEmail(principal.getUsername());
        if (byEmail.getStartupList().stream().noneMatch(startup -> startup.getId() == id)) {
            String message = String.format("Стартап с id: %s не являеться Вашим", id);
            model.addAttribute("message", message);
            LOGGER.info("User "+ principal.getUsername() +" transition on error page!");
            return "error_page";
        }

        Startup startupById = startupService.getById(id);
        Map<Integer, Integer> investorAmountMoneyForEveryStartup = new HashMap<>();
        startupById.getInvestorList().stream().distinct().forEach(invest1 -> {
            int sum = startupById.getInvestorList().stream()
                    .filter(invest2 -> Objects.equals(invest2.getInvestorUser().getId(), invest1.getInvestorUser().getId()))
                    .map(Investor::getInvestments)
                    .mapToInt(BigDecimal::intValue)
                    .sum();
            investorAmountMoneyForEveryStartup.put(invest1.getInvestorUser().getId(), sum);
        });

        List<User> uniqueUsers = startupById.getInvestorList().stream()
                .map(Investor::getInvestorUser)
                .distinct()
                .collect(Collectors.toList());

        int totalSum = investorAmountMoneyForEveryStartup.values().stream().mapToInt(Integer::intValue).sum();

        model.addAttribute("startup", startupById);
        model.addAttribute("uniqueUsers", uniqueUsers);
        model.addAttribute("investorsIdSum", investorAmountMoneyForEveryStartup);
        model.addAttribute("totalSum", totalSum);
        LOGGER.info("Method 'startupInvestors' worked successfully");
        return "investors_details";
    }
}
