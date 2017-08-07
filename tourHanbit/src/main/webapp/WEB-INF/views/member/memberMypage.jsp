<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  
  function popupOpen(){

	      window.open("naver.com", "네이버", "Width=470, Height=470, left=0,top=0, scrollBars=no");
		}

  $(function(){
	  var itme_key_sub=$(".item_key_sub").val();
	  
	  var item_key_sub_start_day = itme_key_sub.substring(5);
	  	$(".item_key_sub_start_day").append(item_key_sub_start_day);
  });
  $(function(){
	  var agegroup = $(".agegroup").val();
	  adult = agegroup.substring(0,1);
	  child = agegroup.substring(2,3);
	  little_child = agegroup.substring(4,5);
	  
	  $(".adult").append("성인 :"+adult)
	  $(".child").append("아동 :"+child)
	  $(".little_child").append("유아 :"+little_child)
	  
	  
  });
  
  
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
                    <!-- <li>
                    	<a href="javascript:popupOpen();"><i class="fa fa-money"></i>결제 방법안내<span class="fa arrow"></span></a>
                    </li> -->
                    <li>
                    	<a href="memberleave.do"><i class="fa fa-user"></i>회원 탈퇴<span class="fa arrow"></span></a>
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
			<th>출발일</th>
			<th>성인/아동/유아</th>
			<th>합계</th>
			<th>주문일</th>
			<th>진행상황</th>
			<th>예약 확인/예약 취소</th>
			<th>리뷰 작성</th>
		</tr>
						
			<c:forEach var="pd" items="${Paymentdetails }">
				<tr>
						<td>${pd.orderid }</td>
						<td><a href="/tourapp/detail.do?item_key_sub=${pd.item_key_sub }">${pd.item_name }</a></td>
						<input class="item_key_sub" type="hidden" value="${pd.item_key_sub }">
						<td class="item_key_sub_start_day"></td>
						<input type="hidden" value="${pd.agegroup }" class="agegroup">
						<td class="agegroup_ss">
							<table>
								<tr>
									<td class="adult"></td>
								</tr>
								<tr>
									<td class="child"></td>
								</tr>
								<tr>
									<td class="little_child "></td>
								</tr>
							</table>
						</td>
						<td>${pd.totprice }원</td>
						
						<td><fmt:formatDate value="${pd.orderdate }" pattern="yyyy년 MM월 dd일 '<br>'hh시 mm분 ss초"/></td>
						<td><c:if test="${pd.deposit != 'yet' }">
						<font color="red">입금 완료</font>
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
				
				<td><a href="memberReview.do?reivew_item_key=${pd.item_key }">후기 작성</a></td>
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
			<th>상품 가격</th>
			
		</tr>
		<c:forEach var="re" items="${mem_recommendation }">
		<tr>
			<td><a href="/tourapp/listSubPackage.do?item_key=${re.item_key }">${re.item_name }</a></td>
			<td>${re.price }</td>
			<td></td>
		</tr>
		</c:forEach>
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