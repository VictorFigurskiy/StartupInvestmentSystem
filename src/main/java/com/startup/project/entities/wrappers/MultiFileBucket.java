package com.startup.project.entities.wrappers;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Sonik on 29.09.2017.
 */

/**
 * Multiple uploads wrapper.
 * This class can handle up to 3 file uploads.
 */
public class MultiFileBucket {

    private List<FileBucket> files = new ArrayList<>();

    public MultiFileBucket() {
        files.add(new FileBucket());
        files.add(new FileBucket());
        files.add(new FileBucket());
    }

    public List<FileBucket> getFiles() {
        return files;
    }

    public void setFiles(List<FileBucket> files) {
        this.files = files;
    }
}
