<jsp:useBean id="book" scope="request" type="com.example.bootjsp.domains.Book"/>
<%--
  Created by IntelliJ IDEA.
  User: shohimardon
  Date: 17/07/22
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    <%@include file="Css/DownloadPage.css"%>
</style>
<body>
<img src="img?filepath=${book.cover.path}">
<a class="download" href="#platforms"></a>
<div class="platforms" id="platforms">
    <a href="#windows" data-os="windows"></a>
    <a href="#mac" data-os="mac"></a>
    <a href="#linux" data-os="linux"></a>
</div>
<div class="installer" id="windows">
    <div class="info" data-weight="${((book.file.size+book.cover.size)/1024)/1024} MB"></div>
    <div class="details">
        <p>Windows installer</p>
        <span>Version 1.0.6</span>
        <ul>
            <li>Name ${book.name}</li>
            <li>Author ${book.author}</li>
            <li>Genre ${book.genre}</li>
            <li>Pages ${book.pageCount}</li>
            <li>Language ${book.language}</li>
        </ul>
    </div>
    <label for="progressWindows"><input type="radio" id="progressWindows"/><span></span></label>
    <a class="close" href="/main"></a>
</div>
<div class="installer" id="mac">
    <div class="info" data-weight="${((book.file.size+book.cover.size)/1024)/1024} MB"></div>
    <div class="details">
        <p>Mac installer</p>
        <span>Version 1.0.6</span>
        <ul>
            <li>Name ${book.name}</li>
            <li>Author ${book.author}</li>
            <li>Genre ${book.genre}</li>
            <li>Pages ${book.pageCount}</li>
            <li>Language ${book.language}</li>
        </ul>
    </div>
    <label for="progressMac"><input type="radio" id="progressMac"/><span></span></label>
    <a class="close" href="/main"></a>
</div>
<div class="installer" id="linux">
    <div class="info" data-weight="${((book.file.size+book.cover.size)/1024)/1024} MB"></div>
    <div class="details">
        <p>Linux installer</p>
        <span>Version 1.0.6</span>
        <ul>
            <li>Name ${book.name}</li>
            <li>Author ${book.author}</li>
            <li>Genre ${book.genre}</li>
            <li>Pages ${book.pageCount}</li>
            <li>Language ${book.language}</li>
        </ul>
    </div>
    <label for="progressLinux"><input type="radio" id="progressLinux"/><span></span></label>
    <a class="close" href="/main"></a>
</div>

</body>

</html>
