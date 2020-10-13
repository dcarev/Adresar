var pageLength = 10;
var contactTable;
var tableOrder = [[0, "asc"]];
var deleteId = 0;
var deleteName = "";

toastr.options.positionClass = "toast-bottom-right";

$(document).ready(function () {

    RecreateDatatable(); 

    $("#btnNew").on("click", function () {
        window.location.href = createUrl;
    });

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

    $('#btnYes').on("click", function () {
        $('#deleteModal').modal('hide');

        $.ajax({
            url: deleteUrl,
            type: "POST",
            beforeSend: function () {
                $("#pageloader").css("display", "block");
            },
            data: {
                "id": deleteId,
            },
            success: function (resultData) {
                if (resultData && resultData.success) {
                    toastr["success"](successMsg.replace('{0}', deleteName));
                    contactTable.ajax.reload(null, false);
                }
                else {
                    toastr["error"](resultData.error);
                }
            },
            error: function (data) {
                toastr["error"](errorMsg);
            }
        });
    });

    $('body').tooltip({ selector: '[data-toggle="tooltip"]' });
});

function EditContact(id) {
    window.location.href = editUrl + "/" + id;
}

function DeleteContact(id, name) {
    deleteId = id;
    deleteName = name;
    $('#modalMsg').text(confirmationMsg.replace('{0}', name));
    $('#deleteModal').modal('show');
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
            "url": langUrl
        },
        "columnDefs": [
            { "responsivePriority": 1, "targets": [0,1] },
            { "responsivePriority": 2, "targets": [-1] },
            { "className": "dt-body-center", "targets": [-1] },
            { "width": "60px", "targets": [-1] }
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
                            "<a href='JavaScript:EditContact(" + row.ID + ");' title='" + editTooltip + "' data-toggle='tooltip'><i class='far fa-edit fa-lg fa-space'></i></a>" +
                            "<a href='JavaScript:DeleteContact(" + row.ID + ", \"" + row.Ime + " " + row.Prezime + "\");' title='" + deleteTooltip + "' data-toggle='tooltip'><i class='far fa-trash-alt fa-lg fa-space'></i></a>";
                    }
                    return dataRender;
                },
                "orderable": false
            }
        ]
    });
}