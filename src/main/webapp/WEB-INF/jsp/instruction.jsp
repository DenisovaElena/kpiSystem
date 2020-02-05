<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="fragments/header.jsp"/>
<main>
    <div class="container-fluid mb-4">
        <div class="card">
            <div class="card-body">
                <div class="container-fluid">
                    <form class="mb-3">
                        <div class="alert alert-primary text-center mb-3">
                            <h4 class="mt-2">Инициирование поручения</h4>
                        </div>
                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="row d-flex align-items-center">
                                    <div class="col-md-3 mb-3"><i class="fas fa-user mr-2"></i>Ответсвенный</div>
                                    <div class="col-md-9 mb-3">
                                        <select class="chosen-select" id="userList" name="userList[]" data-placeholder="Выберите из справочника">
                                            <option value="" selected>Выберите из справочника</option>
                                            <option value="1">Исполнитель 1</option>
                                            <option value="2">Исполнитель 2</option>
                                            <option value="3">Исполнитель 3</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-bullseye mr-2"></i>Цель</div>
                                    <div class="col-md-9 mb-3">
                                        <select class="chosen-select" id="targetList" name="targetList[]" data-placeholder="Выберите из справочника">
                                            <option value="" selected>Выберите из справочника</option>
                                            <option value="1">Цель 1</option>
                                            <option value="2">Цель 2</option>
                                            <option value="3">Цель 3</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-tasks mr-2"></i>Задача</div>
                                    <div class="col-md-9 mb-3">
                                        <select class="chosen-select" id="taskList" name="taskList[]" data-placeholder="Выберите из справочника">
                                            <option value="" selected>Выберите из справочника</option>
                                            <option value="1">Задача 1</option>
                                            <option value="2">Задача 2</option>
                                            <option value="3">Задача 3</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-paperclip mr-2"></i>Действие</div>
                                    <div class="col-md-9 mb-3">
                                        <select class="chosen-select" id="actionList" name="actionList[]" data-placeholder="Выберите из справочника">
                                            <option value="" selected>Выберите из справочника</option>
                                            <option value="1">Разработать</option>
                                            <option value="2">Подготовить</option>
                                            <option value="3">Согласовать</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-file-alt mr-2"></i>Наименование</div>
                                    <div class="col-md-9 mb-3">
                                        <input class="form-control">
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-brain mr-2"></i>Конечный результат</div>
                                    <div class="col-md-9 mb-3">
                                        <select class="chosen-select" id="resultList" name="resultList[]" data-placeholder="Выберите из справочника">
                                            <option value="" selected>Выберите из справочника</option>
                                            <option value="1">Документ</option>
                                            <option value="2">ИАС</option>
                                            <option value="3">Продукт</option>
                                            <option value="4">Услуга</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="far fa-calendar-alt mr-2"></i>Сроки исполнения</div>
                                    <div class="col-md-9 mb-3">
                                        <input type="text" class="form-control demo" placeholder="Выберите дату">
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-balance-scale mr-2"></i>Показатели эффективности</div>
                                    <div class="col-md-9 mb-3">
                                        <div class="btn btn-sm btn-primary rounded ml-0"><i class="fas fa-plus mr-2"></i>Методика расчета</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="container text-center my-3">
                            <div class="btn btn-primary rounded m-3">Зарегистрировать поручение</div>
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
        $('#instruction').addClass('activeMenu');
        var namePageUp = $('#constructor').html();
        $('#namePage').html(namePageUp+'&nbsp;&mdash;&nbsp;'+'Новое поручение');
    });
</script>
<jsp:include page="fragments/footerBasement.jsp"/>