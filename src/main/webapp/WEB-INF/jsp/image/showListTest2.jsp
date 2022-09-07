<%--<jsp:useBean id="book" scope="request" type="com.example.bootjsp.domains.Book"/>--%>
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
<link rel="shortcut icon" href="https://tympanus.net/Development/favicon.ico">
<link rel="stylesheet" type="text/css" href="https://tympanus.net/Development/AnimatedBooks/css/normalize.css"/>
<link rel="stylesheet" type="text/css" href="https://tympanus.net/Development/AnimatedBooks/css/demo.css"/>
<link rel="stylesheet" type="text/css" href="https://tympanus.net/Development/AnimatedBooks/css/book.css"/>
<link rel="stylesheet" type="text/css" href="https://tympanus.net/Development/AnimatedBooks/css/book2.css"/>
<script src="https://tympanus.net/Development/AnimatedBooks/js/modernizr.custom.js"></script>
<style>

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
    <div class="container">
        <!-- Top Navigation -->
        <div class="component">

            <ul class="align">
                <c:forEach var="var" items="${books}" varStatus="loop">

                    <li>

                        <figure class='book'>

                            <!-- Front -->

                            <ul class='paperback_front'>
                                <li>
                                    <span class="ribbon">Nº1</span>
                                    <img src="${var.cover.path}" alt="" width="100%" height="100%">
                                </li>
                                <li></li>
                            </ul>

                            <!-- Pages -->

                            <ul class='ruled_paper'>


                                <% if (request.getAttribute("conformPage") != null) { %>


                                <li>
                                    <a class="btn" href="/conform/${var.id}">Conform</a>
                                </li>
                                <br/>
                                <li>
                                    <a class="btn btn-outline-danger" href="/delete/${var.id}">Delete</a>
                                </li>

                                <% } else { %>
                                <li>
                                    <a class="btn" href="/download/${var.id}">Download</a>
                                </li>
                                <%}%>

                            </ul>

                            <!-- Back -->

                            <ul class='paperback_back'>
                                    <%--                                <li>--%>
                                    <%--                                    <img src="" alt="" width="100%" height="100%">--%>
                                    <%--                                </li>--%>


                                <li></li>
                            </ul>
                            <figcaption>
                                <h1>${var.name}</h1>
                                <span>By ${var.author}</span>
                                <p>

                                <h5>Author: ${var.author}</h5>
                                <h5>Genre: ${var.genre}</h5>
                                <h5>Language: ${var.language.name}</h5>
                                <h5>Pages: ${var.pageCount}</h5>
                                <h5>Downloads: ${var.downloadCount}</h5>


                                </p>
                            </figcaption>
                        </figure>
                    </li>


                </c:forEach>
            </ul>

        </div>
    </div><!-- /container -->
    <%--    <div class="container">--%>
    <%--        <div class="row" style="margin-bottom:10%">--%>
    <%--

    <%--            <div class="col-md-4 col-sm-6" style="width: 50%; ">--%>


    <%--            </div>--%>
    <%--        </div>--%>
    <%--        </c:forEach>--%>
    <%--    </div>--%>


    <%--    <div class="container" style="height: 800">--%>
    <%--        &lt;%&ndash;        style="width: 110%; height: 200%&ndash;%&gt;--%>
    <%--        <div class="row" style="margin-bottom:10%">--%>
    <%--

    <%--                <div class="col-md-4 col-sm-6" style="width: 20%; ">--%>


    <%--                    <div class="box myDIV" style=" width: 100%;height: 100%">--%>
    <%--                        <img src="img?filepath=${var.cover.path}" style="width: 100%; height: 100%"--%>
    <%--                             alt="">--%>
    <%--                        <div class="over-layer">--%>
    <%--                            <h4 class="title">${var.name}</h4>--%>
    <%--                            <div class="user-info"--%>
    <%--                                 style="padding-top: 5%;color: white; padding-bottom: -10%; margin-top: 20%">--%>

    <%--                                <h5>Author: ${var.author}</h5>--%>
    <%--                                <h5>Genre: ${var.genre}</h5>--%>
    <%--                                <h5>Language: ${var.language.name}</h5>--%>
    <%--                                <h5>Pages: ${var.pageCount}</h5>--%>


    <%--
    <%--                            </div>--%>

    <%--                        </div>--%>

    <%--                    </div>--%>
    <%--                </div>--%>
    <%--            </c:forEach>--%>

    <%--        </div>--%>
    <%--    </div>--%>


    <%--Edit menu--%>
</div>


</body>
</html>

