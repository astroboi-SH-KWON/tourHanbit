<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>  
  <style>
	input[type=text] , select{
    display: inline;
    border: 1px solid #ccc;
    padding: 10px 20px;
    border-radius: 5px;
    box-sizing: border-box;
	}
	input[type=text] {width: 300px;}
	select {width: 150px;
	color: white;
	background-color:#337ab7;
	border-color:#2e6da4
    }
	
	
	input[type=submit] {
    width: 100px;
    color: white;
    padding: 8px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

	#srch1:hover{color:#fff;background-color:#fff;border-color:#204d74;
	}

	#draggable { width: 200px; height: 380px; padding: 0.5em;z-index: 999; border-radius: 5px;}

</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">  
  <link rel="stylesheet" type="text/css" href="/finance/s/OVd9g2P4lGg/styles/finance_us.css">
<link rel="icon"
        type="image/vnd.microsoft.icon" href="/finance/favicon.ico">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function() {
		$( "#draggable" ).draggable();
		
		var el=$('#draggable');
		var elpos=el.offset().top;
		$(window).scroll(function () {
		    var y=$(this).scrollTop();
		    if($("#stp").is(":checked")){
		    	el.stop();
		    }else{
			    if(y<elpos){el.stop().animate({'top':20},500);}
			    else{el.stop().animate({'top':y-elpos+100},500);}
		    	
		    }
		    
		});
		
		
		
		var startDay;
		var endDay;
		var today = $.datepicker.formatDate('yy-mm-dd', new Date());
		$("#today").val(today);
		$( "#startDay" ).datepicker({
	    	dateFormat : "yy-mm-dd",
			numberOfMonths :3,
	        onSelect: function() { 
	            startDay = $(this).val();
	            if(startDay<today){
	            	alert(today+" 이후로 선택하세요");
	            	$("#startDay").datepicker('setDate', today);
	            }

	        }
	    });
		
		$( "#endDay" ).datepicker({
	    	dateFormat : "yy-mm-dd",
			numberOfMonths :3,
	        onSelect: function() { 
	        	endDay = $(this).val();
	        	if(startDay>endDay){
	        		alert("출발일 "+$("#startDay").val()+" 이후로 선택하세요.");
	        		$(this).datepicker('setDate', $("#startDay").val());
	        	};
	        }
	    });
		$( "#slider-range" ).slider({
		      range: true,
		      min: 0,
		      max: 500,
		      values: [ 75, 300 ],
		      slide: function( event, ui ) {
		        $( "#amount" ).val( ui.values[ 0 ] + " 만원 ~" + ui.values[ 1 ]+ " 만원"  );
		      }
		    });
		    $( "#amount" ).val( $( "#slider-range" ).slider( "values", 0 ) +" 만원 ~" +
		      $( "#slider-range" ).slider( "values", 1 )+ " 만원"  );
		
		$("#srchOption").change(function() {

			if($(this).val()==3){	
				$("#srchSpan").css("display","none");
				$("#srchPriceSpan").css("display","none");
				$("#srchDateSpan").css("display","inline");
				
			}else if($(this).val()==4){			
				$("#srchSpan").css("display","none");
				$("#srchPriceSpan").css("display","inline");
				$("#srchDateSpan").css("display","none");

			}else{				
				$("#srchSpan").css("display","inline");
				$("#srchDateSpan").css("display","none");
				$("#srchPriceSpan").css("display","none");				
			}
		});
		
		

		
		
	});
</script>
</head>
<body>	
	<nav class="navbar navbar-inverse ">
  	<div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="mainPage.do">한빛여행사</a>
    </div>

    <ul class="nav navbar-nav navbar-right ">

	
	 <c:if test="${r!=1 }">
	   <li><a href="insertMember.do"><span class="glyphicon glyphicon-user"></span>회원 가입</a></li>
      <li><a href="loginMember.do"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
	  </c:if>
	  
	  
	  <c:if test="${r==1 }">
	  	<li><a href="logoutMember.do"><span class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>
    
		  <c:if test="${thisis_admin==100}">
		  	<li><a href="adminLogin.com"><span class="glyphicon glyphicon-log-in"></span>관리자페이지</a></li>
		  </c:if>
		 <li><a href="mypage.do"><span ></span>MyPage   </a></li>
	  </c:if>
	 
	</ul>
	</div>
	</nav>
<hr>
	<div class="btn-group btn-group-justified" >
    <a href="mainPage.do?page=dom" class="btn btn-primary" >국내여행</a>
    <a href="mainPage.do?page=inter" class="btn btn-primary" >해외여행</a>
    <a href="listQna.do" class="btn btn-primary" >Q&A</a>
    <a href="listNotice.do" class="btn btn-primary" >공지사항</a>
   </div>
   
	<center>
<div >
  <form action="srch.do">
      
	<table>
		<tr>
			<td>
			
    <select id="srchOption" name="srchOption"  style="color:#fff;">
      <option value="0" style="color: white;">전체 검색</option>
      <option value="1" style="color: white;">해외 여행</option>
      <option value="2" style="color: white;">국내 여행</option>
      <option value="3" style="color: white;">날짜 검색</option>
      <option value="4" style="color: white;">가격 검색</option>
    </select>  &nbsp&nbsp
</td><td>
    <span id="srchSpan" >

     <input type="text" id="srch" name="srch" placeholder="검색어를 입력하세요." >  
    </span>
   <span id="srchDateSpan" style="display:none; ">
   <input type="hidden" id="today" name="today">
    <input type="text" id="startDay" name="startDay" style="width: 135px">		
	<label>&nbsp<font color="#337ab7"><b> ~ </b></font>&nbsp</label>
	<input type="text" id="endDay" name="endDay" style="width: 135px">
    </span> 
    
    &nbsp&nbsp
    <span id="srchPriceSpan" style="display:none; ">

    <p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
 	 <!-- <label for="amount" style="padding: 0px; margin: 0px;">가격 범위</label> color:#f6931f-->
 	 <input type="text" id="amount" readonly style="border:0; color:#337ab7; font-weight:bold; padding: 0px;margin: 0px;" name="amount">
	</p>
 
	<div id="slider-range" style="width: 330px;padding: 0px;margin: 0px; "></div>

    </span> 
    

    
    </td><td>
    <input type="submit" id="srch1" value="검색" style="color:#fff;background-color:#337ab7;border-color:#2e6da4" class="btn btn-primary"ocation.href='srch.do?'">
	</td>
		</tr>
	</table>
    </form>
</div>
	</center>

<hr>
<div style="position: relative; width: 0; height: 0">
    <div id="draggable" class="ui-widget-content" style="position: absolute; left: 1360px; top: 10px">
       
       
	스크롤창 고정 <input type="checkbox" id="stp" >
    </div>
</div>
</body>
</html>