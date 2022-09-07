<%--
  Created by IntelliJ IDEA.
  User: shohimardon
  Date: 12/07/22
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        <%@ include file="../../Css/signUpcss.css"%>
    </style>
    <title>Sign Up</title>
</head>
<form action="/signup" method="post">
    <% if (request.getParameter("age") != null) { %>
    <h2 style="color: red">This username already exist</h2>

    <% }%>
    <div class="form">
        <div class="title">Welcome</div>
        <div class="subtitle">Let's create your account!</div>
        <div class="input-container ic1">
            <input name="firstname" required=""
                   oninvalid="this.setCustomValidity('Please Enter valid firstname')"
                   oninput="setCustomValidity('')" id="firstname" class="input" type="text" value="${firstname}"
                   placeholder=" "/>
            <div class="cut"></div>
            <label for="firstname" class="placeholder">First name</label>
        </div>

        <div class="input-container ic2">
            <input value="${lastname}" name="lastname" required=""
                   oninvalid="this.setCustomValidity('Please Enter valid lastname')"
                   oninput="setCustomValidity('')" id="lastname" class="input" type="text" placeholder=" "/>
            <div class="cut"></div>
            <label for="lastname" class="placeholder">Last name</label>
        </div>
        <div class="input-container ic2">
            <input value="${username}" name="username" required=""
                   oninvalid="this.setCustomValidity('Please Enter valid username')"
                   oninput="setCustomValidity('')" id="username" class="input" type="text" placeholder=" "/>
            <div class="cut cut-short"></div>
            <label for="username" class="placeholder">Username</label>
        </div>
        <div class="input-container ic2">
            <input value="${password}" name="password" required=""
                   oninvalid="this.setCustomValidity('Please Enter valid password')"
                   oninput="setCustomValidity('')" id="password" class="input" type="password" placeholder=" "/>
            <div class="cut cut-short"></div>
            <label for="password" class="placeholder">Password</label>


            <div class="input-container ic2">
                <input value="${password}" name="conformPassword" required=""
                       oninvalid="this.setCustomValidity('Please Enter valid ConformPassword')"
                       oninput="setCustomValidity('')" id="ConformPassword" class="input" type="password"
                       placeholder=" "/>
                <div class="cut cut-short"></div>
                <label for="ConformPassword" class="placeholder">Conform Password</label>

            </div>

            <div class="input-container ic2">
                <input value="${age}" name="age" required=""
                       oninvalid="this.setCustomValidity('Please Enter valid age')"
                       oninput="setCustomValidity('')" id="age" class="input" type="number" placeholder=" "/>
                <div class="cut"></div>
                <label for="age" class="placeholder">Age </label>
            </div>
            <div class="input-container ic2">
                <input value="${email}" name="email" required=""
                       oninvalid="this.setCustomValidity('Please Enter valid email')"
                       oninput="setCustomValidity('')" id="email" class="input" type="text" placeholder=" "/>
                <div class="cut cut-short"></div>
                <label for="email" class="placeholder">Email</label>
            </div>

            <button type="submit" class="submit" onclick="return Validate()">submit</button>
            <%--            <input type="button" id="btnSubmit" value="Submit" onclick="return Validate()"/>--%>
        </div>

    </div>
</form>

<script type="text/javascript">
    function Validate() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("ConformPassword").value;
        var age = document.getElementById("age").value;
        var username = document.getElementById("username");
        if (password !== confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }

        if (username == null) {
            alert("Username can't not be null")
            return false;
        }
        if (age < 5) {
            alert("You very young yet");
            return false;
        }
        if (password.length < 5) {
            alert("Please enter strong password")
        }

        return true;
    }


</script>
</html>
