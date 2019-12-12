<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="fragments/headerNew.jsp"/>

<main>
    <div class="container-fluid" id="iconBlock">

        <%--<div class="container mb-4">
            <form class="form-inline my-2 my-lg-0">
                <input class="w-75 form-control mr-sm-2 border border-dark"
                       type="search" placeholder="Поиск совпадения функций"
                       aria-label="Поиск совпадения функций" id="searchWord">
                <button class="btn btn-dark px-4 my-2 my-sm-0 searchBtn" type="submit">Искать</button>
            </form>
        </div>--%>

        <div class="row canvas">
            <div class="col-sm-3" id="division">
                <div class="mb-3">
                    <h5 class="bg-primary mx-5 p-3 text-white" id="divisionName">
                        <div class="row">
                            <div class="col-3 d-flex
                            align-items-center justify-content-center">
                                <img class="img-fluid photoUser" src="resources/images/logo.png">
                            </div>
                            <div class="col-9">
                                <div class="row">
                                    <div class="col-9 d-flex align-items-center justify-content-center">
                                        <div class="font-size-middle" id="departmentName"></div>
                                    </div>
                                    <div class="col-3 d-flex align-items-start justify-content-end">
                                        <div class="pointer addBtn"
                                             data-block="division"
                                             data-id="1">
                                            <i class="far fa-minus-square minusBtn d-none"></i>
                                            <i class="far fa-plus-square plusBtn"
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
                                           data-id="1"
                                           data-block="division"
                                           data-key="1"
                                           title="Карта подразделения"></i>--%>
                                        <i class="far fa-file-word mr-4 pointer"
                                           data-toggle="tooltip" data-placement="bottom" title="Нормативный документ"></i>
                                        <a href="division?id=1">
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
            <div class="col-sm-3 d-none" id="administrators"></div>
            <div class="col-sm-3 d-none" id="managements"></div>
            <div class="col-sm-3 d-none" id="departments"></div>
        </div>
    </div>
</main>

<jsp:include page="fragments/footerNew.jsp"/>
<jsp:include page="fragments/footerScript.jsp"/>
<script>
$(function() {

    // Получаем элементы
    function getTopLevel() {
        $.getJSON('rest/profile/divisions/getAllTopLevel/', function (data) {
            for (var i in data) {
                var row = data[i];
                if (row.childDivision.length > 0) {
                    for (var y in row.childDivision) {
                        var administrators = row.childDivision[y];
                        var key = parseInt(y) + 1;
                        var img = 'resources/images/logo.png';
                        /*if(administrators.chiefEmployee.photo && administrators.chiefEmployee.photo != '') {
                            img = 'resources/images/'+administrators.chiefEmployee.photo;
                        }*/
                        $('#administrators').append(
                            '<div class="mb-3" id="administrators'+key+'">' + //border border-dark
                            '   <h5 class="bg-primary p-3 mx-5 text-white" id="administratorsName'+key+'">' +
                            '       <div class="row">' +
                            '           <div class="col-3 d-flex align-items-center justify-content-center">' +
                            '               <img class="img-fluid" src="'+img+'">' +
                            '           </div>' +
                            '           <div class="col-9">' +
                            '               <div class="row">' +
                            '                   <div class="col-9 d-flex align-items-center justify-content-start font-size-middle">'+administrators.name+'</div>' +
                            '                   <div class="col-3 d-flex align-items-start justify-content-end">' +
                            '                       <div class="pointer addBtn" data-block="administrators" data-id="'+administrators.id+'" data-key='+key+'>' +
                            '                           <i class="far fa-minus-square fa-2x minusBtn d-none"></i>' +
                            '                           <i class="far fa-plus-square fa-2x plusBtn"></i>' +
                            '                       </div>' +
                            '                   </div>' +
                            '               </div>' +
                            '               <div class="row">' +
                            '                   <div class="col-12 my-3 mr-3 d-flex align-items-center">' +
                            '                       <a href="administrators?id='+administrators.id+'">' +
                            '                           <i class="fas fa-sitemap mr-4 pointer text-white Sitemap"' +
                            ' data-toggle="tooltip" data-placement="bottom"' +
                            ' title="Карта подразделения">' +
                            '                           </i>' +
                            '                       </a>' +
                            '                       <i class="far fa-file-word mr-4 pointer text-white"' +
                            ' data-toggle="tooltip" data-placement="bottom" title="Нормативный документ"></i>' +
                            '                       <a href="division?id='+administrators.id+'">' +
                            '                           <i class="far fa-address-card mr-4 pointer text-white"' +
                            ' data-toggle="tooltip"' +
                            ' data-placement="bottom"' +
                            ' title="Карточка подразделения">' +
                            '                           </i>' +
                            '                       </a>' +
                            '                       <i class="fas fa-chart-pie mr-4 pointer"' +
                            ' data-toggle="tooltip" data-placement="bottom" title="Проказатель качества"></i>' +
                            '                   </div>' +
                            '               </div>' +
                            '           </div>' +
                            '       </div>' +
                            '   </h5>' +
                            '</div>'
                        );
                        arrowAdd1.arrow('#divisionName','#administratorsName'+key);
                    }
                }
            }
        });
    }

    function getDepartments() {
        $.getJSON('rest/profile/divisions/getAllTopLevel/', function (data) {
            for (var i in data) {
                var row = data[i];
                if (row.id == 1) {
                    $('#departmentName').html(row.name);
                    if(row.photo && row.photo != '') {
                        $('.photoUser').attr('src', row.photo);
                    }
                }
            }
        });
    }

    getDepartments(getId());

    // Получаем список функций по клику
    $(document).on('click', '.plusBtn', function () {
        var parent = $(this).parent('.addBtn');
        $(this).addClass('d-none');
        var row = $(parent).attr('data-block');
        var id = $(parent).attr('data-id');
        var key = $(parent).attr('data-key');
        $('.minusBtn', parent).removeClass('d-none');
        if (row === 'division') {
            $('#administrators').empty().removeClass('d-none');
            arrowAdd5.clear();
            arrowAdd2.clear();
            arrowAdd3.clear();
            getTopLevel();
            getFunctionsDepartments(id, '#' + row);
       }
        if (row === 'administrators') {
            $('#managements').removeClass('d-none');
            arrowAdd1.clear();
            getDivisions(id, key, 'managements', 'administratorsName'+key);
            getFunctionsDepartments(id, '#' + row + key);
        }
        if (row === 'managements') {
            $('#departments').removeClass('d-none');
            arrowAdd2.clear();
            arrowAdd3.clear();
            getDivisions(id, key, 'departments', 'managementsName'+key);
            getFunctionsDepartments(id, '#' + row + key);
        }
        if (row === 'departments') {
            arrowAdd3.clear();
            getFunctionsDepartments(id, '#' + row + key);
        }
    });

    $(document).on('click', '.minusBtn', function () {
        var parent = $(this).parent('.addBtn');
        $(this).addClass('d-none');
        var row = $(parent).attr('data-block');
        var key = $(parent).attr('data-key');
        $('.plusBtn', parent).removeClass('d-none');
        if (row === 'division') {
            $('#administrators, #managements, #departments').empty().addClass('d-none');
            $('.functions').remove();
            arrowAdd1.clear();
            arrowAdd2.clear();
            arrowAdd3.clear();
            arrowAdd5.clear();
        }
        if (row === 'administrators') {
            arrowAdd2.clear();
            arrowAdd3.clear();
            $('#managements, #departments').empty().addClass('d-none');
            $('#' + row + key + ' .functions').remove();
        }
        if (row === 'managements') {
            arrowAdd3.clear();
            $('#departments').empty().addClass('d-none');
            $('#' + row + key + ' .functions').remove();
        }
        if (row === 'departments') {
            arrowAdd3.clear();
            $('#' + row + key + ' .functions').remove();
        }
    });

    // Открываем подразделения по клику на карту
    $(document).on('click', '.Sitemap', function() {
        arrowAdd5.clear();
        arrowAdd2.clear();
        arrowAdd3.clear();
        $('#administrators').empty();
        var id = $(this).attr('data-id');
        var row = $(this).attr('data-block');
        var key = $(this).attr('data-key');
        if (row === 'division') {
            $('#administrators').empty().removeClass('d-none');
            getTopLevel();
        }
        if (row === 'administrators') {
            $('#division').remove();
            $('#managements').empty().removeClass('d-none');
            arrowAdd1.clear();
            getDivisions(id, key, 'managements', 'administratorsName'+key);
        }
    });

});
</script>
<jsp:include page="fragments/footerBasement.jsp"/>