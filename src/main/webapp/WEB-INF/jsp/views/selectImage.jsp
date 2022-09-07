<%--
  Created by IntelliJ IDEA.
  User: shohimardon
  Date: 16/07/22
  Time: 23:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Library</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<style>
    @import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro);
    /*
 * How to copy only one style
 * Just search and copy the code of class for eg:snip1543
 * You are done.
 */

    @import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro);

    /* Snip1543 */


    .snip1543 *,
    .snip1543 *:before,
    .snip1543 *:after {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        -webkit-transition: all 0.45s ease;
        transition: all 0.45s ease;
    }

    .snip1543 img {
        backface-visibility: hidden;
        max-width: 100%;
        vertical-align: top;
    }

    .snip1543:before,
    .snip1543:after {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        content: '';
        background-color: #b81212;
        opacity: 0.5;
        -webkit-transition: all 0.45s ease;
        transition: all 0.45s ease;
    }

    .snip1543:before {
        -webkit-transform: skew(30deg) translateX(-80%);
        transform: skew(30deg) translateX(-80%);
    }

    .snip1543:after {
        -webkit-transform: skew(-30deg) translateX(-70%);
        transform: skew(-30deg) translateX(-70%);
    }

    .snip1543 figcaption {
        position: absolute;
        top: 0px;
        bottom: 0px;
        left: 0px;
        right: 0px;
        z-index: 1;
        bottom: 0;
        padding: 25px 40% 25px 20px;
    }

    .snip1543 figcaption:before,
    .snip1543 figcaption:after {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        background-color: #b81212;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.7);
        content: '';
        opacity: 0.5;
        z-index: -1;
    }

    .snip1543 figcaption:before {
        -webkit-transform: skew(30deg) translateX(-100%);
        transform: skew(30deg) translateX(-100%);
    }

    .snip1543 figcaption:after {
        -webkit-transform: skew(-30deg) translateX(-90%);
        transform: skew(-30deg) translateX(-90%);
    }

    .snip1543 h3,
    .snip1543 p {
        margin: 0;
        opacity: 0;
        letter-spacing: 1px;
    }

    .snip1543 h3 {
        font-family: 'Source Sans Pro', sans-serif;
        font-size: 36px;
        font-weight: 700;
        line-height: 1em;
        text-transform: uppercase;
    }

    .snip1543 p {
        font-size: 0.9em;
    }

    .snip1543 a {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        z-index: 1;
    }

    .snip1543:hover h3,
    .snip1543.hover h3,
    .snip1543:hover p,
    .snip1543.hover p {
        -webkit-transform: translateY(0);
        transform: translateY(0);
        opacity: 0.9;
        -webkit-transition-delay: 0.2s;
        transition-delay: 0.2s;
    }

    .snip1543:hover:before,
    .snip1543.hover:before {
        -webkit-transform: skew(30deg) translateX(-20%);
        transform: skew(30deg) translateX(-20%);
        -webkit-transition-delay: 0.05s;
        transition-delay: 0.05s;
    }

    .snip1543:hover:after,
    .snip1543.hover:after {
        -webkit-transform: skew(-30deg) translateX(-10%);
        transform: skew(-30deg) translateX(-10%);
    }

    .snip1543:hover figcaption:before,
    .snip1543.hover figcaption:before {
        -webkit-transform: skew(30deg) translateX(-40%);
        transform: skew(30deg) translateX(-40%);
        -webkit-transition-delay: 0.15s;
        transition-delay: 0.15s;
    }

    .snip1543:hover figcaption:after,
    .snip1543.hover figcaption:after {
        -webkit-transform: skew(-30deg) translateX(-30%);
        transform: skew(-30deg) translateX(-30%);
        -webkit-transition-delay: 0.1s;
        transition-delay: 0.1s;
    }

    /* Snip1321 */
    @import url(https://fonts.googleapis.com/css?family=Raleway:400,500,800);
    figure.snip1321 {
        font-family: 'Raleway', Arial, sans-serif;
        position: relative;
        overflow: hidden;
        margin: 10px;
        min-width: 230px;
        max-width: 315px;
        width: 100%;
        color: #000000;
        text-align: center;
        -webkit-perspective: 50em;
        perspective: 50em;
    }

    figure.snip1321 * {
        -webkit-box-sizing: padding-box;
        box-sizing: padding-box;
        -webkit-transition: all 0.2s ease-out;
        transition: all 0.2s ease-out;
    }

    figure.snip1321 img {
        max-width: 100%;
        vertical-align: top;
    }

    figure.snip1321 figcaption {
        top: 50%;
        left: 20px;
        right: 20px;
        position: absolute;
        opacity: 0;
        z-index: 1;
    }

    figure.snip1321 h2,
    figure.snip1321 h4 {
        margin: 0;
    }

    figure.snip1321 h2 {
        font-weight: 600;
    }

    figure.snip1321 h4 {
        font-weight: 400;
        text-transform: uppercase;
    }

    figure.snip1321 i {
        font-size: 32px;
    }

    figure.snip1321:after {
        background-color: #ffffff;
        position: absolute;
        content: "";
        display: block;
        top: 20px;
        left: 20px;
        right: 20px;
        bottom: 20px;
        -webkit-transition: all 0.4s ease-in-out;
        transition: all 0.4s ease-in-out;
        -webkit-transform: rotateX(-90deg);
        transform: rotateX(-90deg);
        -webkit-transform-origin: 50% 50%;
        -ms-transform-origin: 50% 50%;
        transform-origin: 50% 50%;
        opacity: 0;
    }

    figure.snip1321 a {
        left: 0;
        right: 0;
        top: 0;
        bottom: 0;
        position: absolute;
        z-index: 1;
    }

    figure.snip1321:hover figcaption,
    figure.snip1321.hover figcaption {
        -webkit-transform: translateY(-50%);
        transform: translateY(-50%);
        opacity: 1;
        -webkit-transition-delay: 0.2s;
        transition-delay: 0.2s;
    }

    figure.snip1321:hover:after,
    figure.snip1321.hover:after {
        -webkit-transform: rotateX(0);
        transform: rotateX(0);
        opacity: 0.9;
    }

    /* Snip 1467 */
    @import url(https://fonts.googleapis.com/css?family=Lato:400,700);
    .snip1467 {
        font-family: 'Lato', Arial, sans-serif;
        position: relative;
        overflow: hidden;
        margin: 10px;
        min-width: 230px;
        max-width: 315px;
        width: 100%;
        color: #fff;
        text-align: center;
        font-size: 16px;
        background-color: #000000;
        line-height: 1.5em;
    }

    .snip1467 *,
    .snip1467 *:before,
    .snip1467 *:after {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        -webkit-transition: all 0.25s linear;
        transition: all 0.25s linear;
    }

    .snip1467 img {
        width: 100%;
        backface-visibility: hidden;
        vertical-align: top;
        -webkit-transform: translate(-40px);
        transform: translate(-40px);
    }

    .snip1467 figcaption {
        position: absolute;
        top: 50%;
        width: 100%;
        -webkit-transform: translateY(-25%);
        transform: translateY(-25%);
        padding: 5px 40px;
        opacity: 0;
    }

    .snip1467 h3 {
        margin: 0;
        text-transform: uppercase;
        font-weight: 700;
    }

    .snip1467 p {
        font-weight: 400;
        margin: 0;
        font-size: 0.9em;
    }

    .snip1467 i {
        position: absolute;
        color: #fff;
        font-size: 34.375px;
        line-height: 55px;
        width: 55px;
        bottom: 0;
        left: 0;
        background-color: #c0392b;
        -webkit-transform: translateX(-55px);
        transform: translateX(-55px);
    }

    .snip1467 a {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
    }

    .snip1467:hover img,
    .snip1467.hover img {
        zoom: 1;
        filter: alpha(opacity=30);
        -webkit-opacity: 0.3;
        opacity: 0.3;
        -webkit-transform: translateX(0px);
        transform: translateX(0px);
    }

    .snip1467:hover figcaption,
    .snip1467.hover figcaption {
        -webkit-transform: translateY(-50%);
        transform: translateY(-50%);
        opacity: 1;
    }

    .snip1467:hover i,
    .snip1467.hover i {
        -webkit-transform: translateX(0);
        transform: translateX(0);
    }

    /* Snip1466 */
    figure.snip1466 {
        position: relative;
        overflow: hidden;
        margin: 10px;
        min-width: 230px;
        max-width: 315px;
        width: 100%;
        color: #ffffff;
        font-size: 16px;
        background-color: #000000;
        border: 3px solid #34495e;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        -webkit-transform: translateZ(0);
        transform: translateZ(0);
    }

    figure.snip1466 *,
    figure.snip1466 *:before,
    figure.snip1466 *:after {
        -webkit-transition: all 0.4s ease;
        transition: all 0.4s ease;
    }

    figure.snip1466 img {
        max-width: 100%;
        backface-visibility: hidden;
        vertical-align: top;
    }

    figure.snip1466 i {
        position: absolute;
        line-height: 50px;
        width: 50px;
        text-align: center;
        font-size: 28px;
        z-index: 1;
        bottom: 0;
        right: 0;
        -webkit-transform: translate(100%, 100%);
        transform: translate(100%, 100%);
    }

    figure.snip1466 i:after {
        position: absolute;
        bottom: 3px;
        right: 3px;
        content: '';
        width: 0;
        height: 0;
        border-style: solid;
        border-width: 0 0 75px 75px;
        border-color: transparent transparent #34495e;
        z-index: -1;
    }

    figure.snip1466 a {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        z-index: 1;
    }

    figure.snip1466:hover img,
    figure.snip1466.hover img {
        zoom: 1;
        filter: alpha(opacity=70);
        -webkit-opacity: 0.7;
        opacity: 0.7;
        -webkit-transform: scale(1.2);
        transform: scale(1.2);
    }

    figure.snip1466:hover i,
    figure.snip1466.hover i {
        -webkit-transform: translate(0, 0);
        transform: translate(0, 0);
    }


    /* Snip1104 */
    @import url(https://fonts.googleapis.com/css?family=Raleway:400,800);
    figure.snip1104 {
        font-family: 'Raleway', Arial, sans-serif;
        position: relative;
        overflow: hidden;
        margin: 10px;
        min-width: 220px;
        max-width: 310px;
        max-height: 220px;
        width: 100%;
        background: #000000;
        color: #ffffff;
        text-align: center;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
    }

    figure.snip1104 * {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        -webkit-transition: all 0.4s ease-in-out;
        transition: all 0.4s ease-in-out;
    }

    figure.snip1104 img {
        max-width: 100%;
        position: relative;
        opacity: 0.4;
    }

    figure.snip1104 figcaption {
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0;
        right: 0;
    }

    figure.snip1104 h2 {
        position: absolute;
        left: 40px;
        right: 40px;
        display: inline-block;
        background: #000000;
        -webkit-transform: skew(-10deg) rotate(-10deg) translate(0, -50%);
        transform: skew(-10deg) rotate(-10deg) translate(0, -50%);
        padding: 12px 5px;
        margin: 0;
        top: 50%;
        text-transform: uppercase;
        font-weight: 400;
    }

    figure.snip1104 h2 span {
        font-weight: 800;
    }

    figure.snip1104:before {
        height: 100%;
        width: 100%;
        top: 0;
        left: 0;
        content: '';
        background: #ffffff;
        position: absolute;
        -webkit-transition: all 0.3s ease-in-out;
        transition: all 0.3s ease-in-out;
        -webkit-transform: rotate(110deg) translateY(-50%);
        transform: rotate(110deg) translateY(-50%);
    }

    figure.snip1104 a {
        left: 0;
        right: 0;
        top: 0;
        bottom: 0;
        position: absolute;
        z-index: 1;
    }

    figure.snip1104.blue {
        background: #123851;
    }

    figure.snip1104.blue h2 {
        background: #0a212f;
    }

    figure.snip1104.red {
        background: #581a14;
    }

    figure.snip1104.red h2 {
        background: #36100c;
    }

    figure.snip1104.yellow {
        background: #7f5006;
    }

    figure.snip1104.yellow h2 {
        background: #583804;
    }

    figure.snip1104:hover img,
    figure.snip1104.hover img {
        opacity: 1;
        -webkit-transform: scale(1.1);
        transform: scale(1.1);
    }

    figure.snip1104:hover h2,
    figure.snip1104.hover h2 {
        -webkit-transform: skew(-10deg) rotate(-10deg) translate(-150%, -50%);
        transform: skew(-10deg) rotate(-10deg) translate(-150%, -50%);
    }

    figure.snip1104:hover:before,
    figure.snip1104.hover:before {
        -webkit-transform: rotate(110deg) translateY(-150%);
        transform: rotate(110deg) translateY(-150%);
    }

    /* Snip1401 */
    @import url(https://fonts.googleapis.com/css?family=Playfair+Display:400,800);
    .snip1401 {
        font-family: 'Playfair Display', Arial, sans-serif;
        position: relative;
        overflow: hidden;
        margin: 10px;
        min-width: 230px;
        max-width: 315px;
        max-height: 220px;
        width: 100%;
        color: #000000;
        text-align: right;
        font-size: 16px;
        background-color: #000000;
    }

    .snip1401 * {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        -webkit-transition: all 0.35s ease;
        transition: all 0.35s ease;
    }

    .snip1401 img {
        max-width: 100%;
        backface-visibility: hidden;
    }

    .snip1401 figcaption {
        position: absolute;
        top: 0;
        bottom: 0;
        right: 0;
        z-index: 1;
        opacity: 1;
        padding: 30px 0 30px 10px;
        background-color: #ffffff;
        width: 40%;
        -webkit-transform: translateX(150%);
        transform: translateX(150%);
    }

    .snip1401 figcaption:before {
        position: absolute;
        top: 50%;
        -webkit-transform: translateY(-50%);
        transform: translateY(-50%);
        right: 100%;
        content: '';
        width: 0;
        height: 0;
        border-style: solid;
        border-width: 120px 120px 120px 0;
        border-color: transparent #ffffff transparent transparent;
    }

    .snip1401:after {
        position: absolute;
        bottom: 50%;
        right: 40%;
        content: '';
        width: 0;
        height: 0;
        border-style: solid;
        border-width: 120px 120px 0 120px;
        border-color: rgba(255, 255, 255, 0.5) transparent transparent transparent;
        -webkit-transform: translateY(-50%);
        transform: translateY(-50%);
        -webkit-transition: all 0.35s ease;
        transition: all 0.35s ease;
    }

    .snip1401 h3,
    .snip1401 p {
        line-height: 1.5em;
        -webkit-transform: translateX(-30px);
        transform: translateX(-30px);
        margin: 0;
    }

    .snip1401 h3 {
        margin: 0 0 5px;
        line-height: 1.1em;
        font-weight: 900;
        font-size: 1.4em;
        opacity: 0.75;
    }

    .snip1401 p {
        font-size: 0.8em;
    }

    .snip1401 i {
        position: absolute;
        bottom: 0;
        left: 0;
        padding: 20px 30px;
        font-size: 44px;
        color: #ffffff;
        opacity: 0;
    }

    .snip1401 a {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        z-index: 1;
    }

    .snip1401:hover img,
    .snip1401.hover img {
        zoom: 1;
        filter: alpha(opacity=50);
        -webkit-opacity: 0.5;
        opacity: 0.5;
    }

    .snip1401:hover:after,
    .snip1401.hover:after,
    .snip1401:hover figcaption,
    .snip1401.hover figcaption,
    .snip1401:hover i,
    .snip1401.hover i {
        -webkit-transform: translateX(0);
        transform: translateX(0);
        opacity: 1;
    }

    /* Snip1477 */
    figure.snip1477 {
        font-family: 'Raleway', Arial, sans-serif;
        position: relative;
        overflow: hidden;
        margin: 10px;
        min-width: 230px;
        max-width: 315px;
        width: 100%;
        color: #ffffff;
        text-align: center;
        font-size: 16px;
        background-color: #000000;
    }

    figure.snip1477 *,
    figure.snip1477 *:before,
    figure.snip1477 *:after {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        -webkit-transition: all 0.55s ease;
        transition: all 0.55s ease;
    }

    figure.snip1477 img {
        max-width: 100%;
        backface-visibility: hidden;
        vertical-align: top;
        opacity: 0.9;
    }

    figure.snip1477 .title {
        position: absolute;
        top: 58%;
        left: 25px;
        padding: 5px 10px 10px;
    }

    figure.snip1477 .title:before,
    figure.snip1477 .title:after {
        height: 2px;
        width: 400px;
        position: absolute;
        content: '';
        background-color: #ffffff;
    }

    figure.snip1477 .title:before {
        top: 0;
        left: 10px;
        -webkit-transform: translateX(100%);
        transform: translateX(100%);
    }

    figure.snip1477 .title:after {
        bottom: 0;
        right: 10px;
        -webkit-transform: translateX(-100%);
        transform: translateX(-100%);
    }

    figure.snip1477 .title div:before,
    figure.snip1477 .title div:after {
        width: 2px;
        height: 300px;
        position: absolute;
        content: '';
        background-color: #ffffff;
    }

    figure.snip1477 .title div:before {
        top: 10px;
        right: 0;
        -webkit-transform: translateY(100%);
        transform: translateY(100%);
    }

    figure.snip1477 .title div:after {
        bottom: 10px;
        left: 0;
        -webkit-transform: translateY(-100%);
        transform: translateY(-100%);
    }

    figure.snip1477 h2,
    figure.snip1477 h4 {
        margin: 0;
        text-transform: uppercase;
    }

    figure.snip1477 h2 {
        font-weight: 400;
    }

    figure.snip1477 h4 {
        display: block;
        font-weight: 700;
        background-color: #ffffff;
        padding: 5px 10px;
        color: #000000;
    }

    figure.snip1477 figcaption {
        position: absolute;
        bottom: 42%;
        left: 25px;
        text-align: left;
        opacity: 0;
        padding: 5px 60px 5px 10px;
        font-size: 0.8em;
        font-weight: 500;
        letter-spacing: 1.5px;
    }

    figure.snip1477 figcaption p {
        margin: 0;
    }

    figure.snip1477 a {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
    }

    figure.snip1477:hover img,
    figure.snip1477.hover img {
        zoom: 1;
        filter: alpha(opacity=35);
        -webkit-opacity: 0.35;
        opacity: 0.35;
    }

    figure.snip1477:hover .title:before,
    figure.snip1477.hover .title:before,
    figure.snip1477:hover .title:after,
    figure.snip1477.hover .title:after,
    figure.snip1477:hover .title div:before,
    figure.snip1477.hover .title div:before,
    figure.snip1477:hover .title div:after,
    figure.snip1477.hover .title div:after {
        -webkit-transform: translate(0, 0);
        transform: translate(0, 0);
    }

    figure.snip1477:hover .title:before,
    figure.snip1477.hover .title:before,
    figure.snip1477:hover .title:after,
    figure.snip1477.hover .title:after {
        -webkit-transition-delay: 0.15s;
        transition-delay: 0.15s;
    }

    figure.snip1477:hover figcaption,
    figure.snip1477.hover figcaption {
        opacity: 1;
        -webkit-transition-delay: 0.2s;
        transition-delay: 0.2s;
    }

    /* Snip1190 */
    figure.snip1190 {
        font-family: 'Raleway', Arial, sans-serif;
        color: #fff;
        position: relative;
        overflow: hidden;
        margin: 10px;
        min-width: 220px;
        max-width: 310px;
        max-height: 220px;
        width: 100%;
        background: #000000;
        text-align: center;
    }

    figure.snip1190 * {
        -webkit-box-sizing: padding-box;
        box-sizing: padding-box;
        -webkit-transition: all 0.3s ease-in-out;
        transition: all 0.3s ease-in-out;
    }

    figure.snip1190 img {
        opacity: 0.8;
        width: 100%;
    }

    figure.snip1190 figcaption {
        bottom: 0;
        display: block;
        left: 0;
        position: absolute;
        right: 0;
        top: 0;
    }

    figure.snip1190 h2 {
        font-weight: 400;
        left: 0;
        right: 0;
        letter-spacing: -1px;
        margin: 0 auto;
        position: absolute;
        text-transform: uppercase;
        bottom: 50%;
        -webkit-transform: translateY(50%);
        transform: translateY(50%);
    }

    figure.snip1190 h2 span {
        font-weight: 800;
    }

    figure.snip1190 p {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        margin: 0 auto;
        top: 50%;
        opacity: 0;
        font-size: 14px;
        -webkit-transform: translateY(-20%) scale(0.7);
        transform: translateY(-20%) scale(0.7);
    }

    figure.snip1190 .square {
        height: 78px;
        width: 78px;
        overflow: hidden;
        position: absolute;
        top: 50%;
        left: 50%;
        content: '';
        -webkit-transform: rotate(45deg) translate(-50%, -50%);
        transform: rotate(45deg) translate(-50%, -50%);
        -webkit-transform-origin: 0 0;
        transform-origin: 0 0;
    }

    figure.snip1190 .square:before,
    figure.snip1190 .square:after,
    figure.snip1190 .square div:before,
    figure.snip1190 .square div:after {
        background-color: #ffffff;
        position: absolute;
        content: "";
        display: block;
        -webkit-transition: all 0.4s ease-in-out;
        transition: all 0.4s ease-in-out;
    }

    figure.snip1190 .square:before,
    figure.snip1190 .square:after {
        width: 65%;
        height: 2px;
    }

    figure.snip1190 .square div:before,
    figure.snip1190 .square div:after {
        width: 2px;
        height: 65%;
    }

    figure.snip1190 .square:before,
    figure.snip1190 .square div:before {
        left: 0;
        top: 0;
    }

    figure.snip1190 .square:after,
    figure.snip1190 .square div:after {
        bottom: 0;
        right: 0;
    }

    figure.snip1190 a {
        left: 0;
        right: 0;
        top: 0;
        bottom: 0;
        position: absolute;
    }

    figure.snip1190:hover img,
    figure.snip1190.hover img {
        opacity: 0.25;
        -webkit-transform: scale(1.1);
        transform: scale(1.1);
    }

    figure.snip1190:hover h2,
    figure.snip1190.hover h2 {
        opacity: 1;
        -webkit-transform: translateY(0px);
        transform: translateY(0px);
    }

    figure.snip1190:hover p,
    figure.snip1190.hover p {
        opacity: 1;
        -webkit-transform: translateY(0px) scale(1);
        transform: translateY(0px) scale(1);
    }

    figure.snip1190:hover .square:before,
    figure.snip1190.hover .square:before {
        width: 38%;
    }

    figure.snip1190:hover .square div:before,
    figure.snip1190.hover .square div:before {
        height: 38%;
    }

    figure.snip1190:hover .square:after,
    figure.snip1190.hover .square:after {
        width: 55%;
    }

    figure.snip1190:hover .square div:after,
    figure.snip1190.hover .square div:after {
        height: 55%;
    }

    /* Snip0016 */
    figure.snip0016 {
        font-family: 'Raleway', Arial, sans-serif;
        color: #fff;
        position: relative;
        overflow: hidden;
        margin: 10px;
        min-width: 220px;
        max-width: 310px;
        max-height: 220px;
        width: 100%;
        background: #000000;
        text-align: left;
    }

    figure.snip0016 * {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
    }

    figure.snip0016 img {
        max-width: 100%;
        opacity: 1;
        width: 100%;
        -webkit-transition: opacity 0.35s;
        transition: opacity 0.35s;
    }

    figure.snip0016 figcaption {
        position: absolute;
        bottom: 0;
        left: 0;
        padding: 30px 3em;
        width: 100%;
        height: 100%;
    }

    figure.snip0016 figcaption::before {
        position: absolute;
        top: 30px;
        right: 30px;
        bottom: 30px;
        left: 100%;
        border-left: 4px solid rgba(255, 255, 255, 0.8);
        content: '';
        opacity: 0;
        background-color: rgba(255, 255, 255, 0.5);
        -webkit-transition: all 0.5s;
        transition: all 0.5s;
        -webkit-transition-delay: 0.6s;
        transition-delay: 0.6s;
    }

    figure.snip0016 h2,
    figure.snip0016 p {
        margin: 0 0 5px;
        opacity: 0;
        -webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
        transition: opacity 0.35s, -webkit-transform 0.35s, -moz-transform 0.35s, -o-transform 0.35s, transform 0.35s;
    }

    figure.snip0016 h2 {
        word-spacing: -0.15em;
        font-weight: 300;
        text-transform: uppercase;
        -webkit-transform: translate3d(30%, 0%, 0);
        transform: translate3d(30%, 0%, 0);
        -webkit-transition-delay: 0.3s;
        transition-delay: 0.3s;
    }

    figure.snip0016 h2 span {
        font-weight: 800;
    }

    figure.snip0016 p {
        font-weight: 200;
        -webkit-transform: translate3d(0%, 30%, 0);
        transform: translate3d(0%, 30%, 0);
        -webkit-transition-delay: 0s;
        transition-delay: 0s;
    }

    figure.snip0016 a {
        left: 0;
        right: 0;
        top: 0;
        bottom: 0;
        position: absolute;
        color: #ffffff;
    }

    figure.snip0016:hover img {
        opacity: 0.3;
    }

    figure.snip0016:hover figcaption h2 {
        opacity: 1;
        -webkit-transform: translate3d(0%, 0%, 0);
        transform: translate3d(0%, 0%, 0);
        -webkit-transition-delay: 0.4s;
        transition-delay: 0.4s;
    }

    figure.snip0016:hover figcaption p {
        opacity: 0.9;
        -webkit-transform: translate3d(0%, 0%, 0);
        transform: translate3d(0%, 0%, 0);
        -webkit-transition-delay: 0.6s;
        transition-delay: 0.6s;
    }

    figure.snip0016:hover figcaption::before {
        background: rgba(255, 255, 255, 0);
        left: 30px;
        opacity: 1;
        -webkit-transition-delay: 0s;
        transition-delay: 0s;
    }

    /* Snip0018 */
    @import url(https://fonts.googleapis.com/css?family=Raleway:400,200,300,800);
    figure.snip0018 {
        font-family: 'Raleway', Arial, sans-serif;
        color: #fff;
        position: relative;
        overflow: hidden;
        margin: 10px;
        min-width: 220px;
        max-width: 310px;
        max-height: 220px;
        width: 100%;
        background: #000000;
        text-align: center;
    }

    figure.snip0018 * {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
    }

    figure.snip0018 img {
        opacity: 1;
        width: 100%;
        -webkit-transition: opacity 0.35s;
        transition: opacity 0.35s;
    }

    figure.snip0018 figcaption {
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 100%;
    }

    figure.snip0018 figcaption > div {
        height: 50%;
        overflow: hidden;
        width: 100%;
        position: relative;
    }

    figure.snip0018 figcaption::before {
        position: absolute;
        top: 50%;
        right: 50%;
        left: 50%;
        height: 2px;
        content: '';
        opacity: 0;
        background-color: rgba(255, 255, 255, 0);
        -webkit-transition: all 0.4s;
        transition: all 0.4s;
        -webkit-transition-delay: 0.6s;
        transition-delay: 0.6s;
    }

    figure.snip0018 h2,
    figure.snip0018 p {
        margin: 0;
        padding: 30px 35px;
        opacity: 0;
        position: absolute;
        height: 100%;
        width: 100%;
        left: 0;
        -webkit-transition: opacity 0.4s, -webkit-transform 0.4s;
        transition: opacity 0.4s, -webkit-transform 0.4s, -moz-transform 0.4s, -o-transform 0.4s, transform 0.4s;
    }

    figure.snip0018 h2 {
        display: inline-block;
        word-spacing: -0.1em;
        font-weight: 300;
        text-transform: uppercase;
        bottom: 0;
        background: rgba(0, 0, 0, 0.5);
        -webkit-transform: translate3d(0%, 50%, 0);
        transform: translate3d(0%, 50%, 0);
        -webkit-transition-delay: 0s;
        transition-delay: 0s;
    }

    figure.snip0018 h2 span {
        font-weight: 800;
    }

    figure.snip0018 p {
        font-weight: 300;
        top: 0%;
        color: #000;
        background: #fff;
        -webkit-transform: translate3d(0%, -50%, 0);
        transform: translate3d(0%, -50%, 0);
        -webkit-transition-delay: 0s;
        transition-delay: 0s;
    }

    figure.snip0018 a {
        left: 0;
        right: 0;
        top: 0;
        bottom: 0;
        position: absolute;
        color: #ffffff;
    }

    figure.snip0018:hover img {
        opacity: 0.7;
    }

    figure.snip0018:hover figcaption h2,
    figure.snip0018:hover figcaption p {
        -webkit-transform: translate3d(0%, 0%, 0);
        transform: translate3d(0%, 0%, 0);
        -webkit-transition-delay: 0.3s;
        transition-delay: 0.3s;
    }

    figure.snip0018:hover figcaption h2 {
        opacity: 1;
    }

    figure.snip0018:hover figcaption p {
        opacity: 1;
    }

    figure.snip0018:hover figcaption::before {
        background: #ffffff;
        left: 0px;
        right: 0px;
        opacity: 1;
        -webkit-transition-delay: 0s;
        transition-delay: 0s;
    }

    /* Snip1361 */
    @import url(https://fonts.googleapis.com/css?family=Oswald);
    @import url(https://fonts.googleapis.com/css?family=Quattrocento);
    .snip1361 {
        font-family: 'Quattrocento', Arial, sans-serif;
        position: relative;
        overflow: hidden;
        margin: 10px;
        min-width: 230px;
        max-width: 315px;
        width: 100%;
        color: #141414;
        text-align: left;
        line-height: 1.4em;
        font-size: 16px;
    }

    .snip1361 * {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        -webkit-transition: all 0.35s ease;
        transition: all 0.35s ease;
    }

    .snip1361 img {
        max-width: 100%;
        vertical-align: top;
    }

    .snip1361 figcaption {
        position: absolute;
        top: calc(77%);
        width: 100%;
        background-color: #ffffff;
        padding: 15px 25px 65px;
    }

    .snip1361 figcaption:before {
        position: absolute;
        content: '';
        z-index: 2;
        bottom: 100%;
        left: 0;
        width: 100%;
        height: 80px;
        background-image: -webkit-linear-gradient(top, transparent 0%, #ffffff 100%);
        background-image: linear-gradient(to bottom, transparent 0%, #ffffff 100%);
    }

    .snip1361 h3,
    .snip1361 p {
        margin: 0 0 10px;
    }

    .snip1361 h3 {
        font-weight: 300;
        font-size: 1.4em;
        line-height: 1.2em;
        font-family: 'Oswald', Arial, sans-serif;
        text-transform: uppercase;
    }

    .snip1361 p {
        font-size: 0.9em;
        letter-spacing: 1px;
        opacity: 0.9;
    }

    .snip1361 a {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        z-index: 2;
    }

    .snip1361:hover figcaption,
    .snip1361.hover figcaption {
        top: 80px;
    }

    /* Snip1446 */
    @import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,500,900);
    .snip1446 {
        font-family: 'Source Sans Pro', Arial, sans-serif;
        position: relative;
        overflow: hidden;
        margin: 10px;
        min-width: 230px;
        max-width: 315px;
        max-height: 230px;
        width: 100%;
        color: #ffffff;
        text-align: center;
        font-size: 16px;
    }

    .snip1446 * {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        -webkit-transition: all 0.35s ease;
        transition: all 0.35s ease;
    }

    .snip1446 img {
        opacity: 1;
        width: 100%;
    }

    .snip1446:after,
    .snip1446:before,
    .snip1446 figcaption:after,
    .snip1446 figcaption:before {
        background: #0a0a0a;
        width: 25%;
        position: absolute;
        content: '';
        opacity: 0;
        -webkit-transition: all 0.3s steps(4);
        transition: all 0.3s steps(4);
        z-index: 1;
        top: 100%;
        bottom: 0;
    }

    .snip1446:before {
        left: 0;
        -webkit-transition-delay: 0;
        transition-delay: 0;
    }

    .snip1446:after {
        left: 25%;
        -webkit-transition-delay: 0.1s;
        transition-delay: 0.1s;
    }

    .snip1446 figcaption:before {
        left: 50%;
        -webkit-transition-delay: 0.2s;
        transition-delay: 0.2s;
        z-index: -1;
    }

    .snip1446 figcaption:after {
        left: 75%;
        -webkit-transition-delay: 0.3s;
        transition-delay: 0.3s;
        z-index: -1;
    }

    .snip1446 figcaption {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        z-index: 2;
        padding: 30px;
    }

    .snip1446 h2,
    .snip1446 p,
    .snip1446 .icons {
        margin: 0;
        width: 100%;
        opacity: 0;
    }

    .snip1446 h2 {
        font-weight: 900;
        text-transform: uppercase;
    }

    .snip1446 p {
        font-weight: 300;
    }

    .snip1446 .icons {
        position: absolute;
        bottom: 30px;
        left: 0;
        width: 100%;
    }

    .snip1446 i {
        padding: 0px 10px;
        display: inline-block;
        font-size: 24px;
        color: #ffffff;
        text-align: center;
        opacity: 0.8;
    }

    .snip1446 i:hover {
        opacity: 1;
    }

    .snip1446:hover:after,
    .snip1446.hover:after,
    .snip1446:hover:before,
    .snip1446.hover:before,
    .snip1446:hover figcaption:after,
    .snip1446.hover figcaption:after,
    .snip1446:hover figcaption:before,
    .snip1446.hover figcaption:before {
        top: 0;
        opacity: 0.8;
    }

    .snip1446:hover figcaption h2,
    .snip1446.hover figcaption h2,
    .snip1446:hover figcaption p,
    .snip1446.hover figcaption p,
    .snip1446:hover figcaption .icons,
    .snip1446.hover figcaption .icons {
        -webkit-transition-delay: 0.4s;
        transition-delay: 0.4s;
    }

    .snip1446:hover figcaption h2,
    .snip1446.hover figcaption h2,
    .snip1446:hover figcaption .icons,
    .snip1446.hover figcaption .icons {
        opacity: 1;
    }

    .snip1446:hover figcaption p,
    .snip1446.hover figcaption p {
        opacity: 0.7;
    }
</style>
<body>


<%--<div class="gallery">--%>
<%--    <a href="mergeImage/+${var}" methods="POST">--%>
<%--        <img src="img?filepath=${var}" alt="Cinque Terre" width="600" height="400">--%>
<%--    </a>--%>
<%--    <div class="desc">${name}</div>--%>
<%--</div>--%>


<div class="container" style="        max-width: 1000px;
    height: 500;">
    <div class="row" style=" width: 100%;height: 100%">
        <c:forEach var="var" items="${images}" varStatus="loop">
            <div class="col" style="width: 100%;height: 100%">

                <figure class="snip1467">

                    <img class="book-top"
                         src="img?filepath=${var}"
                         alt="book-top"/>
                    <figcaption>
                        <h3>Click to select</h3>

                    </figcaption>
                    <i class="ion-plus-round"></i>
                    <a href="/checkSave" onclick="sendImage('${var}')"></a>
                </figure>


            </div>

        </c:forEach>
    </div>
</div>
<script>

    async function sendImage(imagePath) {
        try {


            const formData = new FormData()
            formData.append('file', imagePath)

            const response = await fetch('/mergeImage', {
                method: 'POST',
                body: formData
            })


            console.log('imgs response : ', response)
        } catch (e) {
            console.error(e)
        }
    }

</script>
</body>
</html>
