$(document).ready(function(){
  // changeCompletion()

  $(".show-completed").click(function() {
    $( ".Complete" ).toggle();
  });

  $(".show-future").click(function() {
    $( ".future" ).toggle();
  });

  $("#myTable").tablesorter(); 

  // function changeCompletion(){
    $(".task-status").on('click', function(data){
      data.preventDefault();

      var currentStatus = $(this).html();
      var taskId        = $(this).data("id");
      var taskStatus    = null
      console.log(currentStatus);

      if (currentStatus === "Incomplete"){
        $(this).html("Complete");
        taskStatus = "Complete";
      } else if ($(currentStatus === "Complete")) {
          $(this).html("Incomplete");
          taskStatus = "Incomplete";
      }

      $.ajax({
        type: "POST",
        url: "/change_status",
        dataType: "json",
        data:{
          "task_id": taskId,
          "status": taskStatus
        }
      })
    })
  // }

  $('.change-status').on('click', function(data){
    data.preventDefault();
  })

  function findMatch(element, searchTerm){
    var output = false;
    $(element).children().each(function(index, element){
      if ($(element).html().match(searchTerm)){
        output = true;
      }
    });
    return output;
  }

  $('.search-box').on('keyup', function(){
    var searchTerm = new RegExp($(".search-box").val());
    $('.all-task').children().each(function(index, element){
      if (findMatch(element, searchTerm)) {
        $(element).show();
      } else {
        $(element).hide();
      }
    });
  });
});

