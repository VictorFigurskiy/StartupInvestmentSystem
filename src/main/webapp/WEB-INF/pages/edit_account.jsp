<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Startup Ukraine</title>

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

	<h1>Редактирование профиля</h1>
        <hr style="margin-top: 10px; margin-bottom: 30px">
	<div class="row">

        <jsp:useBean id="userForEdit" scope="request" type="com.startup.project.entities.User"/>
        <c:set var="contextPath" value="${pageContext.request.contextPath}"/>

      <!-- edit form column -->
      <div class="col-md-9 personal-info" style="margin-left: 20%">
        <div class="alert alert-info alert-dismissable" style="width: 80%">
          <a class="panel-close close" data-dismiss="alert">×</a> 
          <i class="fa fa-coffee"></i>
          This is an <strong>.alert</strong>. Use this to show important messages to the user.
        </div>
        <h3 style="margin-top: 0">Ваши даные</h3>
        
        <form:form class="form-horizontal" modelAttribute="userForEdit" action="${contextPath}/account/edit" method="post">
            <%--Id--%>
            <div hidden><form:input value="${userForEdit.id}" type="number" path="id"/></div>
            <%--Id--%>

            <div style="display: block; width: auto; height: auto;" align="center">
                <span style="margin-right:19%; font: 13px Arial; color: red; position: relative; margin-top: -16px; width: 100%"><form:errors path="firstName"></form:errors></span>
            </div>
            <div class="form-group" style="margin-bottom: 0px">
            <label class="col-lg-3 control-label">Имя:</label>
            <div class="col-lg-8">
                <form:input class="form-control" cssStyle="width: 50%" value="${userForEdit.firstName}" type="text" path="firstName"/>
            </div>
          </div>

          <div style="display: block; width: auto; height: auto;" align="center">
              <span style="margin-right:19%; font: 13px Arial; color: red; position: relative; margin-top: -16px; width: 100%"><form:errors path="lastName"></form:errors></span>
          </div>
          <div class="form-group" style="margin-bottom: 0px">
            <label class="col-lg-3 control-label">Фамилия:</label>
            <div class="col-lg-8">
              <form:input class="form-control" cssStyle="width: 50%" value="${userForEdit.lastName}" type="text" path="lastName"/>
            </div>
          </div>
            <%--Prev email--%>
            <div hidden><form:input value="${userForEdit.email}" type="text" path="previousEmail"/></div>
            <%--Prev email--%>

          <div style="display: block; width: auto; height: auto;" align="center">
              <span style="margin-right:19%; font: 13px Arial; color: red; position: relative; margin-top: -16px; width: 100%"><form:errors path="email"></form:errors></span>
          </div>
          <div class="form-group" style="margin-bottom: 0px">
            <label class="col-lg-3 control-label">Email:</label>
            <div class="col-lg-8">
              <form:input class="form-control" cssStyle="width: 50%" value="${userForEdit.email}" type="email" path="email"/>
            </div>
          </div>

            <div style="display: block; width: auto; height: auto;" align="center">
                <span style="margin-right:19%; font: 13px Arial; color: red; position: relative; margin-top: -16px; width: 100%"><form:errors path="phone"></form:errors></span>
            </div>
            <div class="form-group" style="margin-bottom: 0px">
                <label class="col-lg-3 control-label">Телефон:</label>
                <div class="col-lg-8">
                    <form:input class="form-control" cssStyle="width: 50%" value="${userForEdit.phone}" maxlength="13" type="text" path="phone" />
                </div>
            </div>

          <div style="display: block; width: auto; height: auto;" align="center">
              <span style="margin-right:19%; font: 13px Arial; color: red; position: relative; margin-top: -16px; width: 100%"><form:errors path="password"></form:errors></span>
          </div>
          <div class="form-group" style="margin-bottom: 0px">
            <label class="col-lg-3 control-label">Пароль:</label>
            <div class="col-lg-8">
              <form:input class="form-control" cssStyle="width: 50%" value="${userForEdit.password}" type="password" path="password"/>
            </div>
          </div>

            <div style="display: block; width: auto; height: auto;" align="center">
                <span style="margin-right:19%; font: 13px Arial; color: red; position: relative; margin-top: -16px; width: 100%"><form:errors path="confirmPassword"></form:errors></span>
            </div>
            <div class="form-group" style="margin-bottom: 0px">
                <label class="col-lg-3 control-label">Подтверждение пароля:</label>
                <div class="col-lg-8">
                    <form:input class="form-control" cssStyle="width: 50%" value="${userForEdit.password}" type="password" path="confirmPassword"/>
                </div>
            </div>

          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input class="btn btn-primary" value="Сохранить изменения" type="submit"/>
              <span></span>
              <input class="btn btn-default" value="Очистить форму" type="reset"/>
            </div>
          </div>
        </form:form>
      </div>
  </div>
        <!-- /.row -->

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

