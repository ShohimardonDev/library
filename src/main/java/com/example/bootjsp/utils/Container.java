package com.example.bootjsp.utils;

import com.example.bootjsp.domains.Book;
import com.example.bootjsp.domains.SessionUser;
import com.example.bootjsp.service.SessionUserService;
import com.example.bootjsp.service.UserService;
import com.example.bootjsp.servlet.GlobalFilter;
import com.example.bootjsp.servlet.ServiceBot;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;


import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.List;

@Component
@RequiredArgsConstructor
public class Container {
    private final SessionUserService sessionUserService;
    private final UserService userService;
    public static Book editedBook;
    public static String searchBook;
    public static List<Book> books;
    public static int MaPX;
    public static String text;
    public static boolean isSaveBook;
    public static String theme = "1";
    public static String page;
    public static SessionUser sessionUser;

    private final ServiceBot serviceBot;

    @Bean
    public FilterRegistrationBean<GlobalFilter> loggingFilter() {


        FilterRegistrationBean<GlobalFilter> registrationBean
                = new FilterRegistrationBean<>();

        registrationBean.setFilter(new GlobalFilter(sessionUserService, serviceBot));
        registrationBean.addUrlPatterns("/");
        registrationBean.setOrder(1);

        return registrationBean;
    }


}
