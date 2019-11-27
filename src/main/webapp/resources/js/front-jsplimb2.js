jsPlumb.ready(function () {
    //    $(document).on('click','#authorities4', function() {
        //     var dataId = $(this).attr('data-parent');
        //
        //     instance.connect({source: "division1", target: "branch3", type: "basic"});
        //
        //     console.log(dataId);
        // });


    // function getConnect(url, id) {
    //     $.getJSON(url+id, function(data) {
    //
    //     });
    //
    //
    //
    // }
    //$(document).on('ready', function() {
    //     $('.childBlock').each(function() {
    //         // $.each($('.childBlock'), function (index, value) {
    //         // $(document).on('each', '.childBlock', function() {
    //         //var dataParent = $(this).attr('data-parent');
    //         var dataId = $(this).attr('id');
    //         console.log(dataId);
    //     });
    // });

    function getId() {return new URL(window.location.href).searchParams.get("id");}
// установить некоторые значения по умолчанию для jsPlumb.
    var instance = jsPlumb.getInstance({
        Endpoint: ["Dot", {radius: 2}],
        Connector: "StateMachine", //Flowchart
        HoverPaintStyle: {stroke: "#1e8151", strokeWidth: 2},
        ConnectionOverlays: [
            ["Arrow", {
                location: 1,
                id: "arrow",
                length: 14,
                foldback: 0.8
            }],
        ],
        Container: "canvas"
    });

    instance.registerConnectionType("basic", {anchor: "Continuous", connector: "Flowchart"});

    window.jsp = instance;

    var canvas = document.getElementById("canvas");
    var windows = jsPlumb.getSelector(".statemachine-demo .w");

// привязать прослушиватель кликов к каждому соединению
    instance.bind("click", function (c) {
        instance.deleteConnection(c);
    });
    /*
    // привязать слушателя двойного щелчка к «canvas»; добавьте новый узел, когда это произойдет.
                jsPlumb.on(canvas, "dblclick", function(e) {
                    newNode(e.offsetX, e.offsetY);
                });
    */

//Автоматическое создание новых элементов
    function newElem1() {
        for (var i=2; i<10; i++) {
            var t=i+1;
            $('<div class="w" id="authorities'+i+'" ><span class="nameBlock1">Функция</span>\n' +
                '                        <button class="main-btn1" type="submit" value="1">&times;</button>\n' +
                '                        <div class="ep" action="authorities'+i+'"></div>\n' +
                '                    </div>').insertAfter( '<div class="w" id="authorities'+t+'" ><span class="nameBlock1">Функция</span>\n' +
                '                        <button class="main-btn1" type="submit" value="1">&times;</button>\n' +
                '                        <div class="ep" action="authorities'+t+'"></div>\n' +
                '                    </div>');
            // instance.addToGroup("division1", "authorities'+i+'");
        }
    }
    newElem1();




// инициализация элемента как источник и цель соединения.
    var initNode = function (el) {
        instance.draggable(el); // initialise draggable elements.
        instance.makeSource(el, {
            isSource: true,
            filter: ".ep",
            //createEndpoint:true,
            anchor: "Continuous",
            connectorStyle: {stroke: "#5c96bc", strokeWidth: 3, outlineStroke: "transparent", outlineWidth: 4},
            connectionType: "basic",
            extract: {
                "action": "the-action"
            },
            maxConnections: 5,
            onMaxConnections: function (info, e) {
                alert("Maximum connections (" + info.maxConnections + ") reached");
            }
        });
        instance.makeTarget(el, {
           isTarget: true,
            dropOptions: {hoverClass: "dragHover"},
            //createEndpoint: true,
            anchor: "Continuous",
            allowLoopback: false //Предотвращение петлевых подключений
        });
    };
// создание нового элемента.
    var newNode = function () {
        var d = document.createElement("div");
        var id = jsPlumbUtil.uuid();
        d.className = "w";
        d.id = id;
        d.innerHTML = id.substring(0, 8) /*подпись блока*/ + "<div class='ep'></div>" + "<div class='main-btn1'></div>";
        d.style.left = 0 + "px";
        d.style.top = 0 + "px";
        instance.getContainer().appendChild(d);
        initNode(d);
        return d;
    };

// приостановить рисование и инициализировать
    instance.batch(function () {
        for (var i = 0; i < windows.length; i++) {
            initNode(windows[i], true);
        }
    });
//Группы
    instance.addGroup({
        el: division1,
        id: "division1",
        dropOptions: false, //Указывает, что соединения с
        // дочерними элементами внутри Группы (которые исходят из-за пределов Группы) должны быть проксированы
        constrain: true, //препятствует принятию Группой пропущенных элементов
        dropOverride: true, //предотвратит перетаскивание элементов за пределы группы
        autoSize: true,
        maxSize:[600,600],
        draggable: false, //отмена перетаскивания
        anchor: "Continuous",
        endpoint: "Blank",
        orphan: true,
        droppable: true //По умолчанию группы настроены на прием элементов, сбрасываемых на них - любого элемента,
        // который в данный момент управляется экземпляром jsPlumb, а не только существующих членов других групп.
    });
    instance.addToGroup("division1", childDivId);
   // instance.addToGroup("division1", authorities2);

    instance.addGroup({
        el: division2,
        id: "division2",
        dropOptions: false, //Указывает, что соединения с
        // дочерними элементами внутри Группы (которые исходят из-за пределов Группы) должны быть проксированы
        constrain: true, //препятствует принятию Группой пропущенных элементов
        dropOverride: true, //предотвратит перетаскивание элементов за пределы группы
        autoSize:true,
        maxSize:[600,600],
        draggable: true, //отмена перетаскивания
        anchor: "Continuous",
        endpoint: "Blank",
        droppable: true //По умолчанию группы настроены на прием элементов, сбрасываемых на них - любого элемента,
        // который в данный момент управляется экземпляром jsPlumb, а не только существующих членов других групп.
    });
    instance.addToGroup("division2", authorities4);

    instance.addGroup({
        el: division3,
        id: "division3",
        dropOptions: false, //Указывает, что соединения с
        // дочерними элементами внутри Группы (которые исходят из-за пределов Группы) должны быть проксированы
        constrain: true, //препятствует принятию Группой пропущенных элементов
        dropOverride: true, //предотвратит перетаскивание элементов за пределы группы
        autoSize:true,
        maxSize:[600,600],
        draggable: true, //отмена перетаскивания
        anchor: "Continuous",
        endpoint: "Blank",
        droppable: true //По умолчанию группы настроены на прием элементов, сбрасываемых на них - любого элемента,
        // который в данный момент управляется экземпляром jsPlumb, а не только существующих членов других групп.
    });
    instance.addToGroup("division3", authorities3);

    instance.addGroup({
        el: division4,
        id: "division4",
        dropOptions: false, //Указывает, что соединения с
        // дочерними элементами внутри Группы (которые исходят из-за пределов Группы) должны быть проксированы
        constrain: true, //препятствует принятию Группой пропущенных элементов
        dropOverride: true, //предотвратит перетаскивание элементов за пределы группы
        autoSize:true,
        maxSize:[600,600],
        draggable: true, //отмена перетаскивания
        anchor: "Continuous",
        endpoint: "Blank",
        droppable: true //По умолчанию группы настроены на прием элементов, сбрасываемых на них - любого элемента,
        // который в данный момент управляется экземпляром jsPlumb, а не только существующих членов других групп.
    });

    //instance.addToGroup("division4", authorities3);



// Соединители
    instance.connect({source: "division1", target: "branch3", type: "basic"});
    instance.connect({source: "division2", target: "branch2", type: "basic"});
// collapse/expand group button
    instance.on(canvas, "click", ".node-collapse", function () {
        var g = this.parentNode.getAttribute("group"), collapsed = instance.hasClass(this.parentNode, "collapsed");

        instance[collapsed ? "removeClass" : "addClass"](this.parentNode, "collapsed");
        instance[collapsed ? "expandGroup" : "collapseGroup"](g);
    });
    jsPlumb.fire("jsPlumbDemoLoaded", instance);
// Модальное окно
    var modal = document.getElementById('myModal');
    var btn = document.getElementById('myBtn');
    var span = document.getElementById('myClose');
    var btn1 = document.getElementsByClassName('main-btn');

    btn.onclick = function () {
        modal.style.display = "block";
    };
    span.onclick = function () {
        modal.style.display = "none";
    };
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none"
        }
    };

// Создание нового элемента
        $('.main-btn').click(function (e) {
            newNode(e.offsetX, e.offsetY);
            modal.style.display = "none";
            // d.innerHTML = id.substring(0, 8) /*подпись блока*/ + "<div class='ep'></div>" + "<div class='main-btn1'></div>";
        });

// Запросы к серверу
    // Функция для работы с division (названия подложек: Департамент, Проектный офис 1, ...)
    function getAllTopLevel()
    {
        $.ajax({
            url: "rest/profile/divisions/getAllTopLevel",
            method: "GET",
            contentType: "application/json",
            success: function (data) {
                for (var y in data) {
                    var k = parseInt(y)+1;
                    $('#division'+k +' .nameBlock').text(data[y].name);
                        for (var m in data[y].childDivision) {
                            var m1 = parseInt(m)+2;
                            $('#division' + m1 + ' .nameBlock').text(data[y].childDivision[m].name);
                        }
                }
                //$('#division1').text(data[0].name);
                 //$('#division2').text(data[0].childAuthorities[0].name);
            },
            error: function () {
                alert('Error!');
            }
        });
    }
    getAllTopLevel();

    //Функция для работы с Authorities (названия блоков: Функция 1, Функция 2, Подфункция 3, ...)
    function getAuthorities(newId)
    {

        $.ajax({
            url: "rest/profile/authorities/getAuthoritiesByDivisionId/2",
            method: "GET",
            contentType: "application/json",
            async: false,
            success: function (data) {
                for (var y in data) {
                        var k = parseInt(y) + 3;
                        $('#authorities' + k + ' .nameBlock2').text(data[y].name);
                        $('#authorities' + k).attr('data-value', data[y].id);
                }
            },
            error: function () {
                alert('Error!');
            }
        });
        $.ajax({
            url: "rest/profile/authorities/getAuthoritiesByDivisionId/3",
            method: "GET",
            contentType: "application/json",
            async: false,
            success: function (data) {
                for (var y in data) {
                        var k = parseInt(y) + 4;
                        $('#authorities' + k + ' .nameBlock2').text(data[y].name);
                        $('#authorities' + k).attr('data-value', data[y].id );  //даем атрибут "data-parent", сюда надо вставить вместо 49 - parentId, было: data[y].id
                }
            },
            error: function () {
                alert('Error!');
            }
        });
        $.ajax({
            url: "rest/profile/authorities/getAuthoritiesByDivisionId/1",
            method: "GET",
            contentType: "application/json",
            async: false,
            success: function (data) {
                for (var y in data) {
                    var k = parseInt(y) + 1;
                    $('#authorities' + k + ' .nameBlock1').text(data[y].name);
                    $('#authorities' + k).attr('data-value', data[y].id);
                    var m = data[y].childAuthorities
                    if (m.length > 0) {
                        for (var i in m) {
                            var childId = m[i].id;
                            $('[data-value = '+childId+']').attr('data-parent',  data[y].id);
                        }
                    }
                }
            },
            error: function () {
                alert('Error!');
            }
        });
    }
    getAuthorities();
   // $(document).on('click','#authorities4', function() {
   //      var dataId = $(this).attr('data-parent');
   //      console.log(dataId);
   //  });
    //Функция: id и создаем связи
    function getConnect() {
        $('.childBlock').each(function () {
            // $.each($('.childBlock'), function (index, value) {
            // $(document).on('each', '.childBlock', function() {
            var dataParent = $(this).attr('data-parent');
            var childId = $(this).attr('id');
            var dataId = $('[data-value = '+dataParent+']').attr('id');
            //var dataId = $(this).attr('id');
            //console.log(dataId);
            instance.connect({source: dataId, target: childId, type: "basic"});
        });
    }
   getConnect();
    // var newId =  getId();
    // function getDivision(url, newId)   //Функция работы с контроллером при изменяющемся id (в окончании контроллера)
    // {
    //     $.ajax({
    //         url: url+newId,
    //         method: "GET",
    //         contentType: "application/json",
    //         success: function (data) {
    //             if (id == 1) {
    //                 for (var y in data) {
    //                     if (data[y].topLevel === true) {
    //                         var k = parseInt(y) + 1;
    //                         $('#authorities' + k + ' .nameBlock1').text(data[y].name);
    //                     }
    //                 }
    //             }
    //             for (var y in data) {
    //                     if (data[y].topLevel === true) {
    //                         var k = parseInt(y) + 1;
    //                         $('#authorities' + k + ' .nameBlock1').text(data[y].name);
    //                             for (var m in data[y].childAuthorities) {
    //                                 var m1 = parseInt(y) + 3;
    //                                 $('#authorities' + m1 + ' .nameBlock2').text(data[y].childAuthorities[m].name);
    //                             }
    //                     }
    //
    //                     else {
    //                             for (var y in data) {
    //                                 var k = parseInt(y) + 3;
    //                                 $('#authorities' + k + ' .nameBlock2').text(data[y].name);
    //                             }
    //                     }
    //              }
    //            // console.log(data[0].childAuthorities[0].name);
    //            //  $('#authorities1').text(data[0].name);
    //            //  $('#authorities2').text(data[1].name);
    //            //  $('#authorities3').text(data[0].childAuthorities[0].name);
    //            //  $('#authorities4').text(data[1].childAuthorities[0].name);
    //         },
    //         error: function () {
    //             alert('Error!');
    //         }
    //     });
    // }
    // getDivision('rest/profile/authorities/getAuthoritiesByDivisionId/', 2);  //в конце обязательно "/"

// Кнопка удаления
            $(document).on('click', '.main-btn1', function (conn) {  //в новых созданных кнопках работает функция "закрыть"
                var g = $(this).parent();
                g.remove();
                instance.deleteConnectionsForElement(g);//Удаление всех соединений из одного элемента
                //Нахождение группы и удаление коннектеров
                var group1 = instance.getMembers(g);
                instance.deleteConnectionsForElement(group1);
           });

// Соединнение блоков
    jsPlumb.batch(function() {
        // import here
        for (var i = 0, j = connections.length; i < j; i++) {
            jsPlumb.connect(connections[i]);
        }
    });
});




