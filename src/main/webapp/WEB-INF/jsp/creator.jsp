<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="fragments/headerCreator.jsp"/>
<main>
    <div class="h-100 mt-5 pt-5">
        <a target="_blank" href="" download="" class="btn btn-primary btn-sm rounded" id="saveBtn">Сохранить</a>
        <div class="w-25 px-2" id="position">
            <h6 class="alert alert-warning">Панель инструментов</h6>
            <div class="tree well">
                <ul style="padding-left: 0;">
                    <li>
                        <span><i class="icon-minus-sign"></i> Генеральный директор [Иванов М.В]</span>
                        <ul>
                            <li>
                                <span><i class="icon-minus-sign"></i> Первый зам. генерального директора [Гаранин А.В.]</span>
                                <ul>
                                    <li>
                                        <span><i class="icon-minus-sign"></i> Начальник Организационно-планового отдела []</span>
                                        <ul>
                                            <li>
                                                <span><i class="icon-minus-sign"></i> Главный эксперт [Позднякова О.В.]</span>
                                            </li>
                                            <li>
                                                <span><i class="icon-minus-sign"></i> Главный эксперт [Колесов А.Р]</span>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <span><i class="icon-minus-sign"></i> Начальник Отдела кадрового обеспечения [Гиняева Г.Р]</span>
                                        <ul>
                                            <li>
                                                <span><i class="icon-minus-sign"></i> Главный эксперт [Антропова А.В.]</span>
                                            </li>
                                            <li>
                                                <span><i class="icon-minus-sign"></i> Главный эксперт [Тестов Т.Т.]</span>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <span><i class="icon-minus-sign"></i> Первый зам. генерального директора [Захарченков И.А.]</span>
                            </li>
                            <li>
                                <span><i class="icon-minus-sign"></i> Зам. генерального директора [Русаков А.Ю.]</span>
                                <ul>
                                    <li>
                                        <span><i class="icon-minus-sign"></i> Руководитель проектного офиса №1 []</span>
                                    </li>
                                    <li>
                                        <span><i class="icon-minus-sign"></i> Руководитель проектного офиса №2 []</span>
                                    </li>
                                    <li>
                                        <span><i class="icon-minus-sign"></i> Руководитель проектного офиса №3 []</span>
                                    </li>
                                    <li>
                                        <span><i class="icon-minus-sign"></i> Руководитель проектного офиса №4 []</span>
                                    </li>
                                    <li>
                                        <span><i class="icon-minus-sign"></i> Руководитель проектного офиса №5 []</span>
                                    </li>
                                    <li>
                                        <span><i class="icon-minus-sign"></i> Руководитель проектного офиса №6 []</span>
                                    </li>
                                    <li>
                                        <span><i class="icon-minus-sign"></i> Руководитель проектного офиса №7 []</span>
                                    </li>
                                    <li>
                                        <span><i class="icon-minus-sign"></i> Руководитель проектного офиса №8 []</span>
                                    </li>
                                    <li>
                                        <span><i class="icon-minus-sign"></i> Руководитель проектного офиса №9 []</span>
                                    </li>
                                    <li>
                                        <span><i class="icon-minus-sign"></i> Руководитель проектного офиса №10 []</span>
                                    </li>
                                    <li>
                                        <span><i class="icon-minus-sign"></i> Руководитель проектного офиса №11 []</span>
                                    </li>
                                    <li>
                                        <span><i class="icon-minus-sign"></i> Руководитель проектного офиса №12 []</span>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <span><i class="icon-minus-sign"></i> Зам. генерального директора [Каркоцкая А.Ю.]</span>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <h6 class="alert alert-warning mt-3">Элементы управления</h6>
            <div class="border-dark border rounded element" id="elementBlock"></div>
        </div>
        <div class="w-75 px-2 mt-n3" id="canvas">
            <h6 class="alert alert-warning">Конструктор</h6>
        </div>
    </div>
</main>

<jsp:include page="fragments/footerNew.jsp"/>
<jsp:include page="fragments/footerScriptNew.jsp"/>
<%--<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>
<script src="https://unpkg.com/bpmn-js@6.2.1/dist/bpmn-modeler.development.js"></script>
<script>
    $(function() {

        $('#namePage').html('Конструктор');

        $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
        $('.tree li.parent_li > span').on('click', function (e) {
            var children = $(this).parent('li.parent_li').find(' > ul > li');
            if (children.is(":visible")) {
                children.hide('fast');
                $(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
            } else {
                children.show('fast');
                $(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
            }
            e.stopPropagation();
        });

        $('.tree li a').after('      <div class="pull-right btn-group btn-group-sm"></div>');

        /*$('.dragMenu').draggable({
            helper : 'clone',
            cursor :'move',
            revert: "invalid",
            activeClass: "dragTitleActive",
        });

        $('.element').draggable({
            helper: 'clone',
            revert: "invalid"
        });

        // Основной блок
        $("#parrentBlock").droppable({
            activeClass: "activeDrop",
            hoverClass: "hoverDrop",
            accept: ".dragMenu",
            drop: function( event, ui ) {
                //Копируем содержимое перемещаемого блока и записываем в переменную
                var clone = ui.draggable.clone().removeClass('dragMenu').addClass('dragMenuClone ui-droppable');
                //Добавляем стилей к элементам перемещаемого
                clone.css({
                    'width' : '20%',
                    'height' : '90%',
                    'margin' : '5% 0 0 0'
                });
                //Вставляем копию перемещаемого элемента
                $("#parrentBlock").append(clone);
            }
        });

        $(".dragMenuClone").droppable({
            activeClass: "activeDrop",
            hoverClass: "hoverDrop",
            accept: ".element",
            drop: function( event, ui ) {
                //Копируем содержимое перемещаемого блока и записываем в переменную
                var cloneElement = ui.draggable.clone();
                //Добавляем стилей к элементам перемещаемого
                cloneElement.css({
                    'width' : '200px',
                    'border' : '1px solid #000',
                    'height' : '100px',
                    'background' : '#ff0000'
                });
                //Вставляем копию перемещаемого элемента
                $('#parrentBlock .dragMenuClone').append(cloneElement);
            }
        });*/

        // BpmnJS
        var diagramUrl = 'resources/diagram/diagram.bpmn';
        //var diagramUrl = 'https://cdn.staticaly.com/gh/bpmn-io/bpmn-js-examples/dfceecba/starter/diagram.bpmn';

        // modeler instance
        var bpmnModeler = new BpmnJS({
            container: '#canvas',
            keyboard: {
                bindTo: window
            }
        });

        /**
         * Save diagram contents and print them to the console.
         */
        function exportDiagram() {

            bpmnModeler.saveXML({ format: true }, function(err, xml) {

                if (err) {
                    return console.error('could not save BPMN 2.0 diagram', err);
                }

                alert('Diagram exported. Check the developer tools!');
                /*link.setAttribute('href', '/diagram.bpmn');
                link.setAttribute('download', 'diagram.bpmn');
                link.click();
                return false;*/
                $('#saveBtn').attr('href', xml);
                $('#saveBtn').attr('download', xml);
                console.log('DIAGRAM', xml);
            });
        }

        /**
         * Open diagram in our modeler instance.
         *
         * @param {String} bpmnXML diagram to display
         */
        function openDiagram(bpmnXML) {

            // import diagram
            bpmnModeler.importXML(bpmnXML, function(err) {

                if (err) {
                    return console.error('could not import BPMN 2.0 diagram', err);
                }

                // access modeler components
                var canvas = bpmnModeler.get('canvas');
                var overlays = bpmnModeler.get('overlays');


                // zoom to fit full viewport
                canvas.zoom('fit-viewport');

                // attach an overlay to a node
                overlays.add('SCAN_OK', 'note', {
                    position: {
                        bottom: 0,
                        right: 0
                    },
                    html: '<!--<div class="diagram-note">Mixed up the labels?</div>-->'
                });

            });
        }

        $.get(diagramUrl, openDiagram, 'text');

        $('#saveBtn').click(exportDiagram);

        /*$('#saveBtn').on('click', function() {
            exportDiagram;
        });*/

    });
</script>
<jsp:include page="fragments/footerBasement.jsp"/>