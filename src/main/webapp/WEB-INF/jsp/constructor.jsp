<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="fragments/header.jsp"/>
<main>
    <div class="container-fluid mb-4">
        <div class="card">
            <div class="card-body">
                <div class="container-fluid">
                    <form class="mb-3">
                        <div class="alert alert-primary text-center mb-3">
                            <div class="row d-flex align-items-center">
                                <div class="col-md-3 text-left">
                                    <a href="#" class="btn btn-primary rounded my-0" id="newBtn">Создать новый</a>
                                </div>
                                <div class="col-md-8 text-center">
                                    <h4 class="" id="headTitle"></h4>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="col-12">
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
                                            <div class="col-md-2 mb-2">
                                                <h6>Цели</h6>
                                            </div>
                                            <div class="col-md-10 mb-2">
                                                <select class="chosen-select" id="targetListAll" name="targetListAll[]" data-placeholder="Выберите из справочника" multiple>
                                                    <option value="1">Цель 1</option>
                                                    <option value="2">Цель 2</option>
                                                    <option value="3">Цель 3</option>
                                                </select>
                                            </div>
                                            <div class="col-md-2 mb-2">
                                                <h6>Задачи</h6>
                                            </div>
                                            <div class="col-md-10 mb-2">
                                                <select class="chosen-select" id="taskListAll" name="taskListAll[]" data-placeholder="Выберите из справочника" multiple>
                                                    <option value="11">Задача 1</option>
                                                    <option value="12">Задача 2</option>
                                                    <option value="13">Задача 3</option>
                                                    <option value="14">Задача 4</option>
                                                </select>
                                            </div>
                                            <div class="col-md-2 mb-2">
                                                <h6>Подразделения</h6>
                                            </div>
                                            <div class="col-md-10 mb-2">
                                                <select class="chosen-select" id="itemsListAll" name="itemsListAll[]" data-placeholder="Выберите из справочника" multiple>
                                                    <option value="1">Подразделение 1</option>
                                                    <option value="2">Подразделение 2</option>
                                                    <option value="3">Подразделение 3</option>
                                                </select>
                                            </div>
                                            <div class="col-md-2 mb-2">
                                                <h6 id="textTemplate">Подразделения:</h6>
                                            </div>
                                            <div class="col-md-10 mb-2">
                                                <select class="chosen-select" id="optionListAll" name="optionListAll[]" data-placeholder="Выберите из справочника">
                                                    <option value="">Выберите из справочника</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-3 elementList">
                            <div class="card-body">
                                <div class="alert alert-primary my-3">
                                    <div class="row d-flex align-items-center">
                                        <div class="col-md-6 text-left pt-1">
                                            <h5 class="elementName">
                                                <span class="badge badge-pill mdb-color mr-2">Р-СМК-ОП 3216546</span>
                                                Разработка технологической документации
                                            </h5>
                                        </div>
                                        <div class="col-md-6 text-md-right">
                                            <a href="#" class="btn btn-sm btn-success rounded my-0"><i class="fas fa-play mr-2"></i>Запустить</a>
                                            <a href="#" class="btn btn-sm btn-primary rounded my-0"><i class="fas fa-pencil-alt mr-2"></i>Внести изменения</a>
                                            <a href="#" class="btn btn-sm btn-danger rounded my-0"><i class="fas fa-trash mr-2"></i>Удалить</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="row d-flex align-items-center">
                                    <div class="col-md-10 mb-3">
                                        <h6 class="alert alert-secondary">
                                            <div class="mb-2">
                                                Цель: <strong сlass="ml-2">Разработка технологической документации</strong>
                                            </div>
                                            <div>
                                                Задача: <strong сlass="ml-2">Разработка проекта</strong>
                                            </div>
                                        </h6>
                                    </div>
                                    <div class="col-md-2 mb-3">
                                        <ul class="list-unstyled">
                                            <li>запущеных:<span class="badge badge-pill primary-color ml-2 float-right">28</span></li>
                                            <li>просроченных:<span class="badge badge-pill danger-color ml-2 float-right">6</span></li>
                                            <li>% исполнения:<span class="badge badge-pill mdb-color ml-2 float-right">95%</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-3 elementList">
                            <div class="card-body">
                                <div class="alert alert-primary my-3">
                                    <div class="row d-flex align-items-center">
                                        <div class="col-md-6 text-left pt-1">
                                            <h5 class="elementName">
                                                <span class="badge badge-pill mdb-color mr-2">Р-СМК-ОП 866546</span>
                                                Создание верной спецификации
                                            </h5>
                                        </div>
                                        <div class="col-md-6 text-md-right">
                                            <a href="#" class="btn btn-sm btn-success rounded my-0"><i class="fas fa-play mr-2"></i>Запустить</a>
                                            <a href="#" class="btn btn-primary btn-sm rounded my-0"><i class="fas fa-pencil-alt mr-2"></i>Внести изменения</a>
                                            <a href="#" class="btn btn-sm btn-danger rounded my-0"><i class="fas fa-trash mr-2"></i>Удалить</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="row d-flex align-items-center">
                                    <div class="col-md-10 mb-3">
                                        <h6 class="alert alert-secondary">
                                            <div class="mb-2">
                                                Цель: <strong сlass="ml-2">Разработка технологической документации</strong>
                                            </div>
                                            <div>
                                                Задача: <strong сlass="ml-2">Разработка проекта</strong>
                                            </div>
                                        </h6>
                                    </div>
                                    <div class="col-md-2 mb-3">
                                        <ul class="list-unstyled">
                                            <li>запущеных:<span class="badge badge-pill primary-color ml-2 float-right">128</span></li>
                                            <li>просроченных:<span class="badge badge-pill danger-color ml-2 float-right">4</span></li>
                                            <li>% исполнения:<span class="badge badge-pill mdb-color ml-2 float-right">90%</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-3 d-none" id="elementBlock">
                            <div class="card-body">
                                <%--<div class="alert alert-primary my-3">
                                    <div class="row d-flex align-items-center">
                                        <div class="col-md-6 text-left">
                                            <h5 class="" id="elementName"></h5>
                                        </div>
                                        <div class="col-md-6 text-md-right">
                                            <a href="#" class="btn btn-sm btn-success rounded my-0"><i class="fas fa-play mr-2"></i>Запустить</a>
                                            <a href="#" class="btn btn-primary btn-sm rounded my-0"><i class="fas fa-pencil-alt mr-2"></i>Внести изменения</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="row d-flex align-items-center" id="projectBlock">
                                    <div class="col-md-3 mb-3"><i class="fas fa-bullseye mr-2"></i>Цель</div>
                                    <div class="col-md-9 mb-3">
                                        <select class="chosen-select other disableElem" data-placeholder="Выберите из справочника" disabled>
                                            <option value="">Выберите из справочника</option>
                                            <option value="1" selected>Цель 1</option>
                                            <option value="2">Цель 2</option>
                                            <option value="3">Цель 3</option>
                                            <option value="0">Иное</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-tasks mr-2"></i>Задача</div>
                                    <div class="col-md-9 mb-3">
                                        <select class="chosen-select other disableElem" data-placeholder="Выберите из справочника" disabled>
                                            <option value="">Выберите из справочника</option>
                                            <option value="1">Задача 1</option>
                                            <option value="2" selected>Задача 2</option>
                                            <option value="3">Задача 3</option>
                                            <option value="0">Иное</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-file-alt mr-2"></i>Цель проекта</div>
                                    <div class="col-md-9 mb-3">
                                        <input class="form-control disableElem" value="Наименование цели проекта" disabled>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-brain mr-2"></i>Конечный результат</div>
                                    <div class="col-md-9 mb-3">
                                        <select class="chosen-select disableElem" data-placeholder="Выберите из справочника" disabled>
                                            <option value="">Выберите из справочника</option>
                                            <option value="1">Документ</option>
                                            <option value="2">ИАС</option>
                                            <option value="3" selected>Продукт</option>
                                            <option value="4">Услуга</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="far fa-calendar-alt mr-2"></i>Сроки исполнения</div>
                                    <div class="col-md-9 mb-3">
                                        <input type="text" class="form-control demo disableElem" placeholder="Выберите дату" value="15.05.2020" disabled>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-exclamation mr-2"></i>Риски</div>
                                    <div class="col-md-9 mb-3">
                                        <select class="chosen-select other disableElem" data-placeholder="Выберите из справочника" disabled>
                                            <option value="">Выберите из справочника</option>
                                            <option value="1">Риск 1</option>
                                            <option value="2">Риск 2</option>
                                            <option value="3">Риск 3</option>
                                            <option value="0" selected>Иное</option>
                                        </select>
                                        <textarea class="form-control disableElem" disabled>Наименование рисков не из справочника</textarea>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-balance-scale mr-2"></i>Показатели эффективности</div>
                                    <div class="col-md-9 mb-3">
                                        <div class="btn btn-sm btn-primary rounded ml-0"><i class="fas fa-plus mr-2"></i>Методика расчета</div>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-users mr-2"></i>Заинтересованные стороны</div>
                                    <div class="col-md-9 mb-3">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="row align-items-center">
                                                    <div class="col-md-auto">Потребители</div>
                                                    <div class="col-md-auto">
                                                        <select class="chosen-select w-100 disableElem" data-placeholder="Выберите из справочника" disabled>
                                                            <option value="">Выберите из справочника</option>
                                                            <option value="1">Потребитель 1</option>
                                                            <option value="2" selected>Потребитель 2</option>
                                                            <option value="3">Потребитель 3</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="row align-items-center">
                                                    <div class="col-md-auto">Поставщики</div>
                                                    <div class="col-md-auto">
                                                        <select class="chosen-select w-100 disableElem" data-placeholder="Выберите из справочника" disabled>
                                                            <option value="">Выберите из справочника</option>
                                                            <option value="1">Поставщик, длинное название</option>
                                                            <option value="2" selected>Поставщик 2</option>
                                                            <option value="3">Поставщик 3</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-ruble-sign mr-2"></i>Бюджет</div>
                                    <div class="col-md-auto mb-3 d-flex align-items-center">
                                        <input class="form-control disableElem" value="360" disabled>
                                        <div class="ml-3">млн.&nbsp;руб.</div>
                                    </div>
                                </div>
                                <div class="row d-flex align-items-center" id="processBlock">
                                    <div class="col-md-3 mb-3"><i class="fas fa-book mr-2"></i>Каталог процессов</div>
                                    <div class="col-md-9 mb-3">
                                        <select class="chosen-select" data-placeholder="Выберите из справочника" disabled>
                                            <option value="">Выберите из справочника</option>
                                            <option value="1">Процесс 1</option>
                                            <option value="2">Процесс 2</option>
                                            <option value="3" selected>Процесс 3</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-bullseye mr-2"></i>Цель</div>
                                    <div class="col-md-9 mb-3" id="targetListBlock">
                                        <select class="chosen-select other" data-placeholder="Выберите из справочника" disabled>
                                            <option value="">Выберите из справочника</option>
                                            <option value="1">Цель 1</option>
                                            <option value="2" selected>Цель 2</option>
                                            <option value="3">Цель 3</option>
                                            <option value="0">Иное</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-tasks mr-2"></i>Задача</div>
                                    <div class="col-md-9 mb-3" id="taskListBlock">
                                        <select class="chosen-select other" data-placeholder="Выберите из справочника" disabled>
                                            <option value="">Выберите из справочника</option>
                                            <option value="1">Задача 1</option>
                                            <option value="2">Задача 2</option>
                                            <option value="3">Задача 3</option>
                                            <option value="0" selected>Иное</option>
                                        </select>
                                        <textarea class="form-control" disabled>Наименование задачи не из справочника</textarea>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-file-alt mr-2"></i>Цель проекта</div>
                                    <div class="col-md-9 mb-3">
                                        <input class="form-control" value="Наименование цели" disabled>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-brain mr-2"></i>Конечный результат</div>
                                    <div class="col-md-9 mb-3">
                                        <select class="chosen-select" data-placeholder="Выберите из справочника" disabled>
                                            <option value="">Выберите из справочника</option>
                                            <option value="1" selected>Документ</option>
                                            <option value="2">ИАС</option>
                                            <option value="3">Продукт</option>
                                            <option value="4">Услуга</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="far fa-calendar-alt mr-2"></i>Сроки исполнения</div>
                                    <div class="col-md-9 mb-3">
                                        <input type="text" class="form-control demo" placeholder="Выберите дату" value="23.03.2020" disabled>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-exclamation mr-2"></i>Риски</div>
                                    <div class="col-md-9 mb-3">
                                        <select class="chosen-select other" data-placeholder="Выберите из справочника" disabled>
                                            <option value="">Выберите из справочника</option>
                                            <option value="1">Риск 1</option>
                                            <option value="2">Риск 2</option>
                                            <option value="3" selected>Риск 3</option>
                                            <option value="0">Иное</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-balance-scale mr-2"></i>Показатели эффективности</div>
                                    <div class="col-md-9 mb-3">
                                        <div class="btn btn-sm btn-primary rounded ml-0"><i class="fas fa-plus mr-2"></i>Методика расчета</div>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-users mr-2"></i>Заинтересованные стороны</div>
                                    <div class="col-md-9 mb-3">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="row align-items-center">
                                                    <div class="col-md-4 mb-3">Потребители</div>
                                                    <div class="col-md-8 mb-3">
                                                        <select class="chosen-select w-100" data-placeholder="Выберите из справочника" disabled>
                                                            <option value="">Выберите из справочника</option>
                                                            <option value="1">Потребитель 1</option>
                                                            <option value="2" selected>Потребитель 2</option>
                                                            <option value="3">Потребитель 3</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="row align-items-center">
                                                    <div class="col-md-4 mb-3">Поставщики</div>
                                                    <div class="col-md-8 mb-3">
                                                        <select class="chosen-select w-100" data-placeholder="Выберите из справочника" disabled>
                                                            <option value="">Выберите из справочника</option>
                                                            <option value="1" selected>Поставщик 1</option>
                                                            <option value="2">Поставщик 2</option>
                                                            <option value="3">Поставщик 3</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-ruble-sign mr-2"></i>Бюджет</div>
                                    <div class="col-md-3 mb-3 d-flex align-items-center">
                                        <input class="form-control" value="23" disabled>
                                        <div class="ml-3">млн.&nbsp;руб.</div>
                                    </div>
                                    <div class="col-md-6">&nbsp;</div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-thumbtack mr-2"></i>Уточняющие наименование</div>
                                    <div class="col-md-9 mb-3">
                                        <textarea class="form-control" disabled>Текст уточняющего наименования</textarea>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <div class="row d-flex align-items-center">
                                            <div class="col-sm-4"><i class="fas fa-dumbbell mr-2"></i>Уровень сложности</div>
                                            <div class="col-sm-8">
                                                <div class="container mdb-rating">
                                                    <span id="rateMe" class="empty-stars"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <a href="#" class="btn btn-sm btn-primary rounded"><i class="fas fa-users mr-2"></i>Назначение исполнителей</a>
                                    </div>
                                </div>
                                <div class="row d-flex align-items-center" id="instructionBlock">
                                    <div class="col-md-3 mb-3"><i class="fas fa-user mr-2"></i>Ответсвенный</div>
                                    <div class="col-md-9 mb-3">
                                        <select class="chosen-select" data-placeholder="Выберите из справочника" disabled>
                                            <option value="">Выберите из справочника</option>
                                            <option value="1">Исполнитель 1</option>
                                            <option value="2" selected>Исполнитель 2</option>
                                            <option value="3">Исполнитель 3</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-bullseye mr-2"></i>Цель</div>
                                    <div class="col-md-9 mb-3">
                                        <select class="chosen-select" data-placeholder="Выберите из справочника" disabled>
                                            <option value="">Выберите из справочника</option>
                                            <option value="1">Цель 1</option>
                                            <option value="2" selected>Цель 2</option>
                                            <option value="3">Цель 3</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-tasks mr-2"></i>Задача</div>
                                    <div class="col-md-9 mb-3">
                                        <select class="chosen-select" data-placeholder="Выберите из справочника" disabled>
                                            <option value="">Выберите из справочника</option>
                                            <option value="1">Задача 1</option>
                                            <option value="2">Задача 2</option>
                                            <option value="3" selected>Задача 3</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-paperclip mr-2"></i>Действие</div>
                                    <div class="col-md-9 mb-3">
                                        <select class="chosen-select" data-placeholder="Выберите из справочника" disabled>
                                            <option value="">Выберите из справочника</option>
                                            <option value="1">Разработать</option>
                                            <option value="2" selected>Подготовить</option>
                                            <option value="3">Согласовать</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-file-alt mr-2"></i>Наименование</div>
                                    <div class="col-md-9 mb-3">
                                        <input class="form-control" value="Название наименования" disabled>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-brain mr-2"></i>Конечный результат</div>
                                    <div class="col-md-9 mb-3">
                                        <select class="chosen-select" data-placeholder="Выберите из справочника" disabled>
                                            <option value="">Выберите из справочника</option>
                                            <option value="1">Документ</option>
                                            <option value="2" selected>ИАС</option>
                                            <option value="3">Продукт</option>
                                            <option value="4">Услуга</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="far fa-calendar-alt mr-2"></i>Сроки исполнения</div>
                                    <div class="col-md-9 mb-3">
                                        <input type="text" class="form-control demo" placeholder="Выберите дату" disabled value="20.02.2020">
                                    </div>
                                    <div class="col-md-3 mb-3"><i class="fas fa-balance-scale mr-2"></i>Показатели эффективности</div>
                                    <div class="col-md-9 mb-3">
                                        <div class="btn btn-sm btn-primary rounded ml-0"><i class="fas fa-plus mr-2"></i>Методика расчета</div>
                                    </div>
                                </div>--%>
                                <%--<div id="processCard">
                                    <div class="alert alert-secondary">
                                        <strong>Карта процесса</strong>
                                    </div>
                                    <img src="resources/img/diagramm.png" class="img-fluid rounded">
                                </div>--%>
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="alert alert-primary my-3">
                                            <div class="row d-flex align-items-center">
                                                <div class="col-md-6 text-left pt-1">
                                                    <h5>
                                                        <span class="badge badge-pill mdb-color mr-2">Р-СМК-ОП 3216546</span>
                                                        <span id="elementName">Разработка технологической документации</span>
                                                    </h5>
                                                </div>
                                                <div class="col-md-6 text-md-right">
                                                    <a href="#" class="btn btn-sm btn-success rounded my-0"><i class="fas fa-play mr-2"></i>Запустить</a>
                                                    <a href="#" class="btn btn-primary btn-sm rounded my-0"><i class="fas fa-pencil-alt mr-2"></i>Внести изменения</a>
                                                    <a href="#" class="btn btn-sm btn-danger rounded my-0"><i class="fas fa-trash mr-2"></i>Удалить</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row d-flex align-items-center">
                                            <div class="col-md-10 mb-3">
                                                <h6 class="alert alert-secondary">
                                                    <div class="mb-2">
                                                        Цель: <strong сlass="ml-2">Разработка технологической документации</strong>
                                                    </div>
                                                    <div>
                                                        Задача: <strong сlass="ml-2">Разработка проекта</strong>
                                                    </div>
                                                </h6>
                                            </div>
                                            <div class="col-md-2 mb-3">
                                                <ul class="list-unstyled">
                                                    <li>запущеных:<span class="badge badge-pill primary-color ml-2 float-right">28</span></li>
                                                    <li>просроченных:<span class="badge badge-pill danger-color ml-2 float-right">6</span></li>
                                                    <li>% исполнения:<span class="badge badge-pill mdb-color ml-2 float-right">95%</span></li>
                                                </ul>
                                            </div>
                                        </div>
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
        var namePageUp = $('#constructor').html();
        var namePage = $('#'+page).html();
        $('#namePage').html(namePageUp+'&nbsp;&mdash;&nbsp;'+namePage);

        // Показ данных элемента по выбору селекта
        $(document).on('change', '#optionListAll', function() {
            var element = $(this).val();
            if(element && element > 0) {
                $('#elementBlock').removeClass('d-none');
                $('.elementList').addClass('d-none');
                var elementName = $('option:selected', this).html();
                $('#elementName').html(elementName);
            } else {
                $('#elementBlock').addClass('d-none');
                $('.elementList').removeClass('d-none');
            }
        });

        $('#rateMe .rate-popover').each(function() {
            var star = $(this).attr("data-index");
            if(star < 3) {
                $(this).addClass('fas threeStars');
            }
        });

        // Данные страницы процессов
        if(page == 'process') {
            $('#headTitle').html('Процессы');
            $('#textTemplate').html('Каталог процессов');
            $('#textTemplateElement').html('Шаблон процесса:');
            $('#textTarget').html('Цель процесса');
            $('#textTask').html('Задача процесса');
            $('#newBtn').html('Создать новый процесс').attr('href','process');
            $('#optionListAll').append(
                '<option value="1">Процесс 1</option>' +
                '<option value="2">Процесс 2</option>' +
                '<option value="3">Процесс 3</option>'
            );
            $('#optionListAll').trigger("chosen:updated");
            $('#processBlock').removeClass('d-none');
            $('#projectBlock').removeClass('d-flex').addClass('d-none');
            $('#instructionBlock').removeClass('d-flex').addClass('d-none');
        }

        // Данные страницы проектов
        if(page == 'project') {
            $('#headTitle').html('Проекты');
            $('#textTemplate').html('Каталог проектов');
            $('#textTemplateElement').html('Шаблон проекта:');
            $('#textTarget').html('Цель проекта');
            $('#textTask').html('Задача проекта');
            $('#newBtn').html('Создать новый проект').attr('href','project');
            $('#optionListAll').append(
                '<option value="1">Проект 1</option>' +
                '<option value="2">Проект 2</option>' +
                '<option value="3">Проект 3</option>'
            );
            $('#optionListAll').trigger("chosen:updated");
            $('#projectBlock').removeClass('d-none');
            $('#processBlock').removeClass('d-flex').addClass('d-none');
            $('#instructionBlock').removeClass('d-flex').addClass('d-none');
        }

        // Данные страницы поручений
        if(page == 'instruction') {
            $('#headTitle').html('Поручения');
            $('#textTemplate').html('Каталог поручений');
            $('#textTemplateElement').html('Шаблон поручения:');
            $('#textTarget').html('Цель поручения');
            $('#textTask').html('Задача поручения');
            $('#newBtn').html('Создать новое поручение').attr('href','instruction');
            $('#optionListAll').append(
                '<option value="1">Поручение 1</option>' +
                '<option value="2">Поручение 2</option>' +
                '<option value="3">Поручение 3</option>'
            );
            $('#optionListAll').trigger("chosen:updated");
            $('#processCard').addClass('d-none');
            $('#instructionBlock').removeClass('d-none');
            $('#projectBlock').removeClass('d-flex').addClass('d-none');
            $('#processBlock').removeClass('d-flex').addClass('d-none');
        }

    });
</script>
<jsp:include page="fragments/footerBasement.jsp"/>