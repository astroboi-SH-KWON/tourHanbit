<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<table width="100%" border="1">
		<tr><td colspan="2"> <jsp:include page="top.jsp"/></td></tr>
		<tr>
		
			<td width="80%">  <jsp:include page="${viewPage }"/></td>
			<c:if test="${!empty(item_key)}">
			<td width="100%" height="80%" valign="top"><jsp:include page="right.jsp"></jsp:include></td></tr>
			</c:if>
		<tr><td colspan="2"><jsp:include page="bottom.jsp"/></td></tr>
	
	</table>
	
	

</body>
</html>