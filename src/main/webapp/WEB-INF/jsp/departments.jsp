<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="fragments/headerNew.jsp"/>

<main>
    <div class="text-uppercase">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index">Главная</a></li>
                <li class="breadcrumb-item levelUp1">
                    <a href="">Уровень 1</a>
                </li>
                <li class="breadcrumb-item levelUp">
                    <a href="">Уровень 2</a>
                </li>
                <li class="breadcrumb-item active">Уровень 3</li>
            </ol>
        </nav>
    </div>
    <div class="container-fluid" id="iconBlock">
        <div class="row canvas">
            <div class="col-lg-3 col-6" id="departments">
                <div class="mb-3 cardBlock">
                    <h5 class="bg-primary p-3 text-white rounded"
                        id="departmentsName1">
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
                                             data-block="departments"
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
                                        <i class="far fa-file-word mr-4 pointer"
                                           data-toggle="tooltip" data-placement="bottom" title="Нормативный документ"></i>
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
            <div class="col-lg-3 col-6" id="users"></div>
        </div>
    </div>
</main>

<jsp:include page="fragments/footerNew.jsp"/>
<jsp:include page="fragments/footerScript.jsp"/>
<script>
    $(function() {
        var poleId = getId('id');
        $('#divisionId').attr('href', 'division?id='+poleId);
        var managId = getId('managements');
        var adminId = getId('administrators');
        $('.levelUp1 a').attr('href', 'administrators?id='+adminId+'&department=1');
        $('.levelUp a').attr('href', 'managements?id='+managId+'&administrators='+adminId+'&department=1');
        getTopLevel();
        getDepartments('rest/profile/divisions/', poleId, 'departments');
        getFunctionsDepartments(poleId, '#departments');

        function getTopLevel() {
            $.getJSON('rest/profile/divisions/'+poleId, function (data) {
                var key = data.id;
                if (data.employees.length > 0) {
                    getUsers(data.employees, key);
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
            if (row === 'departments') {
                arrowAdd3.clear();
                getFunctionsDepartments(id, '#' + row);
            }
        });

        $(document).on('click', '.minusBtn', function () {
            var parent = $(this).parent('.addBtn');
            $(this).addClass('d-none');
            var row = $(parent).attr('data-block');
            var key = $(parent).attr('data-key');
            $('.plusBtn', parent).removeClass('d-none');
            if (row === 'departments') {
                arrowAdd3.clear();
                $('#' + row + ' .functions').remove();
            }
        });

        // Подсветка похожих функций при нажатии на отдел
        $(document).on('click', '.functions', function () {
            arrowAdd5.clear();
            arrowReturn1.clear();
            $('.card').css('background', '#fff').addClass('d-none');
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

        // Открываем подразделения по клику на карту
        /*$(document).on('click', '.Sitemap', function() {
            arrowAdd1.clear();
            arrowAdd2.clear();
            arrowAdd3.clear();
            arrowAdd5.clear();
            var id = $(this).attr('data-id');
            var row = $(this).attr('data-block');
            var key = $(this).attr('data-key');
            if (row === 'managements') {
                $('#administrators').remove();
                $('#departments').empty().removeClass('d-none');
                arrowAdd2.clear();
                getDivisions(id, key, 'departments', 'managementsName'+key);
            }
        });*/

    });
</script>
<jsp:include page="fragments/footerBasement.jsp"/>