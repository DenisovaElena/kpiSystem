function getId() {
    return new URL(window.location.href).searchParams.get("id");
}

function addElements (url) {
    return $.getJSON(url, function(data) {
        for(var i in data) {
            var key = parseInt(i)+1;
            $('#functionBlock').append(
                '<div class="row d-flex align-items-center mb-3">' +
                '   <div class="col-3 text-right">' +
                '       <label for="funcN'+key+'">'+key+'.</label>' +
                '   </div>' +
                '   <div class="col-9">' +
                '       <input type="text" class="form-control" id="funcN'+key+'" name="funcN'+key+'" value="'+data[i].name+'">' +
                '   </div>' +
                '</div>'
            );
        }
    });
}
function addElements (url) {
    return $.getJSON(url, function(data) {
        for(var i in data) {
            var key = parseInt(i)+1;
            $('#functionBlock').append(
                '<div class="row d-flex align-items-center mb-3">' +
                '   <div class="col-3 text-right">' +
                '       <label for="funcN'+key+'">'+key+'.</label>' +
                '   </div>' +
                '   <div class="col-9">' +
                '       <input type="text" class="form-control" id="funcN'+key+'" name="funcN'+key+'" value="'+data[i].name+'">' +
                '   </div>' +
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


addElements('rest/profile/authorities/getAuthoritiesByDivisionId/' + getId());
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
