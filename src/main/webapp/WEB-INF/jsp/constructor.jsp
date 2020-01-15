<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="fragments/header.jsp"/>
<main>
    <div class="container-fluid mb-4">
        <div class="card">
            <div class="card-body">
                <div class="container-fluid">
                    <form class="mb-3">
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
        $('#constructor').addClass('active');

        // Радио кнопки верх
        $('#process').on('click', function() {
            $(this).removeClass('btn-outline-mdb-color').addClass('btn-mdb-color');
            $('#project, #instruction').removeClass('btn-mdb-color').addClass('btn-outline-mdb-color');
            $('#launch').attr('href','process');
        });

        $('#project').on('click', function() {
            $(this).removeClass('btn-outline-mdb-color').addClass('btn-mdb-color');
            $('#process, #instruction').removeClass('btn-mdb-color').addClass('btn-outline-mdb-color');
            $('#launch').attr('href','project');
        });

        $('#instruction').on('click', function() {
            $(this).removeClass('btn-outline-mdb-color').addClass('btn-mdb-color');
            $('#process, #project').removeClass('btn-mdb-color').addClass('btn-outline-mdb-color');
            $('#launch').attr('href','instruction');
        });

        // Радио кнопки низ
        $('#processBtn').on('click', function() {
            $(this).removeClass('btn-outline-mdb-color').addClass('btn-mdb-color');
            $('#projectBtn, #instructionBtn').removeClass('btn-mdb-color').addClass('btn-outline-mdb-color');
        });

        $('#projectBtn').on('click', function() {
            $(this).removeClass('btn-outline-mdb-color').addClass('btn-mdb-color');
            $('#processBtn, #instructionBtn').removeClass('btn-mdb-color').addClass('btn-outline-mdb-color');
        });

        $('#instructionBtn').on('click', function() {
            $(this).removeClass('btn-outline-mdb-color').addClass('btn-mdb-color');
            $('#processBtn, #projectBtn').removeClass('btn-mdb-color').addClass('btn-outline-mdb-color');
        });
    });
</script>
<jsp:include page="fragments/footerBasement.jsp"/>