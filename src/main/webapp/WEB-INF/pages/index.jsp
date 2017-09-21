<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Modern Business - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="../../static/css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../../static/css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../../static/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="../../static/css/footerStyle.css" rel="stylesheet" type="text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="https://code.jquery.com/jquery-1.8.3.js"></script>
    <script>
        var Imtech = {};
        Imtech.Pager = function () {
            this.paragraphsPerPage = 3;
            this.currentPage = 1;
            this.pagingControlsContainer = '#pagingControls';
            this.pagingContainerPath = '#content';
            // число страниц
            this.numPages = function () {
                var numPages = 0;
                //          ('div.z')                               5
                if (this.paragraphs != null && this.paragraphsPerPage != null) {
                    // метод ceil - возвращает наименьшее целое
                    numPages = Math.ceil(this.paragraphs.length / this.paragraphsPerPage);
                }

                return numPages;
            };

// page - текущая (открытая - номер) страница, то есть в ф-ю передаем номер текущий страницы, контент котор впоследствии выводим
            this.showPage = function (page) {
                this.currentPage = page;
                var html = '';
// slice - Данный метод не изменяет исходный массив, а просто возвращает его часть.
// то есть выводит тот контент, котор соответствует текущей странице
                this.paragraphs.slice((page - 1) * this.paragraphsPerPage,
                    ((page - 1) * this.paragraphsPerPage) + this.paragraphsPerPage).each(function () {
                    html += '<div>' + $(this).html() + '</div>';
                });
// вставляем контент
                $(this.pagingContainerPath).html(html);
//                          #pagingControls,  текущая страница(по умолч. 1), общее число страниц
                renderControls(this.pagingControlsContainer, this.currentPage, this.numPages());
            }

// блок с навигацией
            var renderControls = function (container, currentPage, numPages) {
// разметка с навигацией
                var pagingControls = 'Page: <ul>';
                for (var i = 1; i <= numPages; i++) {
                    if (i != currentPage) {
                        pagingControls += '<li><a href="#" onclick="pager.showPage(' + i + '); return false;">' + i + '</a></li>';
                    } else {
                        pagingControls += '<li>' + i + '</li>';
                    }
                }

                pagingControls += '</ul>';

                $(container).html(pagingControls);
            }
        }
    </script>
</head>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!-- Navigation -->
<nav class="navbar navbar-background" role="navigation">
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
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse header_menu" id="bs-example-navbar-collapse-1" style="width: auto; float: left;">
            <ul class="nav navbar-nav">
                <sec:authorize access="hasAnyRole('USER','OWNER','ADMIN')">
                    <li>
                        <a href="${contextPath}/account">Account</a>
                    </li>
                </sec:authorize>
                <li>
                    <a class="no_padding_left" href="../../static/about.html">About</a>
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
                            <a href="404.jsp">404</a>
                        </li>
                        <li>
                            <a href="../../static/pricing.html">Pricing Table</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <sec:authorize access="anonymous">
            <div class="content registerBox" style="display:block; margin-top: 20px">
                <div class="form">

                    <c:url value="/j_spring_security_check" var="loginUrl"/>
                    <form method="post" action="${loginUrl}">
                        <input id="email" class="form-control" type="email" placeholder="Email address"
                               name="j_username">
                        <input id="password" class="form-control" type="password" placeholder="Password"
                               name="j_password">
                        <input class="btn btn-default btn-register" type="submit" value="Войти">
                        <a class="header_form_create" href="${contextPath}/registration">Create account</a>
                    </form>
                </div>
                <!-- /.navbar-collapse -->
            </div>
        </sec:authorize>

        <sec:authorize access="hasAnyRole('USER','OWNER','ADMIN')">
            <div class="content registerBox login_successfull" style="display:block; float: left; width: auto;padding-left: 16px; height: auto; margin-top: -4px">
                <div class="form">
                    <h4>Вы вошли под логином: <sec:authentication property="principal.username"/></h4>
                    <form:form action="/logout" method="post">
                        <input class="btn btn-default btn-register" style="float: right; margin-right: 19px;" type="submit" value="Выйти">
                    </form:form>
                </div>
            </div>
        </sec:authorize>
    </div>
    <!-- /.container -->
</nav>


<!-- Page Content -->
<div class="container container-top">

    <!-- Marketing Icons Section -->
    <div>
        <h1 class="page-header">
            //startup's
        </h1>
    </div>
    <jsp:useBean id="startupList" scope="request" type="java.util.List<com.startup.project.entities.Startup>"/>

    <div class="example">
        <div id="content">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> <c:out value="${startupList.get(0).startupName}"/></h4>
                    </div>
                    <div class="panel-body">
                        <p><c:out value="${startupList.get(0).idea}"/></p>
                        <a href="" class="btn btn-default">Learn More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-gift"></i> Free &amp; Open Source</h4>
                    </div>
                    <div class="panel-body">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla
                            aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus
                            eveniet incidunt dicta nostrum quod?</p>
                        <a href="#" class="btn btn-default">Learn More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-compass"></i> Easy to Use</h4>
                    </div>
                    <div class="panel-body">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla
                            aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus
                            eveniet incidunt dicta nostrum quod?</p>
                        <a href="#" class="btn btn-default">Learn More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> Bootstrap v3.2.0</h4>
                    </div>
                    <div class="panel-body">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla
                            aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus
                            eveniet incidunt dicta nostrum quod?</p>
                        <a href="#" class="btn btn-default">Learn More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> Bootstrap v3.2.0</h4>
                    </div>
                    <div class="panel-body">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla
                            aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus
                            eveniet incidunt dicta nostrum quod?</p>
                        <a href="#" class="btn btn-default">Learn More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> Bootstrap v3.2.0</h4>
                    </div>
                    <div class="panel-body">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla
                            aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus
                            eveniet incidunt dicta nostrum quod?</p>
                        <a href="#" class="btn btn-default">Learn More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> Bootstrap v3.2.0</h4>
                    </div>
                    <div class="panel-body">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla
                            aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus
                            eveniet incidunt dicta nostrum quod?</p>
                        <a href="#" class="btn btn-default">Learn More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> Bootstrap v3.2.0</h4>
                    </div>
                    <div class="panel-body">
                        <p>НАЗАРРРРРРРРРРРРР, consectetur adipisicing elit. Itaque, optio corporis quae nulla aspernatur
                            in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus eveniet
                            incidunt dicta nostrum quod?</p>
                        <a href="#" class="btn btn-default">Learn More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> Bootstrap v3.2.0</h4>
                    </div>
                    <div class="panel-body">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla
                            aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus
                            eveniet incidunt dicta nostrum quod?</p>
                        <a href="#" class="btn btn-default">Learn More</a>
                    </div>
                </div>
            </div>
            <!--  и далее  параграфы... -->

        </div>
        <div id="pagingControls"></div>
    </div>
    <script type="text/javascript">
        var pager = new Imtech.Pager();
        $(document).ready(function () {
            // кол-во выводимых параграфов () или div )
            // на одной странице
            pager.paragraphsPerPage = 3;
            // основной контейнер
            pager.pagingContainer = $('#content');
            // обозначаем требуемый блок ('div.z')
            pager.paragraphs = $('div.col-md-4', pager.pagingContainer);
            pager.showPage(1);
        });
    </script>
    <!-- /.row -->

    <!-- Portfolio Section -->


    <!-- Features Section -->
    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header">About Project</h2>
        </div>
        <div class="col-md-6">
            <p>Write some info and create photo:</p>
            <ul>
                <li><strong>Bootstrap v3.2.0</strong>
                </li>
                <li>jQuery v1.11.0</li>
                <li>Font Awesome v4.1.0</li>
                <li>Working PHP contact form with validation</li>
                <li>Unstyled page elements for easy customization</li>
                <li>17 HTML pages</li>
            </ul>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id
                reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia
                dolorum ducimus unde.</p>
        </div>
        <div class="col-md-6">
            <img class="img-responsive" src="http://placehold.it/700x450" alt="">
        </div>
    </div>
    <!-- /.row -->

    <hr>

    <!-- Call to Action Section -->
    <div class="well">
        <div class="row">
            <div class="col-md-8">
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum
                    deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
            </div>
            <div class="col-md-4">
                <a class="btn btn-lg btn-default btn-block" href="#">Call to Action</a>
            </div>
        </div>
    </div>

    <hr>



</div>
<!-- /.container -->

<!-- Footer -->
<footer class="container-fluid">
    <div class="container">
        <div class="row">
            <nav>
                <ul>
                    <li><a href="index.jsp">HOME</a></li>
                    <li><a href="index.jsp">GALLERY</a></li>
                    <li><a href="index.jsp">FORUM</a></li>
                    <li><a href="index.jsp">TUTORIALS</a></li>
                    <li><a href="/static/about.html">ABOUT US</a></li>
                    <li><a href="index.jsp">CONTACT</a></li>
                </ul>
            </nav>
        </div>
        <div class="row">
            <div class="col-lg-12 footerClass" >
                <p> TeamOne Website 2017</p>
            </div>
        </div>
    </div>
</footer>

<!-- jQuery -->
<script src="../../static/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../../static/js/bootstrap.min.js"></script>

<!-- Script to Activate the Carousel -->
<script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
</script>

</body>

</html>
