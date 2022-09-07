package com.example.bootjsp.servlet;

import com.example.bootjsp.service.BookService;
import com.example.bootjsp.service.UserService;
import com.example.bootjsp.utils.Container;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author: Shohimardon Abdurashitov
 * @since; September  Wednesday 00:20:56
 * @product Name:  boot-jsp
 * @Class Name: PostMapping
 * IntelliJ IDEA
 **/
@Controller

@MultipartConfig(


        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
@RequiredArgsConstructor
public class PostMappaing {
    private final BookService bookService;
    private final UserService userService;


    @PostMapping("/showList/")
    public String showList(HttpServletRequest req, HttpServletResponse resp, Model model) throws ServletException, IOException {
        boolean login = userService.isLogin(req);

        if (login) {

            try {
                String uri = req.getRequestURI();
                if ((!uri.contains("/theme") || !uri.contains("/conform") || !uri.contains("/delete/") || !uri.contains("/conform/")) && !uri.contains("/search") && !uri.contains("/pagination")) {

                    Container
                            .page = "";
                }
                return bookService.showList(req, resp, model);
            } catch (ServletException e) {
                return "error/505";
            } catch (IOException e) {
                return "error/505";
            }
        } else {
            String uri = ((HttpServletRequest) req).getRequestURI();

            return switch (uri) {
                case "/login", "/" -> login((HttpServletRequest) req, (HttpServletResponse) resp, model);
                case "/signup" -> userService.PostCreate((HttpServletRequest) req, (HttpServletResponse) resp, model);
                default -> "error/404Error";

            };

        }
    }

    @PostMapping("/mergeImage")
    public String mergeImage(HttpServletRequest req, HttpServletResponse resp, Model model) throws ServletException, IOException {
        boolean login = userService.isLogin(req);

        if (login) {

            try {
                String uri = req.getRequestURI();
                if ((!uri.contains("/theme") || !uri.contains("/conform") || !uri.contains("/delete/") || !uri.contains("/conform/")) && !uri.contains("/search") && !uri.contains("/pagination")) {

                    Container
                            .page = "";
                }
                return bookService.mergeImage(req.getParameter("file"), req, resp);
            } catch (IOException e) {
                return "error/505";
            }
        } else {
            String uri = ((HttpServletRequest) req).getRequestURI();

            return switch (uri) {
                case "/login", "/" -> login((HttpServletRequest) req, (HttpServletResponse) resp, model);
                case "/signup" -> userService.PostCreate((HttpServletRequest) req, (HttpServletResponse) resp, model);
                default -> "error/404Error";

            };

        }

    }

    @PostMapping("/login")
    public String login(HttpServletRequest req, HttpServletResponse resp, Model model) throws ServletException, IOException {
        boolean login = userService.isLogin(req);

        if (login||req.getRequestURI().contains("/login")) {

            String uri = req.getRequestURI();
            if ((!uri.contains("/theme") || !uri.contains("/conform") || !uri.contains("/delete/") || !uri.contains("/conform/")) && !uri.contains("/search") && !uri.contains("/pagination")) {

                Container
                        .page = "";
            }
            return userService.PostLogin(req, resp, model);
        } else {
            String uri = ((HttpServletRequest) req).getRequestURI();

            return switch (uri) {
                case "/login" -> userService.login(req, resp);
                case "/signup" -> userService.PostCreate((HttpServletRequest) req, (HttpServletResponse) resp, model);
                default -> "error/404Error";

            };

        }
    }


    @PostMapping("/signup")
    public String signup(HttpServletRequest req, HttpServletResponse resp, Model model) throws ServletException, IOException {
        boolean login = userService.isLogin(req);

        if (login) {

            try {
                String uri = req.getRequestURI();
                if ((!uri.contains("/theme") || !uri.contains("/conform") || !uri.contains("/delete/") || !uri.contains("/conform/")) && !uri.contains("/search") && !uri.contains("/pagination")) {

                    Container
                            .page = "";
                }
                return userService.PostCreate(req, resp, model);
            } catch (IOException | ServletException e) {
                return "error/505";
            }
        } else {
            String uri = ((HttpServletRequest) req).getRequestURI();

            return switch (uri) {
                case "/login", "/" -> login((HttpServletRequest) req, (HttpServletResponse) resp, model);
                case "/signup" -> userService.PostCreate((HttpServletRequest) req, (HttpServletResponse) resp, model);
                default -> "error/404Error";

            };

        }


    }

    @PostMapping("/book/add")
    public String bookadd(HttpServletRequest req, HttpServletResponse resp, Model model) throws ServletException, IOException {
        boolean login = userService.isLogin(req);

        if (login) {

            try {
                String uri = req.getRequestURI();
                if ((!uri.contains("/theme") || !uri.contains("/conform") || !uri.contains("/delete/") || !uri.contains("/conform/")) && !uri.contains("/search") && !uri.contains("/pagination")) {

                    Container
                            .page = "";
                }
                return bookService.AddBook(req, resp, model);
            } catch (IOException e) {
                return "error/505";
            } catch (ServletException e) {
                return "error/505";
            }
        } else {
            String uri = ((HttpServletRequest) req).getRequestURI();

            return switch (uri) {
                case "/login", "/" -> login((HttpServletRequest) req, (HttpServletResponse) resp, model);
                case "/signup" -> userService.PostCreate((HttpServletRequest) req, (HttpServletResponse) resp, model);
                default -> "error/404Error";

            };

        }


    }

    @PostMapping("/setting")
    public String setting(HttpServletRequest req, HttpServletResponse resp, Model model) throws ServletException, IOException {
        boolean login = userService.isLogin(req);

        if (login) {

            try {
                String uri = req.getRequestURI();
                if ((!uri.contains("/theme") || !uri.contains("/conform") || !uri.contains("/delete/") || !uri.contains("/conform/")) && !uri.contains("/search") && !uri.contains("/pagination")) {

                    Container
                            .page = "";
                }
                return userService.setting(req, resp, model);
            } catch (IOException | ServletException e) {
                return "error/505";
            }

        } else {
            String uri = ((HttpServletRequest) req).getRequestURI();

            return switch (uri) {
                case "/login", "/" -> login((HttpServletRequest) req, (HttpServletResponse) resp, model);
                case "/signup" -> userService.PostCreate((HttpServletRequest) req, (HttpServletResponse) resp, model);
                default -> "error/404Error";

            };

        }
    }

    @PostMapping("/main")
    public String main(HttpServletRequest req, HttpServletResponse resp, Model model) throws ServletException, IOException {
        boolean login = userService.isLogin(req);

        if (login) {

            try {
                String uri = req.getRequestURI();
                if ((!uri.contains("/theme") || !uri.contains("/conform") || !uri.contains("/delete/") || !uri.contains("/conform/")) && !uri.contains("/search") && !uri.contains("/pagination")) {

                    Container
                            .page = "";
                }
                return userService.MainMenu(req, resp, model);
            } catch (IOException e) {
                return "error/505";
            }

        } else {
            String uri = ((HttpServletRequest) req).getRequestURI();

            return switch (uri) {
                case "/login", "/" -> login((HttpServletRequest) req, (HttpServletResponse) resp, model);
                case "/signup" -> userService.PostCreate((HttpServletRequest) req, (HttpServletResponse) resp, model);
                default -> "error/404Error";

            };

        }
    }

    @PostMapping("/editBook")
    public String editBook(HttpServletRequest req, HttpServletResponse resp, Model model) throws ServletException, IOException {
        boolean login = userService.isLogin(req);

        if (login) {

            try {
                String uri = req.getRequestURI();
                if ((!uri.contains("/theme") || !uri.contains("/conform") || !uri.contains("/delete/") || !uri.contains("/conform/")) && !uri.contains("/search") && !uri.contains("/pagination")) {

                    Container
                            .page = "";
                }

                return bookService.editBook(req, resp, model);
            } catch (IOException | ServletException e) {
                return "error/505";
            }

        } else {
            String uri = ((HttpServletRequest) req).getRequestURI();

            return switch (uri) {
                case "/login", "/" -> login((HttpServletRequest) req, (HttpServletResponse) resp, model);
                case "/signup" -> userService.PostCreate((HttpServletRequest) req, (HttpServletResponse) resp, model);
                default -> "error/404Error";

            };

        }
    }

    @PostMapping("/download")
    public String download(HttpServletRequest req, HttpServletResponse resp, Model model) throws ServletException, IOException {
        boolean login = userService.isLogin(req);

        if (login) {

            try {
                String uri = req.getRequestURI();
                if ((!uri.contains("/theme") || !uri.contains("/conform") || !uri.contains("/delete/") || !uri.contains("/conform/")) && !uri.contains("/search") && !uri.contains("/pagination")) {

                    Container
                            .page = "";
                }

                return bookService.Download(req, Long.valueOf(uri.split("/")[1]), resp, model);
            } catch (IOException | ServletException e) {
                return "error/505";
            }

        } else {
            String uri = ((HttpServletRequest) req).getRequestURI();

            return switch (uri) {
                case "/login", "/" -> login((HttpServletRequest) req, (HttpServletResponse) resp, model);
                case "/signup" -> userService.PostCreate((HttpServletRequest) req, (HttpServletResponse) resp, model);
                default -> "error/404Error";

            };

        }
    }

    @PostMapping("/searchImg")
    public String searchImg(HttpServletRequest req, HttpServletResponse resp, Model model) throws ServletException, IOException {
        boolean login = userService.isLogin(req);

        if (login) {

            try {
                String uri = req.getRequestURI();
                if ((!uri.contains("/theme") || !uri.contains("/conform") || !uri.contains("/delete/") || !uri.contains("/conform/")) && !uri.contains("/search") && !uri.contains("/pagination")) {

                    Container
                            .page = "";
                }

                return bookService.downloadFile(req, resp, model);
            } catch (IOException | ServletException e) {
                return "error/505";
            }
        } else {
            String uri = ((HttpServletRequest) req).getRequestURI();

            return switch (uri) {
                case "/login", "/" -> login((HttpServletRequest) req, (HttpServletResponse) resp, model);
                case "/signup" -> userService.PostCreate((HttpServletRequest) req, (HttpServletResponse) resp, model);
                default -> "error/404Error";

            };

        }
    }

    @PostMapping("/pagination")
    public String pagination(HttpServletRequest req, HttpServletResponse resp, Model model) throws ServletException, IOException {
        boolean login = userService.isLogin(req);

        if (login) {

            try {
                String uri = req.getRequestURI();
                if ((!uri.contains("/theme") || !uri.contains("/conform") || !uri.contains("/delete/") || !uri.contains("/conform/")) && !uri.contains("/search") && !uri.contains("/pagination")) {

                    Container
                            .page = "";
                }

                return bookService.pagination(req, resp, model);
            } catch (IOException | ServletException e) {
                return "error/505";
            }

        } else {
            String uri = ((HttpServletRequest) req).getRequestURI();

            return switch (uri) {
                case "/login", "/" -> login((HttpServletRequest) req, (HttpServletResponse) resp, model);
                case "/signup" -> userService.PostCreate((HttpServletRequest) req, (HttpServletResponse) resp, model);
                default -> "error/404Error";

            };

        }
    }

    @PostMapping("/theme")
    public String theme(HttpServletRequest req, HttpServletResponse resp, Model model) throws ServletException, IOException {
        boolean login = userService.isLogin(req);

        if (login) {

            try {
                String uri = req.getRequestURI();
                if ((!uri.contains("/theme") || !uri.contains("/conform") || !uri.contains("/delete/") || !uri.contains("/conform/")) && !uri.contains("/search") && !uri.contains("/pagination")) {

                    Container
                            .page = "";
                }

                return bookService.theme(req, String.valueOf(req.getParameter("themeId")), resp, model);
            } catch (IOException | ServletException e) {
                return "error/505";
            }

        } else {
            String uri = ((HttpServletRequest) req).getRequestURI();

            return switch (uri) {
                case "/login", "/" -> login((HttpServletRequest) req, (HttpServletResponse) resp, model);
                case "/signup" -> userService.PostCreate((HttpServletRequest) req, (HttpServletResponse) resp, model);
                default -> "error/404Error";

            };

        }
    }

//    protected String doPost(HttpServletRequest req, HttpServletResponse resp, Model model) throws ServletException, IOException {
//        boolean login = userService.isLogin(req);
//
//        if (login) {
//
//            try {
//                String uri = req.getRequestURI();
//                if ((!uri.contains("/theme") || !uri.contains("/conform") || !uri.contains("/delete/") || !uri.contains("/conform/")) && !uri.contains("/search") && !uri.contains("/pagination")) {
//
//                    Container
//                            .page = "";
//                }
//
//
////            if (uri.contains("/mergeImage")) {
////                return bookService.mergeImage(req.getParameter("file"), req, resp);
//////                return;
////            }
//                if ((!uri.contains("/theme") || !uri.contains("/conform") || !uri.contains("/delete/") || !uri.contains("/conform/")) && !uri.contains("/search") && !uri.contains("/pagination")) {
//
//                    Container
//                            .page = "";
//                }
//
//                return switch (uri) {
////                case "/login" -> login(req, resp, model);
////                case "/signup" -> (userService).PostCreate();(req, resp, model);
////                case "/book/add" -> bookService.AddBook(req, resp, model);
////                case "/showList" -> bookService.showList(req, resp, model);
////                case "/setting" -> userService.setting(req, resp, model);
////                case "/main" -> userService.MainMenu(req, resp, model);
////                case "/editBook" -> bookService.editBook(req, resp, model);
////                case "/download" -> bookService.Download(req, Long.valueOf(uri.split("/")[1]), resp, model);
////                case "/searchImg" -> bookService.downloadFile(req, resp, model);
////                case "/pagination" -> bookService.pagination(req, resp, model);
////                case "/theme" -> bookService.theme(req, String.valueOf(req.getParameter("themeId")), resp, model);
//
//                    default -> "error/404Error";
//
//                };
//
//
//            } catch (Exception e) {
//                e.printStackTrace();
//                return "error/505";
//            }
//
//
//        }
//
//    }
}

