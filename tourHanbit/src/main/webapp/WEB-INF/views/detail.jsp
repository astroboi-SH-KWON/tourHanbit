<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var pageSize = 3;
		var start = 0;
		var end = start + pageSize;
		var arr2;
		var arr = [ "${i.image03 }", "${i.image04 }", "${i.image05 }",
				"${i.image06 }", "${i.image07 }", "${i.image08 }",
				"${i.image09 }", "${i.image10 }", "${i.image11 }", ]
		function listImage() {
			
			arr2 = arr.slice(start, end);
			$("#image02").attr("src","resources/"+arr2[0])
			$("#image03").attr("src","resources/"+arr2[1])
			$("#image04").attr("src","resources/"+arr2[2])
				
			
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

	</script>
</head>
<body>
	<table width="100%">
		<tr>
			<td rowspan="5" width="60%" height="100%"><img id="image01"
				style="height: 400px; width: 630px;" src="resources/${i.image01 }" /></td>
			<td width="20%" height="10%"><input type="button" value="▲"
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
			<td width="20%" height="10%"><input type="button" value="▼"
				name="down" id="down"></td>
		</tr>
	</table>
	<table>
		<tr>
			<td colspan="2"><input type="image" style="height: 225px; width: 830px;"
				src="resources/예약.JPG">
			<td>
		</tr>
		<tr>
			<td width="20%"><input type="image"
				style="height: 200px; width: 250px;" src="resources/${i.image02 }"></td>
			<td>${p.intro_text }</td> 
		</tr>
	</table>
	<%-- <table>
	<tr>${str }
	</tr>
	</table> 
	<hr>
	<table width="80%">
		<tr>
			 <td>${content }</td> 
		</tr>
		<hr>
	</table> --%>
	<table width="100%">
		<tr>
			<td><input type="image" name="content01"
				style="height: 55px; width: 120px;" src="resources/menu01.JPG"
				onclick="pro4(this.name)"></td>
			<td><input type="image" name="content02"
				style="height: 55px; width: 120px;" src="resources/menu02.JPG"
				onclick="pro4(this.name)"></td>
			<td><input type="image" name="content03"
				style="height: 55px; width: 120px;" src="resources/menu03.JPG"
				onclick="pro4(this.name)"></td>
			<td><input type="image" name="content04"
				style="height: 55px; width: 120px;" src="resources/menu04.JPG"
				onclick="pro4(this.name)"></td>
			<td><input type="image" name="content05"
				style="height: 55px; width: 120px;" src="resources/menu05.JPG"
				onclick="pro4(this.name)"></td>
			<td><input type="image" name="content06"
				style="height: 55px; width: 120px;" src="resources/menu06.JPG"
				onclick="pro4(this.name)"></td>
			<td><input type="image" name="content07"
				style="height: 55px; width: 120px;" src="resources/menu07.JPG"
				onclick="pro4(this.name)"></td>
		</tr>
		<tr>
			<td colspan="7"><input type="image" style="width: 830px"
				src="resources/content01.JPG" id="content"></td>
		</tr>
	</table>

</body>
</html>