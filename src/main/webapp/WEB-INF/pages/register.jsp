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

    <title>Modern Business - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="../../static/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../../static/css/modern-business.css" rel="stylesheet">

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
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
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
                    <a href="../../static/about.html">About</a>
                </li>
                <li>
                    <a href="../../static/services.html">Services</a>
                </li>
                <li>
                    <a href="../../static/contact.html">Contact</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Portfolio <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="../../static/portfolio-1-col.html">1 Column Portfolio</a>
                        </li>
                        <li>
                            <a href="../../static/portfolio-2-col.html">2 Column Portfolio</a>
                        </li>
                        <li>
                            <a href="../../static/portfolio-3-col.html">3 Column Portfolio</a>
                        </li>
                        <li>
                            <a href="../../static/portfolio-4-col.html">4 Column Portfolio</a>
                        </li>
                        <li>
                            <a href="../../static/portfolio-item.html">Single Portfolio Item</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="../../static/blog-home-1.html">Blog Home 1</a>
                        </li>
                        <li>
                            <a href="../../static/blog-home-2.html">Blog Home 2</a>
                        </li>
                        <li>
                            <a href="../../static/blog-post.html">Blog Post</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Other Pages <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="../../static/full-width.html">Full Width Page</a>
                        </li>
                        <li>
                            <a href="../../static/sidebar.html">Sidebar Page</a>
                        </li>
                        <li>
                            <a href="../../static/faq.html">FAQ</a>
                        </li>
                        <li>
                            <a href="../../static/404.html">404</a>
                        </li>
                        <li>
                            <a href="../../static/pricing.html">Pricing Table</a>
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

    <!-- Page Heading/Breadcrumbs -->
    <h2>Регистрация</h2>
    <form:form action="/registration" method="POST" modelAttribute="userFormRegist" class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-xs-3" for="firstName">Имя:</label>
            <div class="col-xs-9">
                <spring:bind path="firstName">
                    <form:input type="text" class="form-control" id="firstName" placeholder="Введите имя" path="firstName"/>
                </spring:bind>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="lastName">Фамилия:</label>
            <div class="col-xs-9">
                <spring:bind path="lastName">
                    <form:input type="text" class="form-control" id="lastName" placeholder="Введите фамилию" path="lastName"/>
                </spring:bind>
            </div>
        </div>
        <span style="margin-left:22%; font: 13px Arial; color: red; position: absolute; margin-top: -16px"><form:errors path="email"></form:errors></span>
        <div class="form-group">
            <label class="control-label col-xs-3" for="inputEmail">Email:</label>
            <div class="col-xs-9">
                <spring:bind path="email">
                <form:input type="email" class="form-control" id="inputEmail" placeholder="Email" path="email" required="required"/>
                </spring:bind>
            </div>
        </div>
        <span style="margin-left:22%; font: 13px Arial; color: red; position: absolute; margin-top: -16px"><form:errors path="password" ></form:errors></span>
        <div class="form-group">
            <label class="control-label col-xs-3" for="inputPassword">Пароль:</label>
            <div class="col-xs-9">
                <spring:bind path="password">
                <form:input type="password"  cssClass="form-control" id="inputPassword" placeholder="Введите пароль" path="password" required="required"/>
                </spring:bind>
            </div>
        </div>
        <span style="margin-left:22%; font: 13px Arial; color: red; position: absolute; margin-top: -16px"><form:errors path="confirmPassword"></form:errors></span>
        <div class="form-group">
            <label class="control-label col-xs-3" for="confirmPassword">Подтвердите пароль:</label>
            <div class="col-xs-9">
                <spring:bind path="confirmPassword">
                <form:input type="password" cssClass="form-control" id="confirmPassword" placeholder="Введите пароль ещё раз" path="confirmPassword" required="required"/>
                </spring:bind>
            </div>
        </div>
        <span style="margin-left:22%; font: 13px Arial; color: red; position: absolute; margin-top: -16px"><form:errors path="phone" ></form:errors></span>
        <div class="form-group">
            <label class="control-label col-xs-3" for="phoneNumber">Телефон:</label>
            <div class="col-xs-9">
                <spring:bind path="phone">
                <form:input type="text" cssClass="form-control" id="phoneNumber" maxlength="13"  placeholder="+38(ХХХ) ХХХ-ХХ-ХХ" path="phone" required="required"/>
                </spring:bind>
            </div>
        </div>




        <br/>
        <div class="form-group">
            <div class="col-xs-offset-3 col-xs-9">
                <input  type="submit"  Class="btn btn-default" value="Регистрация"/>
                <input type="reset" Class="btn btn-primary" value="Очистить форму"/>
            </div>
        </div>
    </form:form>
    <!-- /.row -->

    <hr>

    <!-- Footer -->
    <footer>
        <div class="row">
            <div class="col-lg-12">
                <p>Final Project TeamOne Website 2017</p>
            </div>
        </div>
    </footer>

</div>
<!-- /.container -->

<!-- jQuery -->
<script src="../../static/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../../static/js/bootstrap.min.js"></script>

</body>

</html>
