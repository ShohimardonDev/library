<%--<jsp:useBean id="book" scope="request" type="java.util.List<com.example.bootjsp.domains.Book"/>--%>
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


    :root {
        --mobile-width: 325px;
        --mobile-height: 670px;
        --mobile-radius: 25px;
        --separator-height: 500px;

        --bg: #fdf3f2;
        --mobile-bg: #fdeae6;
        --intro-bg: #eed7d1;
        --font-color: #807b7b;

        --transition: transform 0.7s ease-in-out;
    }

    /*.container {*/
    /*    min-height: 100vh;*/
    /*    display: flex;*/
    /*    flex-direction: column;*/
    /*    align-items: center;*/
    /*    justify-content: center;*/
    /*    background-color: var(--bg);*/
    /*}*/

    .info {
        font-family: 'Quicksand', sans-serif;
        font-family: 'Open Sans', sans-serif;
        font-style: italic;
        font-size: 26px;
        margin-top: 10px;
        color: var(--font-color);
    }

    .mobile-layout {
        width: var(--mobile-width);
        height: var(--mobile-height);
        margin: 30px 0;
        border-radius: var(--mobile-radius);
        perspective: 500px;
        overflow: hidden;
        color: #0a0a0a;
        background-color: white;
        box-shadow: 36px 36px 50px 15px #eed7d1d1;
    }

    .notification-header {
        position: fixed;
        top: 5px;
        width: 100%;
        padding: 5px 15px;
        display: flex;
        justify-content: space-between;
        font-size: 12px;
        font-family: 'Open Sans', sans-serif;
        font-weight: bold;
        z-index: 6;
    }

    .actions {
        position: fixed;
        top: 37px;
        width: 100%;
        padding: 50px;
        display: flex;
        justify-content: space-between;
        font-size: 20px;
        z-index: 6;
    }

    .book-cover {
        position: relative;
        height: var(--separator-height);
        width: calc(var(--mobile-width) * 2);
        left: -52.5%;
        border-top-left-radius: var(--mobile-radius);
        border-top-right-radius: var(--mobile-radius);
        background-color: #7fd3ed;
        transform-style: preserve-3d;
        transform-origin: 50% 40%;
        transition: var(--transition);
        z-index: 4;
    }

    .book-top {
        width: 170px;
        position: absolute;
        top: 180px;
        left: 250px;
        z-index: 5;
        transform: translateZ(28.5px);
    }

    .book-side {
        position: absolute;
        top: 430px;
        left: 222px;
        transform: translateY(-15px) translateX(0px) translateZ(15px) rotateX(104deg);
    }

    .book-cover:hover {
        transform: rotateX(75deg) translateZ(3px) scale(0.75);
    }

    .book-cover:hover + .preface {
        transform: translateY(-302px);

    .icon {
        transform: rotateX(180deg);
    }


    .preface {
        height: var(--separator-height);
        padding: 50px;
        transition: var(--transition);
    / / cubic-bezier(1, .98, .82, .98);
        background: white;

    .header {
        display: flex;
        align-items: center;
    }

    .title {
    / / font-family: 'Open Sans', sans-serif;
        font-family: 'Quicksand', sans-serif;
        font-size: 26px;
        margin-bottom: 10px;
    }

    .author {
        font-family: 'Open Sans', sans-serif;
        font-style: italic;
        margin-bottom: 20px;
    }

    .icon {
        transform-origin: top;
        transition: var(--transition);
    }

    .body {
        font-family: 'Quicksand', sans-serif;
    }

    .body p:first-child {
        margin-bottom: 15px;


    }

    .container:hover > .mobile-layout .book-cover {
    / / transform: rotateX(75 deg) translateZ(3 px) scale(0.75);

    }


    /
    .container:hover > .mobile-layout .book-cover + .preface {
    / / transform: translateY(- 302 px);
    }

    .container:hover > .mobile-layout .book-cover + .preface .icon {
    / / transform: rotateX(180 deg);
    / /
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
    <div class="container">
        <div class="row">
            <c:forEach var="var" items="${books}" varStatus="loop">
                <div class="col">

                    <div class="mobile-layout">
                        <div class="notification-header">
                            <div class="time">
                                    ${date}
                            </div>

                        </div>
                        <div class="actions">
                            <i class="fas fa-chevron-left"></i>
                            <i class="fas fa-bookmark"></i>
                        </div>
                        <div class="book-cover">
                            <img class="book-top"
                                 src="img?filepath=${var.cover.path}"
                                 alt="book-top"/>
                            <img class="book-side"
                                 src="https://raw.githubusercontent.com/atomic-variable/images-repo/e37f432405904a280858e5437ce1960753bc78a3/book-side.svg"
                                 alt="book-side"/>
                        </div>
                        <div class="preface">
                            <div class="content">
                                <div class="header">
                                    <% if (request.getAttribute("conformPage") != null) { %>

                                    <a href="/conform/${var.id}">
                                        <button type="button" class="btn btn-outline-primary">Conform</button>

                                    </a>

                                    <a href="/delete/${var.id}">
                                        <button type="button" class="btn btn-outline-danger">`Delete`</button>
                                    </a>


                                    <% } else { %>

                                    <a class="CusButton" href="/download/${var.id}">
                                        <button type="button" class="btn btn-outline-success">Download</button>
                                    </a>


<%--                                    <button type="button" data-target="#editBook" class=" btn btn-outline-success">--%>
<%--                                        Edit--%>

<%--                                    </button>--%>


                                    <%}%>
                                    <div class="title"> ${var.name}</div>
                                    <div class="icon">
                                        <i class="fas fa-chevron-down"></i>
                                    </div>
                                </div>
                                <div class="author">by ${var.author}</div>
                                <div class="body">
                                    <p>
                                        <label>Genre &nbsp; &nbsp; &nbsp;</label>${var.genre}
                                        <br/>

                                        <label>Downloads &nbsp; &nbsp; &nbsp;</label>${var.downloadCount}
                                        <br/>

                                        <label>Language &nbsp; &nbsp; &nbsp;</label> ${var.language.name}
                                        <br/>

                                        <label>Pages &nbsp; &nbsp; &nbsp;</label>${var.pageCount}
                                    </p>
                                    <label>About &nbsp; &nbsp; &nbsp;</label>
                                    <p>
                                            ${var.description}

                                    </p>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <%--    <div class="container">--%>
    <%--        <div class="row" style="margin-bottom:10%">--%>
    <%--            <c:forEach var="var" items="${books}" varStatus="loop">--%>

    <%--            <div class="col-md-4 col-sm-6" style="width: 50%; ">--%>


    <%--            </div>--%>
    <%--        </div>--%>
    <%--        </c:forEach>--%>
    <%--    </div>--%>


    <%--    <div class="container" style="height: 800">--%>
    <%--        &lt;%&ndash;        style="width: 110%; height: 200%&ndash;%&gt;--%>
    <%--        <div class="row" style="margin-bottom:10%">--%>
    <%--            <c:forEach var="var" items="${books}" varStatus="loop">--%>

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


    <%--                                <% if (request.getAttribute("conformPage") != null) { %>--%>

    <%--                                <a href="/conform/${var.id}">--%>
    <%--                                    <button type="button" class="btn btn-outline-primary">Conform</button>--%>

    <%--                                </a>--%>

    <%--                                <a href="/delete/${var.id}">--%>
    <%--                                    <button type="button" class="btn btn-outline-danger">`Delete`</button>--%>
    <%--                                </a>--%>


    <%--                                <% } else { %>--%>
    <%--                                <a class="CusButton" href="/download/${var.id}">--%>
    <%--                                        &lt;%&ndash;                                    <button type="button"  style="background: #3F8EFC !important; color: white; border-radius: 85%" class="downloadButton">DOWNLOAD</button>&ndash;%&gt;--%>
    <%--                                    <button type="button" class="btn btn-outline-success">Download</button>--%>
    <%--                                </a>--%>


    <%--                                    &lt;%&ndash;                                <button type="button" data-target="#editBook" class=" btn btn-outline-success">Edit&ndash;%&gt;--%>
    <%--                                    &lt;%&ndash;                                </button>&ndash;%&gt;--%>


    <%--                                <%}%>--%>
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

