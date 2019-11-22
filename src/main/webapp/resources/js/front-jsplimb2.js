jsPlumb.ready(function () {

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
        el: dep,
        id: "aGroup",
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
    instance.addToGroup("aGroup", division1);
    instance.addToGroup("aGroup", division2);
    instance.addToGroup("aGroup", division3);
    instance.addToGroup("aGroup", division4);

    instance.addGroup({
        el: branch1,
        id: "bGroup",
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
    instance.addToGroup("bGroup", branch2);
    instance.addToGroup("bGroup", branch3);
    //instance.addToGroup("bGroup", branch4);
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
// Запрос к серверу
        $.ajax({
            url: "rest/profile/authorities/getAllTopLevel",
            method: "GET",
            contentType: "application/json",
            success: function (data) {
                for (var y in data) {
                    var k = parseInt(y)+1;
                    $('#division'+k+' .nameBlock').text(data[y].name);
                        for (var m in data[y].childAuthorities) {
                            var m1 = parseInt(y)+1;
                            $('#branch' + m1 + ' .nameBlock').text(data[y].childAuthorities[m].name);
                           // y+=1;
                        }
                }
                // $('#division1').text(data[0].name);
                // $('#division2').text(data[1].name);
            },
            error: function () {
                alert('Error!');
            }
        });
// Кнопка удаления
            $(document).on('click', '.main-btn1', function (conn) {  //в новых созданных кнопках работает функция "закрыть"
                var g = $(this).parent();
                g.remove();
                instance.deleteConnectionsForElement(g);//Удаление всех соединений из одного элемента

                //Нахождение группы и удаление коннектеров
                var group1 = instance.getMembers(g);
                instance.deleteConnectionsForElement(group1);
           });
});



function getData() { //Получаем дату
    const data = Cookies.getCookie('data') || getDefaultJSONData()
    return JSON.parse(data)
}
function saveData() { //Сохраняем дату
    const options = {
        expires:1e10
    }

}
// //таймер
// window.onload = function() {
//     var div = document.querySelect('.items .item');
//     var timer = new Timer(60, div);
//
//     setInterval(function() {
//         timer.tick();
//         }, 1000);
//     }
// function Timer(time, elem) {
//     this.time = time;
//     this.elem = elem;
//
//     this.tick = function(){
//         this.time = time;
//         this.elem = elem;
//
//         this.tick = function() {
//             this.time--;
//             this.elem.innerHTML = this.time;
//         }
//     }






