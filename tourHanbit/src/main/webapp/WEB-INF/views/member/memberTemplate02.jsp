<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
     #right{ position:fixed; _position:absolute; left:1100px; top:250px; background-color: white; }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<table width="100%" border="1">
		<tr><td colspan="4"> <jsp:include page="memberTop.jsp"/></td></tr>
		<tr>
			<td width="15%"></td>
			<td width="54%"> <jsp:include page="${viewPage }"/></td>
			<c:if test="${!empty(item_key)}">
			<td width="15%" id="right" valign="top"><jsp:include page="memberRight.jsp"/></td>
			
			</c:if>
		</tr>
		<tr><td colspan="4"><jsp:include page="memberBottom.jsp"/></td></tr>
	
	</table>
	
	

</body>
</html>