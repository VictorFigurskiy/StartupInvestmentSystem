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

    <link href="../../static/image/index.png" rel="shortcut icon">
    <title>Startup Ukraine</title>

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
                        <a href="${contextPath}/account">Личный кабинет</a>
                    </li>
                </sec:authorize>
                <li>
                    <a class="no_padding_left" href="../../static/about.html">О нас</a>
                </li>
                <li>
                    <a href="../../static/services.html">Сервисы</a>
                </li>
                <li>
                    <a href="../../static/contact.html">Контакты</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Портфолио<b class="caret"></b></a>
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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Блог<b class="caret"></b></a>
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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Другие страницы<b class="caret"></b></a>
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
                        <a class="header_form_create" href="${contextPath}/registration">Зарегистрироватся</a>
                    </form>
                </div>
                <!-- /.navbar-collapse -->
            </div>
        </sec:authorize>
        <sec:authorize access="hasAnyRole('USER','OWNER','ADMIN')">
            <div class="content registerBox login_successfull" style="display:block; float: left; width: auto;padding-left: 16px; height: auto; margin-top: -5px">
                <div class="form">
                    <h4>Ваш логин: <sec:authentication property="principal.username"/></h4>
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
            Наши стартапы:
        </h1>
    </div>

    <jsp:useBean id="startupList" scope="request" type="java.util.List<com.startup.project.entities.Startup>"/>

    <div class="example">
        <div id="content">
            <c:forEach items="${startupList}" var="startup">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> <c:out value="${startup.startupName}"/></h4>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-6">
                            <img class="img-responsive" src="${startup.imageLink}" alt="">
                        </div>
                        <p><c:out value="${startup.description}"/></p>
                        <a href="${contextPath}/startup_description/${startup.id}" class="btn btn-default">Узнать больше</a>
                    </div>
                </div>
            </div>
            </c:forEach>

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
            <h2 class="page-header">Немного о нас!</h2>
        </div>
        <div class="col-md-6">
            <p>Мы универсальная бизнес-платформа по поиску инвестиций в стартап проекты. Наше предназначение - помочь Стартаперу найти инвестиции в свой проект,
                а банкам и инвесторам - принять активное участие в развитии инновационных разработок, получать дивиденды от вложенных денежных средств.
            </p>
            <br>
            <ul>
                <strong>Нас благодарят за:</strong>
                <br>
                <br>
                <li>экономию времени (временные затраты на поиск инвестора (партнера) сокращаются на десятки часов еженедельно)</li>
                <li>эмпатию (вы не платите агентам, посредникам за поиск нужного вам человека) мы знаем, насколько сложен деловой мир</li>
                <li>существование (Вот оно – главное счастье человека: быть нужным.)</li>
                <li>self-Pr (каждый человек имеет право быть услышанным)</li>
            </ul>
            <p>
                Здесь мы не просто ищем инвестиции и рентабельные стартап-идеи, мы строим фундамент своего будущего.
            </p>
        </div>
        <div class="col-md-6">
            <img class="img-responsive" src="${contextPath}/static/image/Screen_Shot_2015-10-22_at_12.20.48_AM.png.png" alt="">
        </div>
    </div>
    <!-- /.row -->

    <hr>

    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Больше о стартапах</h1>
                <%--<ol class="breadcrumb">--%>
                    <%--<li><a href="../WEB-INF/pages/index.jsp">Home</a>--%>
                    <%--</li>--%>
                    <%--<li class="active">FAQ</li>--%>
                <%--</ol>--%>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">О стартапах в целом.</a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse">
                            <div class="panel-body">
                                Стартапы становятся все более популярным вариантом начала (старта) бизнеса. Это нишу быстро заполнили представители новой волны бизнеса – молодые люди примерно 25-30 лет, которые имеют свое видение построения бизнеса, а также множество интересных и перспективных идей. Среди самых успешных новаторов современности много миллионеров и даже миллиардеров. А ведь, как правило, все начиналось с небольшого проекта, который его создатели бережно, год за годом оберегали от конкурентов и развивали. Как награда за эти ежедневные труды – всемирная известность и сказочные доходы – вспомним хотя бы создателя глобальной социальной сети Facebook – Марка Цукерберга. Однако, за видимостью легкого успеха кроется тяжелый кропотливый труд и целый перечень важных задач, для разрешения которых нужно принимать всегда правильные решения. К таким решениям относится: поиск стартап команды, инвестора, который будет осуществлять финансирование стартапов, разработка качественного бизнес-плана и т.д.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Сферы для запуска стартапов.</a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse">
                            <div class="panel-body">
                                Вопреки распространенному мнению о том, что стартапы запускаются только в IT-сфере, стартап компанию можно открыть практически в любом сегменте. Главное, разработать действительно перспективную идею, способную заинтересовать потенциальных инвесторов. Однако, тенденции таковы, что именно IT-сфера сейчас развивается наиболее бурными темпами, и в ней еще осталось немало ниш, которые новаторам еще предстоит заполнить. Только за последние несколько лет в глобальной сети появилось множество стартап проектов, которые смогли добиться реального успеха, вспомним хотя бы Skype или Twitter. Именно поэтому постараемся рассказать о том, как организовываются стартап проекты именно в IT-сфере, тем более, здесь есть свои отличительные особенности.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">Интернет-стартапы.</a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse">
                            <div class="panel-body">
                                Эти стартапы являются особенными, и специфику эту придает, прежде всего, работа в глобальной сети Интернет. Чтобы startup стал успешным, нужно быть хорошо знакомым с этой сферой деятельности и четко представлять, как можно монетизировать проект. Особенность IT-бизнеса заключается в том, что здесь часто не нужны большие денежные затраты, здесь гораздо важнее проявить профессионализм и творческие способности при разработке бизнес-плана и привлечении инвесторов. Однако, несмотря на специфичность этой сферы, общие законы бизнеса здесь действуют также, как и в других отраслях. Чтобы стартап проект мог рассчитывать на успех, ему нужно быть новым, оригинальным и, главное, нужным людям. При этом не обязательно придумывать что-то принципиально новое, когда можно интересно и оригинально реализовать уже существующие идеи. Любой стартап проект должен иметь свою «изюминку», какое-либо конкурентное преимущество.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">Составляющие успеха.</a>
                            </h4>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse">
                            <div class="panel-body">
                                Чтобы получить поддержку и финансирование стартапов, ваш проект должен иметь следующие составляющие:
                                <li>Хорошая перспективная идея. Идея должны быть максимально четкой и конкретной, чтобы потенциальные инвесторы без проблем могли понять ее смысл и механизмы реализации.
                                <li>Ресурсы для достижения цели. Обычно инвестиции в стартапы становятся возможны только для проектов тех новаторов, которые четко представляют себе, каким образом, они будут реализовывать на практике свою идею, и какие инструменты им для этого понадобятся.
                                <li>Финансовая привлекательность проекта. Бывают случаи, когда идея для startup является очень интересной и оригинальной, однако, реальную финансовую выгоду в результате ее реализации получить будет очень сложно или вовсе невозможно. Поэтому вполне логично, что инвесторы предпочитают выделять деньги только на те стартап проекты, которые способны окупиться в короткие сроки, пусть даже идея бизнеса не самая оригинальная и новая.
                                <li>Возможные риски. Работая в IT-сфере, всегда нужно учитывать возможные риски. Далеко не каждый стартап проект в итоге становится успешным, большинство проектов, к сожалению, так и не доходят до своего целевого потребителя, и это может происходить по разным причинам. Различные интернет-проекты жестко конкурируют друг с другом, кроме того, никто не защищен в полной мере от полного или частичного копирования информации, интересных идей. Поэтому в IT-сфере желательно всегда быть на шаг впереди конкурентов и быть готовым явить интернет-сообществу новую идею, в то время, как конкуренты только-только скопировали старую. Наша биржа стартапов является одной из самых популярных в России, благодаря нам многие стартап-компании приобрели надежных инвесторов. Среди наших новаторов очень много успешных людей, а их оригинальные проекты приносят хорошую прибыль. Успешность вашего бизнеса очень важна для нас!
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.panel-group -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
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
                    <li><a href="index.jsp">HOME</a></li>
                    <li><a href="">EditStartupDetails</a></li>
                    <li><a href="index.jsp">FORUM</a></li>
                    <li><a href="index.jsp">TUTORIALS</a></li>
                    <li><a href="/static/about.html">ABOUT US</a></li>
                    <li><a href="index.jsp">CONTACT</a></li>
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

<!-- Script to Activate the Carousel -->
<script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
</script>

</body>

</html>
