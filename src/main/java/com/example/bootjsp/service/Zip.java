package com.example.bootjsp.service;

import java.io.File;
import java.time.LocalTime;


public class Zip implements Runnable {
    private String taskName;
    private LocalTime time;


    public Zip(String path, LocalTime limit) {

        taskName = path;
        time = limit;
    }


    public void run() {


        File file = new File(taskName);
        try {


            while (true) {
                if (time.isBefore(LocalTime.now())) {
                    file.deleteOnExit();
                    break;
                }
            }


        }catch (Exception e){

        }

    }


}

