<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: jl
  Date: 7/12/2022
  Time: 11:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
    <link rel="icon" type="image/x-icon"  href="../../image/images.png">
    <link rel="icon" type="image/x-icon" href="https://img.icons8.com/external-flaticons-flat-flat-icons/64/000000/external-library-university-flaticons-flat-flat-icons.pngico">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <style>
        <%@ include file="../../Css/task2rescss.css"%>
    </style>

</head>

<body>

<div class="login-root">
    <div class="box-root flex-flex flex-direction--column" style="min-height: 100vh;flex-grow: 1;">
        <div class="loginbackground box-background--white padding-top--64">
            <div class="loginbackground-gridContainer">
                <div class="box-root flex-flex" style="grid-area: top / start / 8 / end;">
                    <div class="box-root"
                         style="background-image: linear-gradient(white 0%, rgb(247, 250, 252) 33%); flex-grow: 1;">
                    </div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 4 / 2 / auto / 5;">
                    <div class="box-root box-divider--light-all-2 animationLeftRight tans3s" style="flex-grow: 1;">
                    </div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 6 / start / auto / 2;">
                    <div class="box-root box-background--blue800" style="flex-grow: 1;"></div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 7 / start / auto / 4;">
                    <div class="box-root box-background--blue animationLeftRight" style="flex-grow: 1;"></div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 8 / 4 / auto / 6;">
                    <div class="box-root box-background--gray100 animationLeftRight tans3s" style="flex-grow: 1;">
                    </div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 2 / 15 / auto / end;">
                    <div class="box-root box-background--cyan200 animationRightLeft tans4s" style="flex-grow: 1;">
                    </div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 3 / 14 / auto / end;">
                    <div class="box-root box-background--blue animationRightLeft" style="flex-grow: 1;"></div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 4 / 17 / auto / 20;">
                    <div class="box-root box-background--gray100 animationRightLeft tans4s" style="flex-grow: 1;">
                    </div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 5 / 14 / auto / 17;">
                    <div class="box-root box-divider--light-all-2 animationRightLeft tans3s" style="flex-grow: 1;">
                    </div>
                </div>
            </div>
        </div>
        <div class="box-root padding-top--24 flex-flex flex-direction--column" style="flex-grow: 1; z-index: 9;">
            <div class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center">
                <h1>Library</h1>
            </div>
            <div class="formbg-outer">
                <div class="formbg">

                    <div class="formbg-inner padding-horizontal--48">
                        <span class="padding-bottom--15">Sign in to your account</span>
                        <form id="stripe-login" action="/login" method="post">
                            <div class="field padding-bottom--24">


                                <label for="username">Username</label>
                                <input value="${username}" type="text" name="username" id="username" required=""
                                       oninvalid="this.setCustomValidity('Please Enter valid username')"
                                       oninput="setCustomValidity('')">

                            </div>
                            <div class="field padding-bottom--24">
                                <div class="grid--50-50">
                                    <label for="password">Password</label>
                                    <!-- <div class="reset-pass">
                                        <a href="#">Forgot your password?</a>
                                    </div> -->
                                </div>
                                <input value="${password}" type="password" name="password" id="password" required=""
                                       oninvalid="this.setCustomValidity('Please Enter  password')"
                                       oninput="setCustomValidity('')">
                            </div>
                            <!-- <div class="field field-checkbox padding-bottom--24 flex-flex align-center">
                                <label for="checkbox">
                                    <input type="checkbox" name="checkbox"> Stay signed in for a week
                                </label>
                            </div> -->
                            <%
                                if (!Objects.isNull(request.getParameter("username"))) { %>
                            <p style="color: red">Username or password incorrect</p>

                            <% }%>


                            <div class="field padding-bottom--24">
                                <input type="submit" name="submit" onclick="return Validation()  " value="Continue">
                            </div>
                            <div class="field">

                            </div>
                        </form>
                    </div>
                </div>
                <script type="application/javascript">
                    function Validation() {
                        var username = document.getElementById("username");
                        var password = document.getElementById("password");
                        if (username == null) {
                            alert("username can't not be null")
                            return false;
                        }
                        if (password == null) {
                            alert(" Password can't not be null")
                            return false;
                        }
                    }
                </script>
                <div class="footer-link padding-top--24">
                    <span>Don't have an account? <a href="signup">Sign up</a></span>
                    <div class="listing padding-top--24 padding-bottom--24 flex-flex center-center">
                        <span><a href="#">© Stackfindover</a></span>
                        <span><a href="#">Contact</a></span>
                        <span><a href="#">Privacy & terms</a></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
