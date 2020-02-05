<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="fragments/headerCreator.jsp"/>
<main>

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