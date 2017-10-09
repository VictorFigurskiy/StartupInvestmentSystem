package com.startup.project.validator.validators;

import com.startup.project.entities.User;
import com.startup.project.services.UserService;
import com.startup.project.validator.validate_groups.FullDataValidator;
import com.startup.project.validator.validate_groups.OnlyDataValidatator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by serhii on 19.09.2017.
 */
@Component
public class DataValidatorImpl implements Validator, OnlyDataValidatator, FullDataValidator {


    public static final int EMAIL_MAX_LENGTH = 32;
    public static final int EMAIL_MIN_LENGTH = 8;
    public static final int PHONE_LENGTH = 13;


    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    /**
     * This method validates target object  with allowable form.
     * @param target - object, which used for validate operations.
     * @param errors - possible errors from validate operations.
     */
    @Override
    public void validate(Object target, Errors errors) {

        User user = ((User) target);
        User dbUser = userService.getByEmail(user.getEmail());

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "WhiteSpace.orEmpty.firstName", "Поле обязательное для заполнения и не должно содержать пробелов!");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "WhiteSpace.orEmpty.lastName", "Поле обязательное для заполнения и не должно содержать пробелов!");


        if (dbUser != null && user.getPreviousEmail() == null) {
            errors.rejectValue("email", "Exist.userForm.user", "Пользователь с email: " + user.getEmail() + " уже существует!");
        }
        if (user.getPreviousEmail() != null && (dbUser != null && !user.getPreviousEmail().equals(dbUser.getEmail()))) {
            errors.rejectValue("email", "Exist.Edit.user", "Пользователь с email: " + user.getEmail() + " уже существует!");
        }
        if (user.getEmail().length() < EMAIL_MIN_LENGTH || user.getEmail().length() > EMAIL_MAX_LENGTH) {
            errors.rejectValue("email", "Size.userForm.username", "Ваш email должен иметь "+ EMAIL_MIN_LENGTH +"-"+ EMAIL_MAX_LENGTH +" символов!");
        }
        if (user.getPhone().length() < PHONE_LENGTH) {
            errors.rejectValue("phone", "Size.userForm.phone", "Телефон должне быть не менее "+ PHONE_LENGTH +" символов!");
        }

    }
}
