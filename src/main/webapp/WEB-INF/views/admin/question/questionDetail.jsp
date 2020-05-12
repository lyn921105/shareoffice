<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 상세</title>
<!-- CSS -->
<link href="/resources/include/admin.css" rel="stylesheet">

<!-- js -->
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		$("#goList").click(function() {
			location.href = "/adminQuestion/qnaList";
		})

		//답변 작성 페이지로 이동
		$("#goAnswer").click(function() {
			var q_state = $(this).data("state");

			if (q_state == '2') {
				alert("이미 등록된 답변이 있습니다.")
			} else {
				$("#q_data").attr({
					"method" : "get",
					"action" : "/adminQuestion/writeAnswerForm"
				})

				$("#q_data").submit();
			}

		})

		$("#deleteAnswer").click(function() {
			var result = confirm("삭제 하시겠습니까?");

			if (result) {

				$("#q_data").attr({
					"method" : "post",
					"action" : "/adminQuestion/deleteAnswer"
				})

				$("#q_data").submit();
			} else {

				return;
			}
		})

		//글 수정 폼 페이지 이동
		$("#updateAnswer").click(function() {
			$("#q_data").attr({
				"method" : "post",
				"action" : "/adminQuestion/updateAnswerForm"
			})

			$("#q_data").submit();
		})

		//첨부파일 다운로드
		$("#download").click(function() {
			$("#q_data").attr("action", "/adminQuestion/fileDownload");
			$("#q_data").submit();
		})

	})
</script>

</head>
<body>

	<div class="container">

		<h2>문의 상세</h2>
		<hr>
		<!-- 답변 작성페이지 이동 및 삭제를 위한 정보 -->
		<form name="q_data" id="q_data" method="post"
			enctype="multipart/form-data">
			<input type="hidden" id="q_num" name="q_num" value="${detail.q_num }" />
			<input type="hidden" name="page" id="page" value="${param.page }" />
			<input type="hidden" name="pageSize" id="pageSize" value="10" /> <input
				type="hidden" name="q_ref" id="q_ref" value="${detail.q_ref }">
			<input type="hidden" name="q_file" id="q_file"
				value="${detail.q_file }">

		</form>

		<div id="detail">
			<table id="detailQuestion" border="1" class="table table-bordered">
				<tbody>
					<tr>
						<td colspan="4">${detail.q_title }</td>
					</tr>
					<tr>
						<td>작성자</td>
						<c:choose>
							<c:when test="${not empty detail.a_id }">
								<td>${detail.a_id }</td>
							</c:when>
							<c:otherwise>
								<td>${detail.c_id }</td>
							</c:otherwise>
						</c:choose>
						<td>등록일시</td>
						<td>${detail.q_regdate }</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<c:choose>
							<c:when test="${not empty detail.q_file }">
								<td colspan="3" id="download">${detail.q_file }</td>
							</c:when>
							<c:otherwise>
								<td colspan="3">등록된 첨부파일 없음</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td colspan="4">${detail.q_content }</td>
					</tr>
				</tbody>
			</table>

			<div id="button" align="center">
				<c:choose>
					<c:when test="${not empty detail.a_id}">
						<input type="button" name="goList" id="goList" value="목록">
						<input type="button" name="updateAnswer" id="updateAnswer"
							value="수정">
						<input type="button" name="deleteAnswer" id="deleteAnswer"
							value="삭제">
					</c:when>
					<c:otherwise>
						<input type="button" name="goList" id="goList" value="목록">
						<input type="button" name="goAnswer" id="goAnswer" value="답변"
							data-state="${detail.q_state }">
					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</div>
</body>
</html>