<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.a {
	text-decoration: none;
}
#detailB
{
text-align: center;
}
#reply
{
text-align: center;
}
#replytable
{
text-align: center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">
	function listReply() {
		var idd = $("#artice_id").text();
	
		$("#reply").empty();
		$.getJSON("/tourapp/listReply.do", function(data) {

			var table = $("<table></table>").attr("boder", "1").attr("width",
					"60%").attr("align","center");

			$.each(data, function(index, item) {

				var mem_id = $("<td></td>").text(item.mem_id).attr("width","37%");
				var mem_id2 = item.mem_id;
				var rcontent = $("<td></td>").text(item.rcontent).attr("width","63%");
				
				var tr = $("<tr></tr>");
				$(tr).append(mem_id, rcontent).appendTo(table);
				 if(idd == mem_id2)
					{
				var btn = $("<button>삭제</button>").val(item.rno).attr(
						"onclick", "deleteReply(" + item.rno + ")").attr("size","20px").attr("class","btn btn-info");
				var btntd = $("<td></td>").append(btn);
				$(tr).append(btntd).appendTo(table);
					}
				
				
				/* var tr = $("<tr></tr>").append(mem_id, rcontent, rdate, btntd)
						.appendTo(table); */

			});
			$("#reply").append(table);
		});
	}

	function deleteReply(rno) {
		$.ajax({
			url : "/tourapp/deleteReply.do",
			type : "post",
			data : {
				"rno" : rno
			},
			success : function() {
				listReply();
			},
			error : function() {
				listReply();
			}
		})

	}

	
	
	$(function() {

	$(".textareaerror").click(function(){
		alert("로그인시 이용가능합니다.");
		
	});


		
	
		listReply();
		$("#insertReply").click(function() {
			var mem_id = $("#artice_id").text();
			var qna_number = $("#qna_number").val();

			var rcontent = $("#rcontent").val();

			if (rcontent == "") {
				alert("내용을 입력하세요");
			} else {
				$.ajax({
					url : "/tourapp/insertReply.do",
					type : "post",
					data : {
						"qna_number" : qna_number,
						"mem_id" : mem_id,
						"rcontent" : rcontent
					},
					success : function() {
						$("#rcontent").val("");
						listReply();
					},
					error : function(data) {
						$("#rcontent").val("");
						listReply();
					}
				})
			}
		})
	});
</script>

</head>
<body>
	<h2 align="center">게시물 상세</h2>
	<hr>
	<div id="detailB">
	
		<table class="table" align="center" style="width:50%">
	<tr>
	<td width="40%">제목</td>
	<td width="60%">${q.qna_title }</td>
	</tr>
	<tr>
	<td width="40%">작성자</td>
	<td width="60%">${q.mem_id }</td>
	</tr>
	<tr>
	<td width="40%">등록일</td>
	<td width="60%">${q.qna_date }</td>
	</tr>
	<tr>
	<td width="40%">내용</td>
	<td width="60%"><textarea rows="10" cols="60" readonly="readonly">${q.qna_content }</textarea></td>
	</tr>
	<tr>
	<td width="40%">첨부파일</td>
	<c:if test="${not empty q.qna_fname }">
		<td width="60%"><img src="/tourapp/resources/upload/${q.qna_fname }"  width="425px" height="200px"></td>
	</c:if>
	</tr>
	</table>
	
	
		<c:if test="${sessionScope.mem_id == q.mem_id}">
			
	<span style="padding-right: 370px; float: right;">
	<button onclick="location.href='updateQna.do?qna_number=${q.qna_number}'" class="btn btn-info">수정</button>
	</span>
	<span style="padding-right: 0px; float: right">
	<button onclick="location.href='deleteQna.do?qna_number=${q.qna_number}'" class="btn btn-info">삭제</button>
	</span>
	<br>
	
		</c:if>
		<input type="hidden" name="qna_number" id="qna_number"
			value="${q.qna_number }"> <input type="hidden" name="mem_id"
			id="mem_id" value="${q.mem_id }">

		<div style="padding-left: 250px; padding-top: 20px">
		<table align="center" style="width: 72%; margin-left: 50px" class="table">
			<tr>
				<td width="30%">작성자<br><label id="artice_id">${mem_id }</label></td>
				<c:if test="${mem_id == null}">
				<td  width="50%">
				<textarea cols="50" rows="2" name="rcontent" id="rcontent"
						maxlength="6000"
						style="overflow: hidden; line-height: 14px; height: 39px;"
						title="댓글입력"  class="textareaerror"></textarea>
				
				</td>
				</c:if>
				
				<c:if test="${mem_id != null}">
				<td  width="60%">
				<textarea cols="50" rows="2" name="rcontent" id="rcontent"
						maxlength="6000"
						style="overflow: hidden; line-height: 14px; height: 39px;"
						title="댓글입력"></textarea>
				</td>
				</c:if>
				<td  width="10%">
				<c:if test="${mem_id != null}">
				<input type="button" value="등록" id="insertReply" class="btn btn-info">
				</c:if>
				</td>
			</tr>
		</table>
		<!-- /////////////////////////////////////////////////////////// -->
	<br>
		</div>
		<table align="center" style="width: 60%; " class="table table-striped">
		<tr>
		<td width="37%" align="center">작성자</td>
		<td width="63%" align="center">내용</td>
		</tr>
		</table>
		<div id="reply"> <!-- list출력 div -->
		</div>
		<div style="padding-top:10px;padding-left: 0px">
	<button onclick="location.href='listQna.do'" class="btn btn-info">목록</button>
	</div>
	</div>
	
</body>
</html>