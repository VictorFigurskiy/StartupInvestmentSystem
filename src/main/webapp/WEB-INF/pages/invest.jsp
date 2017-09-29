<%@ page import="com.startup.project.entities.Investor" %><%--
  Created by IntelliJ IDEA.
  User: serhii
  Date: 26.09.2017
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
                <sec:authorize access="hasAnyRole('USER','OWNER','ADMIN')">
                    <li class="active">
                        <a href="${contextPath}/account">Личный кабинет</a>
                    </li>
                </sec:authorize>
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
<div class="container">

    <h1>Инвестирование</h1>
    <hr style="margin-top: 10px; margin-bottom: 30px">

    <div class="row">
        <%--Alert message--%>

                <div class="alert alert-info alert-dismissable" style="width: 70%; margin-left: 15%">
                    <a class="panel-close close" data-dismiss="alert" style="margin-top: 11px">×</a>
                    <i class="fa fa-info" style="margin-right: 5px;"></i><strong>Внимание!</strong>
                    <i>Инвестируя даный проект Вы соглашаетесь с правилами работы нашего сервиса и обязуетесь выплатить заявленую Вами сумму владельцу данного проекта!</i>
                </div>

        <!-- left column -->
        <div class="col-md-4">
            <div class="panel panel-default" style="border-color: darkgray">
                <div class="panel-heading" style="border-bottom-color: darkgray">
                    <h4>Контактные данные владельца</h4>
                </div>
                <div class="panel-body" style="padding: 3px 15px; font-size: 15px">
                    <div style="border-bottom: #ddd solid 1px; padding: 6px 1px;"><strong style="margin-right: 5px">Имя:</strong>${startup.ownerUser.firstName}</div>
                    <div style="border-bottom: #ddd solid 1px; padding: 6px 1px;"><strong style="margin-right: 5px">Фамилия:</strong>${startup.ownerUser.lastName}</div>
                    <div style="border-bottom: #ddd solid 1px; padding: 6px 1px;"><strong style="margin-right: 5px">Email:</strong>${startup.ownerUser.email}</div>
                    <div style="padding: 6px 1px;"><strong style="margin-right: 5px">Телефон:</strong>${startup.ownerUser.phone}</div>
                </div>
            </div>
        </div>

        <div style="width: 65%; display: block; border: 1px solid darkgray; border-radius: 5px; padding: 15px; float: left">

        <div style="width: 100%">
            <div style="width:auto">
                <h4 style="width: 80%; float: left;">${startup.startupName}</h4>
            </div>
            <div style="float: right;">
                <h4 style="float: left"><b style="width: auto; float: right;">${startup.startupCost.intValue()}$</b></h4></div>
            </div>

            <div class="panel-body" style="padding: 0px 0px;">
                                <div style="padding: 6px 1px; display: table; width: 100%">
                                    <div style="float: left; width: 100%">
                                        <form method="post" action="${contextPath}/investment/confirm">
                                            <input hidden name="startupId" value="${startup.id}">
                                            <input style="width: 60%; height: 30px; border-radius: 4px; border: 1px solid darkgray; padding-left: 5px; margin-bottom: 15px" type="number" name="sum" min="100" max="9999999999" step="100" value="100"  required>
                                            <input style="float: right; height: 30px" class="confirm_invest_button" type="submit" value="Инвестировать" title="Инвестировать">
                                            <span style="display: block; display: block; padding: 3px; border: 1px solid #bce8f1; border-radius: 5px; background: #d9edf7;">
                                                <input type="checkbox" required="" style="margin: 4px 10px; float: left; ">
                                            Я принимаю условия работы сервиса.
                                            </span>
                                        </form>
                                    </div>
                                </div>
                    </div>
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


