function openDialog(title, url) {
    $('.opened-dialogs').dialog("close");

    $('<div class="opened-dialogs">').html('loading...').dialog({
        modal:    true,
        position: ['center', 20],
        open:     function () {
            $(this).load(url);

        },
        close:    function (event, ui) {
            $(this).remove();
        },

        title:    title,
        minWidth: 600
    });

    return false;
}

$(document).ready(function () {
    var $modal = $('#load_popup_modal_show_id');
    $(document).on('click', '.bloc-galerie', function (e) {
        e.preventDefault();
        e.stopPropagation();
        e.stopImmediatePropagation();

        var linkHref = $(this).attr('data-url');
        var modalTitle = $(this).attr('data-modal-title');
        if (!modalTitle)
            modalTitle = '';

        $.ajax({
            'url':     linkHref,
            'method':  'GET',
            'success': function (html) {
                var modal = $('#galerieModal');
                //
                //
                // // Modal title
                //
                modal.find('.modal-title').html(modalTitle);
                //
                // // Modal body
                //
                modal.find('.modal-body').html(html);
                //
                // // Modal buttons
                //
                modal.find('.well.well-small.form-actions')
                    .append('<button type="button" class="btn btn-default pull-right" data-dismiss="modal">Close</button>')
                ;

                // Modal itself

                modal.modal({
                    show: true
                });
            }
        });
    });
});

