<jsp:useBean id="startup" scope="request" type="com.startup.project.entities.Startup"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: serhii
  Date: 17.10.2017
  Time: 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Статистика проекта</title>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href="../../static/image/icon.png" rel="shortcut icon">
    <title>Личный кабинет</title>

    <!-- Bootstrap Core CSS -->
    <link href="../../static/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../../static/css/modern-business.css" rel="stylesheet">
    <link href="../../static/css/footerStyle.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../../static/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="../../static/css/footerStyle.css" rel="stylesheet" type="text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

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

<!-- Page Content -->
<jsp:useBean id="investorsIdSum" scope="request" type="java.util.Map<java.lang.Integer,java.lang.Integer>"/>
<div class="container">

    <h1><a style="color: #aaaaaa" href="${contextPath}/account">Назад </a>/ Статистика проекта: ${startup.startupName}</h1>
    <hr style="margin-top: 10px; margin-bottom: 30px">

    <div class="row">
        <!-- left column -->
        <c:if test="${empty uniqueUsers}"><h2>Этот проект еще никто не проинвестировал!</h2></c:if>
        <c:if test="${!empty uniqueUsers}">
        <div class="col-md-4" style="width: auto; border: none">
            <div class="panel panel-default" style="border: none">
                <div class="panel-heading" style="border: darkgray solid 1px;">
                    <h4>Инвесторы</h4>
                </div>
                <div class="panel-body" style="padding: 0px 0px; font-size: 15px; border: darkgray solid 1px; border-top: none; border-bottom-left-radius: 3px; border-bottom-right-radius: 3px;">
                    <table class="table_investors_det" style="border-bottom-left-radius: 5px; border-bottom-right-radius: 5px">
                        <tr>
                            <th style="border-right: darkgray solid 1px;">Имя</th>
                            <th style="border-right: darkgray solid 1px;">Фамилия</th>
                            <th style="border-right: darkgray solid 1px;">Email</th>
                            <th style="border-right: darkgray solid 1px;" >Телефон</th>
                            <th>Cумма вложений</th>
                        </tr>
                    <c:forEach items="${uniqueUsers}" var="user">


                        <tr style="padding: 5px ">
                            <td style="border-right: darkgray solid 1px;">${user.firstName}</td>
                            <td style="border-right: darkgray solid 1px;">${user.lastName}</td>
                            <td style="border-right: darkgray solid 1px;">${user.email}</td>
                            <td style="border-right: darkgray solid 1px;">${user.phone}</td>
                            <td>${investorsIdSum.get(user.id)}$</td>
                        </tr>
                    </c:forEach>
                        <tr>
                            <td colspan="3" style="border-top:darkgray solid 1px; text-align: left;">Стоимость проекта: ${startup.startupCost.intValue()}$</td>
                            <td colspan="2" style="border-top:darkgray solid 1px; text-align: right;">Cобрано: ${totalSum}$</td>
                        </tr>
                    </table>

                </div>
            </div>
        </div>
        </c:if>
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
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

</body>
</html>
