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
						"onclick", "deleteReply(" + item.rno + ")").attr("size","20px");
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
	
		제목 : ${q.qna_title}<br>
		작성자: ${q.mem_id}<br>
		등록일 : ${q.qna_date}<br>
		내용  <br>
		<textarea rows="10" cols="60" readonly="readonly">${q.qna_content }</textarea>
		<br> 첨부파일 : ${q.qna_fname }(${q.qna_fsize }) <br>
		<c:if test="${sessionScope.mem_id == q.mem_id}">
		<button onclick="location.href='updateQna.do?qna_number=${q.qna_number}'">수정</button>
		<button onclick="location.href='deleteQna.do?qna_number=${q.qna_number}'">삭제</button>
		
		</c:if>
		<input type="hidden" name="qna_number" id="qna_number"
			value="${q.qna_number }"> <input type="hidden" name="mem_id"
			id="mem_id" value="${q.mem_id }">


		<table align="center" style="width: 30px">
			<tr>
				<td>작성자<br><label id="artice_id">${mem_id }</label></td>
				<c:if test="${mem_id == null}">
				<td>
				<textarea cols="50" rows="2" name="rcontent" id="rcontent"
						maxlength="6000"
						style="overflow: hidden; line-height: 14px; height: 39px;"
						title="댓글입력"  class="textareaerror"></textarea>
				
				</td>
				</c:if>
				
				<c:if test="${mem_id != null}">
				<td>
				<textarea cols="50" rows="2" name="rcontent" id="rcontent"
						maxlength="6000"
						style="overflow: hidden; line-height: 14px; height: 39px;"
						title="댓글입력"></textarea>
				</td>
				</c:if>
				<td>
				<c:if test="${mem_id != null}">
				<input type="button" value="등록" id="insertReply">
				</c:if>
				</td>
			</tr>
		</table>
		<table align="center" style="width: 60%" border="1">
		<tr>
		<td width="37%" align="center">작성자</td>
		<td width="63%" align="center">내용</td>
		</tr>
		</table>
		<div id="reply"> <!-- list출력 div -->
		</div>
		
	</div>
	<button onclick="location.href='listQna.do'">글목록</button>
</body>
</html>