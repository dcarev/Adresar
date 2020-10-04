var pageLength = 10;
var contactTable;
var tableOrder = [[0, "desc"]];

$(document).ready(function () {

    RecreateDatatable();

    $('#btnReset').on("click", function () {
        $("#search").val("");
        RecreateDatatable();
    });

    $("#btnSearch").on("click", function () {
        RecreateDatatable();
    });
});

    
function RecreateDatatable() {

    if (contactTable) {
        pageLength = contactTable.page.len();
    }

    if ($("#tblContacts").dataTable()) {
        $("#tblContacts").empty();
        $("#tblContacts").dataTable().fnDestroy();
    }

    var contactsSearchViewModel = {
        search: $("#search").val(),
    };

    contactTable = $("#tblContacts").DataTable({
        "searching": false,
        "bLengthChange": true,
        "bSort": true,
        "paging": true,
        "processing": false,
        "serverSide": true,
        "responsive": true,
        "pageLength": pageLength,
        "order": tableOrder,
        "ajax": {
            "url": url,
            "data": contactsSearchViewModel,
            "type": "POST"
        },
        "language": {
            "url": langUrl
        },
        "columns": [
            { "data": "Name" },
            { "data": "Surname" },
            { "data": "Phone" },
            { "data": "Email" },
            { "data": "Created" },
            { "data": "Updated" }
        ]
    });
}