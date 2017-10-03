package com.startup.project.validator;

import com.startup.project.entities.User;
import com.startup.project.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
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

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "WhiteSpace.orEmpty.firstName", "Поле обязательное для заполнения!");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "WhiteSpace.orEmpty.lastName", "Поле обязательное для заполнения!");


        if (dbUser != null && user.getPreviousEmail() == null) {
            errors.rejectValue("email", "Exist.userForm.user", "Пользователь с email: " + user.getEmail() + " уже существует!");
        }
        if (user.getPreviousEmail() != null && (dbUser != null && !user.getPreviousEmail().equals(dbUser.getEmail()))) {
            errors.rejectValue("email", "Exist.Edit.user", "Пользователь с email: " + user.getEmail() + " уже существует!");
        }
        if (user.getEmail().length() < 8 || user.getEmail().length() > 32) {
            errors.rejectValue("email", "Size.userForm.username", "Ваш email должен иметь 8-32 символов!");
        }
        if ((dbUser!=null && !user.getPassword().equals(dbUser.getPassword())) || dbUser==null && user.getPreviousEmail()==null) {
            if (!user.getPassword().equals(user.getConfirmPassword())) {
                errors.rejectValue("confirmPassword", "Match.userForm.password", "Пароли не совпадают, попробуйте еще раз!");
            }
            if (user.getPassword().length() < 4 || user.getPassword().length() > 30) {
                errors.rejectValue("password", "Size.userForm.password", "Пароль должен иметь длинну 4-30 символов!");
            }
        }
        if (user.getPhone().length() < 13) {
            errors.rejectValue("phone", "Size.userForm.phone", "Телефон должне быть не менее 13 символов!");
        }

    }
}
