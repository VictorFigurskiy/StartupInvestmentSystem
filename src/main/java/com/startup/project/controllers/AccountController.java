package com.startup.project.controllers;

import com.startup.project.entities.User;
import com.startup.project.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * Created by serhii on 20.09.2017.
 */
@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private UserService userService;

    @GetMapping
    public String acoountPage(Model model) {
        UserDetails principal = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User byEmail = userService.getByEmail(principal.getUsername());
        model.addAttribute("currentUser", byEmail);
        return "account";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editUser(@PathVariable("id") int id, Model model) {
        User byId = userService.getById(id);
        model.addAttribute("userForEdit", byId);
        return "edit_account";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable("id") int id) {
        User byId = userService.getById(id);
        userService.delete(byId);
        SecurityContextHolder.getContext().getAuthentication().setAuthenticated(false);
        return "redirect:/";
    }
}
