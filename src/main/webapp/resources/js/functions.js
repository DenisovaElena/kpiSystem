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
        let word = $('#searchWord').val();
        if(word!= '') {
            $.getJSON('rest/profile/authorities/searchAuthorities?word='+word, function(data) {
                if(data.length > 0) {
                    for(let i in data) {
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
    let arrowAdd1 = $cArrows('#iconBlock', {
        render : { strokeStyle: '#999999'},
        arrow: {
            arrowType: 'line',
            connectionType: 'rectangleAngle',
            angleFrom: 0,
            angleTo: 180
        }
    });

    let arrowAdd2 = $cArrows('#iconBlock', {
        render : { strokeStyle: '#999999'},
        arrow: {
            arrowType: 'line',
            connectionType: 'rectangleAngle',
            angleFrom: 0,
            angleTo: 180
        }
    });

    let arrowAdd3 = $cArrows('#iconBlock', {
        render : { strokeStyle: '#999999'},
        arrow: {
            arrowType: 'line',
            connectionType: 'rectangleAngle',
            angleFrom: 0,
            angleTo: 180
        }
    });

    let arrowAdd5 = $cArrows('#iconBlock', {
        render : { strokeStyle: '#999999'},
        arrow: {
            arrowType: 'arrow',
            connectionType: 'rectangleAngle',
            angleFrom: 0,
            angleTo: 180
        }
    });

    let arrowReturn1 = $cArrows('#iconBlock', {
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
                for(let i in data.childAuthorities) {
                    let end = parseInt(data.childAuthorities[i].id);
                    end = '#arrow'+end;
                    console.log(element+' - '+end);
                    if(dep != '#division') {
                        arrowAdd5.arrow(end, element);
                        $(element).css('background', '#fc6');
                        $(end).css('background', '#fc6');
                    }
                }
            }*/
            for(let i in data) {
                let end = parseInt(data[i].id);
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
            for (let i in data) {
                let row = data[i];
                $(element).append(
                    '<div class="card functions p-2 my-2 mx-2 font-size-small' +
                    ' pointer"' +
                    ' id="arrow'+row.id+'"' +
                    ' data-id="'+row.id+'"' +
                    ' data-parent="'+element+'">'+row.name+'</div>'
                );
                if(element != '#division') {
                    //getArrow(row.id, '#arrow' + row.id, element);
                }
            }
        });
    }

    function getDivisions(key,keys,img,level,itemName,itemId,link) {
            $('#' + level).append(
                '<div class="mb-3 cardBlock" id="'+level+key+keys+'">' +
                '   <h5 class="bg-primary p-3 text-white rounded" id="'+level+'Name'+key+keys+'">' +
                '       <div class="row">' +
                '           <div class="col-3 d-flex' +
                ' align-items-center justify-content-center">' +
                '               <img class="img-fluid" src="'+img+'">' +
                '           </div>' +
                '           <div class="col-9">' +
                '               <div class="row">' +
                '                   <div class="col-9 d-flex' +
                ' align-items-center justify-content-start' +
                ' font-size-small">'+itemName+'</div>' +
                '                   <div class="col-3 d-flex align-items-start justify-content-end">' +
                '                       <div class="pointer addBtn"' +
                ' data-block="'+level+'"' +
                ' data-id="'+itemId+'"' +
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
                '                       <a href="users?id='+itemId+'">' +
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
            //console.log(levelUp);
            /*if(level == 'managements') {
                arrowAdd2.arrow('#'+levelUp,'#'+level+'Name'+key+keys);
            }
            if(level == 'departments') {
                arrowAdd3.arrow('#'+levelUp,'#'+level+'Name'+key+keys);
            }*/
    }

    // Получение связанных функций детей 3 порядка
    function getArrowChildDeep2 (id) {
        $.getJSON('rest/profile/authorities/getAllChilds/' + id, function (data) {
            for(let i in data) {
                let row = data[i].childAuthorities;
                for(let y in row) {
                    let idParent = $('.card[data-id='+row[y].id+']').attr('data-parent');
                    $(idParent).removeClass('d-none');
                    $('.card[data-id='+row[y].id+']').css('background', '#fc6').removeClass('d-none');
                    arrowReturn1.arrow('#arrow'+id, '#arrow'+row[y].id);
                }
            }
        });
    }

    // Получение связанных функций детей 2 порядка
    function getArrowChildDeep (id) {
        $.getJSON('rest/profile/authorities/getAllChilds/' + id, function (data) {
            for(let i in data) {
                let row = data[i].childAuthorities;
                for(let y in row) {
                    let idParent = $('.card[data-id='+row[y].id+']').attr('data-parent');
                    $(idParent).removeClass('d-none');
                    $('.card[data-id='+row[y].id+']').css('background', '#fc6').removeClass('d-none');
                    arrowReturn1.arrow('#arrow'+id, '#arrow'+row[y].id);
                    getArrowChildDeep2(row[y].id);
                }
            }
        });
    }

    // Получение связанных функций детей
    function getArrowChild (id) {
        $.getJSON('rest/profile/authorities/getAllChilds/' + id, function (data) {
            for(let i in data) {
                let row = data[i].childAuthorities;
                for(let y in row) {
                    let idParent = $('.card[data-id='+row[y].id+']').attr('data-parent');
                    $(idParent).removeClass('d-none');
                    $('.card[data-id='+row[y].id+']').css('background', '#fc6').removeClass('d-none');
                    arrowReturn1.arrow('#arrow'+id, '#arrow'+row[y].id);
                    getArrowChildDeep(row[y].id);
                }
            }
        });
    }

    // Получение связанных функций родителей 3 порядка
    function getArrowParentUp2 (id) {
        $.getJSON('rest/profile/authorities/getAllParents/' + id, function (data) {
            if(data.length > 0) {
                for(let i in data) {
                    let row = data[i];
                    let idParent = $('.card[data-id='+row.id+']').attr('data-parent');
                    $(idParent).removeClass('d-none');
                    $('.card[data-id='+row.id+']').css('background', '#fc6').removeClass('d-none');
                    arrowReturn1.arrow('#arrow'+row.id, '#arrow'+id);
                }
            }
        });
    }

    // Получение связанных функций родителей 2 порядка
    function getArrowParentUp (id) {
        $.getJSON('rest/profile/authorities/getAllParents/' + id, function (data) {
            if(data.length > 0) {
                for(let i in data) {
                    let row = data[i];
                    let idParent = $('.card[data-id='+row.id+']').attr('data-parent');
                    $(idParent).removeClass('d-none');
                    $('.card[data-id='+row.id+']').css('background', '#fc6').removeClass('d-none');
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
                for(let i in data) {
                    let row = data[i];
                    let idParent = $('.card[data-id='+row.id+']').attr('data-parent');
                    $(idParent).removeClass('d-none');
                    $('.card[data-id='+row.id+']').css('background', '#fc6').removeClass('d-none');
                    arrowReturn1.arrow('#arrow'+row.id, '#arrow'+id);
                    getArrowParentUp(row.id);
                }
            }
        });
    }

    // Получение пользователей
    function getUsers (data, key) {
        for (let z in data) {
            let users = data[z];
            let keys = parseInt(z) + 1;
            let img = 'resources/images/logo.png';
            let currentName = '';
            let userPosition = '';
            if(users.position && users.position != '') {userPosition = users.position;}
            if(users.firstname && users.firstname != '') {
                let newFirstname =
                    users.firstname.substr(0,1)+'.';
                let newPatronym =
                    users.patronym.substr(0,1)+'.';
                currentName =
                    users.lastname+' '+newFirstname+' '+newPatronym+'<br>'+userPosition;
            }
            $('#users').append(
                '<div class="mb-3 cardBlock" id="users'+key+keys+'">' +
                '   <div class="bg-primary px-3 py-1 text-white rounded" id="usersName'+key+keys+'">' +
                '       <div class="row">' +
                '           <div class="col-3 d-flex' +
                ' align-items-center justify-content-center">' +
                '               <img class="img-fluid" src="'+img+'">' +
                '           </div>' +
                '           <div class="col-9">' +
                '               <div class="row">' +
                '                   <div class="col-9 d-flex align-items-center justify-content-start font-size-small">'+currentName+'</div>' +
                '                   <div class="col-3 d-flex align-items-start justify-content-end">' +
                '                   </div>' +
                '               </div>' +
                '               <div class="row">' +
                '                   <div class="col-12 my-3 mr-3 d-flex align-items-center">' +
                '                       <i class="far fa-file-word mr-4 pointer"' +
                ' data-toggle="tooltip" data-placement="bottom" title="Нормативный документ"></i>' +
                '                       <a href="division?id='+users.id+'">' +
                '                           <i class="far fa-address-card mr-4 pointer text-white"' +
                ' data-toggle="tooltip"' +
                ' data-placement="bottom"' +
                ' title="Карточка пользователя">' +
                '                           </i>' +
                '                       </a>' +
                '                       <i class="fas fa-chart-pie mr-4 pointer"' +
                ' data-toggle="tooltip" data-placement="bottom" title="Проказатель качества"></i>' +
                '                   </div>' +
                '               </div>' +
                '           </div>' +
                '       </div>' +
                '   </div>' +
                '</div>'
            );
            getFunctionsDepartments(users.id, '#users'+key+keys);
        }
    }


    // Отменяем покраску всех блоков и стрелки
    $(document).on('click', '#refresh', function() {
        $('.card').css('background','#fff').removeClass('d-none');
        $('.cardBlock').removeClass('d-none');
        arrowReturn1.clear();
    });