$(document).ready(function(){
  $(".show-completed").click(function() {
    $( ".Complete" ).toggle();
  });

  $("#myTable").tablesorter(); 

  $('.change-status').on('click', function(data){
    data.preventDefault();
  })

  function findMatch(element, searchTerm){
    var output = false;
    $(element).children().each(function(i,e){
      if ($(e).html().match(searchTerm)){
        output = true;
      }
    });
    return output;
  }

  $('.search-box').on('keyup', function(){
    var searchTerm = new RegExp($(".search-box").val(), "i");
    $('.all-task').children().each(function(index, element){
      if (findMatch(element, searchTerm)) {
        $(element).show();
      } else {
        $(element).hide();
      }
    });
  });
});

