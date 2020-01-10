<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>KPI</title>
    <link href="resources/img/favicon.ico" rel="icon" type="image/x-icon">
    <link href="resources/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
    <link rel="stylesheet" href="resources/css/index.css">
</head>
<body id="customSkin" class="fixed-sn dark-skin">

<header>
    <div id="slide-out" class="side-nav fixed">
        <ul class="custom-scrollbar">
            <li>
                <form class="search-form" role="search">
                    <div class="md-form mt-0 pt-1 waves-light">
                        <%--<input type="text" class="form-control" placeholder="Поиск по документам">--%>
                        <input type="text" class="form-control" disabled>
                    </div>
                </form>
            </li>
            <li>
                <ul class="collapsible collapsible-accordion">
                    <li class="active">
                        <a class="collapsible-header waves-effect arrow-r active">
                            <i class="fa fa-edit mr-2"></i>
                            Задачи<span class="badge badge-pill badge-primary ml-2 agreementSum"></span>
                            <i class="fas fa-angle-down rotate-icon"></i>
                        </a>
                        <div class="collapsible-body">
                            <ul class="list-unstyled">
                                <li>
                                    <a href="#" class="waves-effect">
                                        На исполнении
                                        <span class="badge badge-pill badge-primary ml-2 agreementSum">
                                            5
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="waves-effect">
                                        Инициативный запуск
                                    </a>
                                </li>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a class="collapsible-header waves-effect arrow-r" href="#">
                            <i class="fas fa-project-diagram mr-2"></i>
                            Конструктор процессов/проектов
                        </a>
                    </li>
                    <li>
                        <a class="collapsible-header waves-effect arrow-r" href="#">
                            <i class="fas fa-sitemap mr-2"></i>
                            Орг. структура
                        </a>
                    </li>
                    <li>
                        <a class="collapsible-header waves-effect arrow-r" href="#">
                            <i class="fas fa-bullseye mr-2"></i>
                            Цели и задачи
                        </a>
                    </li>
                    <li>
                        <a class="collapsible-header waves-effect arrow-r" href="#">
                            <i class="fas fa-chart-line mr-2"></i>
                            Анализ функций
                        </a>
                    </li>
                    <li>
                        <a class="collapsible-header waves-effect arrow-r" href="#">
                            <i class="fas fa-file-alt mr-2"></i>
                            Отчёты и документы
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
        <div class="sidenav-bg mask-strong"></div>
    </div>
    <!--Навигация-->
    <nav class="navbar fixed-top navbar-toggleable-md navbar-expand-lg scrolling-navbar double-nav black white-text">
        <div class="float-left">
            <a href="#" data-activates="slide-out" class="button-collapse"><i class="fas fa-bars"></i></a>
        </div>
        <a class="navbar-brand ml-3" href="index">
            <img src="resources/img/Logo.png" height="30" alt="Логотип">
        </a>
        <span class="breadcrumb-dn mr-auto">
            <h6 class="mt-2">АИС "Ключевые показатели эффективности"</h6>
        </span>
        <ul class="nav navbar-nav nav-flex-icons ml-auto">
            <%--<li class="nav-item">
                <a class="nav-link" data-toggle="modal" data-target="#helpBlock"><i class="far fa-question-circle mr-2"></i><span class="clearfix d-none d-sm-inline-block mr-3">Поддержка</span></a>
            </li>--%>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false"><i class="fas fa-user mr-2"></i><span id="templateUser"><sec:authentication property="principal.username"/></span>
                </a>
                <div id="currentUser" class="fontSmall"></div>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                    <form:form id="form-logout" class="dropdown-item" action="logout" method="post">
                    <span type="submit" onclick="document.forms['form-logout'].submit();">
                        <i class="fas fa-sign-out-alt"></i> <spring:message code="app.quit"/>
                    </span>
                    </form:form>
                </div>
            </li>
        </ul>
    </nav>
</header>