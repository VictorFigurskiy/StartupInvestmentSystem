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
                            <a href="portfolio-item.html">Single Portfolio Item</a>
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

    <h1>Profile</h1>
    <hr>

    <div class="row">
        <!-- left column -->
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Personal info</h4>
                </div>
                <div class="panel-body" style="padding: 3px 15px;">
                    <div style="border-bottom: #ddd solid 1px; padding: 6px 1px;">${currentUser.firstName}</div>
                    <div style="border-bottom: #ddd solid 1px; padding: 6px 1px;">${currentUser.lastName}</div>
                    <div style="border-bottom: #ddd solid 1px; padding: 6px 1px;">${currentUser.email}</div>
                    <div style="border-bottom: #ddd solid 1px; padding: 6px 1px;">${currentUser.phone}</div>
                    <div style="padding: 6px 1px; float: left; width: 50%" align="left"><a href="${contextPath}/account/edit/${currentUser.id}"
                        style="color: black;">Edit</a></div>
                    <div style="padding: 6px 1px; float: left; width: 50%" align="right"><a href="${contextPath}/account/delete/${currentUser.id}"
                                                                                style="color: red">Delete</a></div>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Startups</h4>
                </div>
                <div class="panel-body" style="padding: 3px 15px;">
                    <!-- link for startup INFO-->
                    <c:if test="${currentUser.startupList.size()>0}">
                        <c:forEach items="${currentUser.startupList}" var="startup">
                            <div style="border-bottom: #ddd solid 1px; padding: 6px 1px;"><li><a href="${startup.id}" style="color: #333">${startup.startupName}</a></li></div>
                        </c:forEach>
                    </c:if>
                   <!-- link for Adding startup-->
                    <div style="padding: 6px 1px;" align="right"><a href="${contextPath}/add_startup" style="color: black;">+ Add startup</a></div>
                    <div style="padding: 6px 1px;" align="right"><a href="${contextPath}/edit_startup" style="color: black;">+ Edit startup details</a></div>
                    <div style="padding: 6px 1px;" align="right"><a href="${contextPath}account/addStartup/${currentUser.id}" style="color: black;">+ Add startup</a></div>
                </div>
            </div>
        </div>

        <%--<div class="col-md-4">--%>
            <%--<div class="panel panel-default">--%>
                <%--<div class="panel-heading">--%>
                    <%--<h4>Startups</h4>--%>
                <%--</div>--%>
                <%--<div class="panel-body" style="padding: 3px 15px;">--%>
                    <%--<!-- link for startup INFO-->--%>
                    <%--<jsp:useBean id="investment" scope="request" type="java.util.List<com.startup.project.entities.Startup>"/>--%>
                    <%--<c:if test="${not empty investment}">--%>
                        <%--<c:forEach items="${investment}" var="startup">--%>
                            <%--<div style="border-bottom: #ddd solid 1px; padding: 6px 1px;"><li><a href="${startup.id}" style="color: #333">${startup.startupName}  ${}</a></li></div>--%>
                        <%--</c:forEach>--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${investment.empty}">У вас нет инвестиций!</c:if>--%>
                    <%--<!-- link for Adding startup-->--%>
                    <%--<div style="padding: 6px 1px;" align="right"><a href="" style="color: black;">+ Add startup</a></div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>

    </div>


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
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

</body>

</html>

