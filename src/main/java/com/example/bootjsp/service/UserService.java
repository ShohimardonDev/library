package com.example.bootjsp.service;

import com.example.bootjsp.config.Encoder;
import com.example.bootjsp.doa.LanguageDao;
import com.example.bootjsp.doa.SessionUserDao;
import com.example.bootjsp.doa.UserDao;
import com.example.bootjsp.domains.Book;
import com.example.bootjsp.domains.Language;
import com.example.bootjsp.domains.SessionUser;
import com.example.bootjsp.domains.User;
import com.example.bootjsp.utils.Container;
import com.itextpdf.text.pdf.qrcode.Mode;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.*;
import java.time.LocalDate;
import java.util.List;
import java.util.Objects;


@Service
@RequiredArgsConstructor
public class UserService {

    private final Encoder encoder;
    private final UserDao userDao;

    private final LanguageDao languageDao;
    private final SessionUserDao sessionUserDao;

    public boolean isLogin(HttpServletRequest req) {
        String macAddress = getMacAddress(getClientIPAddress((HttpServletRequest) req));
        return isLogin(macAddress);
    }

    public boolean isLogin(String macAddress) {

        SessionUser userDaoBy = sessionUserDao.getBy(macAddress, true);


        return userDaoBy != null;
    }

    public String login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        return "views/auth/login";


    }

    public String signup(HttpServletRequest request, HttpServletResponse resp) {


        return "views/auth/signup";
    }


    public String PostCreate(HttpServletRequest request, HttpServletResponse response, Model model) throws ServletException, IOException {
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String lastname = request.getParameter("lastname");
        String firstname = request.getParameter("firstname");
        String psswrd = request.getParameter("password");
        Integer age = Integer.valueOf(request.getParameter("age"));
        String password = encoder.encodePassword(psswrd);

        try {
            userDao.create(new User((username), password, (email), (lastname), (firstname), age));

        } catch (Exception e) {
            request.setAttribute("email", email);
            request.setAttribute("username", username);
            request.setAttribute("lastname", lastname);
            request.setAttribute("firstname", firstname);
            request.setAttribute("password", password);
            request.setAttribute("age", age);

            model.addAttribute("email", email);
            model.addAttribute("username", username);
            model.addAttribute("lastname", lastname);
            model.addAttribute("firstname", firstname);
            model.addAttribute("password", password);
            model.addAttribute("age", age);
            return signup(request, response);
        }

        HttpSession session = request.getSession();
        User user = new User(username, password, email, lastname, firstname, age);


        SessionUser sessionUser = new SessionUser(user, getMacAddress(getClientIPAddress(request)));

        model.addAttribute("user", user);
        model.addAttribute("salom", "salomaa");


        sessionUserDao.save(sessionUser);

        Container.sessionUser = sessionUser;
        request.getRequestDispatcher("").forward(request, response);
        return MainMenu(request, response, model);
    }


    public String PostLogin(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = userDao.login(username, password);
        if (user == null) {
            request.setAttribute("notFound", true);
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            return login(request, response);
        } else {


            SessionUser sessionUser = makeSessionUser(user, request);
            sessionUserDao.save(sessionUser);


            Container.sessionUser = sessionUser;

            return MainMenu(request, response, model);
        }

    }

    public SessionUser makeSessionUser(User user, HttpServletRequest request) {
        SessionUser sessionUser = new SessionUser();
        sessionUser.setUsername(user.getUsername());
        sessionUser.setLoginDate(LocalDate.now());
        sessionUser.setReLoginDate(LocalDate.now());
        sessionUser.setRole(user.getRole());
        sessionUser.setPassword(user.getPassword());
        sessionUser.setMacAddress(getMacAddress(getClientIPAddress(request)));
        sessionUser.setId(user.getId());

        return sessionUser;
    }

    public String MainMenu(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        HttpSession session = request.getSession();
        SessionUser sessionUser = sessionUserDao.getBy(getMacAddress(getClientIPAddress(request)), true);
        User user = userDao.login(sessionUser.getUsername(), sessionUser.getPassword());


        User login = userDao.login(user.getUsername(), user.getPassword());
        login.setLastname(user.getLastname());
        login.setFirstname(user.getFirstname());
        login.setUsername(user.getUsername());
        login.setEmail(user.getEmail());
        login.setAge(user.getAge());


//        request.setAttribute("user", DisplayUser);

        request.setAttribute("img2", "/home/shohimardon/Pictures/3Mcd61.webp");


        List<Language> languages = languageDao.getAllLanguage();
        Book.Genre[] genres = Book.Genre.values();

        session.setAttribute("user", user);
        session.setAttribute("sessionUser", user);
        session.setAttribute("languages", languages);
        session.setAttribute("genres", genres);
        Container.sessionUser = sessionUser;

        model.addAttribute("user", user);
        model.addAttribute("sessionUser", user);
        model.addAttribute("languages", languages);
        model.addAttribute("genres", genres);

//        RequestDispatcher dispatcher = request.getRequestDispatcher("");

        return "/views/MainMenu";


    }


    public String Logout(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String macAddress = getMacAddress(getClientIPAddress(request));
        sessionUserDao.delete(macAddress, false);
        return "redirect:/";
    }


    public String setting(HttpServletRequest request, HttpServletResponse response, Model model) throws ServletException, IOException {
        HttpSession session = request.getSession();

        SessionUser sessionUser = Container.sessionUser;

        String old = request.getParameter("password");
        String newPassword = request.getParameter("NPassword");
        String ConformPassword = request.getParameter("CPassword");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        if (!Objects.equals(username, sessionUser.getUsername()) && userDao.IsTakenUsername(username)) {
            request.setAttribute("isError", true);
            model.addAttribute("isError", true);
            request.setAttribute("massage", "Bro this username already taken");
            model.addAttribute("massage", "Bro this username already taken");
            return request.getRequestURI();
        }
        String lastname = request.getParameter("lastname");
        String firstname = request.getParameter("firstname");
        String parameter = request.getParameter("age");
        Integer age = 0;

        if (Objects.nonNull(parameter))
            age = Integer.valueOf(parameter);


        boolean b = Objects.nonNull(old) && Objects.nonNull(newPassword) && Objects.nonNull(ConformPassword);

        if (
                b && (!encoder.matchPassword(old, sessionUser.getPassword()) || !Objects.equals(newPassword, ConformPassword))) {


            setCookie(response, "ErrorMassageSetting", "1", 3);


            return "redirect:/";
        }
        User user = userDao.login(sessionUser.getUsername(), sessionUser.getPassword());
        if (b) {
            String newEncodePassword = encoder.encodePassword(newPassword);


            user.setPassword(newEncodePassword);
        }
        b = Objects.nonNull(email) && Objects.nonNull(firstname) && Objects.nonNull(lastname) && Objects.nonNull(username);
        if (b) {


            user.setEmail((email));
            user.setFirstname((firstname));
            user.setLastname((lastname));
            user.setUsername((username));
            user.setAge(age);
        }
        try {
            User user1 = userDao.create(user);

            sessionUser = makeSessionUser(user1, request);


            sessionUserDao.save(sessionUser);


//            sessionUser = new SessionUser(user, getMacAddress(request.getHeader("rlnclientipaddr")));

            session.setAttribute("sessionUser", sessionUser);
            Container.sessionUser = sessionUser;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return MainMenu(request, response, model);
    }

    private void setCookie(HttpServletResponse response, String nom, String valeur, int maxAge) throws IOException {
        Cookie cookie = new Cookie(nom, URLEncoder.encode(valeur, "UTF-8"));
        cookie.setMaxAge(maxAge);
        response.addCookie(cookie);
    }

    public String getMacAddress(String ipAddress) {
        String macAddress = "";
        try {

            InetAddress address = InetAddress.getByName(ipAddress);

            NetworkInterface ni = NetworkInterface.getByInetAddress(address);
            if (ni != null) {
                byte[] mac = ni.getHardwareAddress();
                if (mac != null) {
                    for (int i = 0; i < mac.length; i++) {

                        macAddress += String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : "");

                    }
                } else {
                    System.out.println("Address doesn't exist or is not accessible.");
                }
            } else {
                System.out.println("Network Interface for the specified address is not found.");
            }
        } catch (UnknownHostException | SocketException e) {
            e.printStackTrace();
        }
        System.out.println(macAddress);
        return macAddress;
    }

    public String getClientIPAddress(HttpServletRequest request) {
        if (request.getHeader("x-forwarded-for") == null) {
            return request.getRemoteAddr();
        }
        return request.getHeader("x-forwarded-for");
    }

    public String checkSave(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


        return "redirect:/";


    }

    public String displayImg(HttpServletRequest request, HttpServletResponse response) throws IOException {
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


        return null;
    }

    public User getOne(Long id) {
        return userDao.getOne(id);
    }
}
