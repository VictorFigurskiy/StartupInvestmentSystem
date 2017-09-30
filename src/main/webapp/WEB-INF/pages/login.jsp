<%--
  Created by IntelliJ IDEA.
  User: Sonikb
  Date: 23.08.2017
  Time: 18:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href="../../static/image/icon.png" rel="shortcut icon">
    <title>Форма логирования</title>

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
<body style="background:whitesmoke">

<!-- Navigation -->
<nav class="navbar" role="navigation">
    <div class="container header_menu">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">На главную</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="active">
                    <a class="no_padding_left" href="../../static/team.html">Наша команда</a>
                </li>
                <li>
                    <a href="../../static/about.html">Больше о проекте</a>
                </li>
                <li>
                    <a href="../../static/contact.html">Контакты</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>

<jsp:useBean id="errorLogin" scope="request" type="java.lang.String"/>
<!-- Page Content -->
<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <c:url value="/j_spring_security_check" var="loginUrl"/>
    <h2 align="center">Пожалуйста введите данные для входа:</h2>
    <form class="form-horizontal" action="${loginUrl}" method="post">
        <div class="form-group">
            <label class="control-label col-xs-3" for="email">Введите ваш Email:</label>
            <div class="col-xs-9">
                <input type="email" name="j_username" class="form-control" maxlength="32" id="email" placeholder="Email address" required autofocus>
            </div>
        </div>
        <c:if test="${!empty errorLogin}">
            <span style="margin-left:14%; font: 15px Arial; color: red; position: absolute; margin-top: 43px"><c:out value="${errorLogin.toString()}"/></span>
        </c:if>
        <div class="form-group">
            <label class="control-label col-xs-3" for="password">Введите ваш пароль:</label>
            <div class="col-xs-9">
                <input type="password" name="j_password" class="form-control" maxlength="50" id="password" placeholder="Password" required autofocus>
            </div>
        </div>

        <div class="form-group">
            <div class="col-xs-offset-3 col-xs-9">
                <input type="submit" class="btn btn-primary" value="Войти">
                <input type="reset" class="btn btn-default" value="Очистить форму">
            </div>
        </div>
    </form>
    <hr>

</div>
<!-- /.container -->

<!-- Footer -->
<footer class="container-fluid">
    <div class="container">
        <div class="row">
            <nav>
                <ul style="padding-left: 0px">
                    <li><a href="../../static/team.html">НАША КОМАНДА</a></li>
                    <li><a href="../../static/about.html">БОЛЬШЕ О ПРОЕКТЕ</a></li>
                    <li><a href="../../static/contact.html">КОНТАКТЫ</a></li>
                </ul>
            </nav>
        </div>
        <div class="row">
            <div class="col-lg-12 footerClass" >
                <p>Final Project TeamOne Website 2017</p>
            </div>
        </div>
    </div>
</footer>


<!-- jQuery -->
<script src="../../static/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../../static/js/bootstrap.min.js"></script>

</body>

</html>
