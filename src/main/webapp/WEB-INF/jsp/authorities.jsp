<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="ru">
<head>
            <title>KPI</title>
<!-- CSS -->
            <meta http-equiv="content-type" content="text/html;charset=utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no"/>
            <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
            <link href="//fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
            <link rel="stylesheet" href="resources/css/jsplumbtoolkit-defaults2.css">
            <link rel="stylesheet" href="resources/css/main2.css">
            <link rel="stylesheet" href="resources/css/jsplumbtoolkit-demo2.css">
            <link rel="stylesheet" href="resources/css/front-jsplumb2.css">
            <link rel="stylesheet" href="resources/css/bootstrap.min.css">
<!-- Заголовок страницы -->
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="navbar-brand" href="#">KPI</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item"><a class="nav-link" href="#">Поддержка</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">Личный кабинет</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">Пользователь</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
</head>
<body>
<!-- Элементы -->
        <div class="statemachine">
            <div class="jtk-demo-main">

                <div class="jtk-demo-canvas canvas-wide statemachine-demo jtk-surface jtk-surface-nopan" id="canvas">

                    <div class="w" id="division1" ><span class="nameBlock">Деп</span>
                        <button class="main-btn1" type="submit" value="1">&times;</button>
                        <div class="ep" action="division1"></div>
                    </div>

                    <div class="w" id="division2" ><span class="nameBlock">ПО</span>
                        <button class="main-btn1" type="submit" value="1">&times;</button>
                        <div class="ep" action="division2"></div>
                    </div>
                    <div class="w" id="division3" ><span class="nameBlock">ПО</span>
                        <button class="main-btn1" type="submit" value="1">&times;</button>
                        <div class="ep" action="division3"></div>
                    </div>

                    <div class="w" id="authorities1" ><span class="nameBlock1">Функция</span>
                        <button class="main-btn1" type="submit" value="1">&times;</button>
                        <div class="ep" action="authorities1"></div>
                    </div>
                    <div class="w" id="authorities2" ><span class="nameBlock1">Функция</span>
                        <button class="main-btn1" type="submit" value="1">&times;</button>
                        <div class="ep" action="authorities2"></div>
                    </div>

                    <div class="w childBlock" id="authorities3" ><span class="nameBlock2">Функция</span>
                        <button class="main-btn1" type="submit" value="1">&times;</button>
                        <div class="ep" action="authorities3"></div>
                    </div>
                    <div class="w childBlock" id="authorities4" ><span class="nameBlock2">Функция</span>
                        <button class="main-btn1" type="submit" value="1">&times;</button>
                        <div class="ep" action="authorities4"></div>
                    </div>
                </div>
                <!-- Кнопка новый элемент -->
                <button id="myBtn">Новый элемент</button>
            </div>
        </div>
<!-- Карточка -->
<!--
        <div class="card" style="width: 18rem;">
            <img src="..." class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
            </div>
        </div>
-->
<!-- Модальное окно -->
        <section>
            <div id = "myModal" class="modal">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <h4 class="modal-title w-100 font-weight-bold">Новый элемент</h4>
                        <button type="button" class="close" id="myClose" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body mx-3">
                        <div class="md-form mb-5">
                            <i class="fas fa-envelope prefix grey-text"></i>
                            <input type="email" id="defaultForm-email" class="form-control validate">
                            <label data-error="wrong" data-success="right" for="defaultForm-email">Выберите название подразделения</label>
                        </div>
                        <div class="md-form mb-4">
                            <i class="fas fa-lock prefix grey-text"></i>
                            <input type="password" id="defaultForm-pass" class="form-control validate">
                            <label data-error="wrong" data-success="right" for="defaultForm-pass">Введите название</label>
                        </div>
                    </div>
                   <button id="submit" class="main-btn" type="submit" value="add">Добавить</button>
                </div>
            </div>
        </section>

<!-- Scripts -->
    <script src="resources/js/jquery-3.3.1.min.js"></script>
    <script src="resources/js/jsplumb.js"></script>
    <script src="resources/js/front-jsplimb2.js"></script>
    <script src="resources/js/front-jsplimb-list2.js"></script>
    <script src="resources/js/bootstrap.js"></script>
    <script src="resources/js/popper.min.js"></script>
</body>
</html>
