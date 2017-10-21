(function(Components) {
  var AjaxDataTable = function(element) {
    var $element = $(element);
    var url = $element.data('datatables-url');
    var columns = $element.data('datatables-columns');
    var enabledRowClass = $element.data('datatables-enabled-class');
    var disabledRowClass = $element.data('datatables-disabled-class');
    var validRowClasses = enabledRowClass !== undefined && disabledRowClass !== undefined;
    var postCreatedRow = validRowClasses ? createdRow : function () {};

    function createdRow(row, data, dataIndex) {
      if (data.enabledRow) {
        $(row).addClass(enabledRowClass);
      } else {
        $(row).addClass(disabledRowClass);
      }
    }

    $element.DataTable( {
      "processing": true,
      "serverSide": true,
      "ordering": false,
      "searchDelay": 500,
      "ajax": {
        "url": url,
      },
      "createdRow": postCreatedRow,
      "columns": columns,
      "language": {
        "sEmptyTable": "Nenhum registro encontrado",
        "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
        "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
        "sInfoFiltered": "",
        "sInfoPostFix": "",
        "sInfoThousands": ".",
        "sLengthMenu": "_MENU_ resultados por página",
        "sLoadingRecords": "Carregando ...",
        "sProcessing": "Processando ...",
        "sZeroRecords": "Nenhum registro encontrado",
        "sSearch": "Pesquisar",
        "oPaginate":  {
          "sNext": "Próximo",
          "sPrevious": "Anterior",
          "sFirst": "Primeiro",
          "sLast": "Último"
        },
        "oAria": {
          "sSortAscending": ": Ordenar colunas de forma ascendente",
          "sSortDescending": ": Ordenar colunas de forma descendente"
        }
      }
    });
  }

  Components.AjaxDataTable = AjaxDataTable;
})(Components);
