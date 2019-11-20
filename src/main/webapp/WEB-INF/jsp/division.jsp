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
    <div class="container w-sm-100">
        <h2 class="text-center my-5">Наименование структуры</h2>
        <form>
            <div class="row">
                <div class="col-3">
                    <div class="fakeimg d-flex align-items-center justify-content-center">
                        <img class="img-fluid" src="resources/img/Logo.png" alt="Fake Image">
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
                        <div class="card-body">
                            <div class="row d-flex align-items-center mb-3">
                                <div class="col-3 text-right">
                                    <label for="funcN1">1.</label>
                                </div>
                                <div class="col-9">
                                    <input type="text" class="form-control" id="funcN1" name="funcN1">
                                </div>
                            </div>
                            <div class="row d-flex align-items-center mb-3">
                                <div class="col-3 text-right">
                                    <label for="funcN2">2.</label>
                                </div>
                                <div class="col-9">
                                    <input type="text" class="form-control" id="funcN2" name="funcN2">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--третья штука-->
                    <h5 class="my-3">Подразделения</h5>
                    <div class="card bg-light my-3">
                        <div class="card-body">
                            <div class="row d-flex align-items-center mb-3">
                                <div class="col-3 text-right">
                                    <label for="column1">1.</label>
                                </div>
                                <div class="col-9">
                                    <input type="text" class="form-control" id="column1" name="column1">
                                </div>
                            </div>
                            <div class="row d-flex align-items-center mb-3">
                                <div class="col-3 text-right">
                                    <label for="column1">2.</label>
                                </div>
                                <div class="col-9">
                                    <input type="text" class="form-control" id="column2" name="column2">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Четвертая  штука-->
                    <h5 class="my-3">Сотрудники</h5>
                    <div class="card bg-light my-3">
                        <div class="card-body py-0">
                            <div class="row d-flex align-items-center justify-content-center text-center font-weight-bold">
                                <div class="col-1 border-right border-bottom my-0 py-2">#</div>
                                <div class="col-2 border-right border-bottom my-0 py-2">Фамилия</div>
                                <div class="col-2 border-right border-bottom my-0 py-2">Имя</div>
                                <div class="col-3 border-right border-bottom my-0 py-2">Отчество</div>
                                <div class="col-2 border-right border-bottom my-0 py-2">Должность</div>
                                <div class="col-2 border-bottom my-0 py-2">Email</div>
                            </div>
                            <div class="row d-flex align-items-center justify-content-center text-center" >
                                <div class="col-1 border-right border-bottom my-0 py-2">1</div>
                                <div class="col-2 border-right border-bottom my-0 py-2">Каркоцкий</div>
                                <div class="col-2 border-right border-bottom my-0 py-2">Антон</div>
                                <div class="col-3 border-right border-bottom my-0 py-2">Геннадьевич</div>
                                <div class="col-2 border-right border-bottom my-0 py-2">Сотрудник</div>
                                <div class="col-2 border-bottom my-0 py-2">test@mail.ru</div>
                            </div>
                            <div class="row d-flex align-items-center justify-content-center text-center">
                                <div class="col-1 border-right border-bottom my-0 py-2">2</div>
                                <div class="col-2 border-right border-bottom my-0 py-2">Халиллова</div>
                                <div class="col-2 border-right border-bottom my-0 py-2">Лаура</div>
                                <div class="col-3 border-right border-bottom my-0 py-2">Серкалиевна</div>
                                <div class="col-2 border-right border-bottom my-0 py-2">Сотрудник</div>
                                <div class="col-2 border-bottom my-0 py-2">test@mail.ru</div>
                            </div>
                            <div class="row d-flex align-items-center justify-content-center text-center">
                                <div class="col-1 border-right my-0 py-2">3</div>
                                <div class="col-2 border-right my-0 py-2">Жукова</div>
                                <div class="col-2 border-right my-0 py-2">Светлана</div>
                                <div class="col-3 border-right my-0 py-2">Дмитриевна</div>
                                <div class="col-2 border-right my-0 py-2">Сотрудник</div>
                                <div class="col-2 my-0 py-2">test@mail.ru</div>
                            </div>
                        </div>
                    </div>
                    <button type="button" class="btn btn-success" onclick="save()">Success</button>
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