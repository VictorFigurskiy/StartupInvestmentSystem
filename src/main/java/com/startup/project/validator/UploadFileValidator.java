package com.startup.project.validator;

import com.startup.project.entities.wrappers.FileBucket;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 * Created by Sonik on 29.09.2017.
 */
@Component
@PropertySource("classpath:messages.properties")
public class UploadFileValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return FileBucket.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        FileBucket file = (FileBucket) target;

        if (file.getFile() != null){
            if (file.getFile().getSize() == 0){
                errors.rejectValue("file","missing.file","Файл не выбран, сначала загрузите картинку!");
            }
        }
    }
}
