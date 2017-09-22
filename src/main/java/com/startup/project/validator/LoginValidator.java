package com.startup.project.validator;

import com.startup.project.entities.User;
import com.startup.project.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 * Created by Sonik on 22.09.2017.
 */
@Component
public class LoginValidator implements Validator {

    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {

        User user = (User) target;
        User userFromDB = userService.getByEmail(user.getEmail());

        if (userFromDB == null) {
            errors.rejectValue("loginEmail", "NotExist.loginForm.user", "User with email: " + user.getEmail() + " does not exist!");
        }

        if (userFromDB == null || !user.getPassword().equals(userFromDB.getPassword())) {
            errors.rejectValue("loginPassword","WrongPassword.login.form","Wrong password, try again!");
        }
    }
}
