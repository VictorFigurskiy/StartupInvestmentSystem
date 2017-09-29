<%--
  Created by IntelliJ IDEA.
  User: nonal
  Date: 25.09.2017
  Time: 23:38
  To change this template use File | Settings | File Templates.
--%>
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

    <title>Добавление стартапа</title>

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
    <div class="container header_menu">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="main-page-button"><a class="navbar-brand" href="/" style="color: white;">На главную</a></div>
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
    <!-- /.container -->
</nav>

<div class="edit_startup container">
    <div>
        <h1 class="page-header">
            Добавление стартапа:
        </h1>
    </div>

    <jsp:useBean id="startupReg" scope="request" type="com.startup.project.entities.Startup"/>
    <jsp:useBean id="startupDetailReg" scope="request" type="com.startup.project.entities.StartupDetail"/>

    <form:form modelAttribute="startupReg" method="post" action="${contextPath}/add_startup">
        <form:form modelAttribute="startupDetailReg" method="post" action="${contextPath}/add_startup">


            <p>Название стартапа:</p>
            <textarea rows="2" type="text" size="40" name="startupName" required maxlength="150"></textarea>
            <p>Описание:</p>
            <textarea rows="4" type="text" size="40" name="description" required maxlength="1000" placeholder=""></textarea>
            <p>Ссылка на картинку:</p>
            <textarea rows="4" type="text" size="40" name="imageLink" required maxlength="500"></textarea>
            <p>Идея:</p>
            <textarea rows="4" type="text" size="40" name="idea" required maxlength="1000"></textarea>
            <p>Текущее состояние:</p>
            <textarea rows="4" type="text" size="40" name="currentState" maxlength="500"></textarea>
            <p>Годовой объем продаж, $</p>
            <textarea rows="4" type="text" size="40" name="grossProfit" maxlength="500"></textarea>
            <p>Годовой объем чистой прибыли, $</p>
            <textarea rows="4" type="text" size="40" name="netIncome" maxlength="500"></textarea>
            <p>Тип имущества:</p>
            <textarea rows="4" type="text" size="40" name="typeOfProperty" maxlength="500"></textarea>
            <p>Имущество и активы:</p>
            <textarea rows="4" type="text" size="40" name="property" maxlength="500"></textarea>
            <p>Проблема или Возможность:</p>
            <textarea rows="4" type="text" size="40" name="problemOrOpportunity" maxlength="500"></textarea>
            <p>Конкуренты:</p>
            <textarea rows="4" type="text" size="40" name="competitors" maxlength="500"></textarea>
            <p>Бизнес-модель:</p>
            <textarea rows="4" type="text" size="40" name="businessModel" maxlength="500"></textarea>

            <p>Необходимая сумма, $:</p>
            <input type="number" size="40" name="startupCost" required min="1" max="9999999999">


            <div style="width: 54%; height: auto">
                <div class="one_line">
                    <p class="form_text_left">Отрасль промышленности:</p>
                    <select name="industry" class="form_country" style="float: right">
                        <option value="Автотехобслуживание">Автотехобслуживание</option>
                        <option value="Блокчейн">Блокчейн</option>
                        <option value="Бумажная">Бумажная</option>
                        <option value="Бытовая техника">Бытовая техника</option>
                        <option value="Виртуальная и дополненная реальность">Виртуальная и дополненная реальность</option>
                        <option value="Гаджеты">Гаджеты</option>
                        <option value="Деревообработка">Деревообработка</option>
                        <option value="Дроны">Дроны</option>
                        <option value="Интернет и ИТ">Интернет и ИТ</option>
                        <option value="Информация и СМИ">Информация и СМИ</option>
                        <option value="Искусственный интеллектbr">Искусственный интеллект</option>
                        <option value="Компьютеры, оргтехника">Компьютеры, оргтехника</option>
                        <option value="Консалтинг">Консалтинг</option>
                        <option value="Криптовалюты">Криптовалюты</option>
                        <option value="Культура, искусство">Культура, искусство</option>
                        <option value="Легкая промышленность">Легкая промышленность</option>
                        <option value="Лесозаготовка">Лесозаготовка</option>
                        <option value="Логистика и склады">Логистика и склады</option>
                        <option value="Машиностроение">Машиностроение</option>
                        <option value="Медицина">Медицина</option>
                        <option value="Металлургия">Металлургия</option>
                        <option value="Мобильные приложения">Мобильные приложения</option>
                        <option value="Недвижимость">Недвижимость</option>
                        <option value="Нефтепереработка">Нефтепереработка</option>
                        <option value="Образование, обучение">Образование, обучение</option>
                        <option value="Общественное питание">Общественное питание</option>
                        <option value="Пищевая промышленность">Пищевая промышленность</option>
                        <option value="Полиграфия">Полиграфия</option>
                        <option value="Производство">Производство</option>
                        <option value="Развлечение">Развлечение</option>
                        <option value="Робототехника">Робототехника</option>
                        <option value="Сельское хозяйство">Сельское хозяйство</option>
                        <option value="Страхование">Страхование</option>
                        <option value="Строительство">Строительство</option>
                        <option value="Телекоммуникации">Телекоммуникации</option>
                        <option value="Торговля">Торговля</option>
                        <option value="Транспорт">Транспорт</option>
                        <option value="Туризм, спорт">Туризм, спорт</option>
                        <option value="Услуги, сервис">Услуги, сервис</option>
                        <option value="Фармакология">Фармакология</option>
                        <option value="Финансовые услуги">Финансовые услуги</option>
                        <option value="Франчайзинг">Франчайзинг</option>
                        <option value="Химия">Химия</option>
                        <option value="Электроника">Электроника</option>
                        <option value="Энергетика">Энергетика</option>
                        <option value="Другое">Другое</option>
                    </select>
                </div>

                <div class="one_line">
                    <p class="form_text_left">Стадия проекта:</p>
                    <select name="projectStage" class="form_country" style="float: right">
                        <option value="Есть идея или наработки">Есть идея или наработки</option>
                        <option value="Готов прототип или продукт">Готов прототип или продукт</option>
                        <option value="Действующий бизнес">Действующий бизнес</option>
                    </select>
                </div>

                <div class="one_line">
                    <p class="form_text_left">Страна:</p>
                    <select  name="country" class="form_country" style="float: right">
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
                </div>
            </div>
            <div>
                <input type="submit" value="Сохранить">
                <input type="reset"  value="Очистить введенные данные" style="color: #ffffff; background-color: #E93333;">
            </div>
        </form:form>
    </form:form>

</div>
<!-- /.container -->
<hr/>
<!-- Footer -->
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

<script src="../../static/js/custom.js"></script>

</body>

</html>



