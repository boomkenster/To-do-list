$(document).ready(function(){
$(".show-completed").click(function() {
  $( ".Complete" ).toggle();
});
});

function change_status(){
  $(".change-status").on('click',function(event){
    var taskId = $("change-status").data('change-status')
    var taskStatus = $(this).siblings('.status')
    event.preventDefault();
    $.ajax({
      dataType: 'json',
      type: "POST",
      url: "/change",
      data: {
        "id": taskId
      },
      success: function(task){
        if(taskStatus.html()==="Status: Incomplete"){taskStatus.html("Status: Complete")
      } else if(taskStatus.html()==="Status: Complete"){taskStatus.html("Status: Incomplete")}
      };
    })
  });
};
