$(document).ready(function() {
  $('#make').change(function() {
    $('#car_model').empty();
    if($(this).val() != '' && $(this).val() != undefined) {
      $.get('/home/getmodels/', { make_name: $(this).val() }, function(data) {
        $('#car_model').append('<option></option>');
        for(i = 0; i < data.length; i++) {
          $('#car_model').append('<option value="' + data[i].name + '">' + data[i].name + '</option>');
        }
      });
    }
  });
});
