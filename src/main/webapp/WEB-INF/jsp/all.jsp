<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="fragments/headerNew.jsp"/>

<main>
    <div class="container-fluid" id="iconBlock">

        <div class="row canvas">
            <div class="col-sm-3" id="division">
                <div class="mb-3">
                    <h5 class="bg-primary p-3 text-white rounded"
                        id="divisionName">
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
            <div class="col-sm-3" id="administrators"></div>
            <div class="col-sm-2" id="managements"></div>
            <div class="col-sm-2" id="departments"></div>
            <div class="col-sm-2" id="users"></div>
        </div>
    </div>
</main>

<jsp:include page="fragments/footerNew.jsp"/>
<jsp:include page="fragments/footerScript.jsp"/>
<script>
    $(function() {
        getTopLevel();
        getFunctionsDepartments(1, '#division');

        // Получаем элементы
        function getTopLevel() {
            $.getJSON('rest/profile/divisions/getAllTopLevel/', function (data) {
                for (var i in data) {
                    var row = data[i];
                    if (row.childDivision.length > 0) {
                        for (var y in row.childDivision) {
                            var administrators = row.childDivision[y];
                            var key = parseInt(y)+1;
                            var img = 'resources/images/logo.png';
                            if (administrators.chiefEmployee &&
                                administrators.chiefEmployee.photo !== '') {
                                img = administrators.chiefEmployee.photo;
                            }
                            $('#administrators').append(
                                '<div class="mb-3 cardBlock" id="administrators'+key+'">' +
                                '   <h5 class="bg-primary p-3 text-white rounded" id="administratorsName'+key+'">' +
                                '       <div class="row">' +
                                '           <div class="col-3 d-flex align-items-center justify-content-center">' +
                                '               <img class="img-fluid" src="'+img+'">' +
                                '           </div>' +
                                '           <div class="col-9">' +
                                '               <div class="row">' +
                                '                   <div class="col-9 d-flex align-items-center justify-content-start font-size-middle">'+administrators.name+'</div>' +
                                '                   <div class="col-3 d-flex align-items-start justify-content-end">' +
                                '                       <div class="pointer addBtn" data-block="administrators" data-id="'+administrators.id+'" data-key='+key+'>' +
                                '                           <i class="far fa-minus-square fa-2x minusBtn"></i>' +
                                '                           <i class="far fa-plus-square fa-2x plusBtn d-none"></i>' +
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
                            getFunctionsDepartments(administrators.id, '#administrators'+key);
                            if (administrators.employees.length > 0) {
                                getUsers(administrators.employees, key);
                            }
                            if (administrators.childDivision.length > 0) {
                                for (var y in administrators.childDivision) {
                                    var managements = administrators.childDivision[y];
                                    key = administrators.id;
                                    keys = parseInt(y)+1;
                                    var link = 'managements?id='+managements.id+'&administrators='+administrators.id+'&department=1';
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
                                            var link = 'departments?id='+departments.id+'&managements='+managements.id+'&administrators='+administrators.id+'&department=1';
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
                        if(row.chiefEmployee != null) {
                            if(row.chiefEmployee.photo) {
                                $('.photoUser').attr('src', row.chiefEmployee.photo);
                            }
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
                //$('#administrators').empty().removeClass('d-none');
                arrowAdd5.clear();
                arrowAdd2.clear();
                arrowAdd3.clear();
                //getTopLevel();
                getFunctionsDepartments(id, '#' + row);
            }
            if (row === 'administrators') {
                //$('#managements').empty().removeClass('d-none');
                arrowAdd1.clear();
                arrowAdd2.clear();
                arrowAdd3.clear();
                //getDivisions(id, key, 'managements', 'administratorsName'+key);
                getFunctionsDepartments(id, '#' + row + key);
            }
            if (row === 'managements') {
                //$('#departments').empty().removeClass('d-none');
                arrowAdd2.clear();
                arrowAdd3.clear();
                //getDivisions(id, key, 'departments', 'managementsName'+key);
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
                /*$('#administrators, #managements, #departments').empty().addClass('d-none');*/
                $('#division .functions').remove();
                arrowAdd1.clear();
                arrowAdd2.clear();
                arrowAdd3.clear();
                arrowAdd5.clear();
            }
            if (row === 'administrators') {
                arrowAdd1.clear();
                arrowAdd2.clear();
                arrowAdd3.clear();
                arrowAdd5.clear();
                /*$('#managements, #departments').empty().addClass('d-none');*/
                $('#' + row + key + ' .functions').remove();
            }
            if (row === 'managements') {
                arrowAdd3.clear();
                /*$('#departments').empty().addClass('d-none');*/
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
            arrowAdd1.clear();
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

        // Подсветка похожих функций при нажатии на отдел
        $(document).on('click', '.functions', function () {
            arrowAdd5.clear();
            arrowReturn1.clear();
            $('.card').css('background', '#fff').addClass('d-none');
            $('.cardBlock').addClass('d-none');
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