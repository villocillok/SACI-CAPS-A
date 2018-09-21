$(document).ready(function() {
    $('[data-form="materials-report-form"]').submit(function() {
        var dateInput = $('[data-input="date"]').val();

        setDialogLoader();
        openDialog();

        setDialogHtmlContent('Book Report', '<iframe class="pdf-frame" src="requests/generate_monthly_materials_report.php?date=' + dateInput + '"></iframe>');

        return false;
    });

    $('[data-form="transactions-report-form"]').submit(function() {
        var dateInput = $('[data-input="date"]').val();

        setDialogLoader();
        openDialog();

        setDialogHtmlContent('Transactions Report', '<iframe class="pdf-frame" src="requests/generate_monthly_transactions_report.php?date=' + dateInput + '"></iframe>');

        return false;
    });

    $('[data-form="students-report-form"]').submit(function() {
        setDialogLoader();
        openDialog();

        setDialogHtmlContent('Borrower Report', '<iframe class="pdf-frame" src="requests/generate_students_report.php"></iframe>');

        return false;
    });

    $('[data-form="barcode-report-form"]').submit(function() {
        setDialogLoader();
        openDialog();

        setDialogHtmlContent('Barcode Report', '<iframe class="pdf-frame" src="requests/generate_barcode_report.php"></iframe>');

        return false;
    });

    $('[data-form="penalty-report-form"]').submit(function() {
        setDialogLoader();
        openDialog();

        setDialogHtmlContent('Penalty Report', '<iframe class="pdf-frame" src="requests/generate_penalty_report.php"></iframe>');

        return false;
    });

    $('[data-form="reservation-material-report-form"]').submit(function() {
        setDialogLoader();
        openDialog();

        setDialogHtmlContent('Reservation Report', '<iframe class="pdf-frame" src="requests/generate_reserved_materials_report.php"></iframe>');

        return false;
    });

    $('[data-form="return-report-form"]').submit(function() {
        setDialogLoader();
        openDialog();

        setDialogHtmlContent('Return Report', '<iframe class="pdf-frame" src="requests/generate_return_report.php"></iframe>');

        return false;
    });
});