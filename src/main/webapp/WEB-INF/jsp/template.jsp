<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="fragments/header.jsp"/>
<main>
    <div class="container-fluid mb-4">
        <div class="card">
            <div class="card-body">
                <div class="container-fluid">
                    <form class="mb-3">
                        <div class="alert alert-primary text-center mb-3">
                            <h4 class="mt-2">Мои задачи</h4>
                        </div>
                        Сортировать:
                        <div id="sortLeft" class="btn btn-sm btn-outline-mdb-color ml-3 mr-1 rounded">
                            <i id="sortLeftIconUp" data-sort="1" class="fas fa-sort-amount-down-alt mr-2 d-inline active"></i>
                            <i id="sortLeftIconDown" data-sort="2" class="fas fa-sort-amount-up-alt mr-2 d-none no-active"></i>
                            по дате постановки
                        </div>
                        <div id="sortRight" class="btn btn-sm btn-mdb-color rounded">
                            <i id="sortRightIconUp" data-sort="1" class="fas fa-sort-amount-down-alt mr-2 d-inline active"></i>
                            <i id="sortRightIconDown" data-sort="2" class="fas fa-sort-amount-up-alt mr-2 d-none no-active"></i>
                            по дате контроля
                        </div>
                        <div id="filterBtn" class="btn btn-sm btn-mdb-color rounded float-md-right">
                            <i class="fas fa-filter mr-2"></i>Фильтрация
                        </div>
                        <div class="col-12 d-none mt-3" id="filterBlock">
                            <div class="row mb-2 d-flex align-items-center">
                                <div class="col-2">
                                    <h6>Задачи:</h6>
                                </div>
                                <div class="col-10">
                                    <select class="chosen-select" id="taskList" name="taskList[]" data-placeholder="Выберите из справочника" multiple>
                                        <%--<option value="">Выбрать </option>--%>
                                        <option value="11" >Задача 1.1</option>
                                        <option value="12">Задача 1.2</option>
                                        <option value="13">Задача 1.3</option>
                                        <option value="14">Задача 1.4</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row mb-2 d-flex align-items-center">
                                <div class="col-2">
                                    <h6>Тип:</h6>
                                </div>
                                <div class="col-10">
                                    <select class="chosen-select" id="optionList" name="optionList[]" data-placeholder="Выберите из справочника" multiple>
                                        <option value="1">Проект</option>
                                        <option value="2">Процесс</option>
                                        <option value="3">Поручение</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row mb-2 d-flex align-items-center">
                                <div class="col-2">
                                    <h6>Функции:</h6>
                                </div>
                                <div class="col-10">
                                    <select class="chosen-select" id="functList" name="functList[]" data-placeholder="Выберите из справочника" multiple>
                                        <%--<option value="">Выбрать </option>--%>
                                        <option value="1">Разработка проекта</option>
                                        <option value="2">Согласование</option>
                                        <option value="3">Исполнение</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <%--<div class="row">
                            <div class="col-8">
                                <div class="row mb-3 d-flex align-items-center">
                                    <div class="col-2">
                                        <h6>Задачи:</h6>
                                    </div>
                                    <div class="col-10">
                                        <select class="chosen-select" id="taskList" name="taskList[]" data-placeholder="Выберите из справочника" multiple>
                                            &lt;%&ndash;<option value="" selected>Выбрать </option>&ndash;%&gt;
                                            <option value="11" selected>Задача 1.1</option>
                                            <option value="12" selected>Задача 1.2</option>
                                            <option value="13" selected>Задача 1.3</option>
                                            <option value="14" selected>Задача 1.4</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-2">
                                        <h6>Тип:</h6>
                                    </div>
                                    <div class="col-10">
                                        <div id="typeLeft" class="btn btn-sm btn-outline-mdb-color ml-0 mr-1 rounded">
                                            Процесс
                                        </div>
                                        <div id="typeRight" class="btn btn-sm btn-mdb-color rounded">
                                            Проект
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-3 d-flex align-items-center">
                                    <div class="col-2">
                                        <h6>Функции:</h6>
                                    </div>
                                    <div class="col-10">
                                        <select class="chosen-select" id="functList" name="functList[]" data-placeholder="Выберите из справочника" multiple>
                                            &lt;%&ndash;<option value="" selected>Выбрать </option>&ndash;%&gt;
                                            <option value="1" selected>
                                                Разработка проекта
                                            </option>
                                            <option value="2" selected>
                                                Согласование
                                            </option>
                                            <option value="3" selected>
                                                Исполнение
                                            </option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="demo"></div>
                            </div>
                        </div>--%>
                    </form>
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="row d-flex align-items-center">
                                <div class="col-2 border-right text-center">
                                    <h3><span class="badge badge-pill mdb-color">1</span></h3>
                                    <p>Тип: <strong class="text-dark">процесс</strong></p>
                                </div>
                                <div class="col-8 border-right">
                                    <h6 class="alert alert-secondary">
                                        <div class="mb-2">
                                            Наименование: <strong сlass="ml-2">Задача 1.1. Разработка технологической документации</strong>
                                        </div>
                                        <div>
                                            Функция: <strong сlass="ml-2">Разработка проекта</strong>
                                        </div>
                                    </h6>
                                </div>
                                <div class="col-2 text-center">
                                    <p>Дата постановки:<br>
                                        <span class="text-muted">10.01.2020</span>
                                    </p>
                                    <p>Дата контроля:<br>
                                        <strong class="text-danger">15.01.2020</strong>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="row d-flex align-items-center">
                                <div class="col-2 border-right text-center">
                                    <h3><span class="badge badge-pill mdb-color">2</span></h3>
                                    <p>Тип: <strong class="text-dark">процесс</strong></p>
                                </div>
                                <div class="col-8 border-right">
                                    <h6 class="alert alert-secondary">
                                        <div class="mb-2">
                                            Наименование: <strong сlass="ml-2">Задача 1.1. Разработка технологической документации</strong>
                                        </div>
                                        <div>
                                            Функция: <strong сlass="ml-2">Разработка проекта</strong>
                                        </div>
                                    </h6>
                                </div>
                                <div class="col-2 text-center">
                                    <p>Дата постановки:<br>
                                        <span class="text-muted">10.01.2020</span>
                                    </p>
                                    <p>Дата контроля:<br>
                                        <strong class="text-danger">15.01.2020</strong>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="row d-flex align-items-center">
                                <div class="col-2 border-right text-center">
                                    <h3><span class="badge badge-pill mdb-color">3</span></h3>
                                    <p>Тип: <strong class="text-dark">процесс</strong></p>
                                </div>
                                <div class="col-8 border-right">
                                    <h6 class="alert alert-secondary">
                                        <div class="mb-2">
                                            Наименование: <strong сlass="ml-2">Задача 1.1. Разработка технологической документации</strong>
                                        </div>
                                        <div>
                                            Функция: <strong сlass="ml-2">Разработка проекта</strong>
                                        </div>
                                    </h6>
                                </div>
                                <div class="col-2 text-center">
                                    <p>Дата постановки:<br>
                                        <span class="text-muted">10.01.2020</span>
                                    </p>
                                    <p>Дата контроля:<br>
                                        <strong class="text-danger">15.01.2020</strong>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="row d-flex align-items-center">
                                <div class="col-2 border-right text-center">
                                    <h3><span class="badge badge-pill mdb-color">4</span></h3>
                                    <p>Тип: <strong class="text-dark">процесс</strong></p>
                                </div>
                                <div class="col-8 border-right">
                                    <h6 class="alert alert-secondary">
                                        <div class="mb-2">
                                            Наименование: <strong сlass="ml-2">Задача 1.1. Разработка технологической документации</strong>
                                        </div>
                                        <div>
                                            Функция: <strong сlass="ml-2">Разработка проекта</strong>
                                        </div>
                                    </h6>
                                </div>
                                <div class="col-2 text-center">
                                    <p>Дата постановки:<br>
                                        <span class="text-muted">10.01.2020</span>
                                    </p>
                                    <p>Дата контроля:<br>
                                        <strong class="text-danger">15.01.2020</strong>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="row d-flex align-items-center">
                                <div class="col-2 border-right text-center">
                                    <h3><span class="badge badge-pill mdb-color">5</span></h3>
                                    <p>Тип: <strong class="text-dark">процесс</strong></p>
                                </div>
                                <div class="col-8 border-right">
                                    <h6 class="alert alert-secondary">
                                        <div class="mb-2">
                                            Наименование: <strong сlass="ml-2">Задача 1.1. Разработка технологической документации</strong>
                                        </div>
                                        <div>
                                            Функция: <strong сlass="ml-2">Разработка проекта</strong>
                                        </div>
                                    </h6>
                                </div>
                                <div class="col-2 text-center">
                                    <p>Дата постановки:<br>
                                        <span class="text-muted">10.01.2020</span>
                                    </p>
                                    <p>Дата контроля:<br>
                                        <strong class="text-danger">15.01.2020</strong>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="row d-flex align-items-center">
                                <div class="col-2 border-right text-center">
                                    <h3><span class="badge badge-pill mdb-color">6</span></h3>
                                    <p>Тип: <strong class="text-dark">процесс</strong></p>
                                </div>
                                <div class="col-8 border-right">
                                    <h6 class="alert alert-secondary">
                                        <div class="mb-2">
                                            Наименование: <strong сlass="ml-2">Задача 1.1. Разработка технологической документации</strong>
                                        </div>
                                        <div>
                                            Функция: <strong сlass="ml-2">Разработка проекта</strong>
                                        </div>
                                    </h6>
                                </div>
                                <div class="col-2 text-center">
                                    <p>Дата постановки:<br>
                                        <span class="text-muted">10.01.2020</span>
                                    </p>
                                    <p>Дата контроля:<br>
                                        <strong class="text-danger">15.01.2020</strong>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<jsp:include page="fragments/footerNew.jsp"/>
<jsp:include page="fragments/footerScriptNew.jsp"/>
<script>
    $(function() {
        $('#myTasks').addClass('active');

        $('#sortLeft').on('click', function() {
            $(this).removeClass('btn-mdb-color').addClass('btn-outline-mdb-color');
            $('#sortRight').removeClass('btn-outline-mdb-color').addClass('btn-mdb-color');
        });

        $('#sortRight').on('click', function() {
            $(this).removeClass('btn-mdb-color').addClass('btn-outline-mdb-color');
            $('#sortLeft').removeClass('btn-outline-mdb-color').addClass('btn-mdb-color');
        });

        $('#typeLeft').on('click', function() {
            $(this).removeClass('btn-mdb-color').addClass('btn-outline-mdb-color');
            $('#typeRight').removeClass('btn-outline-mdb-color').addClass('btn-mdb-color');
        });

        $('#typeRight').on('click', function() {
            $(this).removeClass('btn-mdb-color').addClass('btn-outline-mdb-color');
            $('#typeLeft').removeClass('btn-outline-mdb-color').addClass('btn-mdb-color');
        });
    });
</script>
<jsp:include page="fragments/footerBasement.jsp"/>