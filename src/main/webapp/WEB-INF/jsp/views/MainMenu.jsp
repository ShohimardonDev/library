<%@ page import="com.example.bootjsp.service.UserService" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: shohimardon
  Date: 12/07/22
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<link rel="icon"  style="width: 100% ;height: 100%" type="image/png" href="/images/notes.png">
<html>
<head>
    <title>Library</title>


    <meta name="viewport" content="width=device-width, initial-scale=1">


    <%@include file="../links.jsp" %>

</head>
<body>
<%@include file="../Menu.jsp" %>


<div>

    <%
        String ErrorMassage = null;
        for (Cookie cookie : request.getCookies()) {
            if (cookie.getName().equals("ErrorMassageSetting")) {
                ErrorMassage = cookie.getValue();
            }
        }

        if (ErrorMassage != null) { %>


    <h4 style="color:red;">Bro password don't change setting something went wrong please try again</h4>
    <% }%>
</div>

<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
    <%@include file="auth/test2.jsp" %>
</div>

</body>
</html>
