<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="fragments/headerNew.jsp"/>
<main>
    <div class="container-fluid" id="iconBlock">
        <div class="row canvas">
            <div class="col-3">
                <div id="element1">
                    <div style="width: 300px; height: 100px;"
                          class="bg-primary" id="name1"></div>
                    <div class="elementBlock d-none" style="width: 300px;">
                        <div class="child bg-warning my-3" style="height: 50px;"
                             id="child1"></div>
                        <div class="child bg-warning my-3" style="height: 50px;"
                             id="child2"></div>
                        <div class="child bg-warning my-3" style="height: 50px;"
                             id="child3"></div>
                        <div class="child bg-warning my-3" style="height: 50px;"
                             id="child4"></div>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div id="element2" class="d-none">
                    <div style="width: 300px; height: 100px;"
                         class="bg-success" id="name2"></div>
                    <div class="elementBlock d-none" style="width: 300px;">
                        <div class="child bg-warning my-3" style="height: 50px;"
                             id="child5" data-id="5"></div>
                        <div class="child bg-warning my-3" style="height: 50px;"
                             id="child6" data-id="6"></div>
                        <div class="child bg-warning my-3" style="height: 50px;"
                             id="child7" data-id="7"></div>
                        <div class="child bg-warning my-3" style="height: 50px;"
                             id="child8" data-id="8"></div>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div id="element3" class="d-none">
                    <div style="width: 300px; height: 100px;"
                         class="bg-secondary" id="name3"></div>
                    <div class="elementBlock d-none" style="width: 300px;">
                        <div class="child bg-warning my-3" style="height: 50px;"
                             id="child9" data-id="9"></div>
                        <div class="child bg-warning my-3" style="height: 50px;"
                             id="child10" data-id="10"></div>
                        <div class="child bg-warning my-3" style="height: 50px;"
                             id="child11" data-id="11"></div>
                        <div class="child bg-warning my-3" style="height: 50px;"
                             id="child12" data-id="12"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="btn btn-primary" id="addArrow1">Add</div>
                <div class="btn btn-primary" id="addArrow">Add</div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 my-5">
                <svg id="circle"></svg>
            </div>
        </div>
    </div>
</main>

<jsp:include page="fragments/footerNew.jsp"/>
<jsp:include page="fragments/footerScript.jsp"/>
<script>
    $(function() {
        var arrowAdd1 = $cArrows('#iconBlock', {
            render : { strokeStyle: 'green'},
            arrow: { connectionType: 'rectangleAngle', angleFrom: 0, angleTo: 180}
        });

        var arrowAdd2 = $cArrows('#iconBlock', {
            render : { strokeStyle: 'red'},
            arrow: { connectionType: 'rectangleAngle', angleFrom: 180,
                angleTo: 0}
        });

        function getBlockArrow () {
            arrowAdd1.arrow('#name1', '#name2');
            arrowAdd1.arrow('#name1', '#name5');
            arrowAdd1.arrow('#name1', '#name6');
            arrowAdd1.arrow('#name1', '#name7');
            arrowAdd1.arrow('#name1', '#name8');
        }

        function getArrowRight () {
            arrowAdd1.arrow('#child1', '#child5');
            arrowAdd1.arrow('#child2', '#child5');
            arrowAdd1.arrow('#child5', '#child9');
            arrowAdd1.arrow('#child5', '#child10');
        }


        function getArrow () {
            $.getJSON('rest/profile/authorities/1110', function() {
                var id = parseInt($('#element3 .child:last').attr('data-id'));
                var newId = id+1;
                var oldId1 = id-5;
                var oldId2 = id-6;
                $('#element3 .elementBlock').append(
                    '<div class="child bg-warning my-3" style="height: 50px;" id="child'+newId+'" data-id="'+newId+'"></div>'
                );
                arrowAdd2.arrow('#child'+newId, '#child'+oldId1);
                arrowAdd2.arrow('#child'+oldId1, '#child1');
                arrowAdd2.arrow('#child'+newId, '#child'+oldId2);
                arrowAdd2.arrow('#child'+oldId2, '#child2');
            });
        }

        $(document).on('click', '#addArrow1', function() {
            $('#element2').append(
                '<div style="width: 300px; height: 100px;" class="bg-success my-3" id="name5"></div>'
            );
            $('#element1 .elementBlock, #element2').removeClass('d-none');
            getBlockArrow();
        });

        $(document).on('click', '#addArrow', function() {
            arrowAdd1.clear();
            $('#element3, .elementBlock').removeClass('d-none');
            getArrowRight();
            getArrow();
        });

        /*$(document).on('click', '#addArrow', function() {
            var id = parseInt($('#element3 .child:last').attr('data-id'));
            var newId = id+1;
            $('#element3 .elementBlock').append(
                '<div class="child bg-warning my-3" style="height: 50px;" id="child'+newId+'" data-id="'+newId+'"></div>'
            );
            arrowAdd2.arrow('#child'+newId, '#child5');
        });*/

        /*var s = Snap("#circle");
        var circle = s.circle(150, 150, 100);*/

    });
</script>
<jsp:include page="fragments/footerBasement.jsp"/>