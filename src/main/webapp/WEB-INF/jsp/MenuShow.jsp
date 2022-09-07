<%@ page import="com.example.bootjsp.domains.User" %>
<%@ page import="com.example.bootjsp.enums.UserRole" %>
<%@include file="links.jsp" %>

<nav style="height:  10% " class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">


                <li class="nav-item dropdown">
                    <a href="/main" class="dropdown-item">Home</a>
                </li>
                <li class="nav-item dropdown">
                    <a onclick="onSelectTheme('1')" href="/showList" class="dropdown-item">Theme 1</a>
                </li>
                <li class="nav-item dropdown">
                    <a onclick="onSelectTheme('2')" href="/showList" class="dropdown-item">Theme 2</a>
                </li>
                <li class="nav-item dropdown">
                    <a onclick="onSelectTheme('3')" href="/showList" class="dropdown-item">Theme 3 </a>
                </li>


            </ul>
            <script>
                async function onSelectTheme(themeId) {
                    const formData = new FormData()
                    formData.append('themeId', themeId)

                    const response = await fetch('/theme', {
                        method: 'POST',
                        body: formData
                    })
                }

            </script>

                <%
                    if (!request.getRequestURI().contains("/conform")) { %>
            <form class="nav-item dropdown" action="/search">
                <input class="nav-item dropdown" style="width: 150px; height: 30px" name="search" value="${searchBook}"
                       type="search" placeholder="Search"
                       aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>

            <li class="nav-item dropdown">

            </li>
                <% } %>



</nav>