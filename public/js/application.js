$(document).ready(function() {
  $('.possibles').on("click", function(event){
    var url = "/choices"
    $.ajax({
      url: url,
      type: "POST",
      data: $(this).serialize()
    }).done(function(response){
      if (response) {
        if ($('#survey-submit').length == 0){
          $('#container').append(response);
        }
      }
    })
  })
});
