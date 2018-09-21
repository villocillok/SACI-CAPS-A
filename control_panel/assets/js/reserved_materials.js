$(document).ready(function() {
    var list = [];

    $('#borrower-info-table').dataTable();


    $('#materials-table').dataTable();

    $('[data-input="borrower"]').change(function() {
        setDialogLoader();
        openDialog();

        $.ajax({
            url: 'requests/load_reserved_materials.php',
            method: 'POST',
            data: {
                id: $(this).val()
            },
            success: function(response) {
                closeDialog();

                $('#materials-table').dataTable().fnDestroy();
                $('#materials-table > tbody').html(response);
                $('#materials-table').dataTable({
                    aoColumnDefs: [
                        { bSearchable: false, bSortable: false, aTargets: [3] }
                    ],
                    fnDrawCallback: function(oSettings) {
                        var index;

                        $('[data-input="loan-checkbox"]').unbind('change');

                        $('[data-input="loan-checkbox"]').change(function() {
                            if(this.checked) {
                                list.push($(this).data('var-id'));

                                console.log('Checked: ' + $(this).data('var-id'));
                            } else {
                                index = list.indexOf($(this).data('var-id'));

                                if(index > -1) {
                                    list.splice(index, 1);
                                }

                                console.log('Unchecked: ' + $(this).data('var-id'));
                            }

                            console.log(list);
                        });
                    }
                });
            }
        });

        return false;
    });

    $('[data-button="borrow-button"]').click(function() {
        var borrower = $('[data-input="borrower"]').val();

        if(borrower != null) {
            if(list.length > 0) {
                setDialogLoader();
                openDialog();

                $.ajax({
                    url: 'requests/loan_reserved_materials.php',
                    method: 'POST',
                    data: {
                        borrower: borrower,
                        materials: list
                    },
                    success: function(response) {
                        response = JSON.parse(response);
                        setDialogHtmlContent('Loan Status', response['message']);

                        $('[data-button="print-button"]').click(function() {
                            //TODO: Print Receipt
                            closeDialog();
                            $('#dialog').html('<iframe style="display: none;" src="requests/receipt.php?data='+response['data']+'" onload="this.contentWindow.print();"></iframe>');

                            //location.reload();
                        });
                    }
                });

                return false;
            } else {
                alert('Oops! Please select at least 1 material to borrow.');
            }
        } else {
            alert('Oops! Please select a borrower.');
        }
    });
});