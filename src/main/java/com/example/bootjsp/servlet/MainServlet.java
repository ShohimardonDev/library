package com.example.bootjsp.servlet;


import com.example.bootjsp.domains.User;
import com.example.bootjsp.service.BookService;
import com.example.bootjsp.service.UserService;
import com.example.bootjsp.utils.Container;
import lombok.RequiredArgsConstructor;

import org.apache.pdfbox.io.IOUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.support.ServletContextResource;


import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller

@MultipartConfig(


        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
@RequiredArgsConstructor

public class MainServlet {
    private final BookService bookService;
    private final UserService userService;


    //    @GetMapping("/**")
//    public String filterGEt(HttpServletRequest req, HttpServletResponse resp, Model model) throws ServletException, IOException {
//        boolean login = userService.isLogin(req);
//
//        if (login) {
//            boolean login = userService.isLogin(req);
//
//            if (login) {
//                try {
//                    try {
//                        return doGet(req, resp, model);
//                    } catch (ServletException | IOException e) {
//
//                        return "error/404Error";
//                    }
//                }
//            } else {
//
//
//                String uri = ((HttpServletRequest) req).getRequestURI();
//                return switch (uri) {
//                    case "/login", "/" -> userService.login((HttpServletRequest) req, (HttpServletResponse) resp);
//                    case "/signup" -> userService.signup((HttpServletRequest) req, (HttpServletResponse) resp);
//                    case "/img" -> userService.displayImg((HttpServletRequest) req, (HttpServletResponse) resp);
//
//
//                    default -> "error/404Error";
//
//                };
//
//            }
//
//        }

    //            @PostMapping("/**" )


    /**
     * @param req
     * @param resp
     * @param model
     * @return
     * @throws ServletException
     * @throws IOException
     */


    @GetMapping("/download/{id}")
    public String download(HttpServletRequest req, HttpServletResponse resp, Model model, @PathVariable String id) throws ServletException, IOException {
        String uri = req.getRequestURI();
        List<Integer> list = new ArrayList<>();
        List<Integer> listw = new ArrayList<>();
        listw.addAll(list);
        if (!uri.contains("/search") && !uri.contains("/conform") && (!uri.contains("/theme") || !uri.contains("/delete/") && !uri.contains("/conform/"))) {
            Container
                    .page = "";
        }
        boolean login = userService.isLogin(req);

        if (login) {

            try {
                return bookService.Download(req, Long.valueOf(uri.split("/")[2]), resp, model);
            } catch (ServletException | IOException e) {
                return "error/505";
            }

        } else {


            return switch (uri) {
                case "/login", "/" -> userService.login((HttpServletRequest) req, (HttpServletResponse) resp);
                case "/signup" -> userService.signup((HttpServletRequest) req, (HttpServletResponse) resp);
                case "/img" -> userService.displayImg((HttpServletRequest) req, (HttpServletResponse) resp);


                default -> "error/404Error";

            };

        }

    }

    @GetMapping("/login")
    public String login(HttpServletRequest req, HttpServletResponse resp, Model model) throws ServletException, IOException {
        String uri = req.getRequestURI();
        List<Integer> list = new ArrayList<>();
        List<Integer> listw = new ArrayList<>();
        listw.addAll(list);
        if (!uri.contains("/search") && !uri.contains("/conform") && (!uri.contains("/theme") || !uri.contains("/delete/") && !uri.contains("/conform/"))) {
            Container
                    .page = "";
        }
        boolean login = userService.isLogin(req);

        if (!login) {

            try {
                return userService.login(req, resp);
            } catch (ServletException | IOException e) {
                return "error/505";
            }

        } else {


            return
                    userService.login((HttpServletRequest) req, (HttpServletResponse) resp);
//                case "/signup" -> userService.signup((HttpServletRequest) req, (HttpServletResponse) resp);
//                case "/img" -> userService.displayImg((HttpServletRequest) req, (HttpServletResponse) resp);
//
//
//                default -> "error/404Error";


        }

    }

    @GetMapping("/")
    public String logina(HttpServletRequest req, HttpServletResponse resp, Model model) throws ServletException, IOException {
        String uri = req.getRequestURI();
        List<Integer> list = new ArrayList<>();
        List<Integer> listw = new ArrayList<>();
        listw.addAll(list);
        if (!uri.contains("/search") && !uri.contains("/conform") && (!uri.contains("/theme") || !uri.contains("/delete/") && !uri.contains("/conform/"))) {
            Container
                    .page = "";
        }
        boolean login = userService.isLogin(req);

        if (!login) {

            try {
                return userService.login(req, resp);
            } catch (ServletException | IOException e) {
                return "error/505";
            }

        } else {


            return
                    userService.MainMenu(req, resp, model);
//                case "/signup" -> userService.signup((HttpServletRequest) req, (HttpServletResponse) resp);
//                case "/img" -> userService.displayImg((HttpServletRequest) req, (HttpServletResponse) resp);
//
//
//                default -> "error/404Error";


        }

    }

    @GetMapping("/conform/{Id}")
    public void conform(HttpServletRequest req, HttpServletResponse resp, Model model, @PathVariable String Id) throws IOException {
        String uri = req.getRequestURI();
        List<Integer> list = new ArrayList<>();
        List<Integer> listw = new ArrayList<>();
        listw.addAll(list);
        if (!uri.contains("/search") && !uri.contains("/conform") && (!uri.contains("/theme") || !uri.contains("/delete/") && !uri.contains("/conform/"))) {
            Container
                    .page = "";
        }
        boolean login = userService.isLogin(req);

        if (login) {

            try {
                bookService.ConformOrDelete(req, Long.valueOf(uri.split("/")[2]), resp);
            } catch (IOException e) {
                throw new RuntimeException();
            }
        }

    }

    @GetMapping("/conform")
    public String conforma(HttpServletRequest req, HttpServletResponse resp, Model model) throws IOException {
        String uri = req.getRequestURI();
        List<Integer> list = new ArrayList<>();
        List<Integer> listw = new ArrayList<>();
        listw.addAll(list);
        if (!uri.contains("/search") && !uri.contains("/conform") && (!uri.contains("/theme") || !uri.contains("/delete/") && !uri.contains("/conform/"))) {
            Container
                    .page = "";
        }
        boolean login = userService.isLogin(req);

        if (login) {

            try {
                return bookService.showList(req, resp, model);
            } catch (IOException e) {
                throw new RuntimeException();
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }
        return "error/505";

    }

    @GetMapping("/delete/{id}")
    public void delete(HttpServletRequest req, HttpServletResponse resp, Model model, @PathVariable String id) {
        String uri = req.getRequestURI();
        List<Integer> list = new ArrayList<>();
        List<Integer> listw = new ArrayList<>();
        listw.addAll(list);
        if (!uri.contains("/search") && !uri.contains("/conform") && (!uri.contains("/theme") || !uri.contains("/delete/") && !uri.contains("/conform/"))) {
            Container
                    .page = "";
        }
        boolean login = userService.isLogin(req);


        try {
            bookService.ConformOrDelete(req, Long.valueOf(uri.split("/")[2]), resp);
        } catch (IOException e) {

        }
    }


    @GetMapping("/logout")
    public void logout(HttpServletRequest req, HttpServletResponse resp, Model model) {
        String uri = req.getRequestURI();
        List<Integer> list = new ArrayList<>();
        List<Integer> listw = new ArrayList<>();
        listw.addAll(list);
        if (!uri.contains("/search") && !uri.contains("/conform") && (!uri.contains("/theme") || !uri.contains("/delete/") && !uri.contains("/conform/"))) {
            Container
                    .page = "";
        }
        boolean login = userService.isLogin(req);


        try {
            userService.Logout(req, resp);
        } catch (IOException e) {

        }


    }

    @GetMapping("/showList")
    public String showList(HttpServletRequest req, HttpServletResponse
            resp, Model model) throws ServletException, IOException {
        String uri = req.getRequestURI();
        List<Integer> list = new ArrayList<>();
        List<Integer> listw = new ArrayList<>();
        listw.addAll(list);
        if (!uri.contains("/search") && !uri.contains("/conform") && (!uri.contains("/theme") || !uri.contains("/delete/") && !uri.contains("/conform/"))) {
            Container
                    .page = "";
        }
        boolean login = userService.isLogin(req);

        if (login) {

            try {
                return bookService.showList(req, resp, model);
            } catch (ServletException | IOException e) {
                return "error/505";
            }
        } else {


            return switch (uri) {
                case "/login", "/" -> userService.login((HttpServletRequest) req, (HttpServletResponse) resp);
                case "/signup" -> userService.signup((HttpServletRequest) req, (HttpServletResponse) resp);
                case "/img" -> userService.displayImg((HttpServletRequest) req, (HttpServletResponse) resp);


                default -> "error/404Error";

            };

        }
    }


    @GetMapping("/search")
    public String search(HttpServletRequest req, HttpServletResponse
            resp, Model model) throws ServletException, IOException {
        String uri = req.getRequestURI();
        List<Integer> list = new ArrayList<>();
        List<Integer> listw = new ArrayList<>();
        listw.addAll(list);
        if (!uri.contains("/search") && !uri.contains("/conform") && (!uri.contains("/theme") || !uri.contains("/delete/") && !uri.contains("/conform/"))) {
            Container
                    .page = "";
        }
        boolean login = userService.isLogin(req);

        if (login) {

            try {
                return bookService.Search(req, req.getParameter("search"), resp, model);
            } catch (ServletException | IOException e) {
                return "error/505";
            }
        } else {


            return switch (uri) {
                case "/login", "/" -> userService.login((HttpServletRequest) req, (HttpServletResponse) resp);
                case "/signup" -> userService.signup((HttpServletRequest) req, (HttpServletResponse) resp);
                case "/img" -> userService.displayImg((HttpServletRequest) req, (HttpServletResponse) resp);


                default -> "error/404Error";

            };

        }
    }


    @GetMapping("/setting")
    public String setting(HttpServletRequest
                                  req, HttpServletResponse resp, Model model) throws ServletException, IOException {
        String uri = req.getRequestURI();
        List<Integer> list = new ArrayList<>();
        List<Integer> listw = new ArrayList<>();
        listw.addAll(list);
        if (!uri.contains("/search") && !uri.contains("/conform") && (!uri.contains("/theme") || !uri.contains("/delete/") && !uri.contains("/conform/"))) {
            Container
                    .page = "";
        }
        boolean login = userService.isLogin(req);

        if (login) {

            try {
                return userService.setting(req, resp, model);
            } catch (ServletException | IOException e) {
                return "error/505";
            }
        } else {


            return switch (uri) {
                case "/login", "/" -> userService.login((HttpServletRequest) req, (HttpServletResponse) resp);
                case "/signup" -> userService.signup((HttpServletRequest) req, (HttpServletResponse) resp);
                case "/img" -> userService.displayImg((HttpServletRequest) req, (HttpServletResponse) resp);


                default -> "error/404Error";

            };

        }
    }

    @GetMapping("/signup")
    public String signUp(HttpServletRequest
                                 req, HttpServletResponse resp, Model model) throws ServletException, IOException {
        String uri = req.getRequestURI();
        List<Integer> list = new ArrayList<>();
        List<Integer> listw = new ArrayList<>();
        listw.addAll(list);
        if (!uri.contains("/search") && !uri.contains("/conform") && (!uri.contains("/theme") || !uri.contains("/delete/") && !uri.contains("/conform/"))) {
            Container
                    .page = "";
        }
        boolean login = userService.isLogin(req);

//        if (login) {

        try {
            return     userService.signup((HttpServletRequest) req, (HttpServletResponse) resp);
        } catch (Exception e) {
            return "error/505";
        }




}


    @GetMapping("/selectPhoto")
    public String selectPhoto(HttpServletRequest
                                      req, HttpServletResponse resp, Model model) throws ServletException, IOException {
        String uri = req.getRequestURI();
        List<Integer> list = new ArrayList<>();
        List<Integer> listw = new ArrayList<>();
        listw.addAll(list);
        if (!uri.contains("/search") && !uri.contains("/conform") && (!uri.contains("/theme") || !uri.contains("/delete/") && !uri.contains("/conform/"))) {
            Container
                    .page = "";
        }
        boolean login = userService.isLogin(req);

        if (login) {

            try {
                return bookService.selectPhoto(req, resp, model);
            } catch (ServletException |
                     IOException e) {
                return "error/505";
            }

        } else {


            return switch (uri) {
                case "/login", "/" -> userService.login((HttpServletRequest) req, (HttpServletResponse) resp);
                case "/signup" -> userService.signup((HttpServletRequest) req, (HttpServletResponse) resp);
                case "/img" -> userService.displayImg((HttpServletRequest) req, (HttpServletResponse) resp);


                default -> "error/404Error";

            };

        }
    }

    @GetMapping("/main")
    public String main(HttpServletRequest
                               req, HttpServletResponse resp, Model model) throws ServletException, IOException {
        String uri = req.getRequestURI();
        List<Integer> list = new ArrayList<>();
        List<Integer> listw = new ArrayList<>();
        listw.addAll(list);
        if (!uri.contains("/search") && !uri.contains("/conform") && (!uri.contains("/theme") || !uri.contains("/delete/") && !uri.contains("/conform/"))) {
            Container
                    .page = "";
        }
        boolean login = userService.isLogin(req);

        if (login) {

            try {
                return userService.MainMenu(req, resp, model);
            } catch (IOException e) {
                return "error/505";
            }
        } else {


            return switch (uri) {
                case "/login", "/" -> userService.login((HttpServletRequest) req, (HttpServletResponse) resp);
                case "/signup" -> userService.signup((HttpServletRequest) req, (HttpServletResponse) resp);
                case "/img" -> userService.displayImg((HttpServletRequest) req, (HttpServletResponse) resp);


                default -> "error/404Error";

            };

        }
    }


    @GetMapping("/checkSave")
    public String checkSave
            (HttpServletRequest
                     req, HttpServletResponse resp, Model
                     model) throws ServletException, IOException {
        String uri = req.getRequestURI();
        List<Integer> list = new ArrayList<>();
        List<Integer> listw = new ArrayList<>();
        listw.addAll(list);
        if (!uri.contains("/search") && !uri.contains("/conform") && (!uri.contains("/theme") || !uri.contains("/delete/") && !uri.contains("/conform/"))) {
            Container
                    .page = "";
        }
        boolean login = userService.isLogin(req);

        if (login) {

            try {
                return userService.checkSave(req, resp);
            } catch (IOException |
                     ServletException e) {
                return "error/505";
            }

        } else {


            return switch (uri) {
                case "/login", "/" -> userService.login((HttpServletRequest) req, (HttpServletResponse) resp);
                case "/signup" -> userService.signup((HttpServletRequest) req, (HttpServletResponse) resp);
                case "/img" -> userService.displayImg((HttpServletRequest) req, (HttpServletResponse) resp);


                default -> "error/404Error";

            };

        }
    }


//    protected String doGet(HttpServletRequest req, HttpServletResponse resp, Model model) throws ServletException, IOException {
//          boolean login = userService.isLogin(req);


//        try {
//
//
//            String uri = req.getRequestURI();
//            List<Integer> list = new ArrayList<>();
//            List<Integer> listw = new ArrayList<>();

//            listw.addAll(list);
//
////            if (uri.contains("/download")) {
////                return bookService.Download(req, Long.valueOf(uri.split("/")[2]), resp, model);
////                return;
//        } else if (Objects.nonNull(req.getParameter("str"))) {
//            return bookService.showList(req, resp, model);
////                return;
////            } else if (uri.contains("/conform/") || uri.contains("/delete/")) {
////                bookService.ConformOrDelete(req, Long.valueOf(uri.split("/")[2]), resp);
////                return;
////            } else if (uri.contains("/showList/")) {
////                return bookService.showList(req, resp, model);
//////                return;
//        }
//
//
//        return switch (uri) {
////            case "/search" -> bookService.Search(req, req.getParameter("search"), resp, model);
////            case "/logout" -> userService.Logout(req, resp);
////            case "/setting" -> userService.setting(req, resp, model);
////            case "/showList", "/conform" -> bookService.showList(req, resp, model);
////            case "/selectPhoto" -> bookService.selectPhoto(req, resp, model);
////            case "/main", "/" -> userService.MainMenu(req, resp, model);
//
//            case "/checkSave" -> userService.checkSave(req, resp);
//            default -> "error/404Error";
//
//        };
//
//    } catch(
//    Exception e)

//    {
//        e.printStackTrace();
//        return "error/505";
//
//    }


    @RequestMapping(value = "/img")

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("image/jpeg");

        ServletOutputStream out = response.getOutputStream();
        FileInputStream fin = new FileInputStream(request.getParameter("filepath"));
        System.out.println("fin = " + fin);
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



