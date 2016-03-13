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

// J & K code

  $('#create-survey-form').on('submit', function(event){
    event.preventDefault();
    var url = '/surveys';
    $.ajax({
      type: "POST",
      url: url,
      data: $(this).serialize()
    }).done(function(response){
      $("#new-question").append(response);
    });
  })

  $('#new-question').on('submit', '#question-creation', function(event){
    event.preventDefault();
    var url = '/questions';
    $.ajax({
      type: "POST",
      url: url,
      data: $(this).serialize()
    }).done(function(response){
      $("#new-possible-choice").append(response);
    });
  })

  $('#new-question').on('submit', '#possible-choice-creation', function(event){
    event.preventDefault();
    // var url = '/possible_choices';
    // $.ajax({
    //   type: "POST",
    //   url: url,
    //   data: $(this).serialize()
    // }).done(function(response){
    //   $("#new-possible-choice").append(response);
    // });
  })

// end J & K code


});

