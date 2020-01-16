    //Загрузка документа всегда сверху
    $(document).ready(function() {
        setTimeout(function() {
            window.scrollTo(0, 0);
        }, 1);
    });

    //Инициализация анимации
    new WOW().init();

    // Подсказки
    $('[data-toggle="tooltip"]').tooltip();

    // Получаем значения из строки
    function getId(id) {
        return new URL(window.location.href).searchParams.get(id);
    }

    // Подсчёт элементов в массиве
    function countElem (array) {return array.length;}

    //Переключение слайдера навигации
    $(".button-collapse").sideNav();

    // Чусен
    $(".chosen-select").chosen({
        width: "100%",
        no_results_text: "Ничего не найдено!"
    });

    // Календарь
    $('.demo').datepicker({
        format: 'mm/dd/yyyy',
        language: 'ru',
        weekStart: 1,
        multidate: true,
        todayHighlight: true
    });

    var arrayDate = (['01/09/2020', '01/15/2020', '01/20/2020']);
    $('.demoLeft').datepicker({
        format: 'mm/dd/yyyy',
        language: 'ru',
        weekStart: 1,
        multidate: true,
        todayHighlight: true
    });
    $('.demoLeft').datepicker('setDates', arrayDate);

    // Сортировка
    $('#sortLeft').on('click', function() {
        $(this).removeClass('btn-mdb-color').addClass('btn-outline-mdb-color');
        $('#sortRight').removeClass('btn-outline-mdb-color').addClass('btn-mdb-color');
        $('#sortLeftIconUp').toggleClass('d-none d-inline active no-active');
        $('#sortLeftIconDown').toggleClass('d-none d-inline active no-active');
    });

    $('#sortRight').on('click', function() {
        $(this).removeClass('btn-mdb-color').addClass('btn-outline-mdb-color');
        $('#sortLeft').removeClass('btn-outline-mdb-color').addClass('btn-mdb-color');
        $('#sortRightIconUp').toggleClass('d-none d-inline active no-active');
        $('#sortRightIconDown').toggleClass('d-none d-inline active no-active');
    });

    // Блок фильтрации
    $('#filterBtn').on('click', function() {
        $(this).toggleClass('btn-mdb-color');
        $('#filterBlock').toggleClass('d-none');
    });

    // Рейтинг звёздочки
    $('#rateMe').mdbRate();

    // При клике на option взять id родителя select
    $('.other').on('change', function() {
        var idParent = $(this).attr('id')+'Block';
        var idValue = $(this).val();
        if(idValue == 0) {
            $('#'+idParent).append(
                '<textarea class="form-control mt-1 '+idParent+'" row="1"></textarea>'
            );
        } else {
            $('.'+idParent).hide(500).remove();
        }
    });