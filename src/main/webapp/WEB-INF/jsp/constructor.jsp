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
                                    <div class="col-md-3 text-md-left text-center mb-3">
                                        <a href="#" class="btn btn-primary rounded" id="newBtn">Создать новый</a>
                                    </div>
                                    <div class="col-md-9 text-md-left text-center mb-3" id="tempLate">
                                        <div class="row d-flex align-items-center ml-md-5">
                                            <div class="col-md-12">
                                                <h6 class="alert activeMenu rounded" id="textTemplate">Шаблон проекта</h6>
                                            </div>
                                            <div class="col-md-7 mb-3">
                                                <select class="chosen-select" id="optionList" name="optionList[]" data-placeholder="Выберите из справочника">
                                                    <option value="" selected>Выберите из справочника</option>
                                                </select>
                                            </div>
                                            <div class="col-md-5 mb-3 text-md-center">
                                                <a href="#" class="btn btn-primary btn-sm rounded"><i class="fas fa-pencil-alt mr-2"></i>Внести изменения</a>
                                                <a href="#" class="btn btn-sm btn-danger rounded"><i class="far fa-trash-alt mr-2"></i>Удалить</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--<div class="card mb-3">
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
                        </div>--%>
                        <div class="card mb-3 d-none" id="elementBlock">
                            <div class="card-body">
                                <h5 class="alert alert-primary my-3">
                                    <span id="textTemplateElement" class="mr-2"></span>
                                    <strong id="elementName"></strong>
                                </h5>
                                <div class="alert alert-secondary mb-3">
                                    Цель:<strong class="ml-2" id="textTarget"></strong>
                                </div>
                                <div class="alert alert-secondary mb-3">
                                    Задача:<strong class="ml-2" id="textTask"></strong>
                                </div>
                                <div id="processCard">
                                    <div class="alert alert-secondary">
                                        <strong>Карта процесса</strong>
                                    </div>
                                    <img src="resources/img/diagramm.png" class="img-fluid rounded">
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
            $('#textTemplate').html('Управление шаблонами процессов');
            $('#textTemplateElement').html('Шаблон процесса:');
            $('#textTarget').html('Цель процесса');
            $('#textTask').html('Задача процесса');
            $('#newBtn').html('Создать новый процесс').attr('href','process');
            $('#optionList').append(
                '<option value="1">Процесс 1</option>' +
                '<option value="2">Процесс 2</option>' +
                '<option value="3">Процесс 3</option>'
            );
            $('#optionList').trigger("chosen:updated");
        }

        // Данные страницы проектов
        if(page == 'project') {
            $('#headTitle').html('Проекты');
            $('#textTemplate').html('Управление шаблонами проектов');
            $('#textTemplateElement').html('Шаблон проекта:');
            $('#textTarget').html('Цель проекта');
            $('#textTask').html('Задача проекта');
            $('#newBtn').html('Создать новый проект').attr('href','project');
            $('#optionList').append(
                '<option value="1">Проект 1</option>' +
                '<option value="2">Проект 2</option>' +
                '<option value="3">Проект 3</option>'
            );
            $('#optionList').trigger("chosen:updated");
        }

        // Данные страницы поручений
        if(page == 'instruction') {
            $('#headTitle').html('Поручения');
            $('#textTemplate').html('Управление шаблонами поручений');
            $('#textTemplateElement').html('Шаблон поручения:');
            $('#textTarget').html('Цель поручения');
            $('#textTask').html('Задача поручения');
            $('#newBtn').html('Создать новое поручение').attr('href','instruction');
            $('#optionList').append(
                '<option value="1">Поручение 1</option>' +
                '<option value="2">Поручение 2</option>' +
                '<option value="3">Поручение 3</option>'
            );
            $('#optionList').trigger("chosen:updated");
            $('#processCard').addClass('d-none');
        }

        // Показ данных элемента по выбору селекта
        $(document).on('change', '#optionList', function() {
            var element = $(this).val();
            if(element && element > 0) {
                $('#elementBlock').removeClass('d-none');
                var elementName = $('option:selected', this).html();
                $('#elementName').html(elementName);
            } else {
                $('#elementBlock').addClass('d-none');
            }
        });

    });
</script>
<jsp:include page="fragments/footerBasement.jsp"/>