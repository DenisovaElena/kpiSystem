function getId() {
    return new URL(window.location.href).searchParams.get("id");
}

$.ajax({
    url: "rest/profile/divisions/" + getId(),
    method: "GET",
    contentType: "application/json",
    success: function(data) {
        console.log(data); // Возвращаемые данные выводим в консоль
        $('input#nameOtdel').val(data.name);
        $('input#firstName').val(data.chiefEmployee.firstname);
        $('input#lastName').val(data.chiefEmployee.lastname);
        $('input#patronym').val(data.chiefEmployee.patronym);
        $('input#position').val(data.chiefEmployee.position);
        $('input#email').val(data.chiefEmployee.email);
    }
});

$.ajax({
    url: "rest/profile/authorities/getAuthoritiesByDivisionId/" + getId(),
    method: "GET",
    contentType: "application/json",
    success: function(data) {
        console.log(data); // Возвращаемые данные выводим в консоль
        $('input#funcN1').val(data.name);
        $('input#funcN2').val(data.authorities.funcN2);

        $('input#column1').val(data.authorities.column1);
    }
});