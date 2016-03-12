$(document).ready(function() {

  $('.possibles').on("click", function(event){
    var url = "/choices"
    $.ajax({
      url: url,
      type: "POST",
      data: $(this).serialize()
    }).done(function(response){
      if (response) {
        $("#container").append(response);
      }
    })
  })

// J & K code

  $('#create-survey-form').on('submit', function(event){
    event.preventDefault();
    var url = '/surveys';
    $.ajax({
      type: "POST",
      url: url,
      data: $(this).serialize()
    }).done(function(response){
    $("#test").append(response);
    });
  })


// end J & K code

});
