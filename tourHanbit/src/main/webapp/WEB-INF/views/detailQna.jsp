<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.a {
	text-decoration: none;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	function listReply() {
		$("#reply").empty();
		$.getJSON("/test2/listReply.do", function(data) {

			var table = $("<table></table>").attr("boder", "1").attr("width",
					"80%");

			$.each(data, function(index, item) {

				var mem_id = $("<td></td>").text(item.mem_id);
				var rcontent = $("<td></td>").text(item.rcontent);
				var rdate = $("<td></td>").text(item.rdate);
				var btn = $("<button>삭제</button>").val(item.rno).attr(
						"onclick", "deleteReply(" + item.rno + ")");
				var btn2 = $("<button>수정</button>").val(item.rno).attr(
						"onclick", "deleteReply(" + item.rno + ")");
				var btntd = $("<td></td>").append(btn);
				var tr = $("<tr></tr>").append(mem_id, rcontent, rdate, btntd)
						.appendTo(table);

			});
			$("#reply").append(table);
		});
	}

	function deleteReply(rno) {
		$.ajax({
			url : "/test2/deleteReply.do",
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

		listReply();
		$("#insertReply").click(function() {
			var qna_number = $("#qna_number").val();
			var mem_id = $("#mem_id").val();
			var rcontent = $("#rcontent").val();

			if (rcontent == "") {
				alert("내용을 입력하세요");
			} else {
				$.ajax({
					url : "/test2/insertReply.do",
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
	<h2>게시물 상세</h2>
	<hr>
	<div>
		제목 : ${q.qna_title}<br> 작성자: ${q.mem_id} 등록일 : ${q.qna_date}<br>
		내용 : <br>
		<textarea rows="10" cols="60" readonly="readonly">${q.qna_content }</textarea>
		<br> 첨부파일 : ${q.qna_fname }(${q.qna_fsize }) <a
			href="updateQna.do?qna_number=${q.qna_number}">수정</a> <a
			href="deleteQna.do?qna_number=${q.qna_number}">삭제</a> <input
			type="hidden" name="qna_number" id="qna_number"
			value="${q.qna_number }"> <input type="hidden" name="mem_id"
			id="mem_id" value="${q.mem_id }">


		<table width="80%">
			<tr>
				<td>작성자<br>${q.mem_id }</td>
				<td><textarea cols="50" rows="2" name="rcontent" id="rcontent"
						maxlength="6000"
						style="overflow: hidden; line-height: 14px; height: 39px;"
						title="댓글입력"></textarea></td>
				<td><input type="button" value="등록" id="insertReply"></td>
			</tr>
		</table>
		<div id="reply"> <!-- list출력 div -->
		</div>
	</div>
	<h4>
		<a href="listQna.do">돌아가기</a>
	</h4>
</body>
</html>