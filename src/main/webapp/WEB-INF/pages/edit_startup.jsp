<%--
  Created by IntelliJ IDEA.
  User: MakeMeSm1Le-
  Date: 22.09.2017
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
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
        <div class="collapse navbar-collapse header_menu" id="bs-example-navbar-collapse-1">
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
            <div class="content registerBox" style="display:block;">
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
            <div class="content registerBox login_successfull" style="display:block;">
                <div class="form">
                    <h4>Вы вошли под логином: <sec:authentication property="principal.username"/></h4>
                    <form:form action="/logout" method="post">
                        <input class="btn btn-default btn-register" type="submit" value="Выйти">
                    </form:form>
                </div>
            </div>
        </sec:authorize>
    </div>
    <!-- /.container -->
</nav>
<h1 align="center">EDIT STARTUP</h1>
<div class="edit_startup container">
    <form name="test" method="post" >
        <p>Startup Name:</p>
        <textarea rows="4" type="text" size="40" name="startupName"></textarea>
        <p>Description:</p>
        <textarea rows="4" type="text" size="40" name="description"></textarea>
        <p>Image Link:</p>
        <textarea rows="4" type="text" size="40" name="imageLink"></textarea>
        <p>Idea:</p>
        <textarea rows="4" type="text" size="40" name="idea"></textarea>
        <p>Project Stage:</p>
        <textarea rows="4" type="projectStage" size="40" name="startupName"></textarea>
        <p>Startup Cost:</p>
        <textarea rows="4" type="text" size="40" name="startupCost"></textarea>

        <p>Current State:</p>
        <textarea rows="4" type="text" size="40" name="currentState"></textarea>
        <p>Gross Profit:</p>
        <textarea rows="4" type="text" size="40" name="grossProfit"></textarea>
        <p>Net Incom:</p>
        <textarea rows="4" type="text" size="40" name="netIncom"></textarea>
        <p>Property:</p>
        <textarea rows="4" type="text" size="40" name="property"></textarea>
        <p>Problem Or Opportunity:</p>
        <textarea rows="4" type="text" size="40" name="problemOrOpportunityt"></textarea>
        <p>Competitors:</p>
        <textarea rows="4" type="text" size="40" name="competitors"></textarea>
        <p>Business Model:</p>
        <textarea rows="4" type="text" size="40" name="businessModel"></textarea>
        <div class="one_line">
            <p class="form_text_left">Тема стартапа:</p>
            <div class="project_multiselect_c">
                <div id="sector_c" class="selecting_c" style="/* display: none; */">
                    <div id="sector_list" class="checkbox_list">
                        <label><input type="checkbox" name="SECTOR_IB[]" value="229"><span>Автотехобслуживание</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="950"><span>Блокчейн</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="263"><span>Бумажная</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="230"><span>Бытовая техника</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="957"><span>Виртуальная и дополненная реальность</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="946"><span>Гаджеты</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="231"><span>Деревообработка</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="945"><span>Дроны</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="232"><span>Интернет и ИТ</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="233"><span>Информация и СМИ</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="956"><span>Искусственный интеллект</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="234"><span>Компьютеры, оргтехника</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="235"><span>Консалтинг</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="951"><span>Криптовалюты</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="236"><span>Культура, искусство</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="237"><span>Легкая промышленность</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="238"><span>Лесозаготовка</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="239"><span>Логистика и склады</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="240"><span>Машиностроение</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="241"><span>Медицина</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="242"><span>Металлургия</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="958"><span>Мобильные приложения</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="243"><span>Недвижимость</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="244"><span>Нефтепереработка</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="245"><span>Образование, обучение</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="246"><span>Общественное питание</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="247"><span>Пищевая промышленность</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="248"><span>Полиграфия</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="249"><span>Производство</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="250"><span>Развлечение</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="944"><span>Робототехника</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="251"><span>Сельское хозяйство</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="252"><span>Страхование</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="253"><span>Строительство</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="254"><span>Телекоммуникации</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="255"><span>Торговля</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="256"><span>Транспорт</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="257"><span>Туризм, спорт</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="258"><span>Услуги, сервис</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="259"><span>Фармакология</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="260"><span>Финансовые услуги</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="261"><span>Франчайзинг</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="262"><span>Химия</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="264"><span>Электроника</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="265"><span>Энергетика</span></label><br>
                        <label><input type="checkbox" name="SECTOR_IB[]" value="266"><span>Другое</span></label><br>
                    </div>
                    <div id="sector_btn" class="checkbox_btn"><span id="text_form_list">Открить</span> список</div>
                </div>
            </div>
        </div>
        <div class="one_line">
            <p class="form_text_left">Country:</p>
            <select name="country" class="form_country">
                <option value="0">страна</option>
                <option value="300">Украина</option>
                <option value="301">Россия</option>
                <option value="297">Беларусь</option>
                <option value="302">Казахстан</option>
                <option value="303">США</option>
                <option value="299">Польша</option>
                <option value="317">Австралия</option>
                <option value="319">Австрия</option>
                <option value="320">Азербайджан</option>
                <option value="321">Албания</option>
                <option value="322">Алжир</option>
                <option value="323">Ангола</option>
                <option value="324">Андорра</option>
                <option value="325">Антигуа и Барбуда</option>
                <option value="326">Аргентина</option>
                <option value="327">Армения</option>
                <option value="328">Афганистан</option>
                <option value="329">Багамские острова</option>
                <option value="330">Бангладеш</option>
                <option value="331">Барбадос</option>
                <option value="346">Бахрейн</option>
                <option value="347">Белиз</option>
                <option value="348">Бельгия</option>
                <option value="349">Бенин</option>
                <option value="350">Болгария</option>
                <option value="351">Боливия</option>
                <option value="352">Босния и Герцеговина</option>
                <option value="353">Ботсвана</option>
                <option value="354">Бразилия</option>
                <option value="355">Бруней</option>
                <option value="356">Буркина-Фасо</option>
                <option value="357">Бурунди</option>
                <option value="358">Бутан</option>
                <option value="359">Вануату</option>
                <option value="360">Великобритания</option>
                <option value="361">Венгрия</option>
                <option value="362">Венесуэла</option>
                <option value="363">Восточный Тимор</option>
                <option value="364">Вьетнам</option>
                <option value="365">Габон</option>
                <option value="366">Гаити</option>
                <option value="367">Гайана</option>
                <option value="368">Гамбия</option>
                <option value="369">Гана</option>
                <option value="370">Гватемала</option>
                <option value="371">Гвинея</option>
                <option value="372">Гвинея-Бисау</option>
                <option value="373">Германия</option>
                <option value="374">Гондурас</option>
                <option value="375">Гренада</option>
                <option value="376">Греция</option>
                <option value="377">Грузия</option>
                <option value="378">Дания</option>
                <option value="379">Джибути</option>
                <option value="380">Доминика</option>
                <option value="381">Доминиканская Республика</option>
                <option value="382">Египет</option>
                <option value="383">Замбия</option>
                <option value="384">Зимбабве</option>
                <option value="385">Израиль</option>
                <option value="386">Индия</option>
                <option value="387">Индонезия</option>
                <option value="388">Иордания</option>
                <option value="389">Ирак</option>
                <option value="390">Иран</option>
                <option value="391">Ирландия</option>
                <option value="392">Исландия</option>
                <option value="393">Испания</option>
                <option value="394">Италия</option>
                <option value="395">Йемен</option>
                <option value="396">Кабо-Верде</option>
                <option value="298">Канада</option>
                <option value="398">Камбоджа</option>
                <option value="399">Камерун</option>
                <option value="400">Катар</option>
                <option value="401">Кения</option>
                <option value="402">Кипр</option>
                <option value="403">Киргизия</option>
                <option value="404">Кирибати</option>
                <option value="405">КНР</option>
                <option value="406">Колумбия</option>
                <option value="407">Коморы</option>
                <option value="408">Республика Конго</option>
                <option value="409">Демократическая республика Конго</option>
                <option value="410">КНДР</option>
                <option value="411">Республика Корея</option>
                <option value="412">Коста-Рика</option>
                <option value="413">Кот-д’Ивуар</option>
                <option value="414">Куба</option>
                <option value="415">Кувейт</option>
                <option value="416">Лаос</option>
                <option value="417">Латвия</option>
                <option value="418">Лесото</option>
                <option value="419">Либерия</option>
                <option value="420">Ливан</option>
                <option value="421">Ливия</option>
                <option value="422">Литва</option>
                <option value="423">Лихтенштейн</option>
                <option value="424">Люксембург</option>
                <option value="425">Маврикий</option>
                <option value="426">Мавритания</option>
                <option value="427">Мадагаскар</option>
                <option value="428">Македония</option>
                <option value="429">Малави</option>
                <option value="430">Малайзия</option>
                <option value="431">Мали</option>
                <option value="432">Мальдивы</option>
                <option value="433">Мальта</option>
                <option value="434">Марокко</option>
                <option value="435">Маршалловы острова</option>
                <option value="436">Мексика</option>
                <option value="437">Мозамбик</option>
                <option value="438">Молдавия</option>
                <option value="439">Монако</option>
                <option value="440">Монголия</option>
                <option value="441">Мьянма</option>
                <option value="442">Намибия</option>
                <option value="443">Науру</option>
                <option value="444">Непал</option>
                <option value="445">Нигер</option>
                <option value="446">Нигерия</option>
                <option value="447">Нидерланды</option>
                <option value="448">Никарагуа</option>
                <option value="449">Новая Зеландия</option>
                <option value="450">Норвегия</option>
                <option value="451">ОАЭ</option>
                <option value="452">Оман</option>
                <option value="453">Пакистан</option>
                <option value="454">Палау</option>
                <option value="455">Панама</option>
                <option value="456">Папуа-Новая Гвинея</option>
                <option value="457">Парагвай</option>
                <option value="458">Перу</option>
                <option value="459">Португалия</option>
                <option value="460">Руанда</option>
                <option value="461">Румыния</option>
                <option value="462">Сальвадор</option>
                <option value="463">Самоа</option>
                <option value="464">Сан-Марино</option>
                <option value="465">Сан-Томе</option>
                <option value="466">Саудовская Аравия</option>
                <option value="467">Свазиленд</option>
                <option value="468">Сейшельские острова</option>
                <option value="469">Сенегал</option>
                <option value="470">Сент-Винсент</option>
                <option value="471">Сент-Китс</option>
                <option value="472">Сент-Люсия</option>
                <option value="473">Сербия</option>
                <option value="474">Сингапур</option>
                <option value="475">Сирия</option>
                <option value="476">Словакия</option>
                <option value="477">Словения</option>
                <option value="478">Соломоновы острова</option>
                <option value="479">Сомали</option>
                <option value="480">Судан</option>
                <option value="481">Суринам</option>
                <option value="482">Сьерра-Леоне</option>
                <option value="483">Таджикистан</option>
                <option value="484">Таиланд</option>
                <option value="485">Танзания</option>
                <option value="486">Того</option>
                <option value="487">Тонга</option>
                <option value="488">Тринидад и Тобаго</option>
                <option value="489">Тувалу</option>
                <option value="490">Тунис</option>
                <option value="491">Туркменистан</option>
                <option value="492">Турция</option>
                <option value="493">Уганда</option>
                <option value="494">Узбекистан</option>
                <option value="495">Уругвай</option>
                <option value="496">Федеративные Штаты Микронезии</option>
                <option value="497">Фиджи</option>
                <option value="498">Филиппины</option>
                <option value="499">Финляндия</option>
                <option value="316">Франция</option>
                <option value="501">Хорватия</option>
                <option value="502">Центральноафриканская Республика</option>
                <option value="503">Чад</option>
                <option value="504">Черногория</option>
                <option value="505">Чехия</option>
                <option value="506">Чили</option>
                <option value="310">Швейцария</option>
                <option value="311">Швеция</option>
                <option value="312">Шри-Ланка</option>
                <option value="313">Эквадор</option>
                <option value="314">Экваториальная Гвинея</option>
                <option value="315">Эритрея</option>
                <option value="304">Эстония</option>
                <option value="305">Эфиопия</option>
                <option value="306">ЮАР</option>
                <option value="307">Южный Судан</option>
                <option value="308">Ямайка</option>
                <option value="309">Япония</option>
            </select>
        </div>
        <input type="submit" value="Сохранить">
    </form>
</div>



</div>
<!-- /.container -->
<hr/>
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

<script src="../../static/js/custom.js"></script>

</body>

</html>


