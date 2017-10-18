package com.startup.project.controllers;

import com.startup.project.entities.wrappers.Investment;
import com.startup.project.entities.User;
import com.startup.project.services.InvestorService;
import com.startup.project.services.UserService;
import com.startup.project.validator.MultiValidator;
import com.startup.project.validator.ValidateType;
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
    private MultiValidator validator;

    private static final Logger LOGGER = Logger.getLogger(AccountController.class);

    /**
     * This method identify user(through test user's email) and shows account page with current information about user.
     *
     * @param model - visual display of current user's information.
     * @return page with the name "account"
     */
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

    /**
     * This method shows form for edit user's information.
     *
     * @param id-    unique value of users for database.
     * @param model- visual display of current user's information.
     * @return page with the name "edit_account"
     */
    @RequestMapping(value = "/edit-page", method = RequestMethod.POST)
    public String editUserForm(@RequestParam("userId") int id, Model model) {
        User byId = userService.getById(id);
        model.addAttribute("userForEdit", byId);
        LOGGER.info("Method 'editUserForm' worked successfully");
        return "edit_account";
    }

    /**
     * This method shows form for edit user's password.
     *
     * @param id    - unique value of users for database.
     * @param model - visual display of current user's information.
     * @return page with the name "edit_password"
     */
    @RequestMapping(value = "/edit-password", method = RequestMethod.POST)
    public String editUserPass(@RequestParam("userId") int id, Model model) {
        User byId = userService.getById(id);
        model.addAttribute("userForEdit", byId);
        LOGGER.info("Method 'editUserPass' worked successfully");
        return "edit_password";
    }

    /**
     * This method validates input data with allowable password form.
     *
     * @param user          - current user.
     * @param bindingResult - object with possible errors.
     * @return page with the name "edit_password" if method has some errors or
     * return page with the name "account" if method works successfully.
     */
    @RequestMapping(value = "/editpass", method = RequestMethod.POST)
    public String updatePassword(@ModelAttribute("userForEdit") User user, BindingResult bindingResult) {
        validator.validate(user, bindingResult, ValidateType.PASSWORD);
        if (bindingResult.hasErrors()) return "edit_password";
        User dbUser = userService.getById(user.getId());
        dbUser.setPassword(user.getPassword());
        userService.updatePassword(dbUser);
        LOGGER.info("Method 'updatePassword' worked successfully");
        return "redirect:/account";
    }

    /**
     * This method validates input data with allowable user form.
     *
     * @param user          - current user.
     * @param bindingResult - object with possible errors.
     * @return page with the name "edit_account" if method has some errors or
     * return page with the name "account" if method works successfully.
     */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String updateUser(@ModelAttribute("userForEdit") User user, BindingResult bindingResult) {
        validator.validate(user, bindingResult, ValidateType.DATA);
        if (bindingResult.hasErrors()) return "edit_account";
        User dbUser = userService.getById(user.getId());
        user.setStartupList(dbUser.getStartupList());
        user.setUserRoles(dbUser.getUserRoles());
        user.setPassword(dbUser.getPassword());
        userService.updateUserData(user);

        if (!dbUser.getEmail().equals(user.getEmail())) {

            SimpleGrantedAuthority[] simpleGrantedAuthorities = user.getUserRoles().stream()
                    .map(userRole -> new SimpleGrantedAuthority("ROLE_" + userRole.getRoleType()))
                    .toArray(SimpleGrantedAuthority[]::new);

            Set<GrantedAuthority> grantedAuthority = new HashSet<>(Arrays.asList(simpleGrantedAuthorities));

            UserDetails userDetails = new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), grantedAuthority);
            UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(userDetails, user.getPassword(), userDetails.getAuthorities());
            SecurityContextHolder.getContext().getAuthentication().setAuthenticated(false);
            SecurityContextHolder.getContext().setAuthentication(token);
        }
        LOGGER.info("Method 'updateUserData' worked successfully");
        return "redirect:/account";
    }

    /**
     * This method delete current user from database.
     *
     * @param userId - unique value of users for database.
     * @return home page.
     */

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
