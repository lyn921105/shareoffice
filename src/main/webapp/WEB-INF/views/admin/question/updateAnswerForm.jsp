<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 수정</title>
<!-- CSS -->
<link href="/resources/include/admin.css" rel="stylesheet">

<!-- js -->
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>

<script type="text/javascript">
	$(function() {
		$("#updateCancle").click(function() {
			history.back();
		})

		$("#update_ok").click(function() {
			$("#writeAnswerForm").attr({
				"method" : "post",
				"action" : "/adminQuestion/updateAnswer"

			})

			$("#writeAnswerForm").submit();
		})
	})
</script>

</head>
<body>
	<div id="container">

		<!-- 답변글 작성을 위한 정보 -->
		<form id="writeAnswerForm" enctype="multipart/form-data">
		<input type="hidden" name="q_num" id="q_num" value="${data.q_num }">
		<input type="hidden" name="q_file" id="q_file" value="${data.q_file }">

			<!-- 내용 작성 -->
			<table border="1" class="table table-bordered">
				<tr>
					<td colspan="4"><input type="text" name="q_title" id="q_title"
						value="${data.q_title }"></td>
				</tr>

				<tr>
					<td>첨부파일</td>
					<td colspan="3"> <input type="file" id="q_uploadFile"
						name="q_uploadFile">
						</td>
				</tr>
				<tr>
				<td>기존 첨부파일</td>
				<td>${data.q_file }</td>
				</tr>
				<tr>
					<td colspan="4"><textarea rows="10" id="q_content" name="q_content">${data.q_content }</textarea></td>
				</tr>
			</table>
		</form>
		<div class="button" align="center">
			<input type="button" id="update_ok" name="update_ok" value="저장"> <input
				type="button" id="updateCancle" name="updateCancle" value="취소">
		</div>
	</div>
</body>
</html>