var id = getId('id');

function addElement (url, block, idName) {
    return $.getJSON(url, function(data) {
        for(var i in data) {
            var key = parseInt(i)+1;
            $(block).append(
                '<div class="row d-flex align-items-center mb-md-3">' +
                '   <div class="col-1 text-center">' +
                '       <label for="'+idName+key+'">'+key+'.</label>' +
                '   </div>' +
                '   <div class="col-11">' +
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
                /*'<div class="row d-flex align-items-center justify-content-center text-center" >' +
                '   <div class="col-1 border-right border-bottom my-0 py-2">'+key+'</div>' +
                '   <div class="col-2 border-right border-bottom my-0 py-2">'+data[i].lastname+'</div>' +
                '   <div class="col-2 border-right border-bottom my-0 py-2">'+data[i].firstname+'</div>' +
                '   <div class="col-2 border-right border-bottom my-0 py-2">'+data[i].patronym+'</div>' +
                '   <div class="col-3 border-right border-bottom my-0 py-2">'+data[i].position+'</div>' +
                '   <div class="col-2 border-bottom my-0 py-2">'+data[i].email+'</div>' +
                '</div>'*/
                '<tr>' +
                '<td class="text-center">'+key+'</td>' +
                '<td>'+data[i].lastname+'</td>' +
                '<td>'+data[i].firstname+'</td>' +
                '<td>'+data[i].patronym+'</td>' +
                '<td>'+data[i].position+'</td>' +
                '<td>'+data[i].email+'</td>' +
                '</tr>'
            );
        }
    });
}

$.ajax({
    url: "rest/profile/divisions/" + id,
    method: "GET",
    contentType: "application/json",
    success: function(data) {
        //console.log(data); // Возвращаемые данные выводим в консоль
        $('.photoUser').attr({
            'src' : data.chiefEmployee.photo,
            'alt' : data.chiefEmployee.lastname+' '+data.chiefEmployee.firstname+' '+data.chiefEmployee.patronym
        });
        $('.breadcrumb-item .active').html(data.name);
        $('input#nameOtdel').val(data.name);
        $('input#firstName').val(data.chiefEmployee.firstname);
        $('input#lastName').val(data.chiefEmployee.lastname);
        $('input#patronym').val(data.chiefEmployee.patronym);
        $('input#position').val(data.chiefEmployee.position);
        $('input#email').val(data.chiefEmployee.email);
    }
});


addElement('rest/profile/authorities/getAuthoritiesByDivisionId/' + id, '#functionBlock', 'funcN');
addElement('rest/profile/divisions/getChildDivisionByDivisionId/' + id, '#childDivisionBlock', 'column');
addUsers('rest/profile/employees/getEmployeesByDivisionId/' + id, '#employeesDivisionBlock');
var functionBlock = countElem('rest/profile/authorities/getAuthoritiesByDivisionId/' + id);
var childDivision = countElem('rest/profile/divisions/getChildDivisionByDivisionId/' + id);
var sumEmployees = countElem('rest/profile/employees/getEmployeesByDivisionId/' + id);
if (functionBlock && functionBlock > 0) {
    $('#function').removeClass('d-none');
}
if (childDivision > 0) {
    $('#childDivision').removeClass('d-none');
}
if (sumEmployees > 0) {
    $('#chiefEmployees').removeClass('d-none');
}
console.log(functionBlock);
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
