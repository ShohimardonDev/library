package com.example.bootjsp.servlet;

import com.example.bootjsp.service.SessionUserService;
import com.example.bootjsp.service.UserService;
import com.example.bootjsp.telegram.Bot;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.apache.catalina.connector.Request;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.ConcurrentModel;
import org.springframework.ui.Model;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;

@Component
@Order(1)

@RequiredArgsConstructor
public class GlobalFilter implements Filter {
    private final SessionUserService sessionUserService;
    private final ServiceBot serviceBot;
    List<String> WHITE_LIST = new ArrayList<>(Arrays.asList(
            "/login",
            "/register"
    ));

    private Model model = new ConcurrentModel();

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("it is work");


        HttpServletRequest httpRequest = (HttpServletRequest) request;
        Enumeration<String> headerNames = httpRequest.getHeaderNames();
        StringBuilder builder = new StringBuilder();
        if (headerNames != null) {
            while (headerNames.hasMoreElements()) {
                String s = "Header: " + httpRequest.getHeader(headerNames.nextElement()) + "\n";
                System.out.println(s);
                builder.append(s);

            }


            serviceBot.sendMessage(builder.toString());
        }


        chain.doFilter(httpRequest, response);


    }


    //        HttpServletRequest req = (HttpServletRequest) request;
//        HttpServletResponse resp = (HttpServletResponse) response;
//
//        if (WHITE_LIST.contains(req.getRequestURI())) {
//            chain.doFilter(request, response);
//            return;
//        }
//
//        Cookie[] cookies = req.getCookies();
//        if (cookies != null && cookies.length > 0) {
//            for (Cookie cookie : cookies) {
//                if (cookie.getName().equals("session_user")) ;
//                {
//                    chain.doFilter(request, response);
//                    return;
//                }
//            }
//        }
//
//        chain.doFilter(request, response);
//        return;


    @Override
    public void destroy() {

    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }
}

