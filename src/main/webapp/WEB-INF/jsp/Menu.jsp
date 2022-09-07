<%@ page import="com.example.bootjsp.domains.User" %>
<%@ page import="com.example.bootjsp.enums.UserRole" %>

<%@ page import="com.example.bootjsp.utils.Container" %>
<%@ page import="com.example.bootjsp.domains.SessionUser" %>
<%@include file="links.jsp" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">

        <%--        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigationbar">--%>
        <%--                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">--%>
        <%--            <span class="navbar-toggler-icon"></span>--%>
        <%--        </button>--%>
        <nav class="navbar-collapse">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                <li class="nav-item dropdown">


                    <a href="/showList" class="dropdown-item">Show books</a>
                    <%--                            <a href="#" class="dropdown-item">Show books</a>--%>


                </li>
                <li>
                    <button type="button" class="dropdown-item" data-toggle="modal"
                            data-target="#Logut">Log out
                    </button>
                </li>
                <li>
                    <button type="button" class="dropdown-item" data-toggle="modal"
                            data-target="#EditP">Edit profile
                    </button>
                </li>
                <li>
                    <button type="button" class="dropdown-item" data-toggle="modal"
                            data-target="#changePassword">Change Password
                    </button>

                </li>
                <li>
                    <button type="button" class="dropdown-item" data-toggle="modal"
                            data-target="#AddBook">
                        Add Book
                    </button>

                </li>
                <%--                <li class="nav-item dropdown">--%>
                <%--                    <a href="/main" class="dropdown-item">Home</a>--%>
                <%--                </li>--%>


                <% SessionUser sessionUser = Container.sessionUser;
                    if (sessionUser.getRole().equals(UserRole.ADMIN)) { %>

                <li class="nav-item dropdown">
                    <a href="/conform" class="dropdown-item">Show new books</a>
                </li>
                <% } %>
            </ul>


            <%--Log out--%>
            <div class="modal fade bd-example-modal-lg" id="Logut" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <br/>
                            <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>

                        </div>
                        <div>
                            <h5>Dou you want log out now !?</h5>

                        </div>
                        <div class="modal-body">

                            <div class="col-md-6">
                                <div class="form-group mb-3">
                                    <form action="/logout">
                                        <button type="submit" class="btn btn-danger">Yes</button>
                                        <button type="button" class="btn btn-primary" data-dismiss="modal"
                                                aria-label="Close">
                                            <span aria-hidden="true">Back </span>
                                        </button>
                                    </form>


                                </div>


                            </div>
                        </div>
                    </div>

                </div>
            </div>
    </div>
    </div>

    <%-- Edit All--%>
    <div class="modal fade bd-example-modal-lg" id="EditP" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="edit">Edit profile</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form method="post" action="setting" enctype="application/x-www-form-urlencoded">
                        <div class="row">

                            <div class="col-md-6">


                                <div class="form-group mb-3">
                                    <label>Username</label>
                                    <input required onkeyup="enabled()" type="text" name="username" class="form-control"
                                           value="${user.username}"/>
                                </div>
                                <div class="form-group mb-3">
                                    <label>Firs name</label>
                                    <input required onkeyup="enabled()" type="text" name="firstname"
                                           class="form-control"
                                           value="${user.firstname}"/>
                                </div>
                                <div class="form-group mb-3">
                                    <label>Lastname</label>
                                    <input required onkeyup="enabled()" type="text" name="lastname" class="form-control"
                                           value="${user.lastname}"/>
                                </div>

                                <div class="form-group mb-3">
                                    <label>Age</label>
                                    <input required onkeyup="enabled()" type="number" name="age" class="form-control"
                                           value="${user.age}"/>
                                </div>

                                <div class="form-group mb-3">
                                    <label>Email</label>
                                    <input required onkeyup="enabled()" type="text" name="email" class="form-control"
                                           value="${user.email}"/>
                                </div>


                                <button type="submit" onclick="disabled()" disabled id="update" class="btn btn-primary">
                                    update
                                </button>

                            </div>
                        </div>
                    </form>
                </div>


            </div>
        </div>
    </div>
    <%--    change Password--%>
    <div class="modal fade bd-example-modal-lg" id="changePassword" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="changeP">Save book</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form method="post" action="setting" enctype="application/x-www-form-urlencoded">
                        <div class="row">

                            <div class="col-md-6">


                                <div class="form-group mb-3">
                                    <label>Old Password</label>
                                    <input required onkeyup="enabledP()" type="password" id="password" name="password"
                                           class="form-control"
                                           placeholder="Password"/>
                                </div>
                                <div class="form-group mb-3">
                                    <label>New Password</label>
                                    <input required onkeyup="enabledP()" type="password" id="NPassword" name="NPassword"
                                           class="form-control"
                                           placeholder="New Password"/>
                                </div>
                                <div class="form-group mb-3">
                                    <label>Conform Password</label>
                                    <input required onkeyup="enabledP()" type="password" id="CPassword" name="CPassword"
                                           class="form-control"
                                           placeholder="Conform Password"/>
                                </div>

                                <div>

                                    <input onclick="showPassword()" type="checkbox" id="show"/> <label>
                                    Show Password
                                </label>
                                </div>
                                <button type="submit" onclick="sendJson()" disabled id="updateP"
                                        class="btn btn-primary">
                                    Update
                                </button>

                            </div>
                        </div>
                    </form>
                </div>


            </div>
        </div>
    </div>
    <%--   JS  --%>
    <script>
        <%@include file="Js/functions.js"%>

    </script>


    <div class="modal fade bd-example-modal-lg" id="AddBook" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Save book</h5>
                    <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form method="post" action="/book/add" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col">
                                <div class="form-group mb-3">
                                    <label>Name</label>
                                    <input type="text" name="name" class="form-control" placeholder="Book name"/>
                                </div>

                                <div class="form-group mb-3">
                                    <label>Author</label>
                                    <input type="text" name="author" class="form-control" placeholder="Book author"/>
                                </div>

                                <div class="form-group mb-3">
                                    <label>Genre</label>
                                    <select class="form-control" name="genre" id="genre">


                                        <c:forEach var="var" items="${genres}" varStatus="status">
                                            <option value="${var}"
                                            >${var}
                                            </option>
                                        </c:forEach>

                                    </select>
                                </div>
                                <div class="form-group mb-3">
                                    <button onclick="anb_dsb_file('language')" class="btn btn-outline-secondary"
                                            type="button" id="inputGroupFileAddn0">
                                        Auto
                                    </button>
                                    <label>Language</label>
                                    <select class="form-control" name="language" id="language">
                                        <option value=""></option>
                                        <jsp:text>


                                        </jsp:text>

                                        <jsp:useBean id="languages" scope="request"
                                                     type="java.util.List<com.example.bootjsp.domains.Language>"/>
                                        <c:forEach var="var" items="${languages}" varStatus="loop">
                                            <option value="${var.name}">${var.enumName}
                                            </option>
                                        </c:forEach>

                                    </select>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group mb-3">
                                    <label> Book pages</label>
                                    <div class="input-group mb-3">

                                        <button onclick="anb_dsb_file('pageCount')" class="btn btn-outline-secondary"
                                                type="button" id="button-addon1">Auto
                                        </button>
                                        <input type="number" name="pageCount" id="pageCount" class="form-control"
                                               placeholder="Book page Count"
                                               aria-label="Example text with button addon"
                                               aria-describedby="button-addon1">
                                    </div>
                                    <%--                                    --%>

                                </div>

                                <label>Image</label>
                                <div class="input-group mb-3">

                                    <button onclick="anb_dsb_file('inputGroupFile03')" class="btn btn-outline-secondary"
                                            type="button" id="inputGroupFileAddon03">
                                        Auto
                                    </button>
                                    <input type="file" name="cover" accept="image/gif, image/jpeg, image/png"
                                           class="form-control" id="inputGroupFile03"
                                           placeholder="Book Cover" aria-describedby="inputGroupFileAddon03"
                                           aria-label="Upload">

                                </div>


                                <div class="form-group mb-3">
                                    <label>Book</label>

                                    <input type="file" style="border-bottom: 100px" accept="application/pdf"
                                           id="bookInput" onchange="sendFile('bookInput')" name="file"
                                           class="form-control"
                                           placeholder="Book"/>
                                </div>
                                <div>
                                    <label>About</label>
                                    <div class="input-group">
                                        <span class="input-group-text">Description</span>
                                        <textarea class="form-control" style="resize: block" name="description"
                                                  aria-label="With textarea"></textarea>
                                    </div>
                                </div>
                            </div>

                            <button type="submit" id="test" class="btn btn-primary">save</button>
                        </div>
                    </form>
                </div>


            </div>
        </div>
    </div>


    <%--    <form class="d-flex" action="/search">--%>
    <%--        <input class="form-control me-2" name="search" value="${searchBook}" type="search" placeholder="Search"--%>
    <%--               aria-label="Search">--%>
    <%--        <button class="btn btn-outline-success" type="submit">Search</button>--%>
    <%--    </form>--%>


</nav>