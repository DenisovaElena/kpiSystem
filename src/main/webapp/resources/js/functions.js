// Подсказки
$('[data-toggle="tooltip"]').tooltip();

// Получаем значения из строки
function getId(id) {
    return new URL(window.location.href).searchParams.get(id);
}

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

// Получение значений в основном блоке
function getDepartments(url, id, pole) {
    $.getJSON(url+id, function (data) {
        $('#departmentName').html(data.name);
        $('#'+pole+' .addBtn').attr('data-id', id);
        $('#'+pole+' .Sitemap').attr('data-id', id);
    });
}

// Инициализация стрелок
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

// Рисуем стрелочки
function getArrow (id, element, dep) {
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
            //console.log(element+' - '+end);
            if(dep != '#division') {
                arrowAdd5.arrow(end, element);
                $(element).css('background', '#fc6');
                $(end).css('background', '#fc6');
            }
        }
    });
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

function getDivisions(id, key, level, levelUp, levelUp1) {
    $.getJSON('rest/profile/divisions/'+id, function (row) {
        if (row.childDivision.length > 0) {
            for (var z in row.childDivision) {
                var item = row.childDivision[z];
                var keys = parseInt(z) + 1;
                var link = '';
                if(levelUp1 && levelUp1 != '') {
                    link = level+'?id='+item.id+'&levelUp='+id+'&levelUp1='+levelUp1;
                } else {
                    link = level+'?id='+item.id+'&levelUp='+id;
                }
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
                    '                       <div class="pointer addBtn"' +
                    ' data-block="'+level+'"' +
                    ' data-id="'+item.id+'"' +
                    ' data-key='+key+keys+'>' +
                    '                           <i class="far fa-minus-square minusBtn d-none"></i>' +
                    '                           <i class="far fa-plus-square plusBtn"></i>' +
                    '                       </div>' +
                    '                   </div>' +
                    '               </div>' +
                    '               <div class="row">' +
                    '                   <div class="col-12 my-3 mr-3 d-flex align-items-center">' +
                    '                       <a href="'+link+'">' +
                    '                           <i class="fas fa-sitemap mr-4 fa-2x pointer text-white Sitemap"' +
                    ' data-toggle="tooltip" data-placement="bottom"' +
                    ' title="Карта подразделения">' +
                    '                           </i>' +
                    '                       </a>' +
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
                console.log(levelUp);
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