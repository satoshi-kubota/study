function load_content(){
    $("#btn_signup").click(function(event){
	var prms = $("#signup_form").serialize();
    	$.ajax({
    	    type:"GET",
    	    url:"/ajax/signup",
    	    data:prms,
    	    cache:false,
    	    success:function(html){
    		alert("ok");
    	    }
    	});
    });
}

    // 	$.ajax({
    // 	    type:"GET",
    // 	    url:"/ajax/signup",
    // 	    data:prms,
    // 	    cache:false,
    // 	    success:function(html){
    // 		alert("ok");
    // 	    }
    // 	    });
    // });

    
    

