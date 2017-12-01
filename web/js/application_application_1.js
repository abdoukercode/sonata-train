// INIT SELECT2
$.fn.select2.defaults.set('language', 'fr');
$('select').not('.city-autocomplete').each(function () {
    var originalSelect = jQuery(this);

    originalSelect.select2({
        initSelection: function (element, callback) {
            if (originalSelect.val() != '') {
                var data = {id: originalSelect.val(), text: originalSelect.find('option:selected').text()};
                callback(data);
            }
        },
        minimumResultsForSearch: -1
    });

    var classes = originalSelect.attr('class');

    classes = classes.replace(/select2.*/, '');

    originalSelect.next().attr({'class': originalSelect.next().attr('class') + ' ' + classes});
    originalSelect.next().attr('style', '');
});

// INIT CHECKBOXES
$(document).ready(function () {
    $('input').iCheck({
        checkboxClass: 'icheckbox_minimal-blue',
        radioClass: 'iradio_minimal-blue',
        // increaseArea: '20%' // optional
    });

    $('.form-errors').click(function () {
        $(this).fadeOut(500);
    });
});

jQuery(document).ready(function () {
    var delay = 5000;
    var fadeCascade = 500;

    setTimeout(function () {
        var i = 1;
        jQuery('div.flash').each(function () {
            var flash = jQuery(this);
            setTimeout(function () {
                flash.animate({'opacity': 0}, fadeCascade, function () {
                    flash.remove();
                });
            }, i * fadeCascade);
            i++;
        });
    }, delay);
});