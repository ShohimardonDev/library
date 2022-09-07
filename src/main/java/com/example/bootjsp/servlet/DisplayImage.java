package com.example.bootjsp.servlet;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;

@RequestMapping("/img")
public class DisplayImage {

    public static String rootPath = "";

    @GetMapping
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("Display mehto is work");
        response.setContentType("image/jpeg");

        ServletOutputStream out = response.getOutputStream();
        FileInputStream fin = new FileInputStream(request.getParameter("filepath"));

        BufferedInputStream bin = new BufferedInputStream(fin);
        BufferedOutputStream bout = new BufferedOutputStream(out);

        int ch = 0;
        while ((ch = bin.read()) != -1) {
            bout.write(ch);
        }

        bin.close();
        fin.close();
        bout.close();
        out.close();
    }
}