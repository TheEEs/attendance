import $ from 'jquery'
function initializeSelectizeElements () {
    $('.field-unit--belongs-to select').selectize({});
    $(".field-unit--has-many select").selectize({});
    $('.field-unit--polymorphic select').selectize({});
    $('.field-unit--select select').selectize({});
    var keycodes = { space: 32, enter: 13 };

    var visitDataUrl = function (event) {
        if (event.type == "click" ||
            event.keyCode == keycodes.space ||
            event.keyCode == keycodes.enter) {

            if (event.target.href) {
                return;
            }

            var dataUrl = $(event.target).closest("tr").data("url");
            var selection = window.getSelection().toString();
            if (selection.length === 0 && dataUrl) {
                window.location = window.location.protocol + '//' + window.location.host + dataUrl;
            }
        }
    };

    $("table").on("click", ".js-table-row", visitDataUrl);
    $("table").on("keydown", ".js-table-row", visitDataUrl);
}
document.addEventListener("turbo:load", initializeSelectizeElements)
document.addEventListener("turbo:frame-load", initializeSelectizeElements)
