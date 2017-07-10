<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"><!--  -->
 <!--  <link rel="stylesheet" href="/resources/demos/style.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script><!--  -->
  <style>
	input[type=text] , input[type=date], select{
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


</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		//var today=Date();
		$("#srchOption").change(function() {

			if($(this).val()==3){			
				$("#srchSpan").css("display","none");
				$("#srchDateSpan").css("display","inline");
			}else{
				$("#srchSpan").css("display","inline");
				$("#srchDateSpan").css("display","none");
			}
		});
		var startDay;
		var endDay;
		$("#table").hide();
	    $( "#startDay" ).datepicker({
	    	dateFormat : "yy-mm-dd",
			numberOfMonths :3,
	        onSelect: function() { 
	            //startDay = $(this).datepicker('getDate'); 
	            var today = $.datepicker.formatDate('yy-mm-dd', new Date());
	            //alert(today);
	            startDay = $(this).val();
	            if(startDay<today){
	            	alert(today+" 이후로 선택하세요");
	            	$("#startDay").datepicker('setDate', today);
	            }
	            //alert(startDay);
	            $("#endDay").datepicker('setDate', $(this).val());
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
  <!--  <a href="optionSrch.do" class="btn btn-primary" >날짜검색</a>  --> 
    <a href="listQna.do" class="btn btn-primary" >Q&A</a>
    <a href="listNotice.do" class="btn btn-primary" >공지사항</a><!-- style="background-color: lightblue;" -->
   </div>
   
	<center>
<div >
  <form action="srch.do">
      

    <select id="srchOption" name="srchOption"  style="color:#fff;">
      <option value="0" style="color: white;">전체검색</option>
      <option value="1" style="color: white;">해외여행</option>
      <option value="2" style="color: white;">국내여행</option>
      <option value="3" style="color: white;">날짜 검색</option>
    </select>  &nbsp&nbsp

    <span id="srchSpan">
    <input type="text" id="srch" name="srch" placeholder="검색어를 입력하세요." >  
    </span>
    <span id="srchDateSpan" style="display:none; ">
    <input type="date" id="startDay" name="startDay">		
	<label>&nbsp<font color="#337ab7"><b> ~ </b></font>&nbsp</label>
	<input type="date" id="endDay" name="endDay">
    </span>
    

    &nbsp&nbsp
    <input type="submit" id="srch1" value="검색" style="color:#fff;background-color:#337ab7;border-color:#2e6da4" class="btn btn-primary"ocation.href='srch.do?'">

    </form>
</div>
	</center>
	
<hr>

</body>
</html>