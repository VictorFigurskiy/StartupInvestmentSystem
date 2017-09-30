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
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">Start Bootstrap</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
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
                    <li class="dropdown active">
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
                            <li class="active">
                                <a href="404.jsp">404</a>
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
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">404
                    <small>Page Not Found</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.jsp">Home</a>
                    </li>
                    <li class="active">404</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <div class="row">

            <div class="col-lg-12">
                <div class="jumbotron">
                    <h1><span class="error-404">404</span>
                    </h1>
                    <p>The page you're looking for could not be found. Here are some helpful links to get you back on track:</p>



                    <%--<div class="form-container">--%>
                        <%--<h1>Spring 4 MVC File Upload Example </h1>--%>
                        <%--<form:form action="${contextPath}/test/singleUpload" method="POST" modelAttribute="fileBucket" enctype="multipart/form-data" class="form-horizontal">--%>

                            <%--<div class="row">--%>
                                <%--<div class="form-group col-md-12">--%>
                                    <%--<label class="col-md-3 control-lable" for="file">Upload a file</label>--%>
                                    <%--<div class="col-md-7">--%>
                                        <%--<form:input type="file" path="file" id="file" class="form-control input-sm"/>--%>
                                        <%--<div class="has-error">--%>
                                            <%--<form:errors path="file" class="help-inline"/>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>

                            <%--<div class="row">--%>
                                <%--<div class="form-actions floatRight">--%>
                                    <%--<input type="submit" value="Upload" class="btn btn-primary btn-sm">--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</form:form>--%>
                        <%--<a href="<c:url value='/' />">Home</a>--%>
                    <%--</div>--%>




                    <div class="form-container">
                        <h1>Spring 4 MVC Multi File Upload Example </h1>
                        <form:form action="${contextPath}/test/multiUpload" method="POST" modelAttribute="multiFileBucket" enctype="multipart/form-data" class="form-horizontal">

                            <c:forEach  items="${multiFileBucket.files}" var="v" varStatus="vs">
                                <form:input type="file" path="files[${vs.index}].file" id="files[${vs.index}].file" class="form-control input-sm"/>
                                <div class="has-error">
                                    <form:errors path="files[${vs.index}].file" class="help-inline"/>
                                </div>
                            </c:forEach>
                            <br/>
                            <div class="row">
                                <div class="form-actions floatRight">
                                    <input type="submit" value="Upload" class="btn btn-primary btn-sm">
                                </div>
                            </div>
                        </form:form>

                        <br/>
                        <a href="<c:url value='/' />">Home</a>
                    </div>



                    <ul>
                        <li>
                            <a href="index.jsp">Home</a>
                        </li>
                        <li>
                            <a href="../../static/about.html">About</a>
                        </li>
                        <li>
                            <a href="../../static/services.html">Services</a>
                        </li>
                        <li>
                            <a href="../../static/contact.html">Contact</a>
                        </li>
                        <li>
                            Portfolio
                            <ul>
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
                            </ul>
                        </li>
                        <li>
                            Blog
                            <ul>
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
                        <li>
                            Other Pages
                            <ul>
                                <li>
                                    <a href="full-width-page.html">Full Width Page</a>
                                </li>
                                <li>
                                    <a href="../../static/sidebar.html">Sidebar Page</a>
                                </li>
                                <li>
                                    <a href="../../static/faq.html">FAQ</a>
                                </li>
                                <li>
                                    <a href="404.jsp">404 Page</a>
                                </li>
                                <li>
                                    <a href="pricing-table.html">Pricing Table</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>

        </div>



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
