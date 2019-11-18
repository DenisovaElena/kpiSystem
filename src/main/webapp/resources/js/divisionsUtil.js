function getId() {
    return new URL(window.location.href).searchParams.get("id");
}

$.ajax({
    url: "/rest/profile/divisions/" + getId(),
    method: "GET",
    contentType: "application/json",
    success: function(data) {
        console.log(data); // Возвращаемые данные выводим в консоль
    }
});