jsPlumb.ready(function () {

// установить некоторые значения по умолчанию для jsPlumb.
            var instance = jsPlumb.getInstance({
                Endpoint: ["Dot", {radius: 2}],
                Connector:"StateMachine",
                HoverPaintStyle: {stroke: "#1e8151", strokeWidth: 2 },
                ConnectionOverlays: [
                    [ "Arrow", {
                        location: 1,
                        id: "arrow",
                        length: 14,
                        foldback: 0.8
                    } ],
                ],
                Container: "canvas"
            });

            instance.registerConnectionType("basic", { anchor:"Continuous", connector:"Flowchart" });

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
// инициализация элемента как источник и цель соединения.
            var initNode = function(el) {
                    instance.draggable(el); // initialise draggable elements.
                    instance.makeSource(el, {
                        isSource: true,
                        filter: ".ep",
                        //createEndpoint:true,
                        anchor: "Continuous",
                        connectorStyle: { stroke: "#5c96bc", strokeWidth: 3, outlineStroke: "transparent", outlineWidth: 4 },
                        connectionType:"basic",
                        extract:{
                            "action":"the-action"
                        },
                        maxConnections: 5,
                        onMaxConnections: function (info, e) {
                            alert("Maximum connections (" + info.maxConnections + ") reached");
                        }


                    });
                    instance.makeTarget(el, {
                        isTarget:true,
                        dropOptions: { hoverClass: "dragHover" },
                        createEndpoint:true,
                        anchor: "Continuous",
                        allowLoopback: false //Предотвращение петлевых подключений


                    });
            };
// создание нового элемента.
            var newNode = function() {
                    var d = document.createElement("div");
                    var id = jsPlumbUtil.uuid();
                    d.className = "w";
                    d.id = id;
                    function name() {
                    }
                    //d.innerHTML = id.substring(0, 8) /*подпись блока*/ + "<div class='ep'></div>" + "<div class='main-btn1'></div>";
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
                el: dep,
                id:"aGroup",
                dropOptions: true, //Указывает, что соединения с
                // дочерними элементами внутри Группы (которые исходят из-за пределов Группы) должны быть проксированы
                constrain:true, //препятствует принятию Группой пропущенных элементов
                dropOverride:true, //предотвратит перетаскивание элементов за пределы группы
                autoSize:true,
                draggable: false, //отмена перетаскивания
                anchor:"Continuous",
                endpoint:"Blank",
                droppable:true //По умолчанию группы настроены на прием элементов, сбрасываемых на них - любого элемента,
                // который в данный момент управляется экземпляром jsPlumb, а не только существующих членов других групп.
            });
            instance.addToGroup("aGroup", division1);
            instance.addToGroup("aGroup", division2);
            instance.addToGroup("aGroup", division3);
            instance.addToGroup("aGroup", division4);



            instance.addGroup({
                el: branch1,
                id:"bGroup",
                dropOptions: true, //Указывает, что соединения с
                // дочерними элементами внутри Группы (которые исходят из-за пределов Группы) должны быть проксированы
                constrain:true, //препятствует принятию Группой пропущенных элементов
                dropOverride: true, //предотвратит перетаскивание элементов за пределы группы
                autoSize:true,
                draggable: true, //отмена перетаскивания
                anchor:"Continuous",
                endpoint:"Blank",
                droppable:true //По умолчанию группы настроены на прием элементов, сбрасываемых на них - любого элемента,
                // который в данный момент управляется экземпляром jsPlumb, а не только существующих членов других групп.
            });
            instance.addToGroup("bGroup", branch2);
            instance.addToGroup("bGroup", branch3);
            instance.addToGroup("bGroup", branch4);
// Соединители
            instance.connect({ source: "division1", target: "branch3", type:"basic"});
            instance.connect({ source: "division1", target: "branch2", type:"basic"
            });
// collapse/expand group button
            instance.on(canvas, "click", ".node-collapse", function() {
                var g = this.parentNode.getAttribute("group"), collapsed = instance.hasClass(this.parentNode, "collapsed");

                instance[collapsed ? "removeClass" : "addClass"](this.parentNode, "collapsed");
                instance[collapsed ? "expandGroup" : "collapseGroup"](g);
            });
            jsPlumb.fire("jsPlumbDemoLoaded", instance);
// Модальное окно
    var modal = document.getElementById('myModal');
    var btn= document.getElementById('myBtn');
    var span = document.getElementById('myClose');
    var btn1 = document.getElementsByClassName('main-btn');

    btn.onclick = function () {modal.style.display = "block";};

    span.onclick = function () {
        modal.style.display = "none";
    };
    window.onclick = function (event) {
        if(event.target == modal) {
            modal.style.display ="none"
        }
    };

// Создание нового элемента
    $('.main-btn').click(function(e) {
        newNode(e.offsetX, e.offsetY);
        modal.style.display = "none";
        d.innerHTML = id.substring(0, 8) /*подпись блока*/ + "<div class='ep'></div>" + "<div class='main-btn1'></div>";
    });


// Кнопка удаления
    $('.main-btn1').on('click', function (c) {
        var g= $(this).parent().remove();

        // var conn = g.getConnections({
        //     source: sourceId,
        //     target: targetId
        // });
        // if (conn[0]) {
        //     instance.deleteConnection(conn[0]);
       // instance.bind("click", function (c) {
       //      instance.deleteConnection(c);
       //  });

      //  $(this).parent().remove();
     //  $(this).getConnections().hide();
    });

        //$(this).deleteConnection(c);
        //jsPlumb.deleteEveryEndpoint();


        //jsPlumb.deleteConnectionsForElement(el, [params])
        /*
                /*
                var conn = g.getConnections({
                    source: sourceId,
                    target: targetId
                });
                if (conn[0]) {
                    instance.detach(conn[0]);
                }
                 */
});
$(function(){

    $('.load-more').on('click', function(){
        const btn = $(this);
        const loader = btn.find('span');
        $.ajax({
            url: '/data.html',
            type: 'GET',
            beforeSend: function(){
                btn.attr('disabled', true);
                loader.addClass('d-inline-block');
            },
            success: function(responce){
                setTimeout(function(){
                    loader.removeClass('d-inline-block');
                    btn.attr('disabled', false);
                    $('.after-posts').before(responce);
                    ///console.log(responce);
                }, 1000);
            },
            error: function() {
                alert('Error!');
                loader.removeClass('d-inline-block');
                btn.attr('disabled', false);
            }

        });
    });
});





/*

//Начало работы
    $(document).ready(function() {         //обработчик события, выполнить функцию, когда документ загрузится
        //alert($('div', '.grid_6').html()); //содержание страницы, второй параметр - родитель
        var a = $('<h5>Hello</h5>')
        $('div', '.grid_6').append(a);      //добавляет к существующему div строку Hello
    });
//начало работы сейчас - в качестве параметра функция
    $(function() {
//Селекторы - строчные выражения, с помощью которых задаются условия поиска

//Базовые селекторы
//селектор по классу
    $('*', 'grid_5');
    all.css({'border': '2px'});
    //* - библиотека выберет все элементы данной страницы и вернет объект множества выбранных элементов
    //правило css определяет свойства для выбранных элементов
    $('*', '.grid_5.preffix_1');    // через точку перечисляет, через пробел ищем вложенные элементы
    $('#id');                       //селекторы по идентификатору
    $('#id, span, .grid.prefix');   //селекторы по тегу, через запятую перечисляем все элементы
    });
//селекторы иерархии
    $('.container>div').css({'border': '2px'}); //выбирает прямыъ потомков контейнера (у каждого конте йнера только один потомок
    $('.div.grid_12+div').css({'border': '2px'}); //выбирает следующий элемент (div) за контейнером
    $('.div.grid_12 ~ div').css({'border': '2px'}); //выбирает все следующие элементы (div) за контейнером\

    var obj = $('dev.grid_12 ~ div');  //в obj сейчас два элемента, те, которые следуют за dev.grid_12
    alert(obj[0]);                      //выводим содежимое первого объекта
    obj[0].innerHTML = 'Hello!'          //заменить содержимое элемента obj[0]

    for(v in obj) {
        document.write("<strong>" + v + "-</strong>" + obj[v] + "<br />")
    }
//селекторы по атрибутам
    $('[src]').css({'border': '2px'});  //при работе с атрибутами оборачивать в []
    $('div[name=email]').css({'border': '2px'}); // поиск всех блоков div с атрибутом name
    $('div[name!=value]').css({'border': '2px'});
    $('div[name^=value]').css({'border': '2px'});
    $('div[name$=value]').css({'border': '2px'});
    $('div[name*=value]').css({'border': '2px'});
    $('div[name~=value]').css({'border': '2px'});
    $('div[name |=value]').css({'border': '2px'});
    $('div[name*=value]').css({'border': '2px'});
//Методы выбора элементов
    $('.inner').parent().addClass('selected'); //выбор родительских элементов
    $('.block').parent().addClass('selected'); //выбора дочерних элементов
    $('li#second-list-item').closest('ul').addClass('selected'); //ближайший
    $('.inner').find('h4').addClass('selected'); //находит по идентификатору
    $('.inner').prev('h4').addClass('selected'); //находит по идентификатору
    $('.inner').next('h4').addClass('selected'); //находит по идентификатору
    $('.inner').siblings('h4').addClass('selected'); //находит по идентификатору
//Методы события
/*
.click()
.dblclock();
.mouseclick(); наведение мыши на кнопку
.mouseleave(); уведение мыши с кнопки
.focus();
.blur(); //размытие, клик вне выделенной области
.change(); // изменение текста в области
.text(); //добавление текста
.change();
.keyup(); //нажатие клавиши
 */
/*
$('#button-1').click(function() {
    $('#top-header').toggleClass('pinkColor');  //смена цвета при клике
})

//.on - Этот метод быстрее, не загружает память и работает с теми элементами, которые были добавлены позже
$('#button-1').on('click', function() {
    $('#top-header').toggleClass('pinkColor');  //смена цвета при клике
    $('#top-header').addClass('pinkColor');
})

//добавление текста
$('#inputName').on('change', function() {
    $('#textHolder').text($('#this').val());
});

//реакция на нажатие клавиши
$('#inputName').on('keyup', function(event){
    if (event.which = 27) {
        //alert('it was ESC!');
        $('#textHolder').text('');
    }
});
//методы работы с классами
$('#customCSS').on('clock', function(){
    $('#textBox').css({'border': '2px'})
});

*/















//Zoom
/*
window.setZoom = function(zoom, instance, transformOrigin, el) {
    transformOrigin = transformOrigin || [ 0.5, 0.5 ];
    instance = instance || jsPlumb;
    el = el || instance.getContainer();
    var p = [ "webkit", "moz", "ms", "o" ],
        s = "scale(" + zoom + ")",
        oString = (transformOrigin[0] * 100) + "% " + (transformOrigin[1] * 100) + "%";

    for (var i = 0; i < p.length; i++) {
        el.style[p[i] + "Transform"] = s;
        el.style[p[i] + "TransformOrigin"] = oString;
    }

    el.style["transform"] = s;
    el.style["transformOrigin"] = oString;

    instance.setZoom(zoom);
};
jsPlumb.setContainer("dep");

$("#dep").css({
    "-webkit-transform":"scale(0.75)",
    "-moz-transform":"scale(0.75)",
    "-ms-transform":"scale(0.75)",
    "-o-transform":"scale(0.75)",
    "transform":"scale(0.75)"
});

jsPlumb.setZoom(3.75);
*/