<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="fragments/headerNew.jsp"/>

<main>
    <div class="container-fluid">
        <div class="container mb-4">
            <form class="form-inline my-2 my-lg-0">
                <input class="w-75 form-control mr-sm-2 border border-dark"
                       type="search" placeholder="Поиск совпадения функций"
                       aria-label="Поиск совпадения функций"
                       id="seacrhWord"
                >
                <button class="btn btn-dark px-4 my-2 my-sm-0 searchBtn"
                        type="submit">Искать
                </button>
            </form>
        </div>

        <div class="row">
            <div class="col-sm-3">
                <div class="card border border-dark mb-3 mx-4" id="division">
                   <h5 class="bg-primary p-2 text-white font-weight-bold">
                       <span id="departmentName"></span>
                       <div class="my-2">
                           <i class="far fa-file-word mx-2 fa-2x pointer"></i>
                           <i class="far fa-address-card mx-2 fa-2x pointer"></i>
                           <i class="fas fa-chart-pie mx-2 fa-2x pointer"></i>
                       </div>
                   </h5>
                </div>
            </div>
            <div class="col-sm-3" id="administrators"></div>
            <div class="col-sm-3" id="managements"></div>
            <div class="col-sm-3" id="departments"></div>
        </div>
    </div>
</main>

<jsp:include page="fragments/footerNew.jsp"/>
<jsp:include page="fragments/footerScript.jsp"/>
<script>
    $(function() {

        $('.searchBtn').click(function(e) {
            e.preventDefault();
            var word = $('#seacrhWord').val();
            $.getJSON('rest/profile/authorities/searchAuthorities?word='+word, function(data) {
                for(var i in data) {
                    $('[data-id='+data[i].id+']').css('background','#f00');
                }
            });
        });

        jsPlumb.ready(function() {
            var instance = jsPlumb.getInstance({
                Endpoint: /*["Dot", {radius: 4}]*/ "Blank",
                Connector: "StateMachine", //Flowchart
                HoverPaintStyle: {stroke: "red", strokeWidth: 2},
                PaintStyle: {stroke: "black", strokeWidth: 1},
                ConnectionOverlays: [
                    ["Arrow", {
                        location: 1,
                        id: "arrow",
                        length: 8,
                        foldback: 0.5
                    }]
                ]
            });

            instance.registerConnectionType("basic", {
                anchor : ["Right", "Left", "Continuous"],
                connector: "Flowchart"
            });

            function getId() {return new URL(window.location.href).searchParams.get("id");}

            // Получаем функции по элементам
            function getFunctionsDepartments (id, element) {
                $.getJSON('rest/profile/authorities/getAuthoritiesByDivisionId/'+id, function(data) {
                    for(var i in data) {
                        var row = data[i];
                        $(element).append(
                            '<div class="card functions p-2 m-2 font-size-small pointer" data-id="'+row.id+'">'+row.name+'</div>'
                        );
                    }
                });
            }

            function getDepartments (id) {
                $.getJSON('rest/profile/divisions/getAllTopLevel/', function(data) {
                    for(var i in data) {
                        var row = data[i];
                        if(row.id == id) {
                            $('#departmentName').html(row.name);
                            getFunctionsDepartments(row.id, '#division');
                            if (row.childDivision.length > 0) {
                                for(var y in row.childDivision) {
                                    var administrators = row.childDivision[y];
                                    var key = parseInt(y)+1;
                                    $('#administrators').append(
                                        '<div class="card border border-dark mb-3 mx-4" id="administrators'+key+'">' +
                                        '   <h6 class="bg-primary p-2 text-white font-weight-bold">'+administrators.name+'' +
                                        '       <div class="my-2">' +
                                        '           <i class="far fa-file-word mx-2 fa-2x pointer"></i>' +
                                        '           <i class="far fa-address-card mx-2 fa-2x pointer"></i>' +
                                        '           <i class="fas fa-chart-pie mx-2 fa-2x pointer"></i>' +
                                        '       </div>' +
                                        '   </h6>' +
                                        '</div>'
                                    );
                                    instance.connect({
                                        source : 'division',
                                        target : 'administrators'+key,
                                        type : 'basic'
                                    });
                                    getFunctionsDepartments(administrators.id, '#administrators'+key);

                                    if(administrators.childDivision.length > 0) {
                                        for(var z in administrators.childDivision) {
                                            var managements = administrators.childDivision[z];
                                            var keys = parseInt(z)+1;
                                            $('#managements').append(
                                                '<div class="card border border-dark mb-3 mx-4" id="managements'+key+keys+'">' +
                                                '   <h6 class="bg-primary p-2 text-white font-weight-bold">'+managements.name+'' +
                                                '       <div class="my-2">' +
                                                '           <i class="far fa-file-word mx-2 fa-2x pointer"></i>' +
                                                '           <i class="far fa-address-card mx-2 fa-2x pointer"></i>' +
                                                '           <i class="fas fa-chart-pie mx-2 fa-2x pointer"></i>' +
                                                '       </div>' +
                                                '   </h6>' +
                                                '</div>'
                                            );
                                            getFunctionsDepartments(managements.id, '#managements'+key+keys);
                                            console.log('administrators'+key+' - managements'+key+keys);

                                            instance.connect({
                                                source : 'administrators'+key,
                                                target : 'managements'+key+keys,
                                                type : 'basic'
                                            });
                                            if(managements.childDivision.length > 0) {
                                                for(var a in managements.childDivision) {
                                                    var departments =  managements.childDivision[a];
                                                    var keyd = parseInt(a)+1;
                                                    $('#departments').append(
                                                        '<div class="card border border-dark mb-3 mx-4" id="departments'+key+keys+keyd+'">' +
                                                        '   <h6 class="bg-primary p-2 text-white font-weight-bold">'+departments.name+'' +
                                                        '       <div class="my-2">' +
                                                        '           <i class="far fa-file-word mx-2 fa-2x pointer"></i>' +
                                                        '           <i class="far fa-address-card mx-2 fa-2x pointer"></i>' +
                                                        '           <i class="fas fa-chart-pie mx-2 fa-2x pointer"></i>' +
                                                        '       </div>' +
                                                        '   </h6>' +
                                                        '</div>'
                                                    );
                                                    getFunctionsDepartments(departments.id, '#departments'+key+keys+keyd);
                                                    console.log('managements'+key+keys+' - departments'+key+keys+keyd);
                                                    instance.connect({
                                                        source : 'managements'+key+keys,
                                                        target : 'departments'+key+keys+keyd,
                                                        type : 'basic'
                                                    });
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                });
            }
            getDepartments (getId());

        });

    });
</script>
<jsp:include page="fragments/footerBasement.jsp"/>