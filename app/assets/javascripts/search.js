$(document).ready(function() {
  $('#date_year').prepend('<option selected=""></option>');
  $('#make').change(function() {
    if($(this).val() != '' && $(this).val() != undefined) {
      $('#car_model').empty();
      $.get('/home/getmodels/', { make_name: $(this).val() }, function(data) {
        $('#car_model').append('<option></option>');
        for(i = 0; i < data.length; i++) {
          $('#car_model').append('<option value="' + data[i].name + '">' + data[i].name + '</option>');
        }
      });
    }
  });
});
