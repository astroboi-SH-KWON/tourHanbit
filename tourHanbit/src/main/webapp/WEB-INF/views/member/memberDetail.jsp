<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style type="text/css">
a{
font-size: 20px;
cursor: pointer;
clip:       
}

</style>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script type="text/javascript">
	$(function() {
		var pageSize = 3;
		var start = 0;
		var end = start + pageSize;
		var arr2;
		var arr = [ "${i.image03 }", "${i.image04 }", "${i.image05 }",
				"${i.image06 }", "${i.image07 }", "${i.image08 }",
				"${i.image09 }", "${i.image10 }", "${i.image11 }", ]
		var city_id = $("#city_id").val();
		var item_key = $("#item_key").val();
		
		$.ajax({
			url:"weather.do",
			dataType:"json",
			type:"post",
			data: {"city":city_id},
			success: function(data){
			
				data = JSON.parse(data);
					var tr=$("<tr></tr>");
					var tr2=$("<tr></tr>");
					var tr3=$("<tr></tr>");
					var tr4=$("<tr></tr>");
					var tr5=$("<tr></tr>");
					var arr2=[0,8,16,24,32];
					$("<td colspan='5' style='color:#fff;background-color:#337ab7;'><h3>"+data.city.name+"  현지 날씨 정보</h3></td>").appendTo(tr5);
					$.each(arr2,function(index,item){
						$("<td style='text-align:center;font-size: 20px'></td>").html(data.list[item].dt_txt.substring(0,11)).appendTo(tr);
						$("<td style='text-align:center;'></td>").html("<img src='http://openweathermap.org/img/w/"+data.list[item].weather[0].icon+".png' width='80'>").appendTo(tr2);
						$("<td style='text-align:center;'></td>").html("기온 : "+data.list[item].main.temp).appendTo(tr3);
						$("<td style='text-align:center;'></td>").html("습도 : "+data.list[0].main.humidity).appendTo(tr4);
					})
					$("#tb").append(tr5,tr,tr2,tr3,tr4);
			},
			error: function(data){
				alert("응답실패"+data)
			}
			
		})
		$(document).on("click","a",function(){
			pro5($(this).attr("id"));
		});

		pro5(1);
		function pro5(pageNUM){
		$.ajax({
			url:"listReview.do",
			dataType:"json",
			type:"post",
			data: {"item_key":item_key,"pageNUM":pageNUM},
			success: function(data){
				 $("#tab").empty(); 
				$("#tab").html("<tr><td>글번호</td><td>글제목</td><td>작성일</td><td>작성자</td></tr>");
				
				 $("#tab").addClass("table table-striped");
				$.each(data,function(index,item){
					
		                tr = $("<tr></tr>");
		                tr2 = $("<tr></tr>");
		               var td1 = $("<td style='width:10%;'></td>").text(item.review_number);
		               var td2 = $("<td id='title' style='width:50%;'></td>").text(item.review_title);
		               var td3 = $("<td style='width:20%;'></td>").text(item.review_date);
		               var td4 = $("<td 'style='width:20%;'></td>").text(item.mem_id);
		               var td5 = $("<td id='review_content' colspan='4'></td>").text(item.review_content);
		               var tr3;
		               var tr4;
		               $(tr).append(td1,td2,td3,td4).appendTo($("#tab"));
		               $(tr2).append(td5).appendTo($("#tab"));    
		               var score=item.score+"";
		              var array=score.split("/");
		              for ( var i in array ) {
		            	  tr3=$("<tr></tr>");
		            	  tr4=$("<tr></tr>");
		            	  $("<td></td>").html("가이드").appendTo(tr3);
		            	  $("<td></td>").html("호텔").appendTo(tr3);
		            	  $("<td></td>").html("식사").appendTo(tr3);
		            	  $("<td></td>").html("일정").appendTo(tr3);
		            	  $("<td></td>").html("전체만족도").appendTo(tr3);
		            	  var td6=$("<td></td>").html(array[0]);
		            	  var td7=$("<td></td>").html(array[1]);
		            	  var td8=$("<td></td>").html(array[2]);
		            	  var td9=$("<td></td>").html(array[3]);
		            	  var td10=$("<td></td>").html(array[4]);
		            	  $(tr4).append(td6,td7,td8,td9,td10);
		                  
		                }
		              $("<table id='aaa' width='50%' border='1'><table>").append(tr3,tr4).appendTo(td5);
		                 
		            });
				$("#str").html(data[0].pageStr);
		
					
				
			},
			error: function(data){
				alert("실패!!!"+data);
			}
			
		})
		}
		
		

		function listImage() {
		
			arr2 = arr.slice(start, end);
			$("#image02").attr("src","/tourapp/resources/"+arr2[0])
			$("#image03").attr("src","/tourapp/resources/"+arr2[1])
			$("#image04").attr("src","/tourapp/resources/"+arr2[2])
				
			
				}
		
		$("#image02").click(function(){
			$("#image01").attr("src",$("#image02").attr("src"));
		})
		$("#image03").click(function(){
			$("#image01").attr("src",$("#image03").attr("src"));
		})
		$("#image04").click(function(){
			$("#image01").attr("src",$("#image04").attr("src"));
		})
		
		
		$("#up").click(function(){
			
			start= start-pageSize;
			end= start+pageSize;
			
			if(start<0){
				start=arr.length-pageSize;
				end= start+pageSize;
			}
			
			listImage();
		})
		
		$("#down").click(function(){
		
			start= start+pageSize;
			end= start+pageSize;
			
			if(end>arr.length){
				start=0;
				end=start+pageSize;
			}
			listImage();
		})
		listImage();
	});
	function pro4(contentName){
		
		
		
		$("#content").attr("src","/tourapp/resources/"+contentName+".JPG");
	
		
	}
	 function fnMove(idx){
		 	
	        var position = $("#day"+idx).position();
	        $('html, body').animate({scrollTop : position.top}, 400);
	    }
	
	
	</script>
</head>
<body>
	<input type="hidden" id="city_id" value="${p.city_id }">
	<input type="hidden" id="item_key" value="${item_key }">
	
	<table width="100%">
		<tr>
			<td rowspan="5" width="60%" height="100%"><img id="image01"
				style="height: 400px; width: 630px;" src="/tourapp/resources/${i.image01 }" /></td>
			<td width="20%" height="10%" align="center" ><input type="button"  style="color:#fff;background-color:#337ab7;width: 200px;"  value="▲"
				name="up" id="up"></td>
		</tr>
		<tr>
		
			<td width="20%" height="30%"><img id="image02"
				style="height: 120px; width: 200px;" 
				onclick="pro1()" /></td>
		</tr>
		<tr>
			<td width="20%" height="30%"><img id="image03"
				style="height: 120px; width: 200px;" 
				onclick="pro1()" /></td>
		</tr>
		<tr>
			<td width="20%" height="30%"><img id="image04"
				style="height: 120px; width: 200px;" 
				onclick="pro1(this.id)" /></td>
		</tr>
		<tr>
			<td width="20%" height="10%" align="center"><input type="button" value="▼" style="color:#fff;background-color:#337ab7;width: 200px"
				name="down" id="down"></td>
		</tr>
	</table>
	<table id="tb" width="100%">
	</table>
	<table>
		<tr>
			<td colspan="2"><input type="image" style="height: 225px; width: 830px;"
				src="/tourapp/resources/예약.JPG">
			<td>
		</tr>
		<tr>
			<td width="20%"><input type="image"
				style="height: 200px; width: 250px;" src="/tourapp/resources/${i.image02 }"></td>
			<td>${p.intro_text }</td> 
		</tr>
	</table>
	
	<table width="30%">
		<tr>
		<c:forEach var="b" varStatus="s" items="${s }">
		<td><input type='button' value="${s.count }일차"  style="color:#fff;background-color:#337ab7;width: 100px"
		onclick="fnMove('${s.count}')"></td>
		
		</c:forEach>
		</tr>
		</table>
		
		
		<c:forEach var="s" items="${s }" varStatus="status">
		<div id="day${status.count }"> ★    ${status.count } 일차<br><br>${s.content }</div>
		<hr>
		</c:forEach>
		
		
		
		

	<table width="100%">
		<tr>
			<td><input type="image" name="content01"
				style="height: 55px; width: 120px;" src="/tourapp/resources/menu01.JPG"
				onclick="pro4(this.name)"></td>
			<td><input type="image" name="content02"
				style="height: 55px; width: 120px;" src="/tourapp/resources/menu02.JPG"
				onclick="pro4(this.name)"></td>
			<td><input type="image" name="content03"
				style="height: 55px; width: 120px;" src="/tourapp/resources/menu03.JPG"
				onclick="pro4(this.name)"></td>
			<td><input type="image" name="content04"
				style="height: 55px; width: 120px;" src="/tourapp/resources/menu04.JPG"
				onclick="pro4(this.name)"></td>
			<td><input type="image" name="content05"
				style="height: 55px; width: 120px;" src="/tourapp/resources/menu05.JPG"
				onclick="pro4(this.name)"></td>
			<td><input type="image" name="content06"
				style="height: 55px; width: 120px;" src="/tourapp/resources/menu06.JPG"
				onclick="pro4(this.name)"></td>
			<td><input type="image" name="content07"
				style="height: 55px; width: 120px;" src="/tourapp/resources/menu07.JPG"
				onclick="pro4(this.name)"></td>
		</tr>
		<tr>
			<td colspan="7"><input type="image" style="width: 830px"
				src="/tourapp/resources/content01.JPG" id="content"></td>
		</tr>
	</table>
	
	
<table border="1" class="table table-striped" align="center" id="tab"  style="width:100%">
<tr>
<td>글번호</td>
<td>글제목</td>
<td>작성일</td>
<td>작성자</td>
</tr>				
</table>

<center id="str">${pageStr}</center>
</body>
</html>