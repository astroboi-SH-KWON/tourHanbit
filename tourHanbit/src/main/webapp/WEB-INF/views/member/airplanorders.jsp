<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <style type="text/css">
body{
background-image: url("resources/img/world.JPG");
background-repeat: no-repeat;
}
#airplane{

position: absolute;
top: 220px;
left: 400px;

}

.asia{
top : 100px;
left : 100px;
}
.oceania{
}
.europe{
top : 300px;
left : 300px;
}

.afreeca{

}
.s_america{

}
.n_america{

}

#airplane_city{

position: absolute;
}

</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
 $(function(){
	
 /* 	$("#airplane").click(function() {
		var airplane = $("#airplane").val();
		var airplane_intro_text = $("#airplane_intro_text").val();
		
		$("#airplane").animate({ width: "0%", opacity: 0.0, top:"400",left: "+=520", borderWidth: "0px" }, 2000 );
		}); */

 /* 	 $("#oceania").click(function(){
 		 var oceania = $("#oceania").val();
         $("#airplane").animate({ width: "40", height:"40", opacity: 15.0, top:"400",left: "390", borderWidth: "0px" }, 2000 )
         alert(oceania)
 	 });
 	 
 	 $("#asia").click(function(){
 		 var asia = $("#asia").val();
 		$("#airplane").animate({ width: "40", height:"40" , opacity: 15.0, top:"180",left: "320", borderWidth: "0px" }, 2000 );
 		
 	 });
 	 
 	 $("#europe").click(function(){
 		 var europe = $("#europe").val();
 		$("#airplane").animate({ width: "40", height:"40" , opacity: 15.0, top:"150",left: "100", borderWidth: "0px" }, 2000 );
 		
 	 });
 	 
 	 $("#afreeca").click(function(){
 		 var afreeca = $("#afreeca").val();
 		$("#airplane").animate({ width: "40", height:"40" , opacity: 15.0, top:"300",left: "100", borderWidth: "0px" }, 2000 );
 		
 	 });
 	 $("#s_america").click(function(){
 		 var s_america = $("#s_america").val();
 		$("#airplane").animate({ width: "40", height:"40" , opacity: 15.0, top:"190",left: "+=350", borderWidth: "0px" }, 2000 );
 		
 	 });
 	 $("#n_america").click(function(){
 		 var n_america = $("#n_america").val();
 		$("#airplane").animate({ width: "40", height:"40" , opacity: 15.0, top:"380",left: "+=440", borderWidth: "0px" }, 2000 );
 		
 	 }); */
 	 
 	 
 	$("#oceania").click(function(){
		 var oceania = $("#oceania").val();
	        $.ajax({
	             type : 'POST',
	             url : 'airplanorders.do',
	             data:{"oceania":oceania},
	             success : function(data)
	             {
	            	 location.href="main.do";
	             }
	            });
        		$("#airplane").animate({ width: "40", height:"40", opacity: 15.0, top:"400",left: "390", borderWidth: "0px" }, 2000 )
 	});
 	 
 	 $("#n_america").click(function(){
 		 var n_america = $("#n_america").val();
 		$.ajax({
            type : 'POST',
            url : 'airplanorders.do',
            data:{"n_america":n_america},
            success : function(data)
            {
            	location.href="main.do";
            }
           });
 			$("#airplane").animate({ width: "40", height:"40" , opacity: 15.0, top:"380",left: "+=440", borderWidth: "0px" }, 2000 );
			}); 
 });
 
</script>
<title>Insert title here</title>
</head>
<body>

<!-- <form action="airplanorders.do" method="post">
 -->
<input type="image" value="�����ƴϾ�" src="resources/img/�����ƴϾ�.JPG" id="oceania" name="oceania" class="continent" width="40" height="40" alt="�����ƴϾ�">
<input type="image" value="�ƽþ�" src="resources/img/�ƽþ�.JPG" id="asia" name="asia" class="continent" width="40" height="40">
<input type="image" value="����" src="resources/img/����.JPG" id="europe" name="europe" class="continent" width="40" height="40">
<input type="image" value="������ī" src="resources/img/������ī.JPG" id="afreeca" class="continent" name="afreeca" width="40" height="40">
<input type="image" value="���Ƹ޸�ī" src="resources/img/���Ƹ޸�ī.JPG" id="s_america" name="s_america" class="continent" width="40" height="40">
<input type="image" value="�ϾƸ޸�ī" src="resources/img/�ϾƸ޸�ī.JPG" id="n_america" name="n_america" class="continent" width="40" height="40">
<input type="image" value="letsgo" src="resources/img/airplan.png" id="airplane" width="15" height="15">
<!-- 
</form> -->
</body>
</html>


























<!-- $("#airplane").toggle(function(){
		$(this).animate({left:500},"slow").effect( "size", {
		    to: { width: 200, height: 60 }
		  }, 1000 );
		$(this).fadeOut(1000);
		
	},function(){
		$(this).animate({left:0},"slow");
	});  
	
   	$("#airplane_intro_text").click(function(){
 		var airplane_intro_text = $("#airplane_intro_text").val();
 		
 	});
 	
 	$("#airplane_city").click(function(){
 		var airplane_city = $("#airplane_city").val();
 		alert(airplane_city)
 		$(this).fadeOut(1000);
 	
 	});  -->