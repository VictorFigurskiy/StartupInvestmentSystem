package com.startup.project.validator.validators;

import com.startup.project.entities.User;
import com.startup.project.validator.validate_groups.FullDataValidator;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 * Created by serhii on 04.10.2017.
 */
@Component
public class PasswordValidatorImpl implements Validator, com.startup.project.validator.validate_groups.PasswordValidator, FullDataValidator {

    public static final int PASSWORD_MAX_LENGTH = 30;
    public static final int PASSWORD_MIN_LENGTH = 4;

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }


    @Override
    public void validate(Object target, Errors errors) {

        User user = ((User) target);

        if (!user.getPassword().equals(user.getConfirmPassword())) {
            errors.rejectValue("confirmPassword", "Match.userForm.password", "Пароли не совпадают, попробуйте еще раз!");
        }
        if (user.getPassword().length() < PASSWORD_MIN_LENGTH || user.getPassword().length() > PASSWORD_MAX_LENGTH) {
            errors.rejectValue("password", "Size.userForm.password", "Пароль должен иметь длинну "+ PASSWORD_MIN_LENGTH +"-"+ PASSWORD_MAX_LENGTH +" символов!");
        }

    }
}
