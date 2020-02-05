<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>KPI</title>
    <link href="resources/img/favicon.ico" rel="icon" type="image/x-icon">
    <link href="resources/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
    <link rel="stylesheet" href="resources/css/indexCreator.css">
    <script src="resources/js/go.js"></script>
    <%--<script src="resources/js/goSamples.js"></script>--%>
    <link rel="stylesheet" href="resources/css/dataInspector.css" />
    <script src="resources/js/dataInspector.js"></script>
    <script id="code">
        function init() {
            //if (window.goSamples) goSamples();  // init for these samples -- you don't need to call this
            var $ = go.GraphObject.make;  // for conciseness in defining templates

            myDiagram =
                $(go.Diagram, "myDiagramDiv", // must be the ID or reference to div
                    {
                        maxSelectionCount: 1, // users can select only one part at a time
                        validCycle: go.Diagram.CycleDestinationTree, // make sure users can only create trees
                        "clickCreatingTool.archetypeNodeData": { // allow double-click in background to create a new node
                            name: "(new person)",
                            title: "",
                            comments: ""
                        },
                        "clickCreatingTool.insertPart": function(loc) {  // scroll to the new node
                            var node = go.ClickCreatingTool.prototype.insertPart.call(this, loc);
                            if (node !== null) {
                                this.diagram.select(node);
                                this.diagram.commandHandler.scrollToPart(node);
                                this.diagram.commandHandler.editTextBlock(node.findObject("NAMETB"));
                            }
                            return node;
                        },
                        layout:
                            $(go.TreeLayout,
                                {
                                    treeStyle: go.TreeLayout.StyleLastParents,
                                    arrangement: go.TreeLayout.ArrangementHorizontal,
                                    // properties for most of the tree:
                                    angle: 90,
                                    layerSpacing: 35,
                                    // properties for the "last parents":
                                    alternateAngle: 90,
                                    alternateLayerSpacing: 35,
                                    alternateAlignment: go.TreeLayout.AlignmentBus,
                                    alternateNodeSpacing: 20
                                }),
                        "undoManager.isEnabled": true // enable undo & redo
                    });

            // when the document is modified, add a "*" to the title and enable the "Save" button
            myDiagram.addDiagramListener("Modified", function(e) {
                var button = document.getElementById("SaveButton");
                if (button) button.disabled = !myDiagram.isModified;
                var idx = document.title.indexOf("*");
                if (myDiagram.isModified) {
                    if (idx < 0) document.title += "*";
                } else {
                    if (idx >= 0) document.title = document.title.substr(0, idx);
                }
            });

            // manage boss info manually when a node or link is deleted from the diagram
            myDiagram.addDiagramListener("SelectionDeleting", function(e) {
                var part = e.subject.first(); // e.subject is the myDiagram.selection collection,
                // so we'll get the first since we know we only have one selection
                myDiagram.startTransaction("clear boss");
                if (part instanceof go.Node) {
                    var it = part.findTreeChildrenNodes(); // find all child nodes
                    while (it.next()) { // now iterate through them and clear out the boss information
                        var child = it.value;
                        var bossText = child.findObject("boss"); // since the boss TextBlock is named, we can access it by name
                        if (bossText === null) return;
                        bossText.text = "";
                    }
                } else if (part instanceof go.Link) {
                    var child = part.toNode;
                    var bossText = child.findObject("boss"); // since the boss TextBlock is named, we can access it by name
                    if (bossText === null) return;
                    bossText.text = "";
                }
                myDiagram.commitTransaction("clear boss");
            });

            var levelColors = ["#AC193D", "#2672EC", "#8C0095", "#5133AB",
                "#008299", "#D24726", "#008A00", "#094AB2"];

            // override TreeLayout.commitNodes to also modify the background brush based on the tree depth level
            myDiagram.layout.commitNodes = function() {
                go.TreeLayout.prototype.commitNodes.call(myDiagram.layout);  // do the standard behavior
                // then go through all of the vertexes and set their corresponding node's Shape.fill
                // to a brush dependent on the TreeVertex.level value
                myDiagram.layout.network.vertexes.each(function(v) {
                    if (v.node) {
                        var level = v.level % (levelColors.length);
                        var color = levelColors[level];
                        var shape = v.node.findObject("SHAPE");
                        if (shape) shape.stroke = $(go.Brush, "Linear", { 0: color, 1: go.Brush.lightenBy(color, 0.05), start: go.Spot.Left, end: go.Spot.Right });
                    }
                });
            };

            // when a node is double-clicked, add a child to it
            function nodeDoubleClick(e, obj) {
                var clicked = obj.part;
                if (clicked !== null) {
                    var thisemp = clicked.data;
                    myDiagram.startTransaction("add employee");
                    var newemp = {
                        name: "(new person)",
                        title: "",
                        comments: "",
                        parent: thisemp.key
                    };
                    myDiagram.model.addNodeData(newemp);
                    myDiagram.commitTransaction("add employee");
                }
            }

            // this is used to determine feedback during drags
            function mayWorkFor(node1, node2) {
                if (!(node1 instanceof go.Node)) return false;  // must be a Node
                if (node1 === node2) return false;  // cannot work for yourself
                if (node2.isInTreeOf(node1)) return false;  // cannot work for someone who works for you
                return true;
            }

            // This function provides a common style for most of the TextBlocks.
            // Some of these values may be overridden in a particular TextBlock.
            function textStyle() {
                return { font: "9pt  Segoe UI,sans-serif", stroke: "white" };
            }

            // This converter is used by the Picture.
            function findHeadShot(key) {
                if (key < 0 || key > 16) return 'resources/images/logo.png'; // There are only 16 images on the server
                return "resources/images/HS" + key + ".jpg"
            }

            // define the Node template
            myDiagram.nodeTemplate =
                $(go.Node, "Auto",
                    { doubleClick: nodeDoubleClick },
                    { // handle dragging a Node onto a Node to (maybe) change the reporting relationship
                        mouseDragEnter: function(e, node, prev) {
                            var diagram = node.diagram;
                            var selnode = diagram.selection.first();
                            if (!mayWorkFor(selnode, node)) return;
                            var shape = node.findObject("SHAPE");
                            if (shape) {
                                shape._prevFill = shape.fill;  // remember the original brush
                                shape.fill = "darkred";
                            }
                        },
                        mouseDragLeave: function(e, node, next) {
                            var shape = node.findObject("SHAPE");
                            if (shape && shape._prevFill) {
                                shape.fill = shape._prevFill;  // restore the original brush
                            }
                        },
                        mouseDrop: function(e, node) {
                            var diagram = node.diagram;
                            var selnode = diagram.selection.first();  // assume just one Node in selection
                            if (mayWorkFor(selnode, node)) {
                                // find any existing link into the selected node
                                var link = selnode.findTreeParentLink();
                                if (link !== null) {  // reconnect any existing link
                                    link.fromNode = node;
                                } else {  // else create a new link
                                    diagram.toolManager.linkingTool.insertLink(node, node.port, selnode, selnode.port);
                                }
                            }
                        }
                    },
                    // for sorting, have the Node.text be the data.name
                    new go.Binding("text", "name"),
                    // bind the Part.layerName to control the Node's layer depending on whether it isSelected
                    new go.Binding("layerName", "isSelected", function(sel) { return sel ? "Foreground" : ""; }).ofObject(),
                    // define the node's outer shape
                    $(go.Shape, "Rectangle",
                        {
                            name: "SHAPE", fill: "#333333", stroke: 'white', strokeWidth: 3.5,
                            // set the port properties:
                            portId: "", fromLinkable: true, toLinkable: true, cursor: "pointer"
                        }),
                    $(go.Panel, "Horizontal",
                        $(go.Picture,
                            {
                                name: "Picture",
                                desiredSize: new go.Size(70, 70),
                                margin: 1.5,
                            },
                            //new go.Binding("source", "key", findHeadShot)),
                            new go.Binding("source")),
                        // define the panel where the text will appear
                        $(go.Panel, "Table",
                            {
                                minSize: new go.Size(130, NaN),
                                maxSize: new go.Size(150, NaN),
                                margin: new go.Margin(6, 10, 0, 6),
                                defaultAlignment: go.Spot.Left
                            },
                            $(go.RowColumnDefinition, { column: 2, width: 4 }),
                            $(go.TextBlock, textStyle(),  // the name
                                {
                                    row: 0, column: 0, columnSpan: 5,
                                    font: "12pt Segoe UI,sans-serif",
                                    editable: true, isMultiline: false,
                                    minSize: new go.Size(10, 16)
                                },
                                new go.Binding("text", "name").makeTwoWay()),
                            /*$(go.TextBlock, "Должность: ", textStyle(),*/
                            $(go.TextBlock, "", textStyle(),
                                { row: 1, column: 0 }),
                            $(go.TextBlock, textStyle(),
                                {
                                    row: 1, column: 1, columnSpan: 4,
                                    editable: true, isMultiline: false,
                                    minSize: new go.Size(10, 14),
                                    margin: new go.Margin(0, 0, 0, 3)
                                },
                                new go.Binding("text", "title").makeTwoWay()),
                            /*$(go.TextBlock, textStyle(),
                                { row: 2, column: 0 },
                                new go.Binding("text", "key", function(v) { return "Номер: " + v; })),*/
                            /*$(go.TextBlock, textStyle(),
                                { name: "boss", row: 2, column: 3, },
                                new go.Binding("text", "parent", function(v) { return "Начальник: " + v; })),*/
                            $(go.TextBlock, textStyle(),  // the comments
                                {
                                    row: 3, column: 0, columnSpan: 5,
                                    font: "italic 9pt sans-serif",
                                    wrap: go.TextBlock.WrapFit,
                                    editable: true,  // by default newlines are allowed
                                    minSize: new go.Size(10, 14)
                                },
                                new go.Binding("text", "comments").makeTwoWay())
                        )  // end Table Panel
                    ) // end Horizontal Panel
                );  // end Node

            // the context menu allows users to make a position vacant,
            // remove a role and reassign the subtree, or remove a department
            myDiagram.nodeTemplate.contextMenu =
                $("ContextMenu",
                    $("ContextMenuButton",
                        $(go.TextBlock, "Освободить"),
                        {
                            click: function(e, obj) {
                                var node = obj.part.adornedPart;
                                if (node !== null) {
                                    var thisemp = node.data;
                                    myDiagram.startTransaction("vacate");
                                    // update the key, name, and comments
                                    myDiagram.model.setDataProperty(thisemp, "name", "(Свободно)");
                                    myDiagram.model.setDataProperty(thisemp, "comments", "");
                                    myDiagram.commitTransaction("vacate");
                                }
                            }
                        }
                    ),
                    $("ContextMenuButton",
                        $(go.TextBlock, "Удалить элемент"),
                        {
                            click: function(e, obj) {
                                // reparent the subtree to this node's boss, then remove the node
                                var node = obj.part.adornedPart;
                                if (node !== null) {
                                    myDiagram.startTransaction("reparent remove");
                                    var chl = node.findTreeChildrenNodes();
                                    // iterate through the children and set their parent key to our selected node's parent key
                                    while (chl.next()) {
                                        var emp = chl.value;
                                        myDiagram.model.setParentKeyForNodeData(emp.data, node.findTreeParentNode().data.key);
                                    }
                                    // and now remove the selected node itself
                                    myDiagram.model.removeNodeData(node.data);
                                    myDiagram.commitTransaction("reparent remove");
                                }
                            }
                        }
                    ),
                    $("ContextMenuButton",
                        $(go.TextBlock, "Удалить группу"),
                        {
                            click: function(e, obj) {
                                // remove the whole subtree, including the node itself
                                var node = obj.part.adornedPart;
                                if (node !== null) {
                                    myDiagram.startTransaction("remove dept");
                                    myDiagram.removeParts(node.findTreeParts());
                                    myDiagram.commitTransaction("remove dept");
                                }
                            }
                        }
                    )
                );

            // define the Link template
            myDiagram.linkTemplate =
                $(go.Link, go.Link.Orthogonal,
                    { corner: 5, relinkableFrom: true, relinkableTo: true },
                    $(go.Shape, { strokeWidth: 1.5, stroke: "#F5F5F5" }));  // the link shape

            // read in the JSON-format data from the "mySavedModel" element
            //load();
            var myModel = $(go.TreeModel);
            // in the model data, each node is represented by a JavaScript object:
            myModel.nodeDataArray = [
                {"key":1, "name":"Тихонов Денис Владимирович", "title":"Министр Правительства Москвы, руководитель Департамента", "source":"resources/foto/tihonov.jpg"},
                {"key":2, "name":"Путин Дмитрий Валерьевич", "title":"Зам. руководителя", "parent":1, "source":"resources/foto/Pytin.jpg"},
                {"key":3, "name":"Сибрин Александр Эдуардович", "title":"Первый зам. руководителя", "parent":1, "source":"resources/foto/Sibrin.jpg"},
                {"key":4, "name":"Тётушкин Дмитрий Николаевич", "title":"Зам. руководителя", "parent":1, "source":"resources/foto/Tetushkin.jpg"},
                {"key":5, "name":"Крючкова Полина Викторовна", "title":"Зам. руководителя", "parent":1, "source":"resources/foto/kryuchkova.jpg"},
                {"key":6, "name":"Федоров Прохор Дмитриевич ", "title":"Зам. руководителя", "parent":1, "source":"resources/foto/fedorov.jpg"},
                {"key":7, "name":"Багреева Мария Андреевна", "title":"Первый зам. руководителя", "parent":1, "source":"resources/foto/bagreeva.jpg"},
                {"key":8, "name":"Гладких Михаил Викторович", "title":"Начальник Управления", "parent":2, "source":"resources/foto/Gladkikh.jpg"},
                {"key":9, "name":"Кузьмина Наталья Владимировна", "title":"Начальник Управления", "parent":3, "source":"resources/foto/kuzmina.jpg"},
                {"key":10, "name":"Чумаченко Наталья Сергеевна", "title":"Начальник Управления", "parent":7, "source":"resources/foto/chumachenko.jpg"},
                {"key":11, "name":"Зоболева Елена Николаевна", "title":"Начальник Управления", "parent":7, "source":"resources/foto/zoboleva.jpg"}
            ];
            myDiagram.model = myModel;

            // support editing the properties of the selected person in HTML
            if (window.Inspector) myInspector = new Inspector("myInspector", myDiagram,
                {
                    properties: {
                        "key": { readOnly: true },
                        "comments": {}
                    }
                });

            // Setup zoom to fit button
            document.getElementById('zoomToFit').addEventListener('click', function() {
                myDiagram.commandHandler.zoomToFit();
            });

            document.getElementById('centerRoot').addEventListener('click', function() {
                myDiagram.scale = 1;
                myDiagram.commandHandler.scrollToPart(myDiagram.findNodeForKey(1));
            });

        } // end init

        // Show the diagram's model in JSON format
        function save() {
            document.getElementById("mySavedModel").value = myDiagram.model.toJson();
            myDiagram.isModified = false;
        }
        function load() {
            myDiagram.model = go.Model.fromJson(document.getElementById("mySavedModel").value);
            // make sure new data keys are unique positive integers
            var lastkey = 1;
            myDiagram.model.makeUniqueKeyFunction = function(model, data) {
                var k = data.key || lastkey;
                while (model.findNodeDataForKey(k)) k++;
                data.key = lastkey = k;
                return k;
            };
        }
    </script>
</head>
<body id="customSkin" class="dark-skin" onload="init()">

<header>
    <div id="slide-out" class="side-nav">
        <ul class="custom-scrollbar">
            <li>
                <form class="search-form" role="search">
                    <div class="md-form mt-3 pt-2 waves-light">
                        <%--<input type="text" class="form-control" placeholder="Поиск по документам">--%>
                        <input type="text" class="form-control" disabled>
                    </div>
                </form>
            </li>
            <li>
                <ul class="collapsible collapsible-accordion">
                    <li>
                        <a id="myTasks" class="collapsible-header waves-effect arrow-r" href="index">
                            <i class="fa fa-edit mr-2"></i>Мои задачи
                        </a>
                    </li>
                    <li>
                        <a id="allTasks" class="collapsible-header waves-effect arrow-r" href="all-tasks">
                            <i class="fas fa-tasks mr-2"></i>Задачи моего подразделения
                        </a>
                    </li>
                    <li>
                        <%--<a class="collapsible-header waves-effect arrow-r active">--%>
                        <a id="constructor" class="collapsible-header waves-effect disabled">
                            <i class="fas fa-project-diagram mr-2"></i>Управление задачами
                            <%--<i class="fas fa-angle-down rotate-icon"></i>--%>
                        </a>
                        <%--<div class="collapsible-body">--%>
                            <ul class="list-unstyled">
                                <li>
                                    <a id="process" href="constructor?id=process" class="waves-effect pl-4">Процессы</a>
                                </li>
                                <li>
                                    <a id="project" href="constructor?id=project" class="waves-effect pl-4">Проекты</a>
                                </li>
                                <li>
                                    <a id="instruction" href="constructor?id=instruction" class="waves-effect pl-4">Поручения</a>
                                </li>
                            </ul>
                        <%--</div>--%>
                    </li>
                    <%--<li>
                        <a id="constructor" class="collapsible-header waves-effect arrow-r" href="constructor">
                            <i class="fas fa-project-diagram mr-2"></i>Конструктор процессов/проектов
                        </a>
                    </li>--%>
                    <li>
                        <a id="organisation" class="collapsible-header waves-effect arrow-r" href="organisation">
                            <i class="fas fa-sitemap mr-2"></i>Орг. структура
                        </a>
                    </li>
                    <li>
                        <a class="collapsible-header waves-effect arrow-r" href="#">
                            <i class="fas fa-bullseye mr-2"></i>Цели и задачи
                        </a>
                    </li>
                    <li>
                        <a class="collapsible-header waves-effect arrow-r" href="all">
                            <i class="fas fa-chart-line mr-2"></i>Анализ функций
                        </a>
                    </li>
                    <li>
                        <a class="collapsible-header waves-effect arrow-r" href="#">
                            <i class="fas fa-file-alt mr-2"></i>Отчёты и документы
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <h6 class="text-center my-3">Календарь событий</h6>
                <div class="demoLeft"></div>
            </li>
        </ul>
        <div class="sidenav-bg mask-strong"></div>
    </div>
    <!--Навигация-->
    <nav class="navbar fixed-top navbar-toggleable-md navbar-expand-lg scrolling-navbar black white-text">
        <h5 class="float-left pt-2 mr-2">
            <a href="#" data-activates="slide-out" class="button-collapse">
                <i class="fas fa-bars white-text"></i>
            </a>
        </h5>
        <a class="navbar-brand ml-3" href="index">
            <img src="resources/img/Logo.png" height="30" alt="Логотип">
        </a>
        <span class="breadcrumb-dn mr-auto">
            <h6 class="mt-2">АИС "Ключевые показатели эффективности"</h6>
        </span>
        <ul class="nav navbar-nav nav-flex-icons ml-auto">
            <li class="nav-item">
                <div class="nav-link alert-primary rounded mr-3 px-3" id="namePage"></div>
            </li>
            <%--<li class="nav-item">
                <a class="nav-link" data-toggle="modal" data-target="#helpBlock">
                    <i class="far fa-question-circle mr-2"></i>
                    <span class="clearfix d-none d-sm-inline-block mr-3">Поддержка</span>
                </a>
            </li>--%>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle white-text" href="#" id="navbarDrop" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-user mr-2"></i>
                    <span id="templateUser">Пользователь</span>
                </a>
                <div id="currentUser" class="fontSmall"></div>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDrop">
                    <form:form id="form-logout" class="dropdown-item" action="logout" method="post">
                    <span type="submit" onclick="document.forms['form-logout'].submit();">
                        <i class="fas fa-sign-out-alt mr-2"></i>Выход
                    </span>
                    </form:form>
                </div>
            </li>
        </ul>
    </nav>
</header>