<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="fragments/headerCreator.jsp"/>
<main>
    <div class="container-fluid vh-100">
        <div class="w-15 border border-light text-center" id="position">
            <h6 class="alert alert-warning">Панель инструментов</h6>
            <div class="btn btn-outline-dark dragMenu">
                <div class="dragTitle">Директор</div>
            </div>
            <div class="btn btn-outline-dark dragMenu">
                <div class="dragTitle">Зам. руководителя</div>
            </div>
            <div class="btn btn-outline-dark dragMenu">
                <div class="dragTitle">Начальник отдела</div>
            </div>
            <h6 class="alert alert-warning mt-3">Элементы управления</h6>
            <div class="border-dark border rounded element" id="elementBlock"></div>
        </div>
        <div class="w-85" id="parrentBlock"></div>
    </div>
</main>

<jsp:include page="fragments/footerNew.jsp"/>
<jsp:include page="fragments/footerScriptNew.jsp"/>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    $(function() {

        $('.dragMenu').draggable({
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
        });
    });
</script>
<jsp:include page="fragments/footerBasement.jsp"/>