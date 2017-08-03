<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  
  function popupOpen(){


	  var popUrl = "paymentoption.do";	
	  var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
		window.open(popUrl,"",popOption);

		}

  </script>
  <style type="text/css">
  	
  	#myupdate
  	{
  		float: right;
  	}
  	.table table-hover
  	{
  		border-bottom-color: blue;
  	}
  	#my_page_reservation
  	{
	  	margin-top: 150px;
	  	margin-left: 150px;
  	}
  	#my_page_Recommended_goods
  	{
  		margin-left: 150px;
  	}
  	#my_page_QNA
  	{
  		margin-left: 150px;
  	}
  	#right_mypage
  	{
	  	margin-top: 150px;
	  	margin-left: 0px;
  	}
  	
  </style>
<title>Insert title here</title>
 <!-- Bootstrap Core CSS -->
    <link href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/dist/css/sb-admin-2.css" rel="stylesheet">
    <!-- Morris Charts CSS -->
    <link href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/morrisjs/morris.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>


<div class="navbar-default sidebar" role="navigation" id="right_mypage">
	<div class="sidebar-nav navbar-collapse">
    	<ul class="nav" id="side-menu">
        	<li>
            	<ul class="nav nav-second-level">
                	<li>
                    	<a href="memberupdate.do"><i class="fa fa-user"></i>회원정보 수정<span class="fa arrow"></span></a>
                    </li>
                    <li>
                    	<a href="javascript:popupOpen();"><i class="fa fa-money"></i>결제 방법안내<span class="fa arrow"></span></a>
                    </li>
                    <li>
                    	<a href="memberupdate.do"><i class="fa fa-bank"></i>계좌번호 안내<span class="fa arrow"></span></a>
                    </li>
                    <li>
                    	<a href="javascript:popupOpen();"><i class="fa fa-star"></i>우수 여행 상품<span class="fa arrow"></span></a>
                    </li>
                	<li>
                    	<a href="airplanorders.do"><i class="fa fa-star"></i>대륙별 여행지<span class="fa arrow"></span></a>
                    </li>
				</ul>
			</li>
		</ul>
	</div>
</div>
                            

<div class="container">
	<table id="my_page_reservation" class="table table-hover">
		<tr>
			<td><h3>${title }</h3></td>
		</tr>
		<tr>
			<th>주문 번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>주문일</th>
			<th>진행상황</th>
			<th>예약 확인/예약 취소</th>
		</tr>
			<c:forEach var="pd" items="${Paymentdetails }">
				<tr>
						<td>${pd.orderid }</td>
						<td>${pd.item_name }</td>
						<td>${pd.price }</td>
						<td>${pd.orderdate }</td>
						<td><c:if test="${pd.deposit != 'yet' }">
						입금 완료
						</c:if>
						<c:if test="${pd.deposit == 'yet' }">
						입금 전
						</c:if>
						</td>
						
						
				<td><c:if test="${pd.deposit != 'yet' }">
				<font color="red">결제 완료</font>
				</c:if>
				<c:if test="${pd.deposit == 'yet' }">
				<center><a href="memberMypagedelete.do?orderid=${pd.orderid }">취소</a></center>
				</c:if></td>
				</tr>
			</c:forEach>
	</table>
	
<hr>

<br>

	<table id="my_page_Recommended_goods" class="table table-hover">
		<tr>
			<td><h3>추천 상품</h3></td>
		</tr>
		<tr>
			<th>상품 명</th>
			<th>출발일/도착일</th>
			<th>상품 가격</th>
		</tr>
	</table>
	
<hr>

<br>

	<table id="my_page_QNA" class="table table-hover">
		<tr>
			<td><h3>${myqnaa }</h3></td>
		</tr>
	<tr>
		<!-- <th>번호</th> -->
		<th>제목</th>
		<th>작성자</th>
		<th>등록일</th>
	</tr>
		<c:forEach var="q" items="${myqna }">
			<tr>
				<td>${q.qna_number }</td>
				<td>${q.qna_title }</td>
				<td>${q.mem_id }</td>
				<td>${q.qna_date }</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>