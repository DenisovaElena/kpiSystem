function getId() {
    return new URL(window.location.href).searchParams.get("id");
}

function addElement (url, block, idName) {
    return $.getJSON(url, function(data) {
        for(var i in data) {
            var key = parseInt(i)+1;
            $(block).append(
                '<div class="row d-flex align-items-center mb-3">' +
                '   <div class="col-3 text-right">' +
                '       <label for="'+idName+key+'">'+key+'.</label>' +
                '   </div>' +
                '   <div class="col-9">' +
                '       <input type="text" class="form-control" id="'+idName+key+'" name="'+idName+key+'" value="'+data[i].name+'">' +
                '   </div>' +
                '</div>'
            );
        }
    });
}

function addUsers (url, block) {
    return $.getJSON(url, function(data) {
        for(var i in data) {
            var key = parseInt(i)+1;
            $(block).append(
                '<div class="row d-flex align-items-center justify-content-center text-center" >' +
                '   <div class="col-1 border-right border-bottom my-0 py-2">'+key+'</div>' +
                '   <div class="col-2 border-right border-bottom my-0 py-2">'+data[i].lastname+'</div>' +
                '   <div class="col-2 border-right border-bottom my-0 py-2">'+data[i].firstname+'</div>' +
                '   <div class="col-3 border-right border-bottom my-0 py-2">'+data[i].patronym+'</div>' +
                '   <div class="col-2 border-right border-bottom my-0 py-2">'+data[i].position+'</div>' +
                '   <div class="col-2 border-bottom my-0 py-2">'+data[i].email+'</div>' +
                '</div>'
            );
        }
    });
}

$.ajax({
    url: "rest/profile/divisions/" + getId(),
    method: "GET",
    contentType: "application/json",
    success: function(data) {
        //console.log(data); // Возвращаемые данные выводим в консоль
        $('input#nameOtdel').val(data.name);
        $('input#firstName').val(data.chiefEmployee.firstname);
        $('input#lastName').val(data.chiefEmployee.lastname);
        $('input#patronym').val(data.chiefEmployee.patronym);
        $('input#position').val(data.chiefEmployee.position);
        $('input#email').val(data.chiefEmployee.email);
    }
});


addElement('rest/profile/authorities/getAuthoritiesByDivisionId/' + getId(), '#functionBlock', 'funcN');
addElement('rest/profile/divisions/getChildDivisionByDivisionId/' + getId(), '#childDivisionBlock', 'column');
addUsers('rest/profile/divisions/employees/getEmployeesByDivisionId' + getId(), '#employeesDivisionBlock');
/*
$.ajax({
    url: "rest/profile/authorities/getAuthoritiesByDivisionId/" + getId(),
    method: "GET",
    contentType: "application/json",
    success: function(data) {
        console.log(data); // Возвращаемые данные выводим в консоль
        $('input#funcN1').val(data[0].name);
    }
});*/
