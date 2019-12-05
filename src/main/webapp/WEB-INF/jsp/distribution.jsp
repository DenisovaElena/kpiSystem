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
            <div class="col-sm-3">
                <div class="mb-3" id="division">
                    <h5 class="bg-primary mx-5 p-3 text-white" id="divisionName">
                        <div class="row">
                            <div class="col-2 d-flex align-items-center justify-content-center">
                                <img class="img-fluid" src="resources/images/logo.png">
                            </div>
                            <div class="col-10">
                                <div class="row">
                                    <div class="col-9 d-flex align-items-center justify-content-center">
                                        <div id="departmentName"></div>
                                    </div>
                                    <div class="col-3 d-flex align-items-start justify-content-end">
                                        <div class="pointer addBtn"
                                             data-block="division"
                                             data-id="1">
                                            <i class="far fa-minus-square minusBtn d-none"></i>
                                            <i class="far fa-plus-square plusBtn"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 my-3 mr-3 d-flex align-items-center">
                                        <i class="far fa-file-word mr-4 fa-2x pointer"
                                           data-toggle="tooltip" data-placement="bottom" title="Нормативный документ"></i>
                                        <i class="far fa-address-card mr-4 fa-2x pointer"
                                           data-toggle="tooltip" data-placement="bottom" title="Карточка"></i>
                                        <i class="fas fa-chart-pie mr-4 fa-2x pointer"
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
            <%--<div class="col-sm-2 d-none" id="users"></div>--%>
        </div>

    </div>
</main>

<jsp:include page="fragments/footerNew.jsp"/>
<jsp:include page="fragments/footerScript.jsp"/>
<script>
    $(function() {
        //jsPlumb.ready(function() {

        var arrowAdd1 = $cArrows('#iconBlock', {
            render : { strokeStyle: '#999999'},
            arrow: {
                arrowType: 'line',
                connectionType: 'rectangleAngle',
                angleFrom: 0,
                angleTo: 180
            }
        });

        var arrowAdd2 = $cArrows('#iconBlock', {
            render : { strokeStyle: '#999999'},
            arrow: {
                arrowType: 'line',
                connectionType: 'rectangleAngle',
                angleFrom: 0,
                angleTo: 180
            }
        });

        var arrowAdd3 = $cArrows('#iconBlock', {
            render : { strokeStyle: '#999999'},
            arrow: {
                arrowType: 'line',
                connectionType: 'rectangleAngle',
                angleFrom: 0,
                angleTo: 180
            }
        });

        var arrowAdd5 = $cArrows('#iconBlock', {
            render : { strokeStyle: '#999999'},
            arrow: {
                arrowType: 'arrow',
                connectionType: 'rectangleAngle',
                angleFrom: 0,
                angleTo: 180
            }
        });

        var arrowReturn1 = $cArrows('#iconBlock', {
            render : { strokeStyle: 'red'},
            arrow: { connectionType: 'rectangleAngle', angleFrom: 180,
                angleTo: 0}
        });


        // Поиск по функциям
        $('.searchBtn').click(function(e) {
            e.preventDefault();
            var word = $('#searchWord').val();
            if(word!= '') {
                $.getJSON('rest/profile/authorities/searchAuthorities?word='+word, function(data) {
                    if(data.length > 0) {
                        for(var i in data) {
                            $('.card [data-id='+data[i].id+']').css('background','#f00');
                        }
                    } else {
                        $('.card').css('background','#fff');
                    }
                });
            } else {
                $('.card').css('background','#fff');
            }
        });

            // Рисуем стрелочки
            function getArrow (id, element, dep) {
                //rest/profile/authorities/
                $.getJSON('rest/profile/authorities/getAllTopLevelAuthoritiesByChildAuthorityId/'+id, function(data) {
                    /*if(data.childAuthorities.length > 0) {
                        for(var i in data.childAuthorities) {
                            var end = parseInt(data.childAuthorities[i].id);
                            end = '#arrow'+end;
                            console.log(element+' - '+end);
                            if(dep != '#division') {
                                arrowAdd5.arrow(end, element);
                                $(element).css('background', '#fc6');
                                $(end).css('background', '#fc6');
                            }
                        }
                    }*/
                        for(var i in data) {
                            var end = parseInt(data[i].id);
                            end = '#arrow'+end;
                            console.log(element+' - '+end);
                            if(dep != '#division') {
                                arrowAdd5.arrow(end, element);
                                $(element).css('background', '#fc6');
                                $(end).css('background', '#fc6');
                            }
                        }
                });
            }

            function getId() {
                return new URL(window.location.href).searchParams.get("id");
            }

            // Получаем функции по элементам
            function getFunctionsDepartments(id, element) {
                $.getJSON('rest/profile/authorities/getAuthoritiesByDivisionId/' + id, function (data) {
                    for (var i in data) {
                        var row = data[i];
                        $(element).append(
                            '<div class="card functions p-2 my-2 mx-5 font-size-small pointer" id="arrow' + row.id + '" data-id="' + row.id + '">' + row.name + '</div>'
                        );
                        if(element != '#division') {
                            getArrow(row.id, '#arrow' + row.id, element);
                        }
                    }
                });
            }

            // Получаем элементы
            function getTopLevel() {
                $.getJSON('rest/profile/divisions/getAllTopLevel/', function (data) {
                    for (var i in data) {
                        var row = data[i];
                        if (row.childDivision.length > 0) {
                            for (var y in row.childDivision) {
                                var administrators = row.childDivision[y];
                                var key = parseInt(y) + 1;
                                $('#administrators').append(
                                    '<div class="mb-3" id="administrators'+key+'">' + //border border-dark
                                    '   <h5 class="bg-primary p-3 mx-5 text-white" id="administratorsName'+key+'">' +
                                    '       <div class="row">' +
                                    '           <div class="col-2 d-flex align-items-center justify-content-center">' +
                                    '               <img class="img-fluid" src="resources/images/logo.png">' +
                                    '           </div>' +
                                    '           <div class="col-10">' +
                                    '               <div class="row">' +
                                    '                   <div class="col-9 d-flex align-items-center justify-content-start">'+administrators.name+'</div>' +
                                    '                   <div class="col-3 d-flex align-items-start justify-content-end">' +
                                    '                       <div class="pointer addBtn" data-block="administrators" data-id="'+administrators.id+'" data-key='+key+'>' +
                                    '                           <i class="far fa-minus-square fa-2x minusBtn d-none"></i>' +
                                    '                           <i class="far fa-plus-square fa-2x plusBtn"></i>' +
                                    '                       </div>' +
                                    '                   </div>' +
                                    '               </div>' +
                                    '               <div class="row">' +
                                    '                   <div class="col-12 my-3 mr-3 d-flex align-items-center">' +
                                    '                       <i class="far fa-file-word mr-4 fa-2x pointer"' +
                                    ' data-toggle="tooltip" data-placement="bottom" title="Нормативный документ"></i>' +
                                    '                       <i class="far fa-address-card mr-4 fa-2x pointer"' +
                                    ' data-toggle="tooltip" data-placement="bottom" title="Карточка"></i>' +
                                    '                       <i class="fas fa-chart-pie mr-4 fa-2x pointer"' +
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

            function getDivisions(id, key, level, levelUp) {
                $.getJSON('rest/profile/divisions/'+id, function (row) {
                    if (row.childDivision.length > 0) {
                        for (var z in row.childDivision) {
                            var item = row.childDivision[z];
                            var keys = parseInt(z) + 1;
                            $('#' + level).append(
                                '<div class="mb-3" id="'+level+key+keys+'">' + //border border-dark
                                '   <h5 class="bg-primary p-3 mx-5 text-white" id="'+level+'Name'+key+keys+'">' +
                                '       <div class="row">' +
                                '           <div class="col-2 d-flex align-items-center justify-content-center">' +
                                '               <img class="img-fluid" src="resources/images/logo.png">' +
                                '           </div>' +
                                '           <div class="col-10">' +
                                '               <div class="row">' +
                                '                   <div class="col-9 d-flex align-items-center justify-content-start">'+item.name+'</div>' +
                                '                   <div class="col-3 d-flex align-items-start justify-content-end">' +
                                '                       <div class="pointer addBtn" data-block="'+level+'" data-id="'+item.id+'" data-key='+key+keys+'>' +
                                '                           <i class="far fa-minus-square minusBtn d-none"></i>' +
                                '                           <i class="far fa-plus-square plusBtn"></i>' +
                                '                       </div>' +
                                '                   </div>' +
                                '               </div>' +
                                '               <div class="row">' +
                                '                   <div class="col-12 my-3 mr-3 d-flex align-items-center">' +
                                '                       <i class="far fa-file-word mr-4 fa-2x pointer"' +
                                ' data-toggle="tooltip" data-placement="bottom" title="Нормативный документ"></i>' +
                                '                       <i class="far fa-address-card mr-4 fa-2x pointer"' +
                                ' data-toggle="tooltip" data-placement="bottom" title="Карточка"></i>' +
                                '                       <i class="fas fa-chart-pie mr-4 fa-2x pointer"' +
                                ' data-toggle="tooltip" data-placement="bottom" title="Проказатель качества"></i>' +
                                '                   </div>' +
                                '               </div>' +
                                '           </div>' +
                                '       </div>' +
                                '   </h5>' +
                                '</div>'
                            );
                            //console.log(levelUp);
                            if(level == 'managements') {
                                arrowAdd2.arrow('#'+levelUp,'#'+level+'Name'+key+keys);
                            }
                            if(level == 'departments') {
                                arrowAdd3.arrow('#'+levelUp,'#'+level+'Name'+key+keys);
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
                            //getFunctionsDepartments(row.id, '#division');
                            /*if (row.childDivision.length > 0) {
                                for(var y in row.childDivision) {
                                    var administrators = row.childDivision[y];
                                    var key = parseInt(y)+1;
                                    $('#administrators').append(
                                        '<div class="mb-3" id="administrators'+key+'">' + //border border-dark
                                        '   <h6 class="bg-primary p-3 text-white font-weight-bold">'+administrators.name +
                                        '       <img class="logo float-left mr-3" src="resources/images/logo.png">'+
                                        '       <div class="pointer addBtn" data-block="administrators" data-id="'+key+'">' +
                                        '           <span class="pointer addBtn"' +
                                        ' data-block="administrators"' +
                                        ' data-id="'+key+'">' +
                                        '               <i class="far fa-minus-square minusBtn d-none"></i>' +
                                        '               <i class="far fa-plus-square plusBtn"></i>' +
                                        '           </span>' +
                                        '       </div>' +
                                        '       <div class="my-3">' +
                                        '           <i class="far fa-file-word mx-2 fa-2x pointer" data-toggle="tooltip" data-placement="bottom" title="Нормативный документ"></i>' +
                                        '           <i class="far fa-address-card mx-2 fa-2x pointer" data-toggle="tooltip" data-placement="bottom" title="Карточка"></i>' +
                                        '           <i class="fas fa-chart-pie mx-2 fa-2x pointer" data-toggle="tooltip" data-placement="bottom" title="Проказатель качества"></i>' +
                                        '       </div>' +
                                        '   </h6>' +
                                        '</div>'
                                    );

                                    /!*instance.connect({
                                        source : 'division',
                                        target : 'administrators'+key,
                                        type : 'basic'
                                    });*!/
                                    //getFunctionsDepartments(administrators.id, '#administrators'+key);
                                    if(administrators.childDivision.length > 0) {
                                        for(var z in administrators.childDivision) {
                                            var managements = administrators.childDivision[z];
                                            var keys = parseInt(z)+1;
                                            $('#managements').append(
                                                '<div class="mb-3" id="managements'+key+keys+'">' + //border border-dark
                                                '   <h6 class="bg-primary p-3 text-white font-weight-bold">'+managements.name +
                                                '       <div class="my-3">' +
                                                '           <i class="far fa-file-word mx-2 fa-2x pointer" data-toggle="tooltip" data-placement="bottom" title="Нормативный документ"></i>' +
                                                '           <i class="far fa-address-card mx-2 fa-2x pointer" data-toggle="tooltip" data-placement="bottom" title="Карточка"></i>' +
                                                '           <i class="fas fa-chart-pie mx-2 fa-2x pointer" data-toggle="tooltip" data-placement="bottom" title="Проказатель качества"></i>' +
                                                '       </div>' +
                                                '   </h6>' +
                                                '</div>'
                                            );
                                            //getFunctionsDepartments(managements.id, '#managements'+key+keys);
                                            /!*instance.connect({
                                                source : 'administrators'+key,
                                                target : 'managements'+key+keys,
                                                type : 'basic'
                                            });*!/
                                            if(managements.childDivision.length > 0) {
                                                for(var a in managements.childDivision) {
                                                    var departments =  managements.childDivision[a];
                                                    var keyd = parseInt(a)+1;
                                                    $('#departments').append(
                                                        '<div class="mb-3" id="departments'+key+keys+keyd+'">' + //border border-dark
                                                        '   <h6 class="bg-primary p-3 text-white font-weight-bold">'+departments.name +
                                                        '       <div class="my-3">' +
                                                        '           <i class="far fa-file-word mx-2 fa-2x pointer" data-toggle="tooltip" data-placement="bottom" title="Нормативный документ"></i>' +
                                                        '           <i class="far fa-address-card mx-2 fa-2x pointer" data-toggle="tooltip" data-placement="bottom" title="Карточка"></i>' +
                                                        '           <i class="fas fa-chart-pie mx-2 fa-2x pointer" data-toggle="tooltip" data-placement="bottom" title="Проказатель качества"></i>' +
                                                        '       </div>' +
                                                        '   </h6>' +
                                                        '</div>'
                                                    );
                                                    //getFunctionsDepartments(departments.id, '#departments'+key+keys+keyd);
                                                    /!*instance.connect({
                                                        source : 'managements'+key+keys,
                                                        target : 'departments'+key+keys+keyd,
                                                        type : 'basic'
                                                    });*!/
                                                }
                                            }
                                        }
                                    }
                                }
                            }*/
                        }
                    }
                });
            }

            getDepartments(getId());

            /*});*/

            // Получаем список функций по клику
            $(document).on('click', '.plusBtn', function () {
                var parent = $(this).parent('.addBtn');
                $(this).addClass('d-none');
                var row = $(parent).attr('data-block');
                var id = $(parent).attr('data-id');
                var key = $(parent).attr('data-key');
                $('.minusBtn', parent).removeClass('d-none');
                if (row === 'division') {
                    $('#administrators').removeClass('d-none');
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

            // Подсветка похожих функций при нажатии на отдел
            $(document).on('click', '.functions', function () {
                arrowAdd5.clear();
                arrowReturn1.clear();
                $('.card').css('background', '#fff');
                var id = parseInt($(this).attr('data-id'));
                $('.card[data-id='+id+']').css('background', '#fc6');
                //alert(id);
                if (id > 0) {
                    $.getJSON('rest/profile/authorities/getAllTopLevelAuthoritiesByChildAuthorityId/' + id, function (data) {
                        if (data.length > 0) {
                            var array1 = []; var array2 = []; var array3 = []; var array4 = [];
                            for (var i in data) {
                                var row = data[i];
                                array1.push(row.id);
                                if(row.childAuthorities.length > 0) {
                                    for (var y in row.childAuthorities) {
                                        var rowChild = row.childAuthorities[y];
                                        array2.push(rowChild.id);
                                        if(rowChild.childAuthorities.length > 0) {
                                            for (var z in rowChild.childAuthorities) {
                                                var rowChild1 = rowChild.childAuthorities[z];
                                                array3.push(rowChild1.id);
                                                if(rowChild1.childAuthorities.length > 0) {
                                                    for (var j in rowChild1.childAuthorities) {
                                                        var rowChild2 = rowChild1.childAuthorities[j];
                                                        array4.push(rowChild2.id);
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if($.inArray(id, array1) == -1) {
                                for (var i in array1) {
                                    $('.card[data-id='+array1[i]+']').css('background', '#fc6');
                                    arrowReturn1.arrow('#arrow'+id,'#arrow'+array1[i]);
                                }
                            }
                            if($.inArray(id, array2) == -1) {
                                for (var i in array2) {
                                    $('.card[data-id='+array2[i]+']').css('background', '#fc6');
                                    arrowReturn1.arrow('#arrow'+id,'#arrow'+array2[i]);
                                }
                            }
                            if($.inArray(id, array3) == -1) {
                                for (var i in array3) {
                                    $('.card[data-id='+array3[i]+']').css('background', '#fc6');
                                    arrowReturn1.arrow('#arrow'+id,'#arrow'+array3[i]);
                                }
                            }
                            if($.inArray(id, array4) == -1) {
                                for (var i in array4) {
                                    $('.card[data-id='+array4[i]+']').css('background', '#fc6');
                                    arrowReturn1.arrow('#arrow'+id,'#arrow'+array4[i]);
                                }
                            }
                        } else {
                            //alert('Совпадений не найдено!');
                            //$('.card').css('background', '#fff');
                        }
                    });
                } else {
                    $('.card').css('background', '#fff');
                }
            });

    });
</script>
<jsp:include page="fragments/footerBasement.jsp"/>