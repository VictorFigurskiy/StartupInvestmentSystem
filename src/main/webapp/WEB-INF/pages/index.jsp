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

    <link href="../../static/image/icon.png" rel="shortcut icon">
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
                <li>
                    <a class="no_padding_left" href="../../static/team.html">Наша команда</a>
                </li>
                <li>
                    <a href="../../static/about.html">Больше о проекте</a>
                </li>
                <li>
                    <a href="../../static/contact.html">Контакты</a>
                </li>
                <sec:authorize access="hasAnyRole('USER','OWNER','ADMIN')">
                    <li>
                        <a href="${contextPath}/account">Личный кабинет</a>
                    </li>
                </sec:authorize>

            </ul>
        </div>
        <sec:authorize access="anonymous">
            <div class="content registerBox" style="display:block; margin-top: 25px">
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
            <div class="content registerBox login_successfull" style="display: block; float: right; width: auto; height: auto; margin-top: 10px;">
                <div class="form">
                    <h4>Ваш логин: <sec:authentication property="principal.username"/></h4>
                    <form:form action="${contextPath}/logout" method="post">
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

    <div class="indexSearchMainBlock">
        <div class="indexSearchBlock1" >
            <form action="${contextPath}/search/byName" method="get">
                <h4 style="margin-left: 40px;">Поиск стартапов по названию:</h4>
                <input style="height: 38px;" class="form_country" type="text" name="name">
                <input class="btn btn-default btn-register" style="height: 38px; margin-top: -4px; border-color: #999;" type="submit" value="Поиск">
            </form>
        </div>

        <div class="indexSearchBlock2">
            <form action="${contextPath}/search/byCountry" method="get">
                <h4 style="margin-left: 54px;">Поиск стартапов по стране:</h4>
                <select style="height: 38px; " name="country" class="form_country">
                    <option value="Украина">Украина</option>
                    <option value="Россия">Россия</option>
                    <option value="Беларусь">Беларусь</option>
                    <option value="Казахстан">Казахстан</option>
                    <option value="США">США</option>
                    <option value="Польша">Польша</option>
                    <option value="Австралия">Австралия</option>
                    <option value="Австрия">Австрия</option>
                    <option value="Азербайджан">Азербайджан</option>
                    <option value="Албания">Албания</option>
                    <option value="Алжир">Алжир</option>
                    <option value="Ангола">Ангола</option>
                    <option value="Андорра">Андорра</option>
                    <option value="Антигуа и Барбуда">Антигуа и Барбуда</option>
                    <option value="Аргентина">Аргентина</option>
                    <option value="Армения">Армения</option>
                    <option value="Афганистан">Афганистан</option>
                    <option value="Багамские острова">Багамские острова</option>
                    <option value="Бангладеш">Бангладеш</option>
                    <option value="Барбадос">Барбадос</option>
                    <option value="Бахрейн">Бахрейн</option>
                    <option value="Белиз">Белиз</option>
                    <option value="Бельгия">Бельгия</option>
                    <option value="Бенин">Бенин</option>
                    <option value="Болгария">Болгария</option>
                    <option value="Боливия">Боливия</option>
                    <option value="Босния и Герцеговина">Босния и Герцеговина</option>
                    <option value="Ботсвана">Ботсвана</option>
                    <option value="Бразилия">Бразилия</option>
                    <option value="Бруней">Бруней</option>
                    <option value="Буркина-Фасо">Буркина-Фасо</option>
                    <option value="Бурунди">Бурунди</option>
                    <option value="Бутан">Бутан</option>
                    <option value="Вануату">Вануату</option>
                    <option value="Великобритания">Великобритания</option>
                    <option value="Венгрия">Венгрия</option>
                    <option value="Венесуэла">Венесуэла</option>
                    <option value="Восточный Тимор">Восточный Тимор</option>
                    <option value="Вьетнам">Вьетнам</option>
                    <option value="Габон">Габон</option>
                    <option value="Гаити">Гаити</option>
                    <option value="Гайана">Гайана</option>
                    <option value="Гамбия">Гамбия</option>
                    <option value="Гана">Гана</option>
                    <option value="Гватемала">Гватемала</option>
                    <option value="Гвинея">Гвинея</option>
                    <option value="Гвинея-Бисау">Гвинея-Бисау</option>
                    <option value="Германия">Германия</option>
                    <option value="Гондурас">Гондурас</option>
                    <option value="Гренада">Гренада</option>
                    <option value="Греция">Греция</option>
                    <option value="Грузия">Грузия</option>
                    <option value="Дания">Дания</option>
                    <option value="Джибути">Джибути</option>
                    <option value="Доминика">Доминика</option>
                    <option value="Доминиканская Республика">Доминиканская Республика</option>
                    <option value="Египет">Египет</option>
                    <option value="Замбия">Замбия</option>
                    <option value="Зимбабве">Зимбабве</option>
                    <option value="Израиль">Израиль</option>
                    <option value="Индия">Индия</option>
                    <option value="Индонезия">Индонезия</option>
                    <option value="Иордания">Иордания</option>
                    <option value="Ирак">Ирак</option>
                    <option value="Иран">Иран</option>
                    <option value="Ирландия">Ирландия</option>
                    <option value="Исландия">Исландия</option>
                    <option value="Испания">Испания</option>
                    <option value="Италия">Италия</option>
                    <option value="Йемен">Йемен</option>
                    <option value="Кабо-Верде">Кабо-Верде</option>
                    <option value="Канада">Канада</option>
                    <option value="Камбоджа">Камбоджа</option>
                    <option value="Камерун">Камерун</option>
                    <option value="Катар">Катар</option>
                    <option value="Кения">Кения</option>
                    <option value="Кипр">Кипр</option>
                    <option value="Киргизия">Киргизия</option>
                    <option value="Кирибати">Кирибати</option>
                    <option value="КНР">КНР</option>
                    <option value="Колумбия">Колумбия</option>
                    <option value="Коморы">Коморы</option>
                    <option value="Республика Конго">Республика Конго</option>
                    <option value="Демократическая республика Конго">Демократическая республика Конго</option>
                    <option value="КНДР">КНДР</option>
                    <option value="Республика Корея">Республика Корея</option>
                    <option value="Коста-Рика">Коста-Рика</option>
                    <option value="Кот-д’Ивуар">Кот-д’Ивуар</option>
                    <option value="Куба">Куба</option>
                    <option value="Кувейт">Кувейт</option>
                    <option value="Лаос">Лаос</option>
                    <option value="Латвия">Латвия</option>
                    <option value="Лесото">Лесото</option>
                    <option value="Либерия">Либерия</option>
                    <option value="Ливан">Ливан</option>
                    <option value="Ливия">Ливия</option>
                    <option value="Литва">Литва</option>
                    <option value="Лихтенштейн">Лихтенштейн</option>
                    <option value="Люксембург">Люксембург</option>
                    <option value="Маврикий">Маврикий</option>
                    <option value="Мавритания">Мавритания</option>
                    <option value="Мадагаскар">Мадагаскар</option>
                    <option value="Македония">Македония</option>
                    <option value="Малави">Малави</option>
                    <option value="Малайзия">Малайзия</option>
                    <option value="Мали">Мали</option>
                    <option value="Мальдивы">Мальдивы</option>
                    <option value="Мальта">Мальта</option>
                    <option value="Марокко">Марокко</option>
                    <option value="Маршалловы острова">Маршалловы острова</option>
                    <option value="Мексика">Мексика</option>
                    <option value="Мозамбик">Мозамбик</option>
                    <option value="Молдавия">Молдавия</option>
                    <option value="Монако">Монако</option>
                    <option value="Монголия">Монголия</option>
                    <option value="Мьянма">Мьянма</option>
                    <option value="Намибия">Намибия</option>
                    <option value="Науру">Науру</option>
                    <option value="Непал">Непал</option>
                    <option value="Нигер">Нигер</option>
                    <option value="Нигерия">Нигерия</option>
                    <option value="Нидерланды">Нидерланды</option>
                    <option value="Никарагуа">Никарагуа</option>
                    <option value="Новая Зеландия">Новая Зеландия</option>
                    <option value="Норвегия">Норвегия</option>
                    <option value="ОАЭ">ОАЭ</option>
                    <option value="Оман">Оман</option>
                    <option value="Пакистан">Пакистан</option>
                    <option value="Палау">Палау</option>
                    <option value="Панама">Панама</option>
                    <option value="Папуа-Новая Гвинея">Папуа-Новая Гвинея</option>
                    <option value="Парагвай">Парагвай</option>
                    <option value="Перу">Перу</option>
                    <option value="Португалия">Португалия</option>
                    <option value="Руанда">Руанда</option>
                    <option value="Румыния">Румыния</option>
                    <option value="Сальвадор">Сальвадор</option>
                    <option value="Самоа">Самоа</option>
                    <option value="Сан-Марино">Сан-Марино</option>
                    <option value="Сан-Томе">Сан-Томе</option>
                    <option value="Саудовская Аравия">Саудовская Аравия</option>
                    <option value="Свазиленд">Свазиленд</option>
                    <option value="Сейшельские острова">Сейшельские острова</option>
                    <option value="Сенегал">Сенегал</option>
                    <option value="Сент-Винсент">Сент-Винсент</option>
                    <option value="Сент-Китс">Сент-Китс</option>
                    <option value="Сент-Люсия">Сент-Люсия</option>
                    <option value="Сербия">Сербия</option>
                    <option value="Сингапур">Сингапур</option>
                    <option value="Сирия">Сирия</option>
                    <option value="Словакия">Словакия</option>
                    <option value="Словения">Словения</option>
                    <option value="Соломоновы острова">Соломоновы острова</option>
                    <option value="Сомали">Сомали</option>
                    <option value="Судан">Судан</option>
                    <option value="Суринам">Суринам</option>
                    <option value="Сьерра-Леоне">Сьерра-Леоне</option>
                    <option value="Таджикистан">Таджикистан</option>
                    <option value="Таиланд">Таиланд</option>
                    <option value="Танзания">Танзания</option>
                    <option value="Того">Того</option>
                    <option value="Тонга">Тонга</option>
                    <option value="Тринидад и Тобаго">Тринидад и Тобаго</option>
                    <option value="Тувалу">Тувалу</option>
                    <option value="Тунис">Тунис</option>
                    <option value="Туркменистан">Туркменистан</option>
                    <option value="Турция">Турция</option>
                    <option value="Уганда">Уганда</option>
                    <option value="Узбекистан">Узбекистан</option>
                    <option value="Уругвай">Уругвай</option>
                    <option value="Федеративные Штаты Микронезии">Федеративные Штаты Микронезии</option>
                    <option value="Фиджи">Фиджи</option>
                    <option value="Филиппины">Филиппины</option>
                    <option value="Финляндия">Финляндия</option>
                    <option value="Франция">Франция</option>
                    <option value="Хорватия">Хорватия</option>
                    <option value="Центральноафриканская Республика">Центральноафриканская Республика</option>
                    <option value="Чад">Чад</option>
                    <option value="Черногория">Черногория</option>
                    <option value="Чехия">Чехия</option>
                    <option value="Чили">Чили</option>
                    <option value="Швейцария">Швейцария</option>
                    <option value="Швеция">Швеция</option>
                    <option value="Шри-Ланка">Шри-Ланка</option>
                    <option value="Эквадор">Эквадор</option>
                    <option value="Экваториальная Гвинея">Экваториальная Гвинея</option>
                    <option value="Эритрея">Эритрея</option>
                    <option value="Эстония">Эстония</option>
                    <option value="Эфиопия">Эфиопия</option>
                    <option value="ЮАР">ЮАР</option>
                    <option value="Южный Судан">Южный Судан</option>
                    <option value="Ямайка">Ямайка</option>
                    <option value="Япония">Япония</option>
                </select>
                <input class="btn btn-default btn-register" style="height: 38px; margin-top: -4px; border-color: #999;" type="submit" value="Поиск">
            </form>
        </div>
        <div class="indexSearchBlockButton">
            <a class="header_form_create" style="margin-top: 41px;height: 39px;padding: 8px 20px;color: white;font-family: MyWebFont;background: #4686bd; border-color: black;" href="${contextPath}/">Показать все стартапы</a>
        </div>
    </div>

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
                            <p style="line-height: ;e-height: 1.5"><c:out value="${startup.description}"/></p>
                            <a href="${contextPath}/startup_description/${startup.id}" class="btn btn-default">Узнать больше</a>
                        </div>
                    </div>
                </div>
                </c:forEach>
            <c:if test="${startupList.size() == 0}">
                <div class="col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4><i class="fa fa-fw"></i> По данному критерию отбора, стартапы не найдены!!!</h4>
                        </div>
                    </div>
                </div>
            </c:if>
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

<!-- Script to Activate the Carousel -->
<script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
</script>

</body>

</html>
