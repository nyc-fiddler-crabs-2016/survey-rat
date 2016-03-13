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

  $('#create-survey-form').on('submit', function(event){
    event.preventDefault();
    var url = '/surveys';
    $.ajax({
      type: "POST",
      url: url,
      data: $(this).serialize()
    }).done(function(response){
      // $("#survey-title")

      if (response.length > 0) {
        arr = response.split("|");
        $("#survey-title").text("");
        $("#survey-title-show").append(arr[0]);
        $("#new-question").append(arr[1]);
      }
    });
  })

  $('#new-question').on('submit', '.question-creation', function(event){
    event.preventDefault();
    var url = '/questions';
    $.ajax({
      type: "POST",
      url: url,
      data: $(this).serialize()
    }).done(function(response){
      arr = response.split("|");
      $("#current-question").html(arr[0])
      $("#new-possible-choice").html(arr[1]);
    });
  })

  $('#new-possible-choice').on('submit', '.possible-choice-creation', function(event){
    event.preventDefault();
    debugger
    var url = '/possible_choices';
    $.ajax({
      type: "POST",
      url: url,
      data: $(this).serialize()
    }).done(function(response){
      $("#new-possible-choice").html(response);
    });
  })

  $('#new-possible-choice').on('click', '.add-question', function(event){
    event.preventDefault();
    var url = '/questions/new/grab';
    $.ajax({
      type: "POST",
      url: url,
      data: $(this).serialize()
    }).done(function(response){
    $("#current-question").text("");
    $("#new-possible-choice").text("");
    $(response).appendTo("#done-questions");
      console.log(response);
    });
  });



});

