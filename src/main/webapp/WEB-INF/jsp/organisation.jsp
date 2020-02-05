<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="fragments/headerOrganisation.jsp"/>
<main>
    <div id="sample">
        <div id="myDiagramDiv" style="background-color: #34343C; border: solid 1px black; min-height: 100vh;"></div>
        <%--<p>
            <button class="btn btn-sm btn-outline-dark rounded" id="zoomToFit"><i class="fas fa-undo mr-2"></i>Вернуть пред. вид</button>
            <button class="btn btn-sm btn-outline-dark rounded" id="centerRoot"><i class="fas fa-bullseye mr-2"></i>По центру</button>
        </p>--%>
        <%--<div>
            <div id="myInspector">
            </div>
        </div>
        <div>
            <div>
                <button class="btn btn-primary rounded" id="SaveButton" onclick="save()">Сохранить</button>
                <button class="btn btn-success rounded" onclick="load()">Загрузить</button>
            </div>
        </div>--%>
    </div>
</main>

<jsp:include page="fragments/footerNew.jsp"/>
<jsp:include page="fragments/footerScriptNew.jsp"/>
<script>
    $(function() {
        $('#organisation').addClass('activeMenu');
        var namePage = $('#organisation').html();
        $('#namePage').html(namePage);
    });
</script>
<jsp:include page="fragments/footerBasement.jsp"/>