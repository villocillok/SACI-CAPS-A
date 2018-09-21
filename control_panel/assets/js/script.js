function openDialog() {
    var dialog = $("#dialog").data('dialog');

    if(!dialog.element.data('opened')) {
        dialog.open();
    }
}

function closeDialog() {
    var dialog = $("#dialog").data('dialog');

    if(dialog.element.data('opened')) {
        dialog.close();
    }
}

function setDialogLoader() {
    $('#dialog-inner').css({
        'box-sizing': 'border-box',
        'padding': '15px 25px'
    }).html('<div data-role="preloader" data-type="ring" data-style="dark" style="margin: auto;"></div><div class="align-center" style="margin-top: 10px;">Please Wait...</div>');
}

function setDialogContent(header, body) {
    var dialogHeader, dialogBody;

    $('#dialog-inner').css({
        'box-sizing': 'border-box',
        'padding': '15px 25px'
    }).html('<h1 id="dialog-header" class="no-margin"></h1><hr><div id="dialog-body"></div>');

    dialogHeader = $('#dialog-header');
    dialogBody = $('#dialog-body');

    dialogHeader.text(header);
    dialogBody.text(body);
}

function setDialogHtmlContent(header, body) {
    var dialogHeader, dialogBody;

    $('#dialog-inner').css({
        'box-sizing': 'border-box',
        'padding': '15px 25px'
    }).html('<h1 id="dialog-header" class="no-margin"></h1><hr><div id="dialog-body"></div>');

    dialogHeader = $('#dialog-header');
    dialogBody = $('#dialog-body');

    dialogHeader.html(header);
    dialogBody.html(body);
}

function getDataInput(dataInput) {
    return $('[data-input="' + dataInput + '"]').val();
}

function getSelectDataInput(dataInput) {
    return $('select[data-input="' + dataInput + '"] option:selected').val();
}

function getDataSelect(dataInput) {
    var list = [];

    $('[data-input="' + dataInput + '"] option').each(function() {
        if(this.selected == true) {
            list.push(this.value);
        }
    });

    return list;
}