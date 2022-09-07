<%--<jsp:useBean id="book" scope="request" type="uz.jl.library.domains.Book"/>--%>
<%--
  Created by IntelliJ IDEA.
  User: shohimardon
  Date: 17/07/22
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
    <title>Library</title>
    <%@include file="../links.jsp" %>
    <%@include file="../MenuShow.jsp" %>
    <style>

        <%--        <%@include file="showListCss.css" %>--%>

    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<style>

    .box {
        position: relative;
        perspective: 1000px;
    }

    .box img {
        width: 100%;
        height: 100%;
        opacity: 1;
        transform: translateY(0) rotateX(0);
        transition: all 0.6s ease-in-out 0s;
    }

    .box:hover img {
        transform: translateY(-100%) rotateX(90deg);
        transform-origin: center bottom 0;
        opacity: 0;
    }

    .box .over-layer {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        opacity: 0;
        background: #333d4b;
        text-align: center;
        padding: 0 20px;
        transition: all 0.60s ease-in-out 0s;
    }

    .box:hover .over-layer {
        opacity: 1;
    }

    .box .title,
    .box .description,
    .box .social-links {
        position: relative;
        top: 11%;
        color: #d3d3d3;
    }

    .box .title {
        text-transform: capitalize;
    }

    .box .title:after,
    .box .description:after {
        content: "";
        width: 50%;
        display: block;
        margin: 10px auto 0;
        border-bottom: 1px solid #fff;
    }

    .box .social-links {
        padding: 0;
        margin: 0;
        list-style: none;
    }

    .box .social-links li {
        margin: 10px;
        display: inline-block;
    }

    .box .social-links li a {
        color: #fff;
        font-size: 20px;
    }

    .box .social-links li a:hover {
        color: #d3d3d3;
        text-decoration: none;
    }

    @media only screen and (max-width: 990px) {
        .box {
            margin-bottom: 20px;
        }
    }

    .CusButton {
        margin-top: 30%;
        padding-top: 30%;

    }

    myDIV {
        height: 300px;
        background-color: #FFFFFF;
        border: 15px solid transparent;
        padding: 15px;

    }

</style>

<div style=" margin-top: 5%" style="width: 70%; height: 100%; background: #7fd3ed !important;">
    <script>

        async function SendId(str) {
            try {


                const formData = new FormData()
                formData.append('str', str)

                const response = await fetch('/pagination', {
                    method: 'POST',
                    body: formData
                })
                window.location.reload()
                console.log('imgs response : ', response)
            } catch (e) {
                console.error(e)
            }
        }

    </script>

    <jsp:useBean id="books" scope="request" type="java.util.List<com.example.bootjsp.domains.Book>"/>
    <nav style="padding-top: 2%; padding-left: 50%; padding-bottom: 5%; ">
        <ul class="pagination">
            <c:set var="curPg" scope="session" value="${curPg}"/>
            <c:set var="maxP" scope="session" value="${MaxPge}"/>

            <c:if test="${curPg !=0}">
                <li onclick="SendId('-')" class="page-item"><a class="page-link" href="">Previous</a></li>
            </c:if>
            <c:forEach var="i" begin="0" end="${MaxPge}">
                <c:if test="${i!=curPg}">
                    <li onclick="SendId('${i}')" class="page-item"><a class="page-link" href="">${i}</a></li>
                </c:if>
            </c:forEach>

            <c:if test="${maxP>curPg}">
                <li onclick=" SendId('+')" class="page-item"><a class="page-link" href="">Next</a></li>
            </c:if>


        </ul>
    </nav>

    <div class="container" style="height: 800">
        <%--        style="width: 110%; height: 200%--%>
        <div class="row" style="margin-bottom:10%">
            <c:forEach var="var" items="${books}" varStatus="loop">

                <div class="col-md-4 col-sm-6" style="width: 20%; ">


                    <div class="box myDIV" style=" width: 100%;height: 100%">
                        <img src="img?filepath=${var.cover.path}" style="width: 100%; height: 100%"
                             alt="">
                        <div class="over-layer">
                            <h4 class="title">${var.name}</h4>
                            <div class="user-info"
                                 style="padding-top: 5%;color: white; padding-bottom: -10%; margin-top: 20%">

                                <h5>Author: ${var.author}</h5>
                                <h5>Genre: ${var.genre}</h5>
                                <h5>Language: ${var.language.name}</h5>
                                <h5>Pages: ${var.pageCount}</h5>


                                <% if (request.getAttribute("conformPage") != null) { %>

                                <a href="/conform/${var.id}">
                                    <button type="button" class="btn btn-outline-primary">Conform</button>

                                </a>

                                <a href="/delete/${var.id}">
                                    <button type="button" class="btn btn-outline-danger">`Delete`</button>
                                </a>


                                <% } else { %>
                                <a class="CusButton" href="/download/${var.id}">
                                        <%--                                    <button type="button"  style="background: #3F8EFC !important; color: white; border-radius: 85%" class="downloadButton">DOWNLOAD</button>--%>
                                    <button type="button" class="btn btn-outline-success">Download</button>
                                </a>


                                    <%--                                <button type="button" data-target="#editBook" class=" btn btn-outline-success">Edit--%>
                                    <%--                                </button>--%>


                                <%}%>
                            </div>

                        </div>

                    </div>
                </div>
            </c:forEach>

        </div>
    </div>


    <%--    &lt;%&ndash;Edit menu&ndash;%&gt;--%>
    <%--    <div class="modal fade bd-example-modal-lg" id="editBook" style="height:80%;--%>
    <%--    width:100%;" tabindex="-1" role="dialog"--%>
    <%--         aria-labelledby="exampleModalLabel"--%>
    <%--         aria-hidden="true">--%>
    <%--        <div class="modal-dialog modal-lg" role="document">--%>
    <%--            <div class="modal-content">--%>
    <%--                <div class="modal-header">--%>
    <%--                    <h5 class="modal-title" id="exampleModalLabel">Save book</h5>--%>
    <%--                    <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">--%>
    <%--                        <span aria-hidden="true">&times;</span>--%>
    <%--                    </button>--%>
    <%--                </div>--%>
    <%--                <div class="modal-body">--%>
    <%--                    <form method="post" action="/book/add" enctype="multipart/form-data">--%>
    <%--                        <div class="row">--%>
    <%--                            <div class="col">--%>
    <%--                                <div class="form-group mb-3">--%>
    <%--                                    <label>Name</label>--%>
    <%--                                    <input type="text" value="${book.name}" name="name" class="form-control"--%>
    <%--                                           placeholder="Book name"/>--%>
    <%--                                </div>--%>

    <%--                                <div class="form-group mb-3">--%>
    <%--                                    <label>Author</label>--%>
    <%--                                    <input type="text" value="${book.author}" name="author" class="form-control"--%>
    <%--                                           placeholder="Book author"/>--%>
    <%--                                </div>--%>

    <%--                                <div class="form-group mb-3">--%>
    <%--                                    <label>Genre</label>--%>

    <%--                                    <select class="form-control" name="genre" id="genre">--%>

    <%--                                        <option value="${book.genre}"></option>--%>
    <%--                                        <c:forEach var="var" items="${genres}" varStatus="status">--%>
    <%--                                            <option value="${var}"--%>
    <%--                                            >${var}style="width: 70%; height: 100%"--%>
    <%--                                            </option>--%>
    <%--                                        </c:forEach>--%>

    <%--                                    </select>--%>
    <%--                                </div>--%>
    <%--                                <div class="form-group mb-3">--%>
    <%--                                    <button onclick="anb_dsb_file('language')" class="btn btn-outline-secondary"--%>
    <%--                                            type="button" id="inputGroupFileAddn0">--%>
    <%--                                        Auto--%>
    <%--                                    </button>--%>
    <%--                                    <label>Language</label>--%>
    <%--                                    <select class="form-control" name="language" id="language">--%>
    <%--                                        <option value="${book.language}"></option>--%>

    <%--                                        <c:forEach var="var" items="${languages}" varStatus="loop">--%>
    <%--                                            <option value="${var}">${var}--%>
    <%--                                            </option>--%>
    <%--                                        </c:forEach>--%>

    <%--                                    </select>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
    <%--                            <div class="col">--%>
    <%--                                <div class="form-group mb-3">--%>
    <%--                                    <label> Book pages</label>--%>
    <%--                                    <div class="input-group mb-3">--%>

    <%--                                        <button onclick="anb_dsb_file('pageCount')" class="btn btn-outline-secondary"--%>
    <%--                                                type="button" id="button-addon1">Auto--%>
    <%--                                        </button>--%>
    <%--                                        <input value="${book.pageCount}" type="number" name="pageCount" id="pageCount"--%>
    <%--                                               class="form-control"--%>
    <%--                                               placeholder="Book page Count"--%>
    <%--                                               aria-label="Example text with button addon"--%>
    <%--                                               aria-describedby="button-addon1">--%>
    <%--                                    </div>--%>
    <%--                                    &lt;%&ndash;                                    &ndash;%&gt;--%>

    <%--                                </div>--%>

    <%--                                <label>Image</label>--%>
    <%--                                <div class="input-group mb-3">--%>

    <%--                                    <button onclick="anb_dsb_file('inputGroupFile03')" class="btn btn-outline-secondary"--%>
    <%--                                            type="button" id="inputGroupFileAddon03">--%>
    <%--                                        Auto--%>
    <%--                                    </button>--%>
    <%--                                    <input value="${book.cover.path}" type="file" name="cover"--%>
    <%--                                           accept="image/gif, image/jpeg, image/png"--%>
    <%--                                           class="form-control" id="inputGroupFile03"--%>
    <%--                                           placeholder="Book Cover" aria-describedby="inputGroupFileAddon03"--%>
    <%--                                           aria-label="Upload">--%>

    <%--                                </div>--%>


    <%--                                <div>--%>
    <%--                                    <label>About</label>--%>
    <%--                                    <div class="input-group">--%>
    <%--                                        <span class="input-group-text">Description</span>--%>
    <%--                                        <textarea class="form-control" style="resize: block" name="description"--%>
    <%--                                                  aria-label="With textarea"></textarea>--%>
    <%--                                    </div>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>

    <%--                            <button type="submit" id="test" class="btn btn-primary">save</button>--%>
    <%--                        </div>--%>
    <%--                    </form>--%>
    <%--                </div>--%>


    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>

</div>


</body>
</html>

