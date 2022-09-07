package com.example.bootjsp.service;

import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

// TODO: 20/07/22  set File delete  create Temporary file
// TODO: 20/07/22  pagination ni ham to'g'irlash kerak

@Service
@RequiredArgsConstructor
public class FileService implements Runnable {
    private String taskName;


    public void Image(String str) {

        taskName = str;
    }

    @SneakyThrows
    public void run() {

        String path1 = "";

        String name = UUID.randomUUID() + ".jpg";

        java.io.File file = new java.io.File("/home/shohimardon/Desktop/images/" + name);
        try {
            file.mkdirs();
            file.createNewFile();
        } catch (IOException e) {
            e.getMessage();
        }
        String url = taskName;
        Path path = Paths.get("/home/shohimardon/Desktop/images/" + name);
        path1 = String.valueOf(path);
        try (InputStream inputStream = new URL(url).openStream()) {
            Files.copy(inputStream, path, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new IOException();
        }


    }

}
