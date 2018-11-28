$(document).ready(function () {
    $('.proof-link').on("click", function () {
        $('#deed_links').last().after('<input class="form-control" required="required" multiple="multiple" type="text" name="deed[links][]" id="deed_links">');
    });
});