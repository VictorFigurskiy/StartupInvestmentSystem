package com.startup.project.validator;

import com.startup.project.entities.User;
import com.startup.project.validator.validate_groups.OnlyDataValidatator;
import com.startup.project.validator.validate_groups.FullDataValidator;
import com.startup.project.validator.validate_groups.PasswordValidator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.DefaultMessageSourceResolvable;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import java.util.Arrays;
import java.util.List;

/**
 * Created by serhii on 04.10.2017.
 */
@Component
public class MultiValidator {

    private final static Logger LOGGER = Logger.getLogger(MultiValidator.class);

    @Autowired
    private List<FullDataValidator> fullValidate;

    @Autowired
    private PasswordValidator passValidator;

    @Autowired
    private OnlyDataValidatator dataValidator;


    public void validate(User user, Errors errors, ValidateType validateType) {
        switch (validateType) {
            case FULL:
                fullValidate.forEach(validator -> validator.validate(user, errors));
            break;
            case PASSWORD:
                passValidator.validate(user, errors);
                break;
            case DATA:
                dataValidator.validate(user, errors);
        }

        //Logs
        if (errors.hasErrors() && (validateType.equals(ValidateType.DATA) || validateType.equals(ValidateType.PASSWORD))) {
            LOGGER.info("User with id " + user.getId() + " has " + errors.getErrorCount() + " errors during changing his data or password!"
                    + Arrays.toString(errors.getAllErrors().stream().map(DefaultMessageSourceResolvable::getCode).toArray()));
        }
        if (errors.hasErrors() && validateType.equals(ValidateType.FULL)) {
            LOGGER.info("Anonymous user has " + errors.getErrorCount() + " errors during registration!"
                    + Arrays.toString(errors.getAllErrors().stream().map(DefaultMessageSourceResolvable::getCode).toArray()));
        }
        if (!errors.hasErrors() && validateType.equals(ValidateType.FULL)) {
            LOGGER.info("User with email " + user.getEmail() + " registered successfully!");
        }


    }
}
