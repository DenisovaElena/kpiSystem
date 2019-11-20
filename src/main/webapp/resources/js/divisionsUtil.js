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
        $('input#funcN1').val(data.chiefEmployee.funcN1);
    }

});