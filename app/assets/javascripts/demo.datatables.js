$(document).on('turbolinks:load', function(){
  $("table[role='datatable']").each(function(){
    $(this).dataTable({
      processing: true,
      serverSide: true,
      ajax: $(this).data('url'),
    });
  });
})
