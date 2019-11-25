<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap 4 Website Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/index.css">

</head>
<body>
    <div class="container-fluid w-sm-100">
        <h2 class="text-center my-5">Наименование структуры</h2>
        <form>
            <div class="row">
                <div class="col-3">&nbsp;</div>
                <div class="col-9">
                    <label for="nameOtdel">Наименование структуры</label>
                    <input type="text" class="form-control" id="nameOtdel" name="nameOtdel">
                </div>
                <div class="col-3 pt-3">
                    <div class="fakeimg d-flex align-items-center justify-content-center">
                        <img class="img-fluid" src="resources/img/Logo.png" alt="Fake Image">
                    </div>
                </div>
                <div class="col-9">
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
                    <h5 class="my-3">Сотрудники</h5>
                    <div class="card bg-light my-3">
                        <div class="card-body py-0">
                            <table class="table table-bordered mt-3" id="employeesDivisionBlock">
                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="text-center">Фамилия</th>
                                    <th class="text-center">Имя</th>
                                    <th class="text-center">Отчество</th>
                                    <th class="text-center">Должность</th>
                                    <th class="text-center">Email</th>
                                </tr>
                            </table>
                            <%--<div class="row d-flex align-items-center justify-content-center text-center font-weight-bold">
                                <div class="col-1 border-right border-bottom my-0 py-2">#</div>
                                <div class="col-2 border-right border-bottom my-0 py-2">Фамилия</div>
                                <div class="col-2 border-right border-bottom my-0 py-2">Имя</div>
                                <div class="col-2 border-right border-bottom my-0 py-2">Отчество</div>
                                <div class="col-3 border-right border-bottom my-0 py-2">Должность</div>
                                <div class="col-2 border-bottom my-0 py-0">Email</div>
                            </div>--%>
                        </div>
                    </div>
                    <button type="button" class="btn btn-success" onclick="save()">Нажми меня</button>
                </div>
            </div>
        </form>
    </div>
    <script src="resources/js/jquery-3.3.1.min.js"></script>
    <script src="resources/js/popper.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/divisionsUtil.js"></script>
</body>
</html>
