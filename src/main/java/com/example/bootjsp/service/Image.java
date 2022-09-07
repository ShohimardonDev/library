package com.example.bootjsp.service;



import com.example.bootjsp.servlet.Property;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;


public class Image implements Runnable {
    private String taskName;


    public Image(String str) {

        taskName = str;
    }


    public void run() {



        String name = UUID.randomUUID() + ".jpg";

        File file = new File(Property.getProperty("file.upload.temPImg") + name);
        try {
            file.mkdirs();
            file.createNewFile();
        } catch (IOException e) {
            e.getMessage();
        }
        String url = taskName;
        Path path = Paths.get(Property.getProperty("file.upload.temPImg") + name);

        try (InputStream inputStream = new URL(url).openStream()) {
            Files.copy(inputStream, path, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            try {
                throw new IOException();
            } catch (IOException ex) {
                throw new RuntimeException(ex);
            }
        }


    }


}

