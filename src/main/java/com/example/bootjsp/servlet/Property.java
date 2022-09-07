package com.example.bootjsp.servlet;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class Property {


    public static String getProperty(String key) {

        Map<String, String> list = new HashMap<>();


        list.put("file.upload.path", "/home/shohimardon/Music/apps/uploads/book/");
        list.put("file.upload.image", "src/main/resources/static/images/apps/uploads/image/");
        list.put("file.upload.zip", "/home/shohimardon/Music/apps/uploads/zip/");
        list.put("file.upload.temPImg", "src/main/resources/static/images/apps/uploads/tempImg/");

        try {
            return list.get(key);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}