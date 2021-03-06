<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:useBean id="currentUser" scope="request" type="com.startup.project.entities.User"/>
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
<div class="container">

    <h1>Профиль</h1>
    <hr style="margin-top: 10px; margin-bottom: 30px">

    <div class="row">
        <!-- left column -->
        <div class="col-md-4">
            <div class="panel panel-default" style="border-color: darkgray">
                <div class="panel-heading" style="border-bottom-color: darkgray">
                    <h4>Информация</h4>
                </div>
                <div class="panel-body" style="padding: 3px 15px; font-size: 15px">
                    <div style="border-bottom: #ddd solid 1px; padding: 6px 1px;">${currentUser.firstName}</div>
                    <div style="border-bottom: #ddd solid 1px; padding: 6px 1px;">${currentUser.lastName}</div>
                    <div style="border-bottom: #ddd solid 1px; padding: 6px 1px;">${currentUser.email}</div>
                    <div style="border-bottom: #ddd solid 1px; padding: 6px 1px;">${currentUser.phone}</div>
                    <div style="padding: 6px 1px; width: 50%" align="left">
                        <form action="${contextPath}/account/edit-page" method="POST">
                            <input hidden name="userId" value="${currentUser.id}"/>
                            <input class="account_buttons" type="submit" style="color: black;" value="Редактировать профиль"/>
                        </form>
                    </div>
                    <div style="padding: 6px 1px; float: right; width: 50%" align="right">
                        <form action="${contextPath}/account/delete" method="POST">
                            <input hidden name="userId" value="${currentUser.id}"/>
                            <input class="account_buttons" type="submit" style="color: #f30000;" value="Удалить" />
                        </form>
                    </div>
                    <div style="padding: 6px 1px; float: left; width: 50%" align="left">
                            <form action="${contextPath}/account/edit-password" method="POST">
                                <input hidden name="userId" value="${currentUser.id}"/>
                                <input class="account_buttons" type="submit" style="color: black;" value="Изменить пароль!"/>
                            </form>
                    </div>
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
                    <c:if test="${currentUser.startupList.size()>0}">
                          <c:forEach items="${currentUser.startupList}" var="startup">
                              <div  style="border-bottom: #ddd solid 1px; padding: 6px 1px; display: table; width: 100%">
                                  <div style="width: auto; max-width: 83%; float: left;">
                                      <a class="account_a" href="${contextPath}/startup_description/${startup.id}" style="color: #000000;">
                                      <li style="width: auto; float: left; margin-right: 20px; margin-top: 3px;">${startup.startupName}</li>
                                      </a>
                                  </div>
                                  <div style="float: right;">
                                  <form method="post" action="/edit_startup/update_page" style="float: left">
                                      <input hidden="" name="id" value="${startup.id}">
                                      <input class="account_buttons" type="submit" value="Редактировать" title="Просмотр, редактирование и удаление стартапа">
                                  </form>
                                      <a class="statistic_button" style="color: black; text-align: center; float: left" href="${contextPath}/startup_description/${startup.id}/investors">
                                          <div class="account_buttons" style="width:auto; height: auto; margin-left: 5px">Статистика</div>
                                      </a>
                                  </div>
                              </div>
                        </c:forEach>
                    </c:if>
                   <!-- link for Adding startup-->
                    <div style="padding: 6px 1px; width: auto"><a class="account_buttons" href="${contextPath}/add_startup" style="color: black; float: right;">Добавить стартап</a></div>
                </div>
            </div>
        </div>

        <div class="col-md-4" style="width: auto;">
            <div class="panel panel-default" style="border-bottom: none">
                <div class="panel-heading">
                    <h4>Инвестиции</h4>
                </div>
                <div class="panel-body" style="padding: 0px 0px 0px;">
                    <!-- link for startup INFO-->

                    <jsp:useBean id="investments" scope="request" type="java.util.List<com.startup.project.entities.wrappers.Investment>"/>

                    <table width="100%">
                    <c:if test="${not empty investments}">

                            <tr style="border-bottom: 1px solid #ddd; height: 43px">
                            <th style="text-align: center; border-right: 1px solid #ddd;">Название</th>
                            <th style="padding: 0 10px; text-align: center">Сумма вложений</th>
                        </tr>
                        <c:forEach items="${investments}" var="investment">

                            <tr style="border-bottom: 1px solid #ddd"><td style="padding: 10px 10px 10px 15px; border-right: 1px solid #ddd">
                                <a href="${contextPath}/startup_description/${investment.startupId}" style="color: #333;">
                                    <li>${investment.startupName}
                                <%--<c:forEach items="${currentUser.startupList}" var="startup">--%>
                                    <%--<c:if test="${investment.startupId==startup.id}"> (you owner)</c:if>--%>
                                <%--</c:forEach>--%>
                            </li>
                                </a></td>
                                <td style="text-align: center">${investment.sumInvestment}$</td></tr>

                        </c:forEach>

                    </c:if>
                    <c:if test="${empty investments}"><tr><td style="border-bottom: 1px solid #ddd; padding: 11px">У вас нет инвестиций!</td></tr></c:if>
                        </table>
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
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

</body>

</html>

