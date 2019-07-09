$(document).ready(function(){
  $("a.load-more").click(function(e){
    // prevent the default click action
    e.preventDefault();

    $(".load-more").hide();
    $(".loading-gif").show();

    // get the last id and save it in a variable 'last-id'
    var last_id = $(".record").last().attr("data-id");

    $.ajax({
      type: "GET",
      url: $(this).attr("href"),
      data: { last_id: last_id },
      dataType: "script",

      success: function(){
        $(".loading-gif").hide();
        $(".load-more").show();
      }
    });
  });
});
