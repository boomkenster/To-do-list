$(document).ready(function(){
  $(".show-completed").click(function() {
    $( ".Complete" ).toggle();
  });

  $("#myTable").tablesorter(); 

  $('.change-status').on('click', function(data){
    data.preventDefault();
  })
});

