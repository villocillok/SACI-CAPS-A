$(document).ready(function() {
    $('#weeding-table').dataTable({
        aoColumnDefs: [
            { bSearchable: false, bSortable: false, aTargets: [4] }
        ],
        fnDrawCallback: function(oSettings) {
        }
    });
});