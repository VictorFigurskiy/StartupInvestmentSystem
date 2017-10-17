package com.startup.project.controllers;

import com.startup.project.entities.Startup;
import com.startup.project.entities.StartupDetail;
import com.startup.project.services.StartupService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/edit_startup")
public class EditStartupController {

    private static final Logger LOGGER = Logger.getLogger(EditStartupController.class);

    @Autowired
    private StartupService startupService;

    /**
     * This method shows form for edit startup by current user.
     *
     * @param id - unique value of users for database.
     * @return visual display of form for edit startup by current user.
     */
    @RequestMapping(value = "/update_page", method = RequestMethod.POST)
    public ModelAndView editStartupPage(@RequestParam("id") Integer id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("edit_startup");
        Startup startup = startupService.getById(id);
        StartupDetail startupDetail = startup.getStartupDetail();
        modelAndView.addObject("startup", startup);
        modelAndView.addObject("startupDetail", startupDetail);
        LOGGER.info("Method 'editStartupPage' worked successfully");
        return modelAndView;
    }

    /**
     * This method shows form for edit startup by current user.
     * Replaces old data with new ones.
     *
     * @param startup       - entity with main information about startup.
     * @param startupDetail - entity with secondary information about startup.
     * @param startup_id    - unique value of startup for database.
     * @return page with the name "account".
     */

    @RequestMapping(value = "/update", method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String updateStartup(@ModelAttribute("Startup") Startup startup,
                                @ModelAttribute("StartupDetail") StartupDetail startupDetail,
                                @RequestParam("startup_id") Integer startup_id) {
        Startup startupFromDB = startupService.getById(startup_id);
        StartupDetail startupDetailFromDB = startupFromDB.getStartupDetail();

        startupFromDB.setStartupName(startup.getStartupName());
        startupFromDB.setDescription(startup.getDescription());
        startupFromDB.setIdea(startup.getIdea());
        startupFromDB.setIndustry(startup.getIndustry());
        startupFromDB.setImageLink(startup.getImageLink());
        startupFromDB.setProjectStage(startup.getProjectStage());
        startupFromDB.setCountry(startup.getCountry());
        startupFromDB.setStartupCost(startup.getStartupCost());

        startupDetailFromDB.setProblemOrOpportunity(startupDetail.getProblemOrOpportunity());
        startupDetailFromDB.setTypeOfProperty(startupDetail.getTypeOfProperty());
        startupDetailFromDB.setProperty(startupDetail.getProperty());
        startupDetailFromDB.setGrossProfit(startupDetail.getGrossProfit());
        startupDetailFromDB.setNetIncome(startupDetail.getNetIncome());
        startupDetailFromDB.setCompetitors(startupDetail.getCompetitors());
        startupDetailFromDB.setBusinessModel(startupDetail.getBusinessModel());
        startupDetailFromDB.setCurrentState(startupDetail.getCurrentState());

        startupService.update(startupFromDB);
        LOGGER.info("Method 'updateStartup' worked successfully");
        return "redirect:/account";
    }

    /**
     * This method delete current startup from database.
     *
     * @param startup_id - unique value of startup for database.
     * @return page with the name "account".
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteStartup(@RequestParam("startup_id") Integer startup_id) {
        Startup startup = startupService.getById(startup_id);
        startupService.delete(startup);
        LOGGER.info("Method 'deleteStartup' worked successfully");
        return "redirect:/account";
    }
}
