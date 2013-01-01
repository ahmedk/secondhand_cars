$(document).ready(function() {
  $('#make_id').change(function() {
    $('#car_model_id').empty();
    if($(this).val() == '' || $(this).val() == undefined) return false;

    $.get('/home/getmodels/', { make_id: $(this).val() }, function(data) {
      $('#car_model_id').append('<option></option>');
      for(i = 0; i < data.length; i++) {
        $('#car_model_id').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
      }
    });
  });
});
