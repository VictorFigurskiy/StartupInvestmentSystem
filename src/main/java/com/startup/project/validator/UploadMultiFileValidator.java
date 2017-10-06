package com.startup.project.validator;

import com.startup.project.entities.wrappers.FileBucket;
import com.startup.project.entities.wrappers.MultiFileBucket;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 * Created by Sonik on 07.10.2017.
 */
@Component
public class UploadMultiFileValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return MultiFileBucket.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {

        MultiFileBucket multiFileBucket = (MultiFileBucket) target;

        int index = 0;

        for (FileBucket fileBucket : multiFileBucket.getFiles()) {
            if (fileBucket.getFile() != null){
                if (fileBucket.getFile().getSize() == 0){
                    errors.rejectValue("files[" + index + "].file","missing.file", "Файл не выбран, сначала загрузите картинку!");
                }
            }
            index++;
        }
    }
}
