<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="fragments/header.jsp"/>
<main>
    <div class="container-fluid mb-4">
        <div class="card">
            <div class="card-body">
                <div class="container-fluid">
                    <form class="mb-3">
                        <div class="alert alert-primary text-center mb-3">
                            <h4 class="mt-2">Конструктор / Инициирование процесса</h4>
                        </div>
                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="row d-flex align-items-center">
                                    <div class="col-md-2 mb-3"><i class="fas fa-book mr-2"></i>Каталог процессов</div>
                                    <div class="col-md-10 mb-3">
                                        <select class="chosen-select" id="functList" name="functList[]" data-placeholder="Выберите из справочника">
                                            <option value="" selected>Выберите из справочника</option>
                                            <option value="1">Процесс 1</option>
                                            <option value="2">Процесс 2</option>
                                            <option value="3">Процесс 3</option>
                                        </select>
                                    </div>
                                    <div class="col-md-2 mb-3"><i class="fas fa-thumbtack mr-2"></i>Уточняющие наименование</div>
                                    <div class="col-md-10 mb-3">
                                        <textarea class="form-control"></textarea>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <div class="row d-flex align-items-center">
                                            <div class="col-sm-4"><i class="fas fa-dumbbell mr-2"></i>Уровень сложности</div>
                                            <div class="col-sm-8"><span id="rateMe" class="empty-stars"></span></div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <a href="#" class="btn btn-sm btn-primary rounded"><i class="fas fa-users mr-2"></i>Назначение исполнителей</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="alert alert-secondary">Карта процесса</div>
                            </div>
                        </div>
                        <div class="container text-center my-3">
                            <div class="btn btn-success rounded m-3">Сформировать паспорт</div>
                            <div class="btn btn-primary rounded m-3">Запустить процесс</div>
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
        // Рейтинг звёздочки
        $('#rateMe').mdbRate();

        // Подсветка меню
        $('#constructor').addClass('active');

        // Радио кнопки
        $('#typeLeft').on('click', function() {
            $(this).removeClass('btn-outline-mdb-color').addClass('btn-mdb-color');
            $('#typeRight, #typeRight1').removeClass('btn-mdb-color').addClass('btn-outline-mdb-color');
        });

        $('#typeRight').on('click', function() {
            $(this).removeClass('btn-outline-mdb-color').addClass('btn-mdb-color');
            $('#typeLeft, #typeRight1').removeClass('btn-mdb-color').addClass('btn-outline-mdb-color');
        });

        $('#typeRight1').on('click', function() {
            $(this).removeClass('btn-outline-mdb-color').addClass('btn-mdb-color');
            $('#typeLeft, #typeRight').removeClass('btn-mdb-color').addClass('btn-outline-mdb-color');
        });
    });
</script>
<jsp:include page="fragments/footerBasement.jsp"/>