<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="fragments/headerNew.jsp"/>

<main>
    <div class="text-uppercase">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index">Главная</a></li>
                <li class="breadcrumb-item active">Уровень 1</li>
            </ol>
        </nav>
    </div>
    <div class="container-fluid" id="iconBlock">
        <div class="row canvas">
            <div class="col-sm-3" id="administrators">
                <div class="mb-3 cardBlock">
                    <h5 class="bg-primary p-3 text-white rounded"
                        id="administratorsName1">
                        <div class="row">
                            <div class="col-3 d-flex align-items-center justify-content-center">
                                <img class="img-fluid photoUser" src="resources/images/logo.png">
                            </div>
                            <div class="col-9">
                                <div class="row">
                                    <div class="col-9 d-flex align-items-center justify-content-center">
                                        <div id="departmentName" class="font-size-middle"></div>
                                    </div>
                                    <div class="col-3 d-flex align-items-start justify-content-end">
                                        <div class="pointer addBtn"
                                             data-block="administrators"
                                             data-id=""
                                             data-key="1">
                                            <i class="far fa-minus-square minusBtn"></i>
                                            <i class="far fa-plus-square plusBtn d-none"
                                               data-toggle="tooltip"
                                               data-placement="bottom"
                                               title="Список функций подразделения"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 my-3 mr-3 d-flex align-items-center">
                                        <%--<i class="fas fa-sitemap mr-4 pointer Sitemap"
                                           data-toggle="tooltip"
                                           data-placement="bottom"
                                           data-id=""
                                           data-block="administrators"
                                           data-key="1"
                                           title="Карта подразделения"></i>--%>
                                        <i class="far fa-file-word mr-4 pointer"
                                           data-toggle="tooltip"
                                           data-placement="bottom"
                                           title="Нормативный документ">
                                        </i>
                                        <a href="" id="divisionId">
                                            <i class="far fa-address-card mr-4 pointer text-white"
                                               data-toggle="tooltip"
                                               data-placement="bottom"
                                               title="Карточка подразделения">
                                            </i>
                                        </a>
                                        <i class="fas fa-chart-pie mr-4 pointer"
                                           data-toggle="tooltip" data-placement="bottom" title="Проказатель качества"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </h5>
                </div>
            </div>
            <div class="col-sm-3" id="managements"></div>
            <div class="col-sm-3" id="departments"></div>
            <div class="col-sm-3" id="users"></div>
        </div>
    </div>
</main>

<jsp:include page="fragments/footerNew.jsp"/>
<jsp:include page="fragments/footerScript.jsp"/>
<script>
    $(function() {
        var poleId = getId('id');
        $('#divisionId').attr('href', 'division?id='+poleId);
        getTopLevel();
        getDepartments('rest/profile/divisions/', poleId, 'administrators') ;
        getFunctionsDepartments(poleId, '#administrators');

        function getTopLevel() {
            $.getJSON('rest/profile/divisions/'+poleId, function (data) {
                if (data.childDivision.length > 0) {
                    for (var y in data.childDivision) {
                        var managements = data.childDivision[y];
                        var key = data.id;
                        keys = parseInt(y)+1;
                        var link = 'managements?id='+managements.id+'&administrators='+data.id+'&department=1';
                        var img = 'resources/images/logo.png';
                        if (managements.chiefEmployee != null) {
                            if (managements.chiefEmployee.photo) {
                                img = managements.chiefEmployee.photo;
                            }
                        }
                        getDivisions(key,keys,img,'managements',managements.name,managements.id,link);
                        getFunctionsDepartments(managements.id, '#managements'+key+keys);
                        if (managements.employees.length > 0) {
                            getUsers(managements.employees, key);
                        }
                        if (managements.childDivision.length > 0) {
                            for (var z in managements.childDivision) {
                                var departments = managements.childDivision[z];
                                var keys = parseInt(z)+1;
                                var link = 'departments?id='+departments.id+'&managements='+managements.id+'&administrators='+data.id+'&department=1';
                                var img = 'resources/images/logo.png';
                                if (departments.chiefEmployee != null) {
                                    if (departments.chiefEmployee.photo) {
                                        img = departments.chiefEmployee.photo;
                                    }
                                }
                                getDivisions(key,keys,img,'departments',departments.name,departments.id,link);
                                getFunctionsDepartments(departments.id, '#departments'+key+keys);
                                if (departments.employees.length > 0) {
                                    getUsers(departments.employees, key);
                                }
                            }
                        }
                    }
                }
            });
        }

        // Получаем список функций по клику
        $(document).on('click', '.plusBtn', function () {
            var parent = $(this).parent('.addBtn');
            $(this).addClass('d-none');
            var row = $(parent).attr('data-block');
            var id = $(parent).attr('data-id');
            var key = $(parent).attr('data-key');
            $('.minusBtn', parent).removeClass('d-none');
            if (row === 'administrators') {
                //$('#managements').empty().removeClass('d-none');
                arrowAdd1.clear();
                getDivisions(id, key, 'managements', 'administratorsName'+key);
                getFunctionsDepartments(id, '#administrators');
            }
            if (row === 'managements') {
                //$('#departments').removeClass('d-none');
                //arrowAdd2.clear();
                arrowAdd3.clear();
                getDivisions(id, key, 'departments', 'managementsName'+key);
                getFunctionsDepartments(id, '#managements' + key);
            }
            if (row === 'departments') {
                arrowAdd3.clear();
                getFunctionsDepartments(id, '#departments' + key);
            }
        });

        $(document).on('click', '.minusBtn', function () {
            var parent = $(this).parent('.addBtn');
            $(this).addClass('d-none');
            var row = $(parent).attr('data-block');
            var key = $(parent).attr('data-key');
            $('.plusBtn', parent).removeClass('d-none');
            if (row === 'administrators') {
                arrowAdd2.clear();
                arrowAdd3.clear();
                //$('#managements, #departments').empty().addClass('d-none');
                $('#administrators .functions').remove();
            }
            if (row === 'managements') {
                arrowAdd2.clear();
                arrowAdd3.clear();
                arrowAdd5.clear();
                //$('#departments').empty().addClass('d-none');
                $('#managements' + key + ' .functions').remove();
            }
            if (row === 'departments') {
                arrowAdd3.clear();
                $('#departments' + key + ' .functions').remove();
            }
        });

        // Открываем подразделения по клику на карту
        $(document).on('click', '.Sitemap', function() {
            arrowAdd5.clear();
            arrowAdd2.clear();
            arrowAdd3.clear();
            var id = $(this).attr('data-id');
            var row = $(this).attr('data-block');
            var key = $(this).attr('data-key');
            if (row === 'administrators') {
                $('#managements').empty().removeClass('d-none');
                arrowAdd1.clear();
                getDivisions(id, key, 'managements', 'administratorsName'+key);
            }
            if (row === 'managements') {
                $('#administrators').remove();
                $('#departments').empty().removeClass('d-none');
                arrowAdd2.clear();
                arrowAdd3.clear();
                getDivisions(id, key, 'departments', 'managementsName'+key);
            }
        });

        // Подсветка похожих функций при нажатии на отдел
        $(document).on('click', '.functions', function () {
            arrowAdd5.clear();
            arrowReturn1.clear();
            $('.card').css('background', '#fff').addClass('d-none');
            $('#managements .cardBlock').addClass('d-none');
            $('#departments .cardBlock').addClass('d-none');
            $('#users .cardBlock').addClass('d-none');
            var id = parseInt($(this).attr('data-id'));
            var idParent = $(this).attr('data-parent');
            $(idParent).removeClass('d-none');
            $('.card[data-id=' + id + ']').css('background', '#fc6').removeClass('d-none');
            if (id > 0) {
                getArrowChild(id);
                getArrowParent(id);
                $('body,html').animate({
                    scrollTop: 0
                }, 500);
            } else {
                $('.card').css('background', '#fff');
            }
        });

    });
</script>
<jsp:include page="fragments/footerBasement.jsp"/>