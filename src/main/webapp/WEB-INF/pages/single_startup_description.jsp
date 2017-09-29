<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">

<head>

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
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!-- Navigation -->
<nav class="navbar" role="navigation">
    <div class="container header_menu">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header main-page-button">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${contextPath}/">На главную</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <sec:authorize access="hasAnyRole('USER','OWNER','ADMIN')">
                    <li>
                        <a href="${contextPath}/account">Личный кабинет</a>
                    </li>
                </sec:authorize>
                <li>
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

<jsp:useBean id="startup" scope="request" type="com.startup.project.entities.Startup"/>
<jsp:useBean id="startupDetail" scope="request" type="com.startup.project.entities.StartupDetail"/>
<jsp:useBean id="investmentsSum" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="similarStartup" scope="request" type="java.util.List<com.startup.project.entities.Startup>"/>

<!-- Page Content -->
<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"><c:out value="${startup.startupName}"/>
                <%--<small>Subheading</small>--%>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${contextPath}/" style="color: #353535;">Назад</a>
                </li>
                <li class="active"><c:out value="${startup.startupName}"/></li>
                <%--<li class="active"> Сумма вложенная в стартап: ${investmentsSum}</li>--%>
                <%--<li class="active"> Минимальная необходимая сумма: ${startup.startupCost}</li>--%>
                <li class="active"></li>
            </ol>
        </div>
    </div>
    <!-- /.row -->

    <!-- Portfolio Item Row -->
    <div class="row">
        <div class="col-md-8">
            <img class="img-responsive" src="${startup.imageLink}" alt="">
        </div>

        <div class="col-md-4">


            <div>
                <form method="post" action="${contextPath}/investment">
                    <input type="hidden" name="startup_id" value="${startup.id}">
                    <div style="margin-bottom: -14px;">
                        <input class="btn btn-primary" type="submit" value="Инвестировать в стартап" style="width: 359px; height: 52px; font-size: x-large; background: #4F9EE1;">
                    </div>
                    <div class="panel-heading" style="height: 32px; margin-bottom: 9px;">
                        <h3>Необходимо: ${startup.startupCost.intValue()}$</h3>
                    </div>
                    <div class="panel-heading" style="height: 60px;">
                        <h3>Уже собрано: ${investmentsSum}$</h3>
                    </div>
                </form>
            </div>

            <hr>

            <h3>Описание стартапа</h3>
            <p>${startup.description}</p>
        </div>

    </div>
    <!-- /.row -->

    <hr>

    <!-- Service Tabs -->
    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header">Описание стартапа</h2>
        </div>
        <div class="col-lg-12">

            <ul id="myTab" class="nav nav-tabs nav-justified">
                <li class="active"><a href="#service-one" data-toggle="tab" style="color: #353535;"><i
                        class="fa fa-tree"></i> Идея стартапа:</a>
                </li>
                <li class=""><a href="#service-two" data-toggle="tab" style="color: #353535;"><i
                        class="fa fa-car"></i> Текущее состояние:</a>
                </li>
                <li class=""><a href="#service-three" data-toggle="tab" style="color: #353535;"><i
                        class="fa fa-support"></i> Проблема или Возможность:</a>
                </li>
                <li class=""><a href="#service-four" data-toggle="tab" style="color: #353535;"><i
                        class="fa fa-database"></i> Конкуренты:</a>
                </li>
                <li class=""><a href="#service-five" data-toggle="tab" style="color: #353535;"><i
                        class="fa fa-android"></i> Имущество и активы:</a>
                </li>
            </ul>

            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade active in" id="service-one">
                    <h4>Идея стартапа:</h4>
                    <p>${startup.idea}</p>
                </div>
                <div class="tab-pane fade" id="service-two">
                    <h4>Текущее состояние:</h4>
                    <p>${startupDetail.currentState}</p>
                </div>
                <div class="tab-pane fade" id="service-three">
                    <h4>Проблема или Возможность:</h4>
                    <p>${startupDetail.problemOrOpportunity}</p>
                </div>
                <div class="tab-pane fade" id="service-four">
                    <h4>Конкуренты:</h4>
                    <p>${startupDetail.competitors}</p>
                </div>
                <div class="tab-pane fade" id="service-five">
                    <h4>Имущество и активы:</h4>
                    <p>${startupDetail.property}</p>
                </div>
            </div>

        </div>
    </div>


    <hr>

    <!-- Content Row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseOne">Годовой объем продаж, $</a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse">
                        <div class="panel-body">
                            ${startupDetail.grossProfit}
                        </div>
                    </div>
                </div>
                <!-- /.panel -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseTwo">Годовой объем чистой прибыли, $</a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse">
                        <div class="panel-body">
                            ${startupDetail.netIncome}
                        </div>
                    </div>
                </div>
                <!-- /.panel -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseThree">Тип имущества:</a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse">
                        <div class="panel-body">
                            ${startupDetail.typeOfProperty}
                        </div>
                    </div>
                </div>
                <!-- /.panel -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseFour">Отрасль промышленности:</a>
                        </h4>
                    </div>
                    <div id="collapseFour" class="panel-collapse collapse">
                        <div class="panel-body">
                            ${startup.industry}
                        </div>
                    </div>
                </div>
                <!-- /.panel -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseFive">Стадия проекта:</a>
                        </h4>
                    </div>
                    <div id="collapseFive" class="panel-collapse collapse">
                        <div class="panel-body">
                            ${startup.projectStage}
                        </div>
                    </div>
                </div>
                <!-- /.panel -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseSix">Бизнес-модель:</a>
                        </h4>
                    </div>
                    <div id="collapseSix" class="panel-collapse collapse">
                        <div class="panel-body">
                            ${startupDetail.businessModel}
                        </div>
                    </div>
                </div>
                <!-- /.panel -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">Страна:</a>
                        </h4>
                    </div>
                    <div id="collapseSeven" class="panel-collapse collapse">
                        <div class="panel-body">
                            ${startup.country}
                        </div>
                    </div>
                </div>
                <!-- /.panel-group -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>

    <div style= "width: 100%; color:black; border-top:2px solid #4b4b4b; padding: 10px; margin-top: 10px; display: inline-block">
        <span style="display: block"><h2 style="margin: 20px">Похожие проекты:</h2></span>
        <c:forEach items="${similarStartup}" var="s_startup">
            <div  class="additional_startups" style="display: block; background: #e8ecec; width: 20%; float: left; height: 250px; border-radius: 5px; margin: 0 2%; font-size: 13px; border: 1px solid #e0e0e0;">
                <a style="color: #1b6d85" href="${contextPath}/startup_description/${s_startup.id}">
                    <div style="width: 100%; height: 100%">
                        <img style="border-top-left-radius: 5px; border-top-right-radius: 5px;" src="${s_startup.imageLink}" height="60%" width="100%">
                        <p style="text-align: center; margin: 5px">${s_startup.startupName}</p>
                    </div>
                    <p style="text-align: center; font-size: 18px; bottom: 25px; position: relative">${s_startup.startupCost.intValue()}$</p>
                </a>
            </div>
        </c:forEach>
    </div>
        <!-- /.row -->

        <hr>

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

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="../../static/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../../static/js/bootstrap.min.js"></script>

</body>

</html>