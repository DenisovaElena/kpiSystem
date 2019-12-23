<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="fragments/headerNew.jsp"/>

<main>
    <div class="text-uppercase">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="index">Главная</a>
                </li>
                <li class="breadcrumb-item">
                    <a onclick="javascript:history.back(); return false;">
                        Назад
                    </a>
                </li>
                <li class="breadcrumb-item active"></li>
            </ol>
        </nav>
    </div>

    <div class="container-fluid w-sm-100" id="iconBlock">
        <h2 class="text-center my-5">Наименование структуры</h2>
        <form>
            <div class="row">
                <div class="col-3">
                    <div class="d-flex align-items-center justify-content-center">
                        <img class="img-fluid rounded photoUser" src="" alt="">
                    </div>
                </div>
                <div class="col-9">
                    <label for="nameOtdel">Наименование структуры</label>
                    <input type="text" class="form-control" id="nameOtdel" name="nameOtdel">
                    <h5 class="my-3">Руководство структуры</h5>
                    <!--первая  штука-->
                    <div class="card bg-light my-3">
                        <div class="card-body">
                            <div class="row d-flex align-items-center mb-3">
                                <div class="col-3 text-right">
                                    <label for="lastName">Фамилия</label>
                                </div>
                                <div class="col-9">
                                    <input type="text" class="form-control" id="lastName" name="lastName">
                                </div>
                            </div>
                            <div class="row d-flex align-items-center mb-3">
                                <div class="col-3 text-right">
                                    <label for="firstName">Имя</label>
                                </div>
                                <div class="col-9">
                                    <input type="text" class="form-control" id="firstName" name="firstName">
                                </div>
                            </div>
                            <div class="row d-flex align-items-center mb-3">
                                <div class="col-3 text-right">
                                    <label for="patronym">Отчество</label>
                                </div>
                                <div class="col-9">
                                    <input type="text" class="form-control" id="patronym" name="patronym">
                                </div>
                            </div>
                            <div class="row d-flex align-items-center mb-3">
                                <div class="col-3 text-right">
                                    <label for="position">Должность</label>
                                </div>
                                <div class="col-9">
                                    <input type="text" class="form-control" id="position" name="position">
                                </div>
                            </div>
                            <div class="row d-flex align-items-center mb-3">
                                <div class="col-3 text-right">
                                    <label for="email">Email</label>
                                </div>
                                <div class="col-9">
                                    <input type="email" class="form-control" id="email" name="email">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--вторая штука-->
                    <h5 class="my-3">Функции</h5>
                    <div class="card bg-light my-3">
                        <div class="card-body" id="functionBlock"></div>
                    </div>
                    <!--третья штука-->
                    <h5 class="my-3">Подразделения</h5>
                    <div class="card bg-light my-3">
                        <div class="card-body" id="childDivisionBlock"></div>
                    </div>
                    <!--Четвертая  штука-->
                    <div id="chiefEmployees" class="d-none">
                        <h5 class="my-3">Сотрудники</h5>
                        <div class="card bg-light my-3">
                            <div class="card-body py-0">
                                <table class="table table-bordered table-striped white mt-3"
                                       id="employeesDivisionBlock">
                                    <tr>
                                        <th class="text-center">#</th>
                                        <th class="text-center">Фамилия</th>
                                        <th class="text-center">Имя</th>
                                        <th class="text-center">Отчество</th>
                                        <th class="text-center">Должность</th>
                                        <th class="text-center">Email</th>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div>
                        <button type="button" class="btn btn-success my-3 px-5">
                            Сохранить</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</main>
<jsp:include page="fragments/footerNew.jsp"/>
<jsp:include page="fragments/footerScript.jsp"/>
<script src="resources/js/divisionsUtil.js"></script>
<jsp:include page="fragments/footerBasement.jsp"/>