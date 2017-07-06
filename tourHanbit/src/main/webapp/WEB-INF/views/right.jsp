<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

function reserve()
{
	
	var price = document.getElementById("price").value;
  var itemkey = document.getElementById("itemkey").value;
  var ddate = document.getElementById("ddate").value;
  var adate = document.getElementById("adate").value;
  var city = document.getElementById("city").value;
  var orderssu = eval(document.getElementById("orderssu").value);
  var itemname = document.getElementById("itemname").value;
  var reser=  eval(document.getElementById("reser").value); 
  
   var r = window.open('','','width=300,height=400');
   
   if((reser+orderssu)>20){
	   r.document.write("<h2>예약 가능</h2><h1>인원 수 초과</h1>");
   }else{
	   
   r.document.write("<table><tr><td>상품가격 </td> ");
   r.document.write('<td>'+price+'</td></tr>');
   r.document.write("<tr><td>상품번호 </td>");
   r.document.write('<td>'+itemkey+'</td></tr>');
   r.document.write("<tr><td>출발일 </td>");
   r.document.write('<td>'+ddate+'</td></tr>');
   r.document.write("<tr><td>도착일   </td>");
   r.document.write('<td>'+adate+'</td></tr>');
   r.document.write("<tr><td>방문도시 </td>");
   r.document.write('<td>'+city+'</td></tr>');
   r.document.write("<tr><td>예약인원 </td>");
   r.document.write('<td>'+orderssu+'</td></tr>');
   r.document.write("<tr><td>상품명   </td>");
   r.document.write('<td>'+itemname+'</td></tr>');
   r.document.write("<tr><td>항공사   </td> <td>대한항공"+'</td></tr></table>');
   r.document.write("<center><h2>예약 완료</h2></center>");
   }
   
   window.location.reload(true);
   
   
}

</script>
<title>Insert title here</title>
</head>
<body>

<form action="orders.do" method="post">
<input type="hidden" id="price" value="${p.price}">
<input type="hidden" id="itemkey" value="${p.item_key}">
<input type="hidden" id="ddate" value="${p.d_date }">
<input type="hidden" id="adate" value="${p.a_date }">
<input type="hidden" id="city" value="${p.city }">

<input type="hidden" id="itemname" value="${p.item_name}">


<table border="1" width="100%" height="100%">
   
   <tr>
      <td>상품가격 : ${p.price}</td>
   </tr>
   <tr>
      <td>상품번호 : ${p.item_key}</td>
      <td><input type="hidden" name="item_key" value="${p.item_key}"> </td>
   </tr>
   <tr>
      <td>출발일 : ${p.d_date}</td>
   </tr>
   <tr>
      <td>도착일 : ${p.a_date}</td>
   </tr>
   <tr>
      <td>
         항공 :
         <select>
            <option value="대한항공">대한항공</option>
         </select>
      </td>
   </tr>
   <tr>
      <td>방문도시 : ${p.city}</td>
   </tr>
   <tr>
      <td>현재 예약 인원 : ${p.reser}</td>
      <td><input type="hidden" id="reser" value="${p.reser}"> </td>
   </tr>
   <tr>
      <td>예약 희망 인원
      
         <select name="orders_su" id="orderssu">
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
            <option>5</option>
         </select>
      </td>
   </tr>
   <tr>
      <td>상품명 : ${p.item_name}</td>
   </tr>
   <tr>
   		<c:if test="${p.reser==20 }">
   		<td align="center"><label><font color="red"><b>마감</b></font>성원에 감사합니다.</label> </td>
   		</c:if>
   		<c:if test="${p.reser!=20 }">
   		<c:if test="${r==1 }">
      <td align="center"><input type="submit" value="예약" onclick="reserve()" style="background-color:#337ab7; "></td>
      </c:if>
      </c:if>
   </tr>
   
</table>
</form>
</body>
</html>