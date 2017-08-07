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
	#draggable { width: 250px; height: 200px; padding: 0.5em;z-index: 999; border-radius: 5px;background: none}
	
	@font-face {
    font-family: 'weather';
    src: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/93/artill_clean_icons-webfont.eot');
    src: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/93/artill_clean_icons-webfont.eot?#iefix') format('embedded-opentype'),
         url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/93/artill_clean_icons-webfont.woff') format('woff'),
         url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/93/artill_clean_icons-webfont.ttf') format('truetype'),
         url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/93/artill_clean_icons-webfont.svg#artill_clean_weather_iconsRg') format('svg');
    font-weight: normal;
    font-style: normal;
}

html {
  width: 100%;
  height: 100%;
  background: #1192d3 url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/93/austin-2.jpg) no-repeat bottom right;
  background-size: cover;
}

body {
  padding: 45px 0;
  font: 13px 'Open Sans', "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
}

#weather {
  width: 200px;
  margin: 0px auto;
  text-align: center;
  text-transform: uppercase;
  background: none
}

i {
  color: skyblue;
  font-family: weather;
  font-size: 80px;
  font-weight: normal;
  font-style: normal;
  line-height: 1.0;
  text-transform: none;
}

.icon-0:before { content: ":"; }
.icon-1:before { content: "p"; }
.icon-2:before { content: "S"; }
.icon-3:before { content: "Q"; }
.icon-4:before { content: "S"; }
.icon-5:before { content: "W"; }
.icon-6:before { content: "W"; }
.icon-7:before { content: "W"; }
.icon-8:before { content: "W"; }
.icon-9:before { content: "I"; }
.icon-10:before { content: "W"; }
.icon-11:before { content: "I"; }
.icon-12:before { content: "I"; }
.icon-13:before { content: "I"; }
.icon-14:before { content: "I"; }
.icon-15:before { content: "W"; }
.icon-16:before { content: "I"; }
.icon-17:before { content: "W"; }
.icon-18:before { content: "U"; }
.icon-19:before { content: "Z"; }
.icon-20:before { content: "Z"; }
.icon-21:before { content: "Z"; }
.icon-22:before { content: "Z"; }
.icon-23:before { content: "Z"; }
.icon-24:before { content: "E"; }
.icon-25:before { content: "E"; }
.icon-26:before { content: "3"; }
.icon-27:before { content: "a"; }
.icon-28:before { content: "A"; }
.icon-29:before { content: "a"; }
.icon-30:before { content: "A"; }
.icon-31:before { content: "6"; }
.icon-32:before { content: "1"; }
.icon-33:before { content: "6"; }
.icon-34:before { content: "1"; }
.icon-35:before { content: "W"; }
.icon-36:before { content: "1"; }
.icon-37:before { content: "S"; }
.icon-38:before { content: "S"; }
.icon-39:before { content: "S"; }
.icon-40:before { content: "M"; }
.icon-41:before { content: "W"; }
.icon-42:before { content: "I"; }
.icon-43:before { content: "W"; }
.icon-44:before { content: "a"; }
.icon-45:before { content: "S"; }
.icon-46:before { content: "U"; }
.icon-47:before { content: "S"; }

#weather h2 {
  margin: 0 0 8px;
  color: skyblue;
  font-size: 50px;
  font-weight: 300;
  text-align: center;
  text-shadow: 0px 1px 3px rgba(0, 0, 0, 0.15);
}

#weather ul {
  margin: 0;
  padding: 0;
}

#weather li {
  background: #fff;
  background: rgba(173,216,230,0.70);
  padding: 20px;
  display: inline-block;
  border-radius: 5px;
}

#weather .currently {
  margin: 0 20px;
}

#deldiv{float: right;background: none;text-shadow: 2px 2px #FFF}

</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- <link rel="stylesheet" href="/resources/demos/style.css">   -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery.simpleWeather/3.1.0/jquery.simpleWeather.min.js"></script>
<script type="text/javascript">
$(function() {		
		
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

		
		var dragFlag= "true";
		if(document.cookie!=null && document.cookie !=""){
			dragFlag=document.cookie; 
		}
		var url=window.location.href;
		if(url.indexOf('ainPage')>0 && dragFlag=="true"){
			$("#draggable").css('display','inline')
		}
		$( "#draggable" ).draggable();
		
		var el=$('#draggable');
		var elpos=el.offset().top;
		$(window).scroll(function () {
		    var y=$(this).scrollTop();
		    if($("#del").is(":checked")){
		    	$("#draggable").css('display','none');
		    	document.cookie = "false";
		    }else{
			    if(y<elpos){el.stop().animate({'top':20},500);}
			    else{el.stop().animate({'top':y-elpos+100},500);}
		    	
		    }
		    
			    
		});
		
		$.simpleWeather({
		    location: 'SEOUL',
		    woeid: '',
		    unit: 'c',
		    success: function(weather) {
		      html = '<a href="memberSrch.do?srchOption=0&srch=서울"><h2><i class="icon-'+weather.code+'"></i> '+weather.temp+'&deg;'+weather.units.temp+'</h2>';
		      html += '<ul><li><b> 한국 서울 </b></li><ul></a>';			  
		      $("#weather").html(html);
		    },
		    error: function(error) {
		      $("#weather").html('<p>'+error+'</p>');
		    }
		  });
		
		var city_en = ["OSAKA","CEBU","PARIS","SHANGHAI","PRAHA","SEOUL", "LONDON", "TOKYO","PUSAN","SYDNEY","DANANG"];
		var city_kr = ["일본 오사카","필리핀 세부","프랑스 파리","중국 상하이","체코 프라하","한국 서울", "영국 런던", "일본 도쿄","한국 부산","호주 시드니","베트남 다낭"];
		var i=-1;
		setInterval( function() {
			i++;
			if(i>=city_kr.length){ i=0}
			$.simpleWeather({
			    location: city_en[i],
			    woeid: '',
			    unit: 'c',
			    success: function(weather) {
			      html = '<a href="memberSrch.do?srchOption=0&srch='+city_kr[i].split(" ")[1]+'"><h2><i class="icon-'+weather.code+'"></i> '+weather.temp+'&deg;'+weather.units.temp+'</h2>';
			      html += '<ul><li><b>'+city_kr[i]+'</b></li><ul></a>';			  
			      $("#weather").html(html);
			    },
			    error: function(error) {
			      $("#weather").html('<p>'+error+'</p>');
			    }
			  });
			
			
		} , 2000);
	});
</script>
</head>
<body>	
	<nav class="navbar navbar-inverse ">
  	<div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="memberMainPage.do">한빛여행사</a>
    </div>

    <ul class="nav navbar-nav navbar-right ">


	 <c:if test="${empty id}">
	   <li><a href="joinMember.do"><span class="glyphicon glyphicon-user"></span>회원 가입</a></li>
      <li><a href="loginmember.do"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
	</c:if>
	  
	  
	  <c:if test="${not empty id }">
	  	<li><a href="logout.do"><span class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>
		 <li><a href="memberMypage.do"><span ></span>MyPage   </a></li>
    
		  <c:if test="${thisis_admin==100}">
		  	<li><a href="adminLogin.com"><span class="glyphicon glyphicon-log-in"></span>관리자페이지</a></li>
		  </c:if>
	  </c:if>
	 
	</ul>
	</div>
	</nav>
<hr>
	<div class="btn-group btn-group-justified" >
    <a href="memberMainPage.do?page=dom" class="btn btn-primary" >국내여행</a>
    <a href="memberMainPage.do?page=inter" class="btn btn-primary" >해외여행</a>
    <a href="listQna.do" class="btn btn-primary" >Q&A</a>
    <a href="listNotice.do" class="btn btn-primary" >공지사항</a>
   </div>
   
	<center>
<div >
  <form action="memberSrch.do">
      
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
    <input type="submit" id="srch1" value="검색" style="color:#fff;background-color:#337ab7;border-color:#2e6da4" class="btn btn-primary" location.href='srch.do?'>
	</td>
		</tr>
	</table>
    </form>
</div>
	</center>

<hr>
	<div style="position: relative; width: 0; height: 0">
    	<div id="draggable" class="ui-widget-content" style="position: absolute; left: 1250px; top: 10px ;display:none;">       
		<div id="weather"></div>
		<div id="deldiv"><input type="checkbox" id="del" ><b>오늘은 그만 보겠습니다.</b> </div><br>
    	</div>
    </div>
</body>
</html>