<%--
  Created by IntelliJ IDEA.
  User: nonal
  Date: 22.09.2017
  Time: 23:25
  To change this template use File | Settings | File Templates.
--%>
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
            <a class="navbar-brand" href="/account">Вернуться в личный кабинет</a>
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
                            <a href="single_startup_description.jsp">Single Portfolio Item</a>
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
    <h2>Регистрация нового стартапа</h2>
    <form:form action="/add_startup" method="POST" modelAttribute="startupReg" class="form-horizontal">
        <label class="control-label col-xs-3" for="imageLink">Изображение:</label>
        <spring:bind path="imageLink">
        <form:input type="file" class="form-control" id="imageLink" placeholder="Введите название проекта"
                     path="imageLink"/>
        </spring:bind>


        <div class=" form-group">
            <label class="control-label col-xs-3" for="startupName">Название:</label>
            <div class="col-xs-9">
                <spring:bind path="startupName">
                    <form:input type="text" class="form-control" id="startupName" placeholder="Введите название проекта"
                                path="startupName"/>
                </spring:bind>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="description">Описание:</label>
            <div class="col-xs-9">
                <spring:bind path="description">
                    <form:input type="text" class="form-control" id="description"
                                placeholder="Введите краткое описание проекта" path="description"/>
                </spring:bind>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="idea">Идея:</label>
            <div class="col-xs-9">
                <spring:bind path="idea">
                    <form:input type="text" class="form-control" id="idea" placeholder="Введите главную идею проекта"
                                path="idea"/>
                </spring:bind>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="industry">Отрасль:</label>
            <div class="col-xs-9">
                <spring:bind path="industry">
                    <form:input type="text" class="form-control" id="industry"
                                placeholder="Введите отрасль, в которой работает Ваш проект " path="industry"/>
                </spring:bind>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="country">Страна:</label>
            <div class="col-xs-9">
                <spring:bind path="country">
                    <form:input type="text" class="form-control" id="country"
                                placeholder="Введите страну, в которой работает Ваш проект " path="country"/>
                </spring:bind>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3">Стадия:</label>
            <div class="col-xs-9">

                <select name="projectStage">
                    <option value="Есть идея или наработки">Есть идея или наработки</option>
                    <option value="Готов прототип или продукт">Готов прототип или продукт</option>
                    <option value="Действующий бизнес">Действующий бизнес</option>
                </select>
            </div>
        </div>


        <div class="form-group">
            <label class="control-label col-xs-3" for="country">Стоимость:</label>
            <div class="col-xs-9">
                <spring:bind path="startupCost">
                    <form:input type="text" class="form-control" id="startupCost"
                                placeholder="Введите стоимость Вашего проекта " path="startupCost"/>
                </spring:bind>
            </div>
        </div>
<<<<<<< Updated upstream


        <br/>
        <div class="form-group">
            <div class="col-xs-offset-3 col-xs-9">
                <input type="submit" Class="btn btn-primary" value="Зарегистрировать проект"/>
                <input type="reset" Class="btn btn-danger" value="Очистить введенные данные"/>
=======
        <div class="row">
            <div class="col-lg-12 footerClass" >
                <p>Final Project TeamOne Website 2017</p>
>>>>>>> Stashed changes
            </div>
        </div>
        </form:form>
        <!-- /.row -->

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
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
