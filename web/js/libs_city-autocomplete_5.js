jQuery(document).ready(function () {
    cityAutocomplete();
});

function cityAutocomplete() {
    var originalSelect = jQuery(".city-autocomplete");
    if (originalSelect.length != 0) {
        originalSelect.append(jQuery('<option/>')).select2({
            ajax:               {
                url:            Routing.generate('sdw_localisation_city_autocomplete'),
                dataType:       'json',
                quietMillis:    250,
                data:           function (term, page) {
                    return {
                        q: term
                    };
                },
                processResults: function (data, params) {
                    params.page = params.page || 1;

                    return {
                        results:    data.items,
                        pagination: {
                            more: (params.page * 30) < data.total_count
                        }
                    };
                },
                cache:          true
            },
            initSelection:      function (element, callback) {
                if (element.val() != '') {
                    var data = {
                        id:   element.val(),
                        text: jQuery('.city-autocomplete-label').val()
                    };
                    callback(data);
                }
            },
            escapeMarkup:       function (markup) {
                return markup;
            },
            minimumInputLength: 3,
            templateResult:     repoFormatResult,
            templateSelection:  repoFormatSelection
        }).next().val('').find('.select2-selection__rendered').html(originalSelect.attr('data-placeholder'));

        var classes = originalSelect.attr('class');

        classes = classes.replace(/select2.*/, '');
        classes = classes.replace('city-autocomplete', '');

        originalSelect.next().attr({'class': originalSelect.next().attr('class') + ' ' + classes});
        originalSelect.next().attr('style', '');
    }

}

function repoFormatResult(repo) {
    return '<div>' +
        repo.name +
        '</div>';
}

function repoFormatSelection(repo) {
    return repo.name;
}