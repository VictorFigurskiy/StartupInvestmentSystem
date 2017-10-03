package com.startup.project.controllers;

import com.startup.project.entities.User;
import com.startup.project.services.UserService;
import com.startup.project.validator.UserValidator;
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
    private UserValidator userValidator;

    @Autowired
    private UserService userService;

    @GetMapping
    public ModelAndView setUserModel(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("register");
        modelAndView.addObject("userFormRegist", new User());
        return modelAndView;
    }

    @PostMapping
    public String addNewUser(@ModelAttribute("userFormRegist") User user, BindingResult bindingResult){
        userValidator.validate(user,bindingResult);
        if (bindingResult.hasErrors()) return "register";
        userService.save(user);
        return "redirect:/";
    }
}
