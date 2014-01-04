$(document).ready(function(){
    var id = $("#page-id").val();

    $.ajax({
	type:"GET",
	url:"/ajax/getContent/" + id,
	cache:false,
	success:function(html){
	    $("#mainContent").html(html);
	    
	    if(load_content){
		load_content();
	    }
	    
	    $("#initContent").hide(200);
	}
    });
});

