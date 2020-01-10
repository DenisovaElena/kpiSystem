    //Загрузка документа всегда сверху
    $(document).ready(function() {
        setTimeout(function() {
            window.scrollTo(0, 0);
        }, 1);
    });

    // Подсказки
    $('[data-toggle="tooltip"]').tooltip();

    // Получаем значения из строки
    function getId(id) {
        return new URL(window.location.href).searchParams.get(id);
    }

    // Подсчёт элементов в массиве
    function countElem (array) {return array.length;}