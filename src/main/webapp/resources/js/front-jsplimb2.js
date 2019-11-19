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
                        filter: ".ep",
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
                        anchor: "Continuous",
                        allowLoopback: false //Предотвращение петлевых подключений
                    });
            };
// создание новго элемента.
            var newNode = function(x, y) {
                    var d = document.createElement("div");
                    var id = jsPlumbUtil.uuid();
                    d.className = "w";
                    d.id = id;
                    d.innerHTML = id.substring(0, 7) + "<div class=\"ep\"></div>";
                    d.style.left = x + "px";
                    d.style.top = y + "px";
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


            var endpointOptions = {
                anchor:"division1",
                isSource:true,
                isTarget:true,
                connector : "Straight",
                connectorStyle: { lineWidth:20, strokeStyle:'blue' },
                scope:"blueline",
                dragAllowedWhenFull:false
            };

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
            instance.connect({ source: "division1", target: "branch3", type:"basic" });
            instance.connect({ source: "division1", target: "branch2", type:"basic"
            });



// collapse/expand group button
            instance.on(canvas, "click", ".node-collapse", function() {
                var g = this.parentNode.getAttribute("group"), collapsed = instance.hasClass(this.parentNode, "collapsed");

                instance[collapsed ? "removeClass" : "addClass"](this.parentNode, "collapsed");
                instance[collapsed ? "expandGroup" : "collapseGroup"](g);
            });

            jsPlumb.fire("jsPlumbDemoLoaded", instance);

// collapse/expand group button
    var modal = document.getElementById('myModal');
    var btn= document.getElementById('myBtn');
    var span = document.getElementById('myClose');
    var btn1 = document.getElementsByClassName('main-btn');

    btn.onclick = function () {modal.style.display = "block";}

    span.onclick = function () {
        modal.style.display = "none";
    };
    window.onclick = function (event) {
        if(event.target == modal) {
            modal.style.display ="none"
        }
    };

    $('.main-btn').click(function(e) {

        newNode(e.offsetX, e.offsetY);
        modal.style.display = "none";
    });


    // delete group button

    $('.close1').click(function () {
       var g = $(this).attr("data-value");
      $('.w').hasAttr('id', g).css('background-color', 'red !important');




       /*
       instance.empty(g);

        var conn = jsPlumb.getConnections({
            //only one of source and target is needed, better if both setted
            source: sourceId,
            target: targetId
        });
        if (conn[0]) {
            instance.detach(conn[0]);
        }

        */
    });

});






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