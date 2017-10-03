package com.startup.project.controllers;

import com.startup.project.entities.Investment;
import com.startup.project.entities.User;
import com.startup.project.services.InvestorService;
import com.startup.project.services.UserService;
import com.startup.project.validator.UserValidator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by serhii on 20.09.2017.
 */
@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private UserService userService;

    @Autowired
    private InvestorService investorService;

    @Autowired
    private UserValidator validator;

    private static final Logger LOGGER = Logger.getLogger(AccountController.class);

    @GetMapping
    public String accountPage(Model model) {
        UserDetails principal = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User byEmail = userService.getByEmail(principal.getUsername());
        List<Investment> investments = investorService.getInvestment(byEmail.getId());
        model.addAttribute("currentUser", byEmail);
        model.addAttribute("investments", investments);
        LOGGER.info("Method 'accountPage' worked successfully");
        return "account";
    }

    @RequestMapping(value = "/edit-page", method = RequestMethod.POST)
    public String editUserForm(@RequestParam("userId") int id, Model model) {
        User byId = userService.getById(id);
        model.addAttribute("userForEdit", byId);
        LOGGER.info("Method 'editUserForm' worked successfully");
        return "edit_account";
    }

    @RequestMapping(value = "/edit-password", method = RequestMethod.POST)
    public String editUserPass(@RequestParam("userId") int id, Model model) {
        User byId = userService.getById(id);
        model.addAttribute("userForEdit", byId);
        LOGGER.info("Method 'editUserPass' worked successfully");
        return "edit_password";
    }

    @RequestMapping(value = "/editpass", method = RequestMethod.POST)
    public String updatePassword(@ModelAttribute("userForEdit") User user, BindingResult bindingResult) {
        validator.validate(user,bindingResult);
        if (bindingResult.hasErrors()) return "edit_password";
        User dbUser = userService.getById(user.getId());
        user.setStartupList(dbUser.getStartupList());
        user.setUserRoles(dbUser.getUserRoles());
        userService.update(user);
        LOGGER.info("Method 'updatePassword' worked successfully");
        return "redirect:/account";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String updateUser(@ModelAttribute("userForEdit") User user, BindingResult bindingResult) {
        validator.validate(user,bindingResult);
        if (bindingResult.hasErrors()) return "edit_account";
        User dbUser = userService.getById(user.getId());
        user.setStartupList(dbUser.getStartupList());
        user.setUserRoles(dbUser.getUserRoles());
        userService.update(user);

        if (!user.getPreviousEmail().equals(user.getEmail())) {

            SimpleGrantedAuthority[] simpleGrantedAuthorities = user.getUserRoles().stream()
                    .map(userRole -> new SimpleGrantedAuthority("ROLE_" + userRole.getRoleType()))
                    .toArray(SimpleGrantedAuthority[]::new);

            Set<GrantedAuthority> grantedAuthority = new HashSet<>(Arrays.asList(simpleGrantedAuthorities));

            UserDetails userDetails = new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), grantedAuthority);
            UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(userDetails, user.getPassword(), userDetails.getAuthorities());
            SecurityContextHolder.getContext().getAuthentication().setAuthenticated(false);
            SecurityContextHolder.getContext().setAuthentication(token);
        }
        LOGGER.info("Method 'updateUser' worked successfully");
        return "redirect:/account";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteUser(@RequestParam("userId") int userId) {
        User byId = userService.getById(userId);
        investorService.deleteInvestorByUserId(userId);
        userService.delete(byId);
        SecurityContextHolder.getContext().getAuthentication().setAuthenticated(false);
        LOGGER.info("Method 'deleteUser' worked successfully");
        return "redirect:/";
    }
}
