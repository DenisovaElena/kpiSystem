//Загрузка документа всегда сверху
$(document).ready(function() {
    setTimeout(function() {
        window.scrollTo(0, 0);
    }, 1);
});

// Подсказки
$('[data-toggle="tooltip"]').tooltip();

// Получаем значения из строки
function getId(id) {
    return new URL(window.location.href).searchParams.get(id);
}

// Подсчёт элементов в массиве
function countElem (array) {return array.length;}

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
        if(data.chiefEmployee != null) {
            if(data.chiefEmployee.photo) {
                $('.photoUser').attr('src', data.chiefEmployee.photo);
            }
        }
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
    arrow: {
        arrowType: 'arrow',
        connectionType: 'rectangleAngle',
        angleFrom: 0,
        angleTo: 180
    }
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
        //if(data.length == 0) {$(element+'
        // .addBtn').removeClass('d-none').addClass('d-none');}
        for (var i in data) {
            var row = data[i];
            $(element).append(
                '<div class="card functions p-2 my-2 mx-5 font-size-small pointer" id="arrow' + row.id + '" data-id="' + row.id + '">' + row.name + '</div>'
            );
            if(element != '#division') {
                //getArrow(row.id, '#arrow' + row.id, element);
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
                var img = 'resources/images/logo.png';
                if(item.chiefEmployee != null) {
                    if(item.chiefEmployee.photo) {
                        img = item.chiefEmployee.photo;
                    }
                }
                $('#' + level).append(
                    '<div class="mb-3" id="'+level+key+keys+'">' + //border border-dark
                    '   <h5 class="bg-primary p-3 mx-5 text-white" id="'+level+'Name'+key+keys+'">' +
                    '       <div class="row">' +
                    '           <div class="col-3 d-flex' +
                    ' align-items-center justify-content-center">' +
                    '               <img class="img-fluid" src="'+img+'">' +
                    '           </div>' +
                    '           <div class="col-9">' +
                    '               <div class="row">' +
                    '                   <div class="col-9 d-flex align-items-center justify-content-start font-size-middle">'+item.name+'</div>' +
                    '                   <div class="col-3 d-flex align-items-start justify-content-end">' +
                    '                       <div class="pointer addBtn"' +
                    ' data-block="'+level+'"' +
                    ' data-id="'+item.id+'"' +
                    ' data-key='+key+keys+'>' +
                    '                           <i class="far fa-minus-square minusBtn"></i>' +
                    '                           <i class="far fa-plus-square plusBtn d-none"></i>' +
                    '                       </div>' +
                    '                   </div>' +
                    '               </div>' +
                    '               <div class="row">' +
                    '                   <div class="col-12 my-3 mr-3 d-flex align-items-center">' +
                    '                       <a href="'+link+'">' +
                    '                           <i class="fas fa-sitemap mr-4 pointer text-white Sitemap"' +
                    ' data-toggle="tooltip" data-placement="bottom"' +
                    ' title="Карта подразделения">' +
                    '                           </i>' +
                    '                       </a>' +
                    '                       <i class="far fa-file-word mr-4 pointer"' +
                    ' data-toggle="tooltip" data-placement="bottom" title="Нормативный документ"></i>' +
                    '                       <a href="division?id='+item.id+'">' +
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
                getFunctionsDepartments(id, '#'+level+key+keys);
                //console.log(levelUp);
                /*if(level == 'managements') {
                    arrowAdd2.arrow('#'+levelUp,'#'+level+'Name'+key+keys);
                }
                if(level == 'departments') {
                    arrowAdd3.arrow('#'+levelUp,'#'+level+'Name'+key+keys);
                }*/
            }
        }
    });
}

// Получение связанных функций детей 3 порядка
function getArrowChildDeep2 (id) {
    $.getJSON('rest/profile/authorities/getAllChilds/' + id, function (data) {
        for(var i in data) {
            var row = data[i].childAuthorities;
            for(var y in row) {
                $('.card[data-id='+row[y].id+']').css('background', '#fc6').removeClass('d-none');
                console.log('#arrow'+id, '#arrow'+row[y].id);
                arrowReturn1.arrow('#arrow'+id, '#arrow'+row[y].id);
            }
        }
    });
}

// Получение связанных функций детей 2 порядка
function getArrowChildDeep (id) {
    $.getJSON('rest/profile/authorities/getAllChilds/' + id, function (data) {
        for(var i in data) {
            var row = data[i].childAuthorities;
            for(var y in row) {
                $('.card[data-id='+row[y].id+']').css('background', '#fc6').removeClass('d-none');
                arrowReturn1.arrow('#arrow'+id, '#arrow'+row[y].id);
                //arrowReturn1.arrow('#arrow'+row[y].id, '#arrow'+id);
                console.log('#arrow'+id, '#arrow'+row[y].id);
                getArrowChildDeep2(row[y].id);
            }
        }
    });
}

// Получение связанных функций детей
function getArrowChild (id) {
    $.getJSON('rest/profile/authorities/getAllChilds/' + id, function (data) {
        for(var i in data) {
            var row = data[i].childAuthorities;
            for(var y in row) {
                $('.card[data-id='+row[y].id+']').css('background', '#fc6').removeClass('d-none');
                arrowReturn1.arrow('#arrow'+id, '#arrow'+row[y].id);
                //arrowReturn1.arrow('#arrow'+row[y].id, '#arrow'+id);
                console.log('#arrow'+id, '#arrow'+row[y].id);
                getArrowChildDeep(row[y].id);
            }
        }
    });
}

// Получение связанных функций родителей 3 порядка
function getArrowParentUp2 (id) {
    $.getJSON('rest/profile/authorities/getAllParents/' + id, function (data) {
        if(data.length > 0) {
            for(var i in data) {
                var row = data[i];
                $('.card[data-id='+row.id+']').css('background', '#fc6').removeClass('d-none');
                arrowReturn1.arrow('#arrow'+row.id, '#arrow'+id);
                //arrowReturn1.arrow('#arrow'+id,'#arrow'+row.id);
            }
        }
    });
}

// Получение связанных функций родителей 2 порядка
function getArrowParentUp (id) {
    $.getJSON('rest/profile/authorities/getAllParents/' + id, function (data) {
        if(data.length > 0) {
            for(var i in data) {
                var row = data[i];
                $('.card[data-id='+row.id+']').css('background', '#fc6').removeClass('d-none');
                //arrowReturn1.arrow('#arrow'+id,'#arrow'+row.id);
                arrowReturn1.arrow('#arrow'+row.id, '#arrow'+id);
                getArrowParentUp2 (row.id);
            }
        }
    });
}

// Получение связанных функций родителей
function getArrowParent (id) {
    $.getJSON('rest/profile/authorities/getAllParents/' + id, function (data) {
        if(data.length > 0) {
            for(var i in data) {
                var row = data[i];
                $('.card[data-id='+row.id+']').css('background', '#fc6').removeClass('d-none');
                //arrowReturn1.arrow('#arrow'+id,'#arrow'+row.id);
                arrowReturn1.arrow('#arrow'+row.id, '#arrow'+id);
                getArrowParentUp(row.id);
            }
        }
    });
}

// Подсветка похожих функций при нажатии на отдел
$(document).on('click', '.functions', function () {
    arrowAdd5.clear();
    arrowReturn1.clear();
    $('.card').css('background', '#fff').addClass('d-none');
    var id = parseInt($(this).attr('data-id'));
    $('.card[data-id='+id+']').css('background', '#fc6').removeClass('d-none');
    //alert(id);
    if (id > 0) {
        getArrowChild(id);
        getArrowParent(id);
        $('body,html').animate({
            scrollTop: 0
        }, 500);
        /*$.getJSON('rest/profile/authorities/getAllTopLevelAuthoritiesByChildAuthorityId/' + id, function (data) {
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
                        arrowReturn1.arrow('#arrow'+array2[i],'#arrow'+array1[0]);
                    }
                }
                if($.inArray(id, array3) == -1) {
                    for (var i in array3) {
                        $('.card[data-id='+array3[i]+']').css('background', '#fc6');
                        getArrowLevel(array3[i], 3);
                    }
                }
                if($.inArray(id, array4) == -1) {
                    for (var i in array4) {
                        $('.card[data-id='+array4[i]+']').css('background', '#fc6');
                        arrowReturn1.arrow('#arrow'+id,'#arrow'+array4[i]);
                    }
                }
                console.log('array1 - '+array1);
                console.log('array2 - '+array2);
                console.log('array3 - '+array3);
                console.log('array4 - '+array4);
            }
        });*/
    } else {
        $('.card').css('background', '#fff');
    }

    // Отменяем покраску всех блоков и стрелки
    $(document).on('click', '#refresh', function() {
        $('.card').css('background','#fff').removeClass('d-none');
        arrowReturn1.clear();
    });
});