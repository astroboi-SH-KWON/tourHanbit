<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">


$(function(){
	 adult_su=0;
	 child_su=0;
	 baby_su=0;
	 price = eval($("#price").val());

	 
	 $("#adult_su").change(function(){
	   adult_su=eval($(this).val());
	   totprice();
	})
	$("#child_su").change(function(){
	   child_su=eval($(this).val());
	   totprice();
	})
	$("#baby_su").change(function(){
	   baby_su=eval($(this).val());
	   
	   totprice();
	}) 
	
})
function totprice(){
	   $("#tr").empty();
	   tot_su = adult_su+(child_su*0.8)+(baby_su*0.4);
	   tot_su2 = adult_su+child_su+baby_su;
	   tot_p=tot_su*price;
	   
	   var td1=$("<td></td>").html("<h4>총가격</h4>");
	   var td2=$("<td></td>").html(tot_p+"원");
	   var hidden=$("<input type='hidden' name='totPrice' value="+tot_p+">");
	   $("#tr").append(td1,td2,hidden);
}

function pro(){
	
	 var item_key_sub = $("#item_key_sub").val();
 	  var d_date = $("#d_date").text();
	  var price_sub = $("#price_sub").text();
	  var a_date = $("#a_date").text();
	  var item_name = $("#item_name").text();
	  var city = $("#city").text();
	  var airplane = $("#airplane").text();
	  var orders_su = eval($("#orders_su").val());
	  var reser_sub=  eval($("#reser_sub").val()); 
	  var mem_name=  $("#mem_name").val(); 
	 
	if(confirm("예약하시겠습니까??")==true){
		
		if((reser_sub+tot_su2)>20){
			var l = window.open('','reservation','width=270,height=170,top=200,left=600,location=0');
		 	  
			 l.document.write("<h2>예약 가능 인원 수 초과</h2>");
		   }
		 	else{	
		       var r = window.open('','reservation','width=350,height=350,top=200,left=600,location=0');
		       
		 	   r.document.write("<table><tr><td style='background-color:#337ab7;'>상품총가격 </td>");
		 	   r.document.write('<td>'+tot_p+'</td></tr>');
		 	  r.document.write("<tr><td style='background-color:#337ab7;'>예약자 성함 </td>");
		 	   r.document.write('<td>'+mem_name+'</td></tr>');
		 	   r.document.write("<tr><td style='background-color:#337ab7;'>상품번호 </td>");
		 	   r.document.write('<td>'+item_key_sub+'</td></tr>');
		 	   r.document.write("<tr><td style='background-color:#337ab7;'>출발일 </td>");
		 	   r.document.write('<td>'+d_date+'</td></tr>');
		 	   r.document.write("<tr><td style='background-color:#337ab7;'>도착일   </td>");
		 	   r.document.write('<td>'+a_date+'</td></tr>');
		 	   r.document.write("<tr><td style='background-color:#337ab7;'>방문도시 </td>");
		 	   r.document.write('<td>'+city+'</td></tr>');
		 	   r.document.write("<tr><td style='background-color:#337ab7;'>예약인원 </td>");
		 	   r.document.write('<td>성인 : '+adult_su+'/아동: '+child_su+'/유아: '+baby_su+'<br>총인원 : '+tot_su2+'</td></tr>');
		 	   r.document.write("<tr><td style='background-color:#337ab7;'>상품명   </td>");
		 	   r.document.write('<td>'+item_name+'</td></tr>');
		 	   r.document.write("<tr><td style='background-color:#337ab7;'>항공사   </td>");
		 	   r.document.write("<td>"+airplane+"</td></tr>");
		 	   r.document.write("<tr><td colspan='2'><center><h2>예약 완료</h2></center></td></table>");
		 	  $("#f").submit();
		 	   } 
		
	}   
	
	
}


</script>
<title>Insert title here</title>
</head>
<body>

<form action="insertOrder.do" method="post" id="f">
<input type="hidden" id="item_key" name="item_key" value="${p.item_key}">
<input type="hidden" id="item_key_sub" name="item_key_sub" value="${sp.item_key_sub}">
<input type="hidden" id="reser_sub" value="${sp.reser_sub}">
<input type="hidden" id="price" value="${sp.price_sub}">
<input type="hidden" id="mem_name" name="mem_name" value="${name }">
<input type="hidden" id="mem_id" name="mem_id" value="${id }">


<table width="100%" height="100%">
   
   <tr>
      <td align="center" colspan="2" style="background-color:#337ab7;color: lightgray">상품가격(성인1인기준)</td>
   <tr>
  	 <td align="center" colspan="2" style="background-color:#337ab7;color: white" id="price_sub"><h2>${sp.price_sub}원</h2></td>
   </tr>
   </table>
   <table>
   <tr>
   <td><center><b>아동</b><font color="gray">(만12세 미만)</font></center></td><td><b>유아</b><font color="gray">(만 2세 미만)</font></td>
   </tr>
   <tr>
   <td><center>${child_p }</center></td><td><center>${baby_p }</center></td>
   </tr>
   </table>
   <table>
   <tr>
      <td width="30%">상품번호 </td><td id="item_key_sub">  [${sp.item_key_sub}]</td>
   </tr>
   <tr>
      <td>상품명 </td><td id="item_name">  ${p.item_name}</td>
   </tr>
   <tr>
      <td>출발일 </td><td id="d_date">  ${sp.d_date}</td>
   </tr>
   <tr>
      <td>도착일 </td><td id="a_date">  ${sp.a_date}</td>
   </tr>
   <tr>
      <td>
         항공 </td><td id="airplane">  ${sp.airplane }
      </td>
   </tr>
   <tr>
      <td>방문도시 </td><td id="city">${p.city}</td>
   </tr>
   <tr>
      <td>남은 좌석 </td><td>  ${seats} (최대인원: 20명)</td>
   </tr>
   <tr>
      <td colspan="2"><center>예약 인원</center></td>
      
   </tr>
   <tr><td>성인</td>
   <td> 
      
         <select name="adult_su" id="adult_su" style="color: white" >
            <option selected="selected">0</option>
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
            <option>5</option>
         </select>
      </td>
   </tr>
   <tr><td>아동</td>
   <td> 
      
         <select name="child_su" id="child_su" style="color: white" >
            <option selected="selected">0</option>
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
            <option>5</option>
         </select>
      </td>
   </tr>
   <tr><td>유아</td>
   <td> 
      
         <select name="baby_su" id="baby_su" style="color: white" >
            <option selected="selected">0</option>
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
            <option>5</option>
         </select>
      </td>
   </tr>
   <tr id="tr"></tr>
   
   <tr>
   		<c:if test="${sp.reser_sub==20 }">
   		<td align="center" colspan="2"><label><font color="red"><b>마감</b></font>성원에 감사합니다.</label> </td>
   		</c:if>
   		<c:if test="${sp.reser_sub!=20 }">
   		<c:if test="${id!=null }"> 
      <td colspan="2" align="center"><input type="button" value="예약" onclick="pro()" style="background-color:#337ab7; "></td>
       </c:if> 
      </c:if>
   </tr>
   
   
</table>
</form>
</body>
</html>