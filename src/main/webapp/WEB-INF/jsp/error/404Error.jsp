<%--
  Created by IntelliJ IDEA.
  User: shohimardon
  Date: 21/07/22
  Time: 00:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
</head>

<body>
<style>
    /*======================
404 page
=======================*/


    .page_404 {
        padding: 40px 0;
        background: #fff;
        font-family: 'Arvo', serif;
    }

    .page_404 img {
        width: 100%;
    }

    .four_zero_four_bg {

        background-image: url(https://cdn.dribbble.com/users/285475/screenshots/2083086/dribbble_1.gif);
        height: 400px;
        background-position: center;
    }


    .four_zero_four_bg h1 {
        font-size: 80px;
    }

    .four_zero_four_bg h3 {
        font-size: 80px;
    }

    .link_404 {
        color: #fff !important;
        padding: 10px 20px;
        background: #39ac31;
        margin: 20px 0;
        display: inline-block;
    }

    .contant_box_404 {
        margin-top: -50px;
    }
</style>


<section class="page_404" >
    <div class="container" >
        <div class="row" >
            <div class="col-sm-10 " >
                <div class="col-sm-10 col-sm-offset-1  text-center" >
                    <div class="four_zero_four_bg">
                        <h1 class="text-center ">404</h1>


                    </div>

                    <div class="contant_box_404">
                        <h3 class="h2">
                            Look like you're lost
                        </h3>

                        <p>the page you are looking for not avaible!</p>

                        <a href="/main" class="link_404">Go to Home</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>

</html>
