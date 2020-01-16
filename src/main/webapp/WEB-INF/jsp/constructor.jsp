<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="fragments/header.jsp"/>
<main>
    <div class="container-fluid mb-4">
        <div class="card">
            <div class="card-body">
                <div class="container-fluid">
                    <%--<form class="mb-3">
                        <div class="alert alert-primary text-center mb-3">
                            <h4 class="mt-2">Конструктор</h4>
                        </div>
                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="alert alert-secondary mb-3">Создать проект/процесс/поручение</div>
                                <div class="row d-flex align-items-center">
                                    <div class="col-md-4 mb-3">
                                        <div id="process" class="btn btn-sm btn-mdb-color rounded">Процесс</div>
                                        <div id="project" class="btn btn-sm btn-outline-mdb-color rounded">Проект</div>
                                        <div id="instruction" class="btn btn-sm btn-outline-mdb-color rounded">Поручение</div>
                                    </div>
                                    <div class="col-md-8 mb-3">
                                        <a href="process" class="btn btn-primary btn-sm rounded" id="launch"><i class="far fa-hand-point-down mr-2"></i>Инициативный запуск</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="alert alert-secondary mb-3">Шаблон проекта/процесса/поручения</div>
                                <div class="row d-flex align-items-center">
                                    <div class="col-md-4 mb-3">
                                        <div id="processBtn" class="btn btn-sm btn-mdb-color rounded" data-link="process">Процесс</div>
                                        <div id="projectBtn" class="btn btn-sm btn-outline-mdb-color rounded" data-link="project">Проект</div>
                                        <div id="instructionBtn" class="btn btn-sm btn-outline-mdb-color rounded" data-link="instruction">Поручение</div>
                                    </div>
                                    <div class="col-md-5 mb-3">
                                        <select class="chosen-select" id="functList" name="functList[]" data-placeholder="Выберите из справочника">
                                            <option value="" selected>Выберите из справочника</option>
                                            <option value="1">Каталог процессов</option>
                                            <option value="2">Каталог проектов</option>
                                            <option value="3">Каталог поручений</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <a href="#" class="btn btn-primary btn-sm rounded"><i class="fas fa-pencil-alt mr-2"></i>Внести изменения</a>
                                        <button class="btn btn-sm btn-danger rounded"><i class="far fa-trash-alt mr-2"></i>Удалить</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>--%>
                    <form class="mb-3">
                        <div class="alert alert-primary text-center mb-3">
                            <h4 class="mt-2" id="headTitle">Конструктор</h4>
                        </div>
                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="row d-flex align-items-center">
                                    <div class="col-md-3">
                                        <a href="#" class="btn btn-primary btn-sm rounded" id="newBtn">Создать новый</a>
                                    </div>
                                    <div class="col-md-9">
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
                                        <%--<div class="row mb-3">
                                            <div class="col-2">
                                                <h6>Тип:</h6>
                                            </div>
                                            <div class="col-10">
                                                <select class="chosen-select" id="optionList" name="optionList[]" data-placeholder="Выберите из справочника" multiple>
                                                    <option value="" selected>Выбрать </option>
                                                    <option value="1" selected>Проект</option>
                                                    <option value="2" selected>Процесс</option>
                                                    <option value="3" selected>Поручение</option>
                                                </select>
                                            </div>
                                        </div>--%>
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
                                </div>
                            </div>
                        </div>
                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="row d-flex align-items-center">
                                    <div class="col-md-1 mb-3">
                                        <h3><span class="badge badge-pill mdb-color">1</span></h3>
                                    </div>
                                    <div class="col-md-8 mb-3">
                                        <h6 class="alert alert-secondary">
                                            <div class="mb-2">
                                                Наименование: <strong сlass="ml-2">Разработка технологической документации</strong>
                                            </div>
                                            <div>
                                                Функция: <strong сlass="ml-2">Разработка проекта</strong>
                                            </div>
                                        </h6>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <a href="#" class="btn btn-primary btn-sm rounded"><i class="fas fa-pencil-alt mr-2"></i>Изменить</a>
                                        <button class="btn btn-sm btn-danger rounded"><i class="far fa-trash-alt mr-2"></i>Удалить</button>
                                    </div>
                                </div>
                                <div class="row d-flex align-items-center">
                                    <div class="col-md-1 mb-3">
                                        <h3><span class="badge badge-pill mdb-color">2</span></h3>
                                    </div>
                                    <div class="col-md-8 mb-3">
                                        <h6 class="alert alert-secondary">
                                            <div class="mb-2">
                                                Наименование: <strong сlass="ml-2">Разработка технологической документации</strong>
                                            </div>
                                            <div>
                                                Функция: <strong сlass="ml-2">Разработка проекта</strong>
                                            </div>
                                        </h6>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <a href="#" class="btn btn-primary btn-sm rounded"><i class="fas fa-pencil-alt mr-2"></i>Изменить</a>
                                        <button class="btn btn-sm btn-danger rounded"><i class="far fa-trash-alt mr-2"></i>Удалить</button>
                                    </div>
                                </div>
                                <div class="row d-flex align-items-center">
                                    <div class="col-md-1 mb-3">
                                        <h3><span class="badge badge-pill mdb-color">3</span></h3>
                                    </div>
                                    <div class="col-md-8 mb-3">
                                        <h6 class="alert alert-secondary">
                                            <div class="mb-2">
                                                Наименование: <strong сlass="ml-2">Разработка технологической документации</strong>
                                            </div>
                                            <div>
                                                Функция: <strong сlass="ml-2">Разработка проекта</strong>
                                            </div>
                                        </h6>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <a href="#" class="btn btn-primary btn-sm rounded"><i class="fas fa-pencil-alt mr-2"></i>Изменить</a>
                                        <button class="btn btn-sm btn-danger rounded"><i class="far fa-trash-alt mr-2"></i>Удалить</button>
                                    </div>
                                </div>
                                <div class="row d-flex align-items-center">
                                    <div class="col-md-1 mb-3">
                                        <h3><span class="badge badge-pill mdb-color">4</span></h3>
                                    </div>
                                    <div class="col-md-8 mb-3">
                                        <h6 class="alert alert-secondary">
                                            <div class="mb-2">
                                                Наименование: <strong сlass="ml-2">Разработка технологической документации</strong>
                                            </div>
                                            <div>
                                                Функция: <strong сlass="ml-2">Разработка проекта</strong>
                                            </div>
                                        </h6>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <a href="#" class="btn btn-primary btn-sm rounded"><i class="fas fa-pencil-alt mr-2"></i>Изменить</a>
                                        <button class="btn btn-sm btn-danger rounded"><i class="far fa-trash-alt mr-2"></i>Удалить</button>
                                    </div>
                                </div>
                                <div class="row d-flex align-items-center">
                                    <div class="col-md-1 mb-3">
                                        <h3><span class="badge badge-pill mdb-color">5</span></h3>
                                    </div>
                                    <div class="col-md-8 mb-3">
                                        <h6 class="alert alert-secondary">
                                            <div class="mb-2">
                                                Наименование: <strong сlass="ml-2">Разработка технологической документации</strong>
                                            </div>
                                            <div>
                                                Функция: <strong сlass="ml-2">Разработка проекта</strong>
                                            </div>
                                        </h6>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <a href="#" class="btn btn-primary btn-sm rounded"><i class="fas fa-pencil-alt mr-2"></i>Изменить</a>
                                        <button class="btn btn-sm btn-danger rounded"><i class="far fa-trash-alt mr-2"></i>Удалить</button>
                                    </div>
                                </div>
                                <div class="row d-flex align-items-center">
                                    <div class="col-md-1 mb-3">
                                        <h3><span class="badge badge-pill mdb-color">6</span></h3>
                                    </div>
                                    <div class="col-md-8 mb-3">
                                        <h6 class="alert alert-secondary">
                                            <div class="mb-2">
                                                Наименование: <strong сlass="ml-2">Разработка технологической документации</strong>
                                            </div>
                                            <div>
                                                Функция: <strong сlass="ml-2">Разработка проекта</strong>
                                            </div>
                                        </h6>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <a href="#" class="btn btn-primary btn-sm rounded"><i class="fas fa-pencil-alt mr-2"></i>Изменить</a>
                                        <button class="btn btn-sm btn-danger rounded"><i class="far fa-trash-alt mr-2"></i>Удалить</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<jsp:include page="fragments/footerNew.jsp"/>
<jsp:include page="fragments/footerScriptNew.jsp"/>
<script>
    $(function() {
        // Подсветка меню
        var page = getId('id');
        $('#constructor').addClass('active');
        $('#'+page).addClass('activeMenu');

        // Данные страницы процессов
        if(page == 'process') {
            $('#headTitle').html('Процессы');
            $('#newBtn').html('Создать новый процесс').attr('href','process');
        }

        // Данные страницы проектов
        if(page == 'project') {
            $('#headTitle').html('Проекты');
            $('#newBtn').html('Создать новый проект').attr('href','project');
        }

        // Данные страницы поручений
        if(page == 'instruction') {
            $('#headTitle').html('Поручения');
            $('#newBtn').html('Создать новое поручение').attr('href','instruction');
        }

    });
</script>
<jsp:include page="fragments/footerBasement.jsp"/>