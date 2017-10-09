package com.startup.project.controllers;

import com.startup.project.entities.User;
import com.startup.project.services.UserService;
import com.startup.project.validator.MultiValidator;
import com.startup.project.validator.ValidateType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by serhii on 19.09.2017.
 */
@Controller
@RequestMapping("/registration")
public class RegistrationController {

    @Autowired
    private MultiValidator validator;

    @Autowired
    private UserService userService;

    /**
     * This method shows form for registration in system by current user.
     *
     * @return visual display of form for registration by current user.
     */
    @GetMapping
    public ModelAndView setUserModel() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("register");
        modelAndView.addObject("userFormRegist", new User());
        return modelAndView;
    }

    /**
     * @param user          - current user.
     * @param bindingResult - object with possible errors.
     * @return main page.
     */
    @PostMapping
    public String addNewUser(@ModelAttribute("userFormRegist") User user, BindingResult bindingResult) {
        validator.validate(user, bindingResult, ValidateType.FULL);
        if (bindingResult.hasErrors()) return "register";
        userService.save(user);
        return "redirect:/";
    }
}
