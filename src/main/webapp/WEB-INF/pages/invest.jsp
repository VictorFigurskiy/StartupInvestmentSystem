<%@ page import="com.startup.project.entities.Investor" %><%--
  Created by IntelliJ IDEA.
  User: serhii
  Date: 26.09.2017
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    <jsp:useBean id="startup" scope="request" type="com.startup.project.entities.Startup"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Modern Business - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="../../static/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../../static/css/modern-business.css" rel="stylesheet">
    <link href="../../static/css/footerStyle.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../../static/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<!-- Navigation -->
<nav class="navbar" role="navigation">
    <div class="container header_menu" style="font-size: 18px; ">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="main-page-button"><a class="navbar-brand" href="/">На главную</a></div>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="active">
                    <a href="about.html">About</a>
                </li>
                <li>
                    <a href="services.html">Services</a>
                </li>
                <li>
                    <a href="contact.html">Contact</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Portfolio <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="portfolio-1-col.html">1 Column Portfolio</a>
                        </li>
                        <li>
                            <a href="portfolio-2-col.html">2 Column Portfolio</a>
                        </li>
                        <li>
                            <a href="portfolio-3-col.html">3 Column Portfolio</a>
                        </li>
                        <li>
                            <a href="portfolio-4-col.html">4 Column Portfolio</a>
                        </li>
                        <li>
                            <a href="single_startup_description.jsp">Single Portfolio Item</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="blog-home-1.html">Blog Home 1</a>
                        </li>
                        <li>
                            <a href="blog-home-2.html">Blog Home 2</a>
                        </li>
                        <li>
                            <a href="blog-post.html">Blog Post</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Other Pages <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="full-width.html">Full Width Page</a>
                        </li>
                        <li>
                            <a href="sidebar.html">Sidebar Page</a>
                        </li>
                        <li>
                            <a href="faq.html">FAQ</a>
                        </li>
                        <li>
                            <a href="../WEB-INF/pages/404.jsp">404</a>
                        </li>
                        <li>
                            <a href="pricing.html">Pricing Table</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>

<!-- Page Content -->
<div class="container">

    <h1>Инвестирование</h1>
    <hr style="margin-top: 10px; margin-bottom: 30px">

    <div class="row">
        <%--Alert message--%>
            <div class="col-md-9 personal-info" style="margin-left: 20%">
                <div class="alert alert-info alert-dismissable" style="width: 80%">
                    <a class="panel-close close" data-dismiss="alert">×</a>
                    <i class="fa fa-coffee"></i>
                    This is an <strong>.alert</strong>. Use this to show important messages to the user.
                </div>
            </div>

        <!-- left column -->
        <div class="col-md-4">
            <div class="panel panel-default" style="border-color: darkgray">
                <div class="panel-heading" style="border-bottom-color: darkgray">
                    <h4>Контактные данные владельца</h4>
                </div>
                <div class="panel-body" style="padding: 3px 15px; font-size: 15px">
                    <div style="border-bottom: #ddd solid 1px; padding: 6px 1px;">${startup.ownerUser.firstName}</div>
                    <div style="border-bottom: #ddd solid 1px; padding: 6px 1px;">${startup.ownerUser.lastName}</div>
                    <div style="border-bottom: #ddd solid 1px; padding: 6px 1px;">${startup.ownerUser.email}</div>
                    <div style="padding: 6px 1px;">${startup.ownerUser.phone}</div>
                </div>
            </div>
        </div>

        <div align="left" style="width: auto; max-width: 66%; display: inline-grid">
            <div class="col-md-4" style="width: auto; min-width: 400px">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4>Стартапы</h4>
                    </div>
                    <div class="panel-body" style="padding: 3px 15px;">
                        <!-- link for startup INFO-->
                        <%--<c:if test="${currentUser.startupList.size()>0}">--%>

                                <div style="padding: 6px 1px; display: table; width: 100%">
                                    <li style="width: auto; float: left; margin-right: 20px;">${startup.startupName}</li>
                                    <span style="width: auto; float: right; margin-right: 20px;">${startup.startupCost}$</span>
                                    <div style="float: left; width: 100%">
                                        <form method="post" action="${contextPath}/investment/confirm">
                                            <input hidden name="startupId" value="${startup.id}">
                                            <input style="width: 60%; border-radius: 4px; border: 1px solid darkgray; height: 30px;" type="number" name="sum" required>
                                            <input style="float: right; height: 30px" class="account_buttons" type="submit" value="Инвестировать" title="Просмотр, редактирование и удаление стартапа">
                                        </form>
                                    </div>
                                </div>

                        <%--</c:if>--%>
                        <!-- link for Adding startup-->
                    </div>
                </div>
            </div>

            <%--<div class="col-md-4" style="width: auto;">--%>
                <%--<div class="panel panel-default" style="border-bottom: none">--%>
                    <%--<div class="panel-heading">--%>
                        <%--<h4>Инвестиции</h4>--%>
                    <%--</div>--%>
                    <%--<div class="panel-body" style="padding: 0px 0px 0px;">--%>
                        <%--<!-- link for startup INFO-->--%>

                        <%--<jsp:useBean id="investments" scope="request" type="java.util.List<com.startup.project.entities.Investment>"/>--%>

                        <%--<table width="100%">--%>
                            <%--<c:if test="${not empty investments}">--%>

                                <%--<tr style="border-bottom: 1px solid #ddd; height: 45px">--%>
                                    <%--<th style="text-align: center; border-right: 1px solid #ddd;">Название</th>--%>
                                    <%--<th style="padding: 0 10px; text-align: center">Сумма вложений</th>--%>
                                <%--</tr>--%>
                                <%--<c:forEach items="${investments}" var="investment">--%>

                                    <%--<tr style="border-bottom: 1px solid #ddd"><td style="padding: 10px 10px 10px 15px; border-right: 1px solid #ddd"><a href="${investment.startupId}" style="color: #333;"><li>${investment.stastupName}--%>
                                        <%--<c:forEach items="${currentUser.startupList}" var="startup">--%>
                                            <%--<c:if test="${investment.startupId==startup.id}"> (your own)</c:if>--%>
                                        <%--</c:forEach>--%>
                                    <%--</li></a></td>--%>
                                        <%--<td style="text-align: center">${investment.sumInvestment}$</td></tr>--%>

                                <%--</c:forEach>--%>

                            <%--</c:if>--%>
                            <%--<c:if test="${empty investments}"><tr><td style="border-bottom: 1px solid #ddd; padding: 11px">У вас нет инвестиций!</td></tr></c:if>--%>
                        <%--</table>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        </div>

    </div>

    <hr style="margin-top: 10px; margin-bottom: 30px">

</div>
<!-- /.container -->
<!-- Footer -->
<footer class="container-fluid">
    <div class="container">
        <div class="row">
            <nav>
                <ul style="padding-left: 0px">
                    <li><a href="index.jsp">HOME</a></li>
                    <li><a href="">EditStartupDetails</a></li>
                    <li><a href="index.jsp">FORUM</a></li>
                    <li><a href="index.jsp">TUTORIALS</a></li>
                    <li><a href="/static/about.html">ABOUT US</a></li>
                    <li><a href="index.jsp">CONTACT</a></li>
                </ul>
            </nav>
        </div>
        <div class="row">
            <div class="col-lg-12 footerClass">
                <p>Final Project TeamOne Website 2017</p>
            </div>
        </div>
    </div>
</footer>

<!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

</body>

</html>


