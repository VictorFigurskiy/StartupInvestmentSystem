package com.startup.project.entities.wrappers;

import org.springframework.web.multipart.MultipartFile;

/**
 * Created by Sonik on 29.09.2017.
 */

/**
 * Wrapper class to further simply it’s usage in our application.
 * Spring provides org.springframework.web.multipart.MultipartFile which is a representation of an uploaded file
 * received in a multipart request. It provides handy methods like getName(), getContentType(), getBytes(), getInputStream() etc..
 * which make life bit easier while retrieving information about file being uploaded.
 */
public class FileBucket {

    private MultipartFile file;

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}
