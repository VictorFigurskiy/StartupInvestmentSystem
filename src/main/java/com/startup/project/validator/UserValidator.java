package com.startup.project.validator;

import com.startup.project.entities.User;
import com.startup.project.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 * Created by serhii on 19.09.2017.
 */
@Component
public class UserValidator implements Validator {

    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {

        User user = ((User) target);
        User dbUser = userService.getByEmail(user.getEmail());

        if (!user.getPassword().equals(user.getConfirmPassword())) {
            errors.rejectValue("password", "Match.userForm.password", "Passwords don't match, try again!");
        }
        if (dbUser != null) {
            errors.rejectValue("email", "Exist.userForm.user", "User with email: "+user.getEmail() +" already exist!");
        }
        if (user.getEmail().length() < 8 || user.getEmail().length() > 32) {
            errors.rejectValue("email", "Size.userForm.username", "Your email must have length between 8-32 characters!");
        }
        if (user.getPassword().length() < 4 || user.getPassword().length() > 10) {
            errors.rejectValue("password", "Size.userForm.password", "Your password must have length between 4-10 characters!");
        }
        if (user.getPhone().length()<13) {
            errors.rejectValue("phone", "Size.userForm.phone", "Phone must have length not less 13 characters!");
        }

    }
}
