package com.example.bootjsp.service;

import com.example.bootjsp.doa.BookDao;
import com.example.bootjsp.doa.LanguageDao;
import com.example.bootjsp.doa.SessionUserDao;
import com.example.bootjsp.doa.UploadsDao;
import com.example.bootjsp.domains.Uploads;
import com.itextpdf.text.pdf.PdfDocument;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.qrcode.Mode;


import lombok.RequiredArgsConstructor;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.pdfbox.text.PDFTextStripperByArea;
import org.springframework.stereotype.Service;
import com.example.bootjsp.config.ApplicationContextHolder;
import com.example.bootjsp.doa.*;
import com.example.bootjsp.domains.Book;
import com.example.bootjsp.domains.SessionUser;
import com.example.bootjsp.domains.Uploads;
import com.example.bootjsp.domains.User;
import com.example.bootjsp.servlet.Property;
import com.example.bootjsp.utils.Container;
import com.example.bootjsp.utils.GoogleTranslate;
import org.springframework.ui.Model;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import static com.example.bootjsp.utils.Container.*;

@MultipartConfig(

        maxRequestSize = 1024 * 1024 * 100)

@Service
@RequiredArgsConstructor
public class BookService {

    private final LanguageDao languageDao;

    private final SessionUserDao sessionUserDao;
    private final UserService userService;
    private final UserDao userDao;
    private final BookDao bookDao;
    private final UploadsDao uploadsDao;


    public String AddBook(HttpServletRequest request, HttpServletResponse response, Model model) throws ServletException, IOException {
        String name = request.getParameter("name");
        String author = request.getParameter("author");
        String genre = request.getParameter("genre");
        String language = request.getParameter("language");
        String pageCount = request.getParameter("pageCount");
        String description = request.getParameter("description");
        Part part = request.getPart("cover");
        Part file = request.getPart("file");


        long size = 0;

        Uploads image;


        Uploads book = uploads(file.getSize(), Property.getProperty("file.upload.path"), file);

        Integer pages = calculatePage(pageCount, book.getPath());
        language = getLanguage(language, book.getPath());

        Book addedBook = new Book(name, description, author, Book.Genre.valueOf(genre), languageDao.convertor(language, false), pages, 0, null, book);
        if (Objects.nonNull(part)) {
            size = part.getSize();

            image = uploads(size, Property.getProperty("file.upload.path"), part);
            addedBook.setCover(image);

//

            bookDao.save(addedBook);

            return userService.MainMenu(request, response, model);
        } else {


            ApplicationContextHolder.book = addedBook;


            return "redirect:/selectPhoto";
        }

    }


    public Uploads getImage(String fileName, String path) throws IOException {
        File file = new File(Property.getProperty("file.upload.temPImg"));
        file.mkdirs();
        for (File listFile : file.listFiles()) {
            listFile.delete();
        }
        try {

            DownloadImage(fileName);
        } catch (Exception e) {

        }
        getFirsPageAsImage(path);

        return null;
    }

    public Integer calculatePage(String pageCount, String fullAddress) {
        if (Objects.nonNull(pageCount) && !(pageCount.trim().equals(""))) {
            return Integer.valueOf(pageCount);
        }
        int totalPages = 0;
        try {


            PdfReader reader = new PdfReader(fullAddress);
            totalPages = reader.getNumberOfPages();


        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalPages;
    }

    public String getLanguage(String language, String fullAddress) {
        if (Objects.nonNull(language) && !language.trim().equals("")) {
            return language;
        }
        try {
            File file = new File(fullAddress);
            String text = getText(file);


            System.out.println("text");
            System.out.println(text);
            System.out.println("text");
            Container.text = text;

            return GoogleTranslate.
                    getDisplayLanguage(
                            GoogleTranslate.detectLanguage(
                                    Objects.requireNonNull(text))
                    );

        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    public String getText(File file) throws IOException {

        StringBuilder builder = new StringBuilder();
        PDDocument pdfDocument = PDDocument.load(file);


        try (PDDocument document = PDDocument.load(file)) {

            document.getClass();
            int counter = 0;
            if (!document.isEncrypted()) {

                PDFTextStripperByArea stripper = new PDFTextStripperByArea();
                stripper.setSortByPosition(true);

                PDFTextStripper tStripper = new PDFTextStripper();

                String pdfFileInText = tStripper.getText(document);
                System.out.println("Text:" + pdfFileInText);

                // split by whitespace
                String lines[] = pdfFileInText.split("\\r?\\n");
                for (String line : lines) {
                    if (counter <= 10) {
                        ;
                        builder.append(line)
                        ;
                    } else {
                        break;
                    }
                    counter++;
                }

            }
//
//
//        PDFTextStripper pdfStripper = new PDFTextStripper();
//
//
//        String textPdf = pdfStripper.getText(pdfDocument);
//        PdfDocument doc = new PdfDocument();
//        doc.loadFromFile(file.getAbsolutePath());
//        int counter = 0;
//        for (int i = 0; i < doc.getPages().getCount(); i++) {
//            PdfPageBase page = doc.getPages().get(i);
//            PdfImageInfo[] imageInfo = page.getImagesInfo();
//
//            if (imageInfo != null && imageInfo.length > 0) {
//
//                if (counter >= 5) {
//                    pdfDocument.close();
//                    return file.getName();
//                }
//                counter++;
//
//            }
//        }


            return builder.toString();
        }
    }

    public Uploads uploads(long size, String path, Part part) throws IOException {

        if (Objects.isNull(part)) {
            return new Uploads();
        }

        String fullAddress = null;
        String name = null;
        File file = new File(path);
        file.mkdirs();
        part.write(path + File.separator + part.getSubmittedFileName());


        fullAddress = path + part.getSubmittedFileName();
        name = part.getSubmittedFileName();
        return !fullAddress.trim().equals("") ? new Uploads(fullAddress, name, String.valueOf(UUID.randomUUID()), size, "pdf") : null;
//        return null;
    }


    private String download(Set<String> list) throws IOException {
        ExecutorService pl = Executors.newFixedThreadPool(3);
        String path1 = "";
        int i = 0;
        List<String> names = new ArrayList<>();
        for (String s : list) {


            File file = new File(Property.getProperty("file.upload.temPImg"));
            String[] list1 = file.list();

            Runnable tasks = new Image(s);


            pl.execute(tasks);

            if (Objects.nonNull(list1) && list1.length > 5) {
                for (String s1 : list1) {
                    File file1 = new File(Property.getProperty("file.upload.temPImg") + s1);
                    if (file1.isDirectory()) {
                        file1.deleteOnExit();
                        break;
                    }

                    Path path = Paths.get(Property.getProperty("file.upload.temPImg") + s1);
                    long size = Files.size(path);

                    if (size < 100000L) {
                        file1.deleteOnExit();

                    }

                }
                file = new File(Property.getProperty("file.upload.temPImg"));
                list1 = file.list();
                if (list1.length > 20) {

                    break;
                }
            }
        }


        return path1;

    }

    public void DownloadImage(String name) {

        name = name.trim();

        name = name.replace(",", "");
        String path = "";
        String[] splits = name.split(" ");
        StringBuilder nameBuilder = new StringBuilder();
        for (int i = 0; i < splits.length - 1; i++) {
            String split = splits[i];
            split = split.replace("\t", "");
            split = split.replace("\n", "");
            nameBuilder.append(split).append("%20");
        }
        nameBuilder.append(splits[splits.length - 1]);

        name = nameBuilder.toString();


        {
            try {
                String str = "https://yandex.ru/images/search?text=" + name + "&pos=0&img_url=https%3A%2F%2Ftelegra.ph%2Ffile%2Fef54f6fc4b58cd61bc66e.jpg&rpt=simage&lr=10335";
                str = str.trim();


                URL url = new URL(str);

                URLConnection connection = url.openConnection();
                BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                StringBuffer sb = new StringBuffer();
                String d;
                while ((d = reader.readLine()) != null) {
                    sb.append(d);
                }
                Set<String> list = new TreeSet<>();

                String s = sb.toString();
                String[] split = s.split("url\":\"");
                lap:
                for (String s1 : split) {

                    if (s1.startsWith("https://") && s1.contains(".jpg")) {

                        String[] split1 = s1.split(".jpg");
                        for (String sq : split1) {
                            sq += ".jpg";
                            sq = sq.trim();
                            if (sq.startsWith("https://") && sq.trim().endsWith(".jpg")) {
                                list.add(sq);
                                if (list.size() == 30)
                                    break lap;

                            }
                        }
                    }

                }
                try {

                    download(list);
                } catch (Exception e) {
                    e.printStackTrace();
                }


            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

        File file = new File(Objects.requireNonNull(Property.getProperty("file.upload.temPImg")));
        File[] files = file.listFiles();
        for (File file1 : files) {
            boolean directory = file1.isDirectory();
            System.out.println(file1.getName() + " -> " + directory
            );
            if (directory) {
                boolean delete = file1.delete();
                System.out.println("delete = " + delete);
            }

        }

    }

    public void getFirsPageAsImage(String name) throws IOException {
//            PdfDocument doc = new PdfDocument();
//
//
//            doc.loadFromFile(name);
//
//
//            int index = 0;
//
//
//            for (Object page : doc.getPages()) {
//
//                PdfPageBase pageBase = (PdfPageBase) page;
//
//
//                for (BufferedImage image : pageBase.extractImages()) {
//
//
//                    File output = new File(Property.getProperty("file.upload.temPImg") + UUID.randomUUID() + "/");
//
//
//                    ImageIO.write(image, "PNG", output);
//                }
//                break;
//            }
    }


    public String selectPhoto(HttpServletRequest request, HttpServletResponse response, Model model) throws
            ServletException, IOException {


        File file = new File(Property.getProperty("file.upload.temPImg"));

//// TODO: 20/07/22  width 1197  --- heght 1915
//// TODO: 20/07/22  Width : 500   --- Height : 751
//        if (readers.hasNext()) {
//            //Get the first available ImageReader
//            ImageReader reader = readers.next();
//            reader.setInput(iis, true);
//

//

        List<String> images = new ArrayList<>();
        for (File listFile : file.listFiles()) {


            ImageInputStream iis;


            iis = ImageIO.createImageInputStream(listFile);
            if (iis != null) {
                Iterator<ImageReader> readers = ImageIO.getImageReaders(iis);
                if (!listFile.isDirectory()) {
                    if (readers.hasNext()) {
//            //Get the first available ImageReader
                        ImageReader reader = readers.next();
                        reader.setInput(iis, true);
                        System.out.println("--------------------------------------------------------------");
                        System.out.println("----------   " + listFile.getName() + "  --------------------");
                        System.out.println("Width : " + reader.getWidth(0) + " pixels");
                        System.out.println("Height : " + reader.getHeight(0) + " pixels");
                        System.out.println("--------------------------------------------------------------");
                        System.out.println(((double) (reader.getHeight(0)) / ((double) reader.getWidth(0))));
                        if (((double) (reader.getHeight(0)) / ((double) reader.getWidth(0))) > 1.3) {

//                            images.add(listFile.getPath().replace("src/main/resources/static/", "/"));
                            images.add(listFile.getAbsolutePath());
                        } else {
                            file.deleteOnExit();
                        }
                    }
                }
            } else {
                file.deleteOnExit();
            }
        }

        System.out.println("files.length = " + images.size());

        request.setAttribute("images", images);
        model.addAttribute("images", images);
        request.setAttribute("name", ApplicationContextHolder.book.getName());
        model.addAttribute("name", ApplicationContextHolder.book.getName());
        System.out.println(images);
        return "views/selectImage";
    }

    public String downloadFile(HttpServletRequest request, HttpServletResponse response, Model model) throws
            ServletException, IOException {
        Part part = request.getPart("file");
        Uploads uploads = null;
        try {
            String path = Property.getProperty("file.upload.path");
            uploads = uploads(part.getSize(), path, part);
        } catch (Exception e) {
            throw new RuntimeException();
        }
        getImage(part.getSubmittedFileName(), uploads.getPath());
        File file = new File(Property.getProperty("file.upload.temPImg"));
        List<String> images = new ArrayList<>();
        for (File listFile : file.listFiles()) {
            if (!listFile.isDirectory()) {
                images.add(listFile.getAbsolutePath());
            }
        }
        System.out.println("files.length = " + images.size());
        request.setAttribute("images", images);
        model.addAttribute("images", images);
        request.getRequestDispatcher("views/MainMenu").forward(request, response);
        return "";
    }

    public String mergeImage(String imagePath, HttpServletRequest request, HttpServletResponse response) throws
            IOException {
        System.out.println("imagePath = " + imagePath);
        File file = new File(imagePath);
        String generenedName = imagePath.split("/")[imagePath.split("/").length - 1];
        String fullPath = Property.getProperty("file.upload.image") + ApplicationContextHolder.book.getName() + imagePath.split("/")[imagePath.split("/").length - 1];
        file = new File(Property.getProperty("file.upload.image"));
        file.mkdirs();
        file = new File(imagePath);

        try {


            Path temp = Files.move
                    (
                            Paths.get(file.getAbsolutePath()),
                            Paths.get(fullPath)
                    );
        } catch (Exception e) {
            Container.isSaveBook = false;

            throw new RuntimeException();
        }
        file = new File(fullPath);

        Uploads image = new Uploads(fullPath, ApplicationContextHolder.book.getName(), generenedName, file.length(), "img/jpg");
        ApplicationContextHolder.book.setCover(image);
        HttpSession session = request.getSession();
//        ApplicationContextHolder.book.setDeleted(true);
        bookDao.save(ApplicationContextHolder.book);
        file = new File(Property.getProperty("file.upload.temPImg"));

        ApplicationContextHolder.book = null;
        try {


            for (File listFile : file.listFiles()) {

                listFile.delete();

            }
        } catch (Exception e) {
            Container.isSaveBook = false;

            throw new RuntimeException();
        }
        Container.isSaveBook = true;

        return "redirect:/main";
    }

    public String showList(HttpServletRequest request, HttpServletResponse response, Model model) throws
            ServletException, IOException {

        List<Book> book;
        Long id = 0L;


        String currentPage = (String) request.getSession().getAttribute("currentPage");
        if (currentPage == null) {
            id = 0L;
        } else {
            id = Long.valueOf(currentPage);

        }


        if (Objects.isNull(searchBook)) {
            ApplicationContextHolder.book = null;
        }
        if (page != null && page.contains("/conform") || request.getRequestURI().contains("/conform")) {
            Container.page = "/conform";
            request.setAttribute("conformPage", "true");

            request.setAttribute("conformPage", "true");
            model.addAttribute("conformPage", "true");


            book = bookDao.getAllBook(false);
            id = 0L;
        } else {

            book = bookDao.getAllBook(true);
        }


        List<Book> pageWithBook = new ArrayList<>();
        SessionUser user = sessionUserDao.getBy(userService.getMacAddress(userService.getClientIPAddress(request)), true);

        User login = userDao.login(user.getUsername(), user.getPassword());


        pageWithBook = getPageWithBook(book, id * 10);


        request.getSession().setAttribute("currentPage", String.valueOf(id));


        if (request.getRequestURI().contains("/conform") && pageWithBook.size() == 0) {

            return "error/NewBooksNotYet";
        }
        request.getSession().setAttribute("sessionUser", login);

        request.setAttribute("books", pageWithBook);
        model.addAttribute("books", pageWithBook);

        request.setAttribute("user", login);
        model.addAttribute("user", login);

        request.setAttribute("curPg", id);
        model.addAttribute("curPg", id);

        request.setAttribute("date", LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd MMMM yyyy hh:mm")));
        model.addAttribute("date", LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd MMMM yyyy hh:mm")));

        request.setAttribute("searchBook", searchBook);
        model.addAttribute("searchBook", searchBook);

        request.setAttribute("MaxPge", MaPX / 10);
        model.addAttribute("MaxPge", MaPX / 10);


        return switch (theme) {
            case "2" -> "views/showListTest";
            case "3" -> "views/showList";
            default -> "views/showListTest2";

        };

//        response.sendRedirect("/");
    }

    private List<Book> getPageWithBook(List<Book> book, Long start) {
        List<Book> bookList = new ArrayList<>();


        if (Objects.nonNull(Container.books)) {
            bookList = Container.books;
        } else {
            Container.books = null;
            bookList = book;
        }


        List<Book> result = new ArrayList<>();

        for (; start < bookList.size(); start++) {
            Book e = bookList.get(Math.toIntExact(start));


            result.add(e);
            if (result.size() == 10) {
                break;
            }
        }

        MaPX = bookList.size() - 1;

        return result;
    }

    public static String zipFile(List<String> srcFiles, String zipName) throws IOException {
// TODO: 20/07/22  convert to temporary file
        File file = new File(Property.getProperty("file.upload.zip"));
        file.mkdirs();
        FileOutputStream fos = new FileOutputStream(file.getAbsolutePath() + "/" + zipName + ".zip");
        ZipOutputStream zipOut = new ZipOutputStream(fos);
        for (String srcFile : srcFiles) {
            File fileToZip = new File(srcFile);
            FileInputStream fis = new FileInputStream(fileToZip);
            ZipEntry zipEntry = new ZipEntry(fileToZip.getName());
            zipOut.putNextEntry(zipEntry);

            byte[] bytes = new byte[1024];
            int length;
            while ((length = fis.read(bytes)) >= 0) {
                zipOut.write(bytes, 0, length);
            }
            fis.close();
        }
        zipOut.close();
        fos.close();
        return Property.getProperty("file.upload.zip") + zipName + ".zip";
    }

    public String Download(HttpServletRequest request, Long id, HttpServletResponse response, Model model) throws
            ServletException, IOException {

        Book book = bookDao.getById(id);

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String filename = book.getName();
        String filepath = zipFile(new ArrayList<>(
                        Arrays.asList(book.getFile().getPath(),
                                book.getCover().getPath())),

                book.getName());
        response.setContentType("APPLICATION/OCTET-STREAM");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

        FileInputStream fileInputStream = new FileInputStream(filepath);

        int i;
        while ((i = fileInputStream.read()) != -1) {
            out.write(i);
        }
        fileInputStream.close();
        out.close();
        book.setDownloadCount(book.getDownloadCount() + 1);


        Zip zip = new Zip(filepath, LocalTime.now().plusMinutes(10));
        ExecutorService pl = Executors.newFixedThreadPool(3);

        Runnable tasks = new Zip(filepath, LocalTime.now().plusMinutes(10));
        pl.execute(tasks);
        bookDao.save(book);
        return "";
    }

    public void ConformOrDelete(HttpServletRequest request, Long id, HttpServletResponse response) throws
            IOException {
        Book book = bookDao.getById(id);

        if (request.getRequestURI().contains("/conform")) {

            book.setConform(true);
        } else {
            bookDao.delete(book);
        }
        bookDao.save(book);
        response.sendRedirect("/conform");
    }

    public String editBook(HttpServletRequest request, HttpServletResponse response, Model model) throws
            IOException, ServletException {

        Book book = bookDao.getById(Long.valueOf(request.getParameter("id")));
        Container.editedBook = book;
        request.setAttribute("book", book);
        model.addAttribute("book", book);


        request.getRequestDispatcher("views/showList").forward(request, response);
        return "views/showList";

    }

    public String Search(HttpServletRequest request, String search, HttpServletResponse response, Model model) throws
            ServletException, IOException {

        List<Book> books = bookDao.getAnyWhere(search);
        searchBook = search;
        Container.books = books;


        response.addCookie(new Cookie("currentPage", "0"));
        model.addAttribute("currentPage", "0");
        return showList(request, response, model);


    }

    public String pagination(HttpServletRequest req, HttpServletResponse resp, Model model) throws
            ServletException, IOException {

        Long id = 0L;


        String currentPage = (String) req.getSession().getAttribute("currentPage");
        if (currentPage == null) {
            id = 0L;
        } else {
            id = Long.valueOf(currentPage);

        }

        String str = req.getParameter("str");
        if (str != null) {
            if (str.contains("-")) {
                id--;


            } else if (str.contains("+")) {
                id++;


            } else {
                id = Long.valueOf(str);
            }


        }
        req.getSession().setAttribute("currentPage", String.valueOf(id));
        model.addAttribute("currentPage", String.valueOf(id));

        return switch (theme) {
            case "2" -> "views/showListTest";
            case "3" -> "views/showList";
            default -> "views/showListTest2";

        };

    }


    public static boolean isInvalidImage(String path) throws IOException {
        File file = new File(path);
        ImageInputStream iis = ImageIO.createImageInputStream(file);
        Iterator<ImageReader> readers = ImageIO.getImageReaders(iis);

        if (readers.hasNext()) {
            //Get the first available ImageReader
            ImageReader reader = readers.next();
            reader.setInput(iis, true);

            System.out.println("Format : " + reader.getFormatName());
            System.out.println("Width : " + reader.getWidth(0) + " pixels");
            System.out.println("Height : " + reader.getHeight(0) + " pixels");
        }
        return true;
    }

    public String theme(HttpServletRequest request, String themeNumber, HttpServletResponse response, Model model) throws
            ServletException, IOException {
        if (themeNumber != null) {
            theme = themeNumber;
        } else {
            theme = "1";

        }
        return showList(request, response, model);
    }
}

