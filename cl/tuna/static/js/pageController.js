$(document).ready(function(){
    var id = $("#pageId").val();

    $.ajax({
	type:"GET",
	url:"/ajax/getContent/" + id,
	cache:false,
	success:function(html){
	    $("#mainContent").html(html);
	    $("#initContent").hide(200);
	}
    });

    
});

