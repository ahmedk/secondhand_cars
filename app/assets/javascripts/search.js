$(document).ready(function() {
  $('#search_form #make').change(function() {
    $('#search_form #car_model').empty();
    if($(this).val() != '' && $(this).val() != undefined) {
      $.get('/home/getmodels/', { make_name: $(this).val() }, function(data) {
        $('#search_form #car_model').append('<option></option>');
        for(i = 0; i < data.length; i++) {
          $('#car_model').append('<option value="' + data[i].name + '">' + data[i].name + '</option>');
        }
      });
    }
  });

  $('#search_form').submit(function() {
    var search_fields = 3;
    var field = [$(this).find('#make'), $(this).find('#car_model'), $(this).find('#date_year')];
    for(var i=0; i < 3; i++) {
      var value = field[i].val();
      if(value == '' || value == undefined) {
        search_fields--;
        field[i].attr('disabled', 'disabled');
      }
    }
    if(search_fields == 0) {
      alert("Please enter search criteria");
      $(this).find(':disabled').removeAttr('disabled');
      return false;
    }
  });
});
