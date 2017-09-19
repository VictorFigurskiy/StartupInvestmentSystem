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

    <!-- Navigation -->
    <nav class="navbar" role="navigation">
        <div class="container">
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
                    <li class="active">
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
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <h2>Регистрация</h2>
<form class="form-horizontal">
  <div class="form-group">
    <label class="control-label col-xs-3" for="lastName">Фамилия:</label>
    <div class="col-xs-9">
      <input type="text" class="form-control" id="lastName" placeholder="Введите фамилию">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-xs-3" for="firstName">Имя:</label>
    <div class="col-xs-9">
      <input type="text" class="form-control" id="firstName" placeholder="Введите имя">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-xs-3" for="fatherName">Отчество:</label>
    <div class="col-xs-9">
      <input type="text" class="form-control" id="fatherName" placeholder="Введите отчество">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-xs-3">Дата рождения:</label>
    <div class="col-xs-3">
      <select class="form-control">
        <option>Дата</option>
      </select>
    </div>
    <div class="col-xs-3">
      <select class="form-control">
        <option>Месяц</option>
      </select>
    </div>
    <div class="col-xs-3">
      <select class="form-control">
        <option>Год</option>
      </select>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-xs-3" for="inputEmail">Email:</label>
    <div class="col-xs-9">
      <input type="email" class="form-control" id="inputEmail" placeholder="Email">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-xs-3" for="inputPassword">Пароль:</label>
    <div class="col-xs-9">
      <input type="password" class="form-control" id="inputPassword" placeholder="Введите пароль">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-xs-3" for="confirmPassword">Подтвердите пароль:</label>
    <div class="col-xs-9">
      <input type="password" class="form-control" id="confirmPassword" placeholder="Введите пароль ещё раз">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-xs-3" for="phoneNumber">Телефон:</label>
    <div class="col-xs-9">
      <input type="tel" class="form-control" id="phoneNumber" placeholder="Введите номер телефона">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-xs-3" for="postalAddress">Адрес:</label>
    <div class="col-xs-9">
      <textarea rows="3" class="form-control" id="postalAddress" placeholder="Введите адрес"></textarea>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-xs-3">Пол:</label>
    <div class="col-xs-2">
      <label class="radio-inline">
        <input type="radio" name="genderRadios" value="male"> Мужской
      </label>
    </div>
    <div class="col-xs-2">
      <label class="radio-inline">
        <input type="radio" name="genderRadios" value="female"> Женский
      </label>
    </div>
  </div>
  <div class="form-group">
    <div class="col-xs-offset-3 col-xs-9">
      <label class="checkbox-inline">
        <input type="checkbox" value="agree">  Я согласен с <a href="#">условиями</a>.
      </label>
    </div>
  </div>
  <br />
  <div class="form-group">
    <div class="col-xs-offset-3 col-xs-9">
      <input type="submit" class="btn btn-primary" value="Регистрация">
      <input type="reset" class="btn btn-default" value="Очистить форму">
    </div>
  </div>
</form>
        <!-- /.row -->

        <hr>

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
    <script src="../../static/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../../static/js/bootstrap.min.js"></script>

</body>

</html>
