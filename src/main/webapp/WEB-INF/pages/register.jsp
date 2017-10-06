<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="../../static/image/icon.png" rel="shortcut icon">
    <title>Форма регистрации</title>

    <!-- Bootstrap Core CSS -->
    <link href="../../static/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../../static/css/modern-business.css" rel="stylesheet">
    <link href="../../static/css/footerStyle.css" rel="stylesheet">

    <%-- Custom js --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="../../static/js/clear_regist_form.js"></script>

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
<div class="container" style="padding-left: 15%">

    <!-- Page Heading/Breadcrumbs -->
    <h2>Регистрация</h2>
    <form:form action="/registration" method="POST" modelAttribute="userFormRegist" class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-xs-3" for="firstName">Имя:</label>
            <div class="col-xs-9">
                <spring:bind path="firstName">
                    <input type="text" class="form-control res_inp_js" id="firstName" placeholder="Введите имя" pattern="^[A-Za-zА-Яа-яЁё]+$" title="Только символы латиницы и кирилицы без пробелов!" name="firstName" path="firstName" value="${userFormRegist.firstName}"/>
                </spring:bind>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="lastName">Фамилия:</label>
            <div class="col-xs-9">
                <spring:bind path="lastName">
                    <input type="text" class="form-control res_inp_js" id="lastName" placeholder="Введите фамилию" pattern="^[A-Za-zА-Яа-яЁё]+$" title="Только символы латиницы и кирилицы без пробелов!" name="lastName" path="lastName" value="${userFormRegist.lastName}"/>
                </spring:bind>
            </div>
        </div>
        <span style="margin-left:18%; font: 13px Arial; color: red; position: absolute; margin-top: -16px"><form:errors path="email"></form:errors></span>
        <div class="form-group">
            <label class="control-label col-xs-3" for="inputEmail">Email:</label>
            <div class="col-xs-9">
                <spring:bind path="email">
                <input type="email" class="form-control res_inp_js" id="inputEmail" placeholder="Email" name="email" path="email" required="required" value="${userFormRegist.email}"/>
                </spring:bind>
            </div>
        </div>
        <span style="margin-left:18%; font: 13px Arial; color: red; position: absolute; margin-top: -16px"><form:errors path="password" ></form:errors></span>
        <div class="form-group">
            <label class="control-label col-xs-3" for="inputPassword">Пароль:</label>
            <div class="col-xs-9">
                <spring:bind path="password">
                <input type="password"  class="form-control res_inp_js" id="inputPassword" placeholder="Введите пароль" name="password" path="password" required="required" value="${userFormRegist.password}"/>
                </spring:bind>
            </div>
        </div>
        <span style="margin-left:18%; font: 13px Arial; color: red; position: absolute; margin-top: -16px"><form:errors path="confirmPassword"></form:errors></span>
        <div class="form-group">
            <label class="control-label col-xs-3" for="confirmPassword">Подтвердите пароль:</label>
            <div class="col-xs-9">
                <spring:bind path="confirmPassword">
                <input type="password" class="form-control res_inp_js" id="confirmPassword" placeholder="Введите пароль ещё раз" name="confirmPassword" path="confirmPassword" required="required" value="${userFormRegist.confirmPassword}"/>
                </spring:bind>
            </div>
        </div>
        <span style="margin-left:18%; font: 13px Arial; color: red; position: absolute; margin-top: -16px"><form:errors path="phone" ></form:errors></span>
        <div class="form-group">
            <label class="control-label col-xs-3" for="phoneNumber">Телефон:</label>
            <div class="col-xs-9">
                <spring:bind path="phone">
                <input type="text" class="form-control res_inp_js" id="phoneNumber" maxlength="13" placeholder="+38(ХХХ) ХХХ-ХХ-ХХ" name="phone" path="phone" required="required" value="${userFormRegist.phone}"/>
                </spring:bind>
            </div>
        </div>




        <br/>
        <div class="form-group" style="margin-top: -15px">
            <div class="col-xs-offset-3 col-xs-9">
                <input type="submit" style="margin-right: 33px" Class="btn btn-primary" value="Регистрация"/>
                <input id="reset" type="button" Class="btn btn-default" value="Очистить форму"/>
            </div>
        </div>
    </form:form>
    <!-- /.row -->

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
