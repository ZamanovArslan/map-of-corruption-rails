//= require maps/jquery.vmap
//= require maps/jquery.vmap.russia
//= require_self
$(document).ready(function () {

    let colorRegion = '#1076C8'; // Цвет всех регионов
    let focusRegion = '#FF9900'; // Цвет подсветки регионов при наведении на объекты из списка
    let sortBy = "name";
    let deputies;
    $.ajax({
        method: "get",
        dataType: "json",
        url: "/deputies",
    })
        .done(function (data) {
            deputies = data.deputies;
            /*sortProperties(deeds, sortBy);
            printDeputies();*/
        });
    let current_code = null;
    let current_deputies = [];
    $('#vmap').vectorMap({
        map: 'russia',
        backgroundColor: '#f5f5f5',
        borderColor: '#ffffff',
        borderWidth: 2,
        color: colorRegion,
        hoverOpacity: 0.7,
        enableZoom: true,
        showTooltip: true,
        onLabelShow: function (event, label, code) {
            label.append("<br/><li>Количество дел: " + getDeedsCountByRegionCode(code) + "</li>" +
                "<li>Количество депутатов:" + getDeputiesByRegionCode(code).length + "</li>");
        },
        selectedColor: focusRegion,

        // Клик по региону
        onRegionClick: function (element, code, region) {
            $("h1").text(region);
            current_deputies = getDeputiesByRegionCode(code);
            current_code = code;
            printDeputies();
        }
    });

    function getDeedsCountByRegionCode(code){
        var d = 0;
        $.each(deputies, function (index, deputy) {
            $.each(deputy["deeds"], function (index, deed) {
                if (deed["region_code"] === code) {
                    d++;
                }
            });
        });
        return d;
    }

    function printDeputies() {
        $(".deputies").find(".deputy").remove();
        $(".god-thanks").remove();
        if (current_deputies != null && current_deputies.length > 0) {
            $.each(current_deputies, function (index, deputy) {
                let deputy_html = "<tr class='deputy " + deputy["id"] + "'>";
                deputy_html += "<td ><img class=\"deputy-img\" src='" + deputy["image"] + "' alt='" + deputy["name"] + "'>" + "</td>";
                deputy_html += "<td>" + deputy["name"] + " " + deputy["surname"] + " " + deputy["patronymic"] + "</td>";
                deputy_html += "<td>" + deputy["current_position"] + "</td>";
                $.each(deputy["deeds"], function (index, deed) {
                    if (deed["region_code"] === current_code) {
                        let deed_html = '';
                        let result = deed_html;
                        deed_html += "<td>" + deed["sign"] + "</td>";
                        deed_html += "<td>" + deed["detriment"] + "</td>";
                        deed_html += "<td>" + deed["punishment"] + "</td>";
                        deed_html += "<td>" + deed["status"] + "</td>";
                        deed_html += "<td>" + formatDate(deed["date"]) + "</td>";
                        result += deputy_html;
                        result += deed_html;
                        result += "<td>";
                        $.each(deed["links"], function (index, link) {
                            result += '<li><a href=\'' + link + '\'>' + link.substring(0, 20) + "..." + '</a></li>';
                        });
                        console.log(deed["links"])
                        result += "</td>";
                        result += "</tr>";
                        $(".deputies tr:last-child").after(result);
                    }
                });
            });
        } else {
            $(".deputies").after("<p class='text-center font-weight-light font-italic god-thanks pt-2'>Тут ничего.</p>")
        }
    }

    function getDeputiesByRegionCode(code) {
        var d = [];
        $.each(deputies, function (index, deputy) {
            $.each(deputy["deeds"], function (index, deed) {
                if (deed["region_code"] === code) {
                    d.push(deputy);
                    return false;
                }
            });
        });
        return d;
    }

    function formatDate(date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2) month = '0' + month;
        if (day.length < 2) day = '0' + day;

        return [year, month, day].join('-');
    }

    $('*[data-href]').on("click", function () {
        window.location = $(this).data('href');
        return false;
    });

    $('*[data-sort-by]').on("click", function () {
        if (current_deputies != null && current_deputies.length > 0) {
            sortProperties($(this).data('sort-by'));
            printDeputies()
        }
        return false;
    });

    $('.proof-link').on("click", function () {
        $('#proof_link').append("hihi")
    });

    // function toHashMap(obj) {
    //     var sortable = [];
    //     for (var key in obj)
    //         if (obj.hasOwnProperty(key))
    //             sortable.push(JSON.parse(obj[key])); // each item is an array in format [key, value]
    //     return sortable;
    // }

    function sortProperties(title) {
        if (title !== sortBy) {
            current_deputies.sort(function (a, b) {
                if (a[title] > b[title])
                    return 1
            });
        } else {
            current_deputies.reverse()
        }
    }

});
