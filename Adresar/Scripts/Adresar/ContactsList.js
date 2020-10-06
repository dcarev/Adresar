var pageLength = 10;
var contactTable;
var tableOrder = [[0, "asc"]];

$(document).ready(function () {

    RecreateDatatable();

    $('#btnReset').on("click", function () {
        $("#search").val("");
        RecreateDatatable();
    });

    $("#btnSearch").on("click", function () {
        RecreateDatatable();
    });

    $("#frmContactSearch").on("submit", function () {
        RecreateDatatable();
        return false;
    });
});

function EditContact(id) {
    
}

function DeleteContact(id) {
    
}
    
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
            "url": '//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Croatian.json'
        },
        "columnDefs": [
            { "responsivePriority": 1, "targets": [0,1] },
            { "responsivePriority": 2, "targets": [-1] },
            { "className": "dt-body-center", "targets": [-1] },
            { "width": "50px", "targets": [-1] }
        ],
        "columns": [
            { "data": "Ime" },
            { "data": "Prezime" },
            { "data": "Telefon" },
            { "data": "Email" },
            { "data": "VrijemeKreiranja" },
            { "data": "ZadnjaIzmjena" },
            {
                "data": "ID",
                "render": function (data, type, row) {
                    var dataRender;
                    if (data !== "dummy") {
                        dataRender =
                            "<a href='JavaScript:EditContact(" + row.ID + ");'><i class='far fa-edit fa-lg fa-space'></i></a>" +
                            "<a href='JavaScript:DeleteContact(" + row.ID + ");'><i class='far fa-trash-alt fa-lg fa-space'></i></a>";
                    }
                    return dataRender;
                },
                "orderable": false
            }
        ]
    });
}