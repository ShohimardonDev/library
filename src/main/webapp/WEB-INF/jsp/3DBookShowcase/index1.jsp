<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" class="no-js demo-2">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>3D Book Showcase</title>
    <meta name="description" content="3D Book Showcase with CSS 3D Transforms"/>
    <meta name="keywords" content="3d transforms, css3 3d, book, jquery, open book, css transitions"/>
    <meta name="author" content="Codrops"/>
    <link rel="shortcut icon" href="../favicon.ico">
    <style>
        <%@include file="css/default.css"%>
        <%@include file="css/component2.css"%>
    </style>
    <script>
        <%@include file="js/modernizr.custom.js"%>
    </script>
<%--    <link rel="stylesheet" type="text/css" href="css/default.css"/>--%>
<%--    <link rel="stylesheet" type="text/css" href="css/component2.css"/>--%>
<%--    <script src="js/modernizr.custom.js"></script>--%>
</head>
<body>
<div class="container">
    <!-- Codrops top bar -->
    <div class="codrops-top clearfix">
        <a href="http://tympanus.net/Tutorials/ItemSlider/"><strong>&laquo; Previous Demo: </strong>Simple Item
            Slider</a>
        <span class="right"><a href="http://tympanus.net/codrops/?p=13406"><strong>Back to the Codrops Article</strong></a></span>
    </div><!--/ Codrops top bar -->
    <header class="clearfix">
        <h1>3D Book Showcase</h1>
        <nav class="codrops-demos">
            <a href="index.html">Demo 1</a>
            <a class="current-demo" href="index2.html">Demo 2</a>
        </nav>
        <span class="support-note">Best viewed in WebKit browsers</span>
    </header>
    <div class="main">
        <ul id="bk-list" class="bk-list clearfix">
            <li>
                <div class="bk-book book-1">
                    <div class="bk-front">
                        <div class="bk-cover-back"></div>
                        <div class="bk-cover">
                            <h2>
                                <span>Anthony Burghiss</span>
                                <span>A Catwork Orange</span>
                            </h2>
                        </div>
                    </div>
                    <div class="bk-page">
                        <div class="bk-content bk-content-current">
                            <p>Red snapper Kafue pike fangtooth humums slipmouth, salmon cutlassfish; swallower European
                                perch mola mola sunfish, threadfin bream. Billfish hog sucker trout-perch lenok
                                orbicular velvetfish. Delta smelt striped bass, medusafish dragon goby starry flounder
                                cuchia round whitefish northern anchovy spadefish merluccid hake cat shark Black
                                pickerel. Pacific cod.</p>
                        </div>
                        <div class="bk-content">
                            <p>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish
                                carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish
                                snubnose parasitic eel? Black bass soldierfish duckbill--Rattail Atlantic saury Blind
                                shark California halibut; false trevally warty angler!</p>
                        </div>
                        <div class="bk-content">
                            <p>Trahira giant wels cutlassfish snapper koi blackchin mummichog mustard eel rock bass
                                whiff murray cod. Bigmouth buffalo ling cod giant wels, sauger pink salmon. Clingfish
                                luderick treefish flatfish Cherubfish oldwife Indian mul gizzard shad hagfish zebra
                                danio. Butterfly ray lizardfish ponyfish muskellunge Long-finned sand diver mullet
                                swordfish limia ghost carp filefish.</p>
                        </div>
                    </div>
                    <div class="bk-back">
                        <p>In this nightmare vision of cats in revolt, fifteen-year-old Alex and his friends set out on
                            a diabolical orgy of robbery, rape, torture and murder. Alex is jailed for his teenage
                            delinquency and the State tries to reform him - but at what cost?</p>
                    </div>
                    <div class="bk-right"></div>
                    <div class="bk-left">
                        <h2>
                            <span>Anthony Burghiss</span>
                            <span>A Catwork Orange</span>
                        </h2>
                    </div>
                    <div class="bk-top"></div>
                    <div class="bk-bottom"></div>
                </div>
            </li>
            <li>
                <div class="bk-book book-2">
                    <div class="bk-front">
                        <div class="bk-cover-back"></div>
                        <div class="bk-cover">
                            <h2>
                                <span>The Catfather</span>
                                <span>Mario Purrzo</span>
                            </h2>
                        </div>
                    </div>
                    <div class="bk-page">
                        <div class="bk-content">
                            <p>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish
                                carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish
                                snubnose parasitic eel? Black bass soldierfish duckbill--Rattail Atlantic saury Blind
                                shark California halibut; false trevally warty angler!</p>
                        </div>
                        <div class="bk-content">
                            <p>Trahira giant wels cutlassfish snapper koi blackchin mummichog mustard eel rock bass
                                whiff murray cod. Bigmouth buffalo ling cod giant wels, sauger pink salmon. Clingfish
                                luderick treefish flatfish Cherubfish oldwife Indian mul gizzard shad hagfish zebra
                                danio. Butterfly ray lizardfish ponyfish muskellunge Long-finned sand diver mullet
                                swordfish limia ghost carp filefish.</p>
                        </div>
                        <div class="bk-content bk-content-current">
                            <p>Red snapper Kafue pike fangtooth humums's slipmouth, salmon cutlassfish; swallower
                                European perch mola mola sunfish, threadfin bream. Billfish hog sucker trout-perch lenok
                                orbicular velvetfish. Delta smelt striped bass, medusafish dragon goby starry flounder
                                cuchia round whitefish northern anchovy spadefish merluccid hake cat shark Black
                                pickerel. Pacific cod.</p>
                        </div>
                    </div>
                    <div class="bk-back">
                        <p>Tyrant, blackmailer, racketeer, murderer - his influence reaches every level of American
                            society. Meet Cat Corleone, a friendly cat, a just cat, a reasonable cat. The deadliest lord
                            of the Cata Nostra. The Catfather.</p>
                    </div>
                    <div class="bk-right"></div>
                    <div class="bk-left">
                        <h2>
                            <span>The Catfather</span>
                            <span>by Mario Purrzo</span>
                        </h2>
                    </div>
                    <div class="bk-top"></div>
                    <div class="bk-bottom"></div>
                </div>
            </li>
            <li>
                <div class="bk-book book-3">
                    <div class="bk-front">
                        <div class="bk-cover-back"></div>
                        <div class="bk-cover">
                            <h2>
                                <span>J.C. Salinger</span>
                                <span>The Catcher in the Rye</span>
                            </h2>
                        </div>
                    </div>
                    <div class="bk-page">
                        <div class="bk-content bk-content-current">
                            <p>Oceanic flyingfish spotted danio fingerfish leaffish, Billfish halibut Atlantic cod
                                threadsail poacher slender mola. Swallower muskellunge, turbot needlefish yellow perch
                                trout dhufish dwarf gourami false moray southern smelt cod dwarf gourami. Betta blue
                                catfish bottlenose electric ray sablefish.</p>
                        </div>
                        <div class="bk-content">
                            <p>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish
                                carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish
                                snubnose parasitic eel? Black bass soldierfish duckbill--Rattail Atlantic saury Blind
                                shark California halibut; false trevally warty angler!</p>
                        </div>
                        <div class="bk-content">
                            <p>Trahira giant wels cutlassfish snapper koi blackchin mummichog mustard eel rock bass
                                whiff murray cod. Bigmouth buffalo ling cod giant wels, sauger pink salmon. Clingfish
                                luderick treefish flatfish Cherubfish oldwife Indian mul gizzard shad hagfish zebra
                                danio. Butterfly ray lizardfish ponyfish muskellunge Long-finned sand diver mullet
                                swordfish limia ghost carp filefish.</p>
                        </div>
                    </div>
                    <div class="bk-back">
                        <img src="images/3.png" alt="cat"/>
                        <p>Holden Catfield is a seventeen-year-old dropout who has just been kicked out of his fourth
                            school. Navigating his way through the challenges of growing up, Holden dissects the 'phony'
                            aspects of society.</p>
                    </div>
                    <div class="bk-right"></div>
                    <div class="bk-left">
                        <h2>
                            <span>J.C. Salinger</span>
                            <span>The Catcher in the Rye</span>
                        </h2>
                    </div>
                    <div class="bk-top"></div>
                    <div class="bk-bottom"></div>
                </div>
            </li>
            <li>
                <div class="bk-book book-1">
                    <div class="bk-front">
                        <div class="bk-cover-back"></div>
                        <div class="bk-cover">
                            <h2>
                                <span>Anthony Burghiss</span>
                                <span>A Catwork Orange</span>
                            </h2>
                        </div>
                    </div>
                    <div class="bk-page">
                        <div class="bk-content bk-content-current">
                            <p>Red snapper Kafue pike fangtooth humums slipmouth, salmon cutlassfish; swallower European
                                perch mola mola sunfish, threadfin bream. Billfish hog sucker trout-perch lenok
                                orbicular velvetfish. Delta smelt striped bass, medusafish dragon goby starry flounder
                                cuchia round whitefish northern anchovy spadefish merluccid hake cat shark Black
                                pickerel. Pacific cod.</p>
                        </div>
                        <div class="bk-content">
                            <p>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish
                                carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish
                                snubnose parasitic eel? Black bass soldierfish duckbill--Rattail Atlantic saury Blind
                                shark California halibut; false trevally warty angler!</p>
                        </div>
                        <div class="bk-content">
                            <p>Trahira giant wels cutlassfish snapper koi blackchin mummichog mustard eel rock bass
                                whiff murray cod. Bigmouth buffalo ling cod giant wels, sauger pink salmon. Clingfish
                                luderick treefish flatfish Cherubfish oldwife Indian mul gizzard shad hagfish zebra
                                danio. Butterfly ray lizardfish ponyfish muskellunge Long-finned sand diver mullet
                                swordfish limia ghost carp filefish.</p>
                        </div>
                    </div>
                    <div class="bk-back">
                        <p>In this nightmare vision of cats in revolt, fifteen-year-old Alex and his friends set out on
                            a diabolical orgy of robbery, rape, torture and murder. Alex is jailed for his teenage
                            delinquency and the State tries to reform him - but at what cost?</p>
                    </div>
                    <div class="bk-right"></div>
                    <div class="bk-left">
                        <h2>
                            <span>Anthony Burghiss</span>
                            <span>A Catwork Orange</span>
                        </h2>
                    </div>
                    <div class="bk-top"></div>
                    <div class="bk-bottom"></div>
                </div>
            </li>
            <li>
                <div class="bk-book book-2">
                    <div class="bk-front">
                        <div class="bk-cover-back"></div>
                        <div class="bk-cover">
                            <h2>
                                <span>The Catfather</span>
                                <span>Mario Purrzo</span>
                            </h2>
                        </div>
                    </div>
                    <div class="bk-page">
                        <div class="bk-content">
                            <p>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish
                                carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish
                                snubnose parasitic eel? Black bass soldierfish duckbill--Rattail Atlantic saury Blind
                                shark California halibut; false trevally warty angler!</p>
                        </div>
                        <div class="bk-content">
                            <p>Trahira giant wels cutlassfish snapper koi blackchin mummichog mustard eel rock bass
                                whiff murray cod. Bigmouth buffalo ling cod giant wels, sauger pink salmon. Clingfish
                                luderick treefish flatfish Cherubfish oldwife Indian mul gizzard shad hagfish zebra
                                danio. Butterfly ray lizardfish ponyfish muskellunge Long-finned sand diver mullet
                                swordfish limia ghost carp filefish.</p>
                        </div>
                        <div class="bk-content bk-content-current">
                            <p>Red snapper Kafue pike fangtooth humums's slipmouth, salmon cutlassfish; swallower
                                European perch mola mola sunfish, threadfin bream. Billfish hog sucker trout-perch lenok
                                orbicular velvetfish. Delta smelt striped bass, medusafish dragon goby starry flounder
                                cuchia round whitefish northern anchovy spadefish merluccid hake cat shark Black
                                pickerel. Pacific cod.</p>
                        </div>
                    </div>
                    <div class="bk-back">
                        <p>Tyrant, blackmailer, racketeer, murderer - his influence reaches every level of American
                            society. Meet Cat Corleone, a friendly cat, a just cat, a reasonable cat. The deadliest lord
                            of the Cata Nostra. The Catfather.</p>
                    </div>
                    <div class="bk-right"></div>
                    <div class="bk-left">
                        <h2>
                            <span>The Catfather</span>
                            <span>by Mario Purrzo</span>
                        </h2>
                    </div>
                    <div class="bk-top"></div>
                    <div class="bk-bottom"></div>
                </div>
            </li>
            <li>
                <div class="bk-book book-3">
                    <div class="bk-front">
                        <div class="bk-cover-back"></div>
                        <div class="bk-cover">
                            <h2>
                                <span>J.C. Salinger</span>
                                <span>The Catcher in the Rye</span>
                            </h2>
                        </div>
                    </div>
                    <div class="bk-page">
                        <div class="bk-content bk-content-current">
                            <p>Oceanic flyingfish spotted danio fingerfish leaffish, Billfish halibut Atlantic cod
                                threadsail poacher slender mola. Swallower muskellunge, turbot needlefish yellow perch
                                trout dhufish dwarf gourami false moray southern smelt cod dwarf gourami. Betta blue
                                catfish bottlenose electric ray sablefish.</p>
                        </div>
                        <div class="bk-content">
                            <p>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish
                                carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish
                                snubnose parasitic eel? Black bass soldierfish duckbill--Rattail Atlantic saury Blind
                                shark California halibut; false trevally warty angler!</p>
                        </div>
                        <div class="bk-content">
                            <p>Trahira giant wels cutlassfish snapper koi blackchin mummichog mustard eel rock bass
                                whiff murray cod. Bigmouth buffalo ling cod giant wels, sauger pink salmon. Clingfish
                                luderick treefish flatfish Cherubfish oldwife Indian mul gizzard shad hagfish zebra
                                danio. Butterfly ray lizardfish ponyfish muskellunge Long-finned sand diver mullet
                                swordfish limia ghost carp filefish.</p>
                        </div>
                    </div>
                    <div class="bk-back">
                        <img src="images/3.png" alt="cat"/>
                        <p>Holden Catfield is a seventeen-year-old dropout who has just been kicked out of his fourth
                            school. Navigating his way through the challenges of growing up, Holden dissects the 'phony'
                            aspects of society.</p>
                    </div>
                    <div class="bk-right"></div>
                    <div class="bk-left">
                        <h2>
                            <span>J.C. Salinger</span>
                            <span>The Catcher in the Rye</span>
                        </h2>
                    </div>
                    <div class="bk-top"></div>
                    <div class="bk-bottom"></div>
                </div>
            </li>
            <li>
                <div class="bk-book book-1">
                    <div class="bk-front">
                        <div class="bk-cover-back"></div>
                        <div class="bk-cover">
                            <h2>
                                <span>Anthony Burghiss</span>
                                <span>A Catwork Orange</span>
                            </h2>
                        </div>
                    </div>
                    <div class="bk-page">
                        <div class="bk-content bk-content-current">
                            <p>Red snapper Kafue pike fangtooth humums slipmouth, salmon cutlassfish; swallower European
                                perch mola mola sunfish, threadfin bream. Billfish hog sucker trout-perch lenok
                                orbicular velvetfish. Delta smelt striped bass, medusafish dragon goby starry flounder
                                cuchia round whitefish northern anchovy spadefish merluccid hake cat shark Black
                                pickerel. Pacific cod.</p>
                        </div>
                        <div class="bk-content">
                            <p>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish
                                carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish
                                snubnose parasitic eel? Black bass soldierfish duckbill--Rattail Atlantic saury Blind
                                shark California halibut; false trevally warty angler!</p>
                        </div>
                        <div class="bk-content">
                            <p>Trahira giant wels cutlassfish snapper koi blackchin mummichog mustard eel rock bass
                                whiff murray cod. Bigmouth buffalo ling cod giant wels, sauger pink salmon. Clingfish
                                luderick treefish flatfish Cherubfish oldwife Indian mul gizzard shad hagfish zebra
                                danio. Butterfly ray lizardfish ponyfish muskellunge Long-finned sand diver mullet
                                swordfish limia ghost carp filefish.</p>
                        </div>
                    </div>
                    <div class="bk-back">
                        <p>In this nightmare vision of cats in revolt, fifteen-year-old Alex and his friends set out on
                            a diabolical orgy of robbery, rape, torture and murder. Alex is jailed for his teenage
                            delinquency and the State tries to reform him - but at what cost?</p>
                    </div>
                    <div class="bk-right"></div>
                    <div class="bk-left">
                        <h2>
                            <span>Anthony Burghiss</span>
                            <span>A Catwork Orange</span>
                        </h2>
                    </div>
                    <div class="bk-top"></div>
                    <div class="bk-bottom"></div>
                </div>
            </li>
            <li>
                <div class="bk-book book-2">
                    <div class="bk-front">
                        <div class="bk-cover-back"></div>
                        <div class="bk-cover">
                            <h2>
                                <span>The Catfather</span>
                                <span>Mario Purrzo</span>
                            </h2>
                        </div>
                    </div>
                    <div class="bk-page">
                        <div class="bk-content">
                            <p>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish
                                carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish
                                snubnose parasitic eel? Black bass soldierfish duckbill--Rattail Atlantic saury Blind
                                shark California halibut; false trevally warty angler!</p>
                        </div>
                        <div class="bk-content">
                            <p>Trahira giant wels cutlassfish snapper koi blackchin mummichog mustard eel rock bass
                                whiff murray cod. Bigmouth buffalo ling cod giant wels, sauger pink salmon. Clingfish
                                luderick treefish flatfish Cherubfish oldwife Indian mul gizzard shad hagfish zebra
                                danio. Butterfly ray lizardfish ponyfish muskellunge Long-finned sand diver mullet
                                swordfish limia ghost carp filefish.</p>
                        </div>
                        <div class="bk-content bk-content-current">
                            <p>Red snapper Kafue pike fangtooth humums's slipmouth, salmon cutlassfish; swallower
                                European perch mola mola sunfish, threadfin bream. Billfish hog sucker trout-perch lenok
                                orbicular velvetfish. Delta smelt striped bass, medusafish dragon goby starry flounder
                                cuchia round whitefish northern anchovy spadefish merluccid hake cat shark Black
                                pickerel. Pacific cod.</p>
                        </div>
                    </div>
                    <div class="bk-back">
                        <p>Tyrant, blackmailer, racketeer, murderer - his influence reaches every level of American
                            society. Meet Cat Corleone, a friendly cat, a just cat, a reasonable cat. The deadliest lord
                            of the Cata Nostra. The Catfather.</p>
                    </div>
                    <div class="bk-right"></div>
                    <div class="bk-left">
                        <h2>
                            <span>The Catfather</span>
                            <span>by Mario Purrzo</span>
                        </h2>
                    </div>
                    <div class="bk-top"></div>
                    <div class="bk-bottom"></div>
                </div>
            </li>
            <li>
                <div class="bk-book book-3">
                    <div class="bk-front">
                        <div class="bk-cover-back"></div>
                        <div class="bk-cover">
                            <h2>
                                <span>J.C. Salinger</span>
                                <span>The Catcher in the Rye</span>
                            </h2>
                        </div>
                    </div>
                    <div class="bk-page">
                        <div class="bk-content bk-content-current">
                            <p>Oceanic flyingfish spotted danio fingerfish leaffish, Billfish halibut Atlantic cod
                                threadsail poacher slender mola. Swallower muskellunge, turbot needlefish yellow perch
                                trout dhufish dwarf gourami false moray southern smelt cod dwarf gourami. Betta blue
                                catfish bottlenose electric ray sablefish.</p>
                        </div>
                        <div class="bk-content">
                            <p>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish
                                carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish
                                snubnose parasitic eel? Black bass soldierfish duckbill--Rattail Atlantic saury Blind
                                shark California halibut; false trevally warty angler!</p>
                        </div>
                        <div class="bk-content">
                            <p>Trahira giant wels cutlassfish snapper koi blackchin mummichog mustard eel rock bass
                                whiff murray cod. Bigmouth buffalo ling cod giant wels, sauger pink salmon. Clingfish
                                luderick treefish flatfish Cherubfish oldwife Indian mul gizzard shad hagfish zebra
                                danio. Butterfly ray lizardfish ponyfish muskellunge Long-finned sand diver mullet
                                swordfish limia ghost carp filefish.</p>
                        </div>
                    </div>
                    <div class="bk-back">
                        <img src="images/3.png" alt="cat"/>
                        <p>Holden Catfield is a seventeen-year-old dropout who has just been kicked out of his fourth
                            school. Navigating his way through the challenges of growing up, Holden dissects the 'phony'
                            aspects of society.</p>
                    </div>
                    <div class="bk-right"></div>
                    <div class="bk-left">
                        <h2>
                            <span>J.C. Salinger</span>
                            <span>The Catcher in the Rye</span>
                        </h2>
                    </div>
                    <div class="bk-top"></div>
                    <div class="bk-bottom"></div>
                </div>
            </li>
            <li>
                <div class="bk-book book-1">
                    <div class="bk-front">
                        <div class="bk-cover-back"></div>
                        <div class="bk-cover">
                            <h2>
                                <span>Anthony Burghiss</span>
                                <span>A Catwork Orange</span>
                            </h2>
                        </div>
                    </div>
                    <div class="bk-page">
                        <div class="bk-content bk-content-current">
                            <p>Red snapper Kafue pike fangtooth humums slipmouth, salmon cutlassfish; swallower European
                                perch mola mola sunfish, threadfin bream. Billfish hog sucker trout-perch lenok
                                orbicular velvetfish. Delta smelt striped bass, medusafish dragon goby starry flounder
                                cuchia round whitefish northern anchovy spadefish merluccid hake cat shark Black
                                pickerel. Pacific cod.</p>
                        </div>
                        <div class="bk-content">
                            <p>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish
                                carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish
                                snubnose parasitic eel? Black bass soldierfish duckbill--Rattail Atlantic saury Blind
                                shark California halibut; false trevally warty angler!</p>
                        </div>
                        <div class="bk-content">
                            <p>Trahira giant wels cutlassfish snapper koi blackchin mummichog mustard eel rock bass
                                whiff murray cod. Bigmouth buffalo ling cod giant wels, sauger pink salmon. Clingfish
                                luderick treefish flatfish Cherubfish oldwife Indian mul gizzard shad hagfish zebra
                                danio. Butterfly ray lizardfish ponyfish muskellunge Long-finned sand diver mullet
                                swordfish limia ghost carp filefish.</p>
                        </div>
                    </div>
                    <div class="bk-back">
                        <p>In this nightmare vision of cats in revolt, fifteen-year-old Alex and his friends set out on
                            a diabolical orgy of robbery, rape, torture and murder. Alex is jailed for his teenage
                            delinquency and the State tries to reform him - but at what cost?</p>
                    </div>
                    <div class="bk-right"></div>
                    <div class="bk-left">
                        <h2>
                            <span>Anthony Burghiss</span>
                            <span>A Catwork Orange</span>
                        </h2>
                    </div>
                    <div class="bk-top"></div>
                    <div class="bk-bottom"></div>
                </div>
            </li>
            <li>
                <div class="bk-book book-2">
                    <div class="bk-front">
                        <div class="bk-cover-back"></div>
                        <div class="bk-cover">
                            <h2>
                                <span>The Catfather</span>
                                <span>Mario Purrzo</span>
                            </h2>
                        </div>
                    </div>
                    <div class="bk-page">
                        <div class="bk-content">
                            <p>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish
                                carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish
                                snubnose parasitic eel? Black bass soldierfish duckbill--Rattail Atlantic saury Blind
                                shark California halibut; false trevally warty angler!</p>
                        </div>
                        <div class="bk-content">
                            <p>Trahira giant wels cutlassfish snapper koi blackchin mummichog mustard eel rock bass
                                whiff murray cod. Bigmouth buffalo ling cod giant wels, sauger pink salmon. Clingfish
                                luderick treefish flatfish Cherubfish oldwife Indian mul gizzard shad hagfish zebra
                                danio. Butterfly ray lizardfish ponyfish muskellunge Long-finned sand diver mullet
                                swordfish limia ghost carp filefish.</p>
                        </div>
                        <div class="bk-content bk-content-current">
                            <p>Red snapper Kafue pike fangtooth humums's slipmouth, salmon cutlassfish; swallower
                                European perch mola mola sunfish, threadfin bream. Billfish hog sucker trout-perch lenok
                                orbicular velvetfish. Delta smelt striped bass, medusafish dragon goby starry flounder
                                cuchia round whitefish northern anchovy spadefish merluccid hake cat shark Black
                                pickerel. Pacific cod.</p>
                        </div>
                    </div>
                    <div class="bk-back">
                        <p>Tyrant, blackmailer, racketeer, murderer - his influence reaches every level of American
                            society. Meet Cat Corleone, a friendly cat, a just cat, a reasonable cat. The deadliest lord
                            of the Cata Nostra. The Catfather.</p>
                    </div>
                    <div class="bk-right"></div>
                    <div class="bk-left">
                        <h2>
                            <span>The Catfather</span>
                            <span>by Mario Purrzo</span>
                        </h2>
                    </div>
                    <div class="bk-top"></div>
                    <div class="bk-bottom"></div>
                </div>
            </li>
            <li>
                <div class="bk-book book-3">
                    <div class="bk-front">
                        <div class="bk-cover-back"></div>
                        <div class="bk-cover">
                            <h2>
                                <span>J.C. Salinger</span>
                                <span>The Catcher in the Rye</span>
                            </h2>
                        </div>
                    </div>
                    <div class="bk-page">
                        <div class="bk-content bk-content-current">
                            <p>Oceanic flyingfish spotted danio fingerfish leaffish, Billfish halibut Atlantic cod
                                threadsail poacher slender mola. Swallower muskellunge, turbot needlefish yellow perch
                                trout dhufish dwarf gourami false moray southern smelt cod dwarf gourami. Betta blue
                                catfish bottlenose electric ray sablefish.</p>
                        </div>
                        <div class="bk-content">
                            <p>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish
                                carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish
                                snubnose parasitic eel? Black bass soldierfish duckbill--Rattail Atlantic saury Blind
                                shark California halibut; false trevally warty angler!</p>
                        </div>
                        <div class="bk-content">
                            <p>Trahira giant wels cutlassfish snapper koi blackchin mummichog mustard eel rock bass
                                whiff murray cod. Bigmouth buffalo ling cod giant wels, sauger pink salmon. Clingfish
                                luderick treefish flatfish Cherubfish oldwife Indian mul gizzard shad hagfish zebra
                                danio. Butterfly ray lizardfish ponyfish muskellunge Long-finned sand diver mullet
                                swordfish limia ghost carp filefish.</p>
                        </div>
                    </div>
                    <div class="bk-back">
                        <img src="images/3.png" alt="cat"/>
                        <p>Holden Catfield is a seventeen-year-old dropout who has just been kicked out of his fourth
                            school. Navigating his way through the challenges of growing up, Holden dissects the 'phony'
                            aspects of society.</p>
                    </div>
                    <div class="bk-right"></div>
                    <div class="bk-left">
                        <h2>
                            <span>J.C. Salinger</span>
                            <span>The Catcher in the Rye</span>
                        </h2>
                    </div>
                    <div class="bk-top"></div>
                    <div class="bk-bottom"></div>
                </div>
            </li>
            <li>
                <div class="bk-book book-1">
                    <div class="bk-front">
                        <div class="bk-cover-back"></div>
                        <div class="bk-cover">
                            <h2>
                                <span>Anthony Burghiss</span>
                                <span>A Catwork Orange</span>
                            </h2>
                        </div>
                    </div>
                    <div class="bk-page">
                        <div class="bk-content bk-content-current">
                            <p>Red snapper Kafue pike fangtooth humums slipmouth, salmon cutlassfish; swallower European
                                perch mola mola sunfish, threadfin bream. Billfish hog sucker trout-perch lenok
                                orbicular velvetfish. Delta smelt striped bass, medusafish dragon goby starry flounder
                                cuchia round whitefish northern anchovy spadefish merluccid hake cat shark Black
                                pickerel. Pacific cod.</p>
                        </div>
                        <div class="bk-content">
                            <p>Whale catfish leatherjacket deep sea anglerfish grenadier sawfish pompano dolphinfish
                                carp large-eye bream, squeaker amago. Sandroller; rough scad, tiger shovelnose catfish
                                snubnose parasitic eel? Black bass soldierfish duckbill--Rattail Atlantic saury Blind
                                shark California halibut; false trevally warty angler!</p>
                        </div>
                        <div class="bk-content">
                            <p>Trahira giant wels cutlassfish snapper koi blackchin mummichog mustard eel rock bass
                                whiff murray cod. Bigmouth buffalo ling cod giant wels, sauger pink salmon. Clingfish
                                luderick treefish flatfish Cherubfish oldwife Indian mul gizzard shad hagfish zebra
                                danio. Butterfly ray lizardfish ponyfish muskellunge Long-finned sand diver mullet
                                swordfish limia ghost carp filefish.</p>
                        </div>
                    </div>
                    <div class="bk-back">
                        <p>In this nightmare vision of cats in revolt, fifteen-year-old Alex and his friends set out on
                            a diabolical orgy of robbery, rape, torture and murder. Alex is jailed for his teenage
                            delinquency and the State tries to reform him - but at what cost?</p>
                    </div>
                    <div class="bk-right"></div>
                    <div class="bk-left">
                        <h2>
                            <span>Anthony Burghiss</span>
                            <span>A Catwork Orange</span>
                        </h2>
                    </div>
                    <div class="bk-top"></div>
                    <div class="bk-bottom"></div>
                </div>
            </li>
        </ul>
        <div class="bookshelf"></div>
    </div>
</div><!-- /container -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script
        <%@include file="js/books2.js" %>
></script>
<script>
    $(function () {

        Books.init();

    });
</script>
</body>
</html>