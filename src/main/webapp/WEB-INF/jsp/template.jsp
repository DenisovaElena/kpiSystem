<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="fragments/header.jsp"/>
<main>
    <div class="container-fluid mb-4">
        <div class="card">
            <div class="card-body">
                <div class="container-fluid">
                    <form class="mb-3">
                        <div class="alert alert-primary text-center mb-3">
                            <h4 class="mt-2">Задачи на исполнении</h4>
                        </div>
                        <h6 class="mb-3">
                            Сортировка:
                            <div id="sortLeft"
                                 class="btn btn-sm btn-outline-mdb-color
                                ml-3 mr-1 rounded">
                                по дате постановки
                            </div>
                            <div id="sortRight"
                                 class="btn btn-sm btn-mdb-color rounded">
                                по дате контроля
                            </div>
                        </h6>
                        <div class="row">
                            <div class="col-8">
                                <div class="row mb-3 d-flex align-items-center">
                                    <div class="col-2">
                                        <h6>Задачи:</h6>
                                    </div>
                                    <div class="col-10">
                                        <select
                                                class="chosen-select"
                                                id="taskList" name="taskList[]"
                                                data-placeholder="Выберите из справочника" multiple>
                                            <%--<option value="" selected>Выбрать </option>--%>
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
                                        <div id="typeLeft"
                                             class="btn btn-sm btn-outline-mdb-color ml-0 mr-1 rounded">
                                            Процесс
                                        </div>
                                        <div id="typeRight"
                                             class="btn btn-sm btn-mdb-color rounded">
                                            Проект
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-3 d-flex align-items-center">
                                    <div class="col-2">
                                        <h6>Функции:</h6>
                                    </div>
                                    <div class="col-10">
                                        <select
                                                class="chosen-select"
                                                id="functList" name="functList[]"
                                                data-placeholder="Выберите из справочника" multiple>
                                            <%--<option value="" selected>Выбрать </option>--%>
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
                        </div>
                    </form>
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="row d-flex align-items-center">
                                <div class="col-2 border-right text-center">
                                    <h3>
                                        <span class="badge badge-pill mdb-color">1</span>
                                    </h3>
                                    <p>
                                        Тип: <strong class="text-dark">процесс</strong>
                                    </p>
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
                                    <p>
                                        Дата постановки:<br>
                                        <strong class="text-dark">10.01.2020</strong>
                                    </p>
                                    <p>
                                        Дата контроля:<br>
                                        <strong class="text-dark">15.01.2020</strong>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="row d-flex align-items-center">
                                <div class="col-2 border-right text-center">
                                    <h3>
                                        <span class="badge badge-pill mdb-color">2</span>
                                    </h3>
                                    <p>
                                        Тип: <strong class="text-dark">процесс</strong>
                                    </p>
                                </div>
                                <div class="col-8 border-right">
                                    <h6 class="alert alert-secondary">
                                        <div class="mb-2">
                                            Наименование: <strong
                                                сlass="ml-2">Задача 2.3.
                                            Рассылка информационных
                                            писем</strong>
                                        </div>
                                        <div>
                                            Функция: <strong
                                                сlass="ml-2">Согласование
                                        </strong>
                                        </div>
                                    </h6>
                                </div>
                                <div class="col-2 text-center">
                                    <p>
                                        Дата постановки:<br>
                                        <strong class="text-dark">17.01
                                            .2020</strong>
                                    </p>
                                    <p>
                                        Дата контроля:<br>
                                        <strong class="text-dark">20.01
                                            .2020</strong>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="row d-flex align-items-center">
                                <div class="col-2 border-right text-center">
                                    <h3>
                                        <span
                                                class="badge badge-pill mdb-color">3</span>
                                    </h3>
                                    <p>
                                        Тип: <strong class="text-dark">проект
                                    </strong>
                                    </p>
                                </div>
                                <div class="col-8 border-right">
                                    <h6 class="alert alert-secondary">
                                        <div class="mb-2">
                                            Наименование: <strong
                                                сlass="ml-2">Задача 3.1.
                                            Подготовка статистической
                                            отчётности</strong>
                                        </div>
                                        <div>
                                            Функция: <strong
                                                сlass="ml-2">Исполнение
                                        </strong>
                                        </div>
                                    </h6>
                                </div>
                                <div class="col-2 text-center">
                                    <p>
                                        Дата постановки:<br>
                                        <strong class="text-dark">02.01
                                            .2020</strong>
                                    </p>
                                    <p>
                                        Дата контроля:<br>
                                        <strong class="text-dark">09.01
                                            .2020</strong>
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
        $('#sortLeft').on('click', function() {
            $(this).removeClass('btn-mdb-color').addClass('btn-outline-mdb-color');
            $('#sortRight').removeClass('btn-outline-mdb-color').addClass('btn-mdb-color');
        });

        $('#sortRight').on('click', function() {
            $(this).removeClass('btn-mdb-color').addClass('btn-outline-mdb-color');
            $('#sortLeft').removeClass('btn-outline-mdb-color').addClass('btn-mdb-color');
        });

        $('.demo').datepicker({
            format: 'mm/dd/yyyy',
            language: 'ru',
            weekStart: 1,
            multidate: true,
            todayHighlight: true
        });

        var arrayDate = (['01/09/2020', '01/15/2020', '01/20/2020']);
        $('.demo').datepicker('setDates', arrayDate);


        $(".chosen-select").chosen({
            width: "100%",
            no_results_text: "Ничего не найдено!"
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