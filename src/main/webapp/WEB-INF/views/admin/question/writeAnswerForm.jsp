<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 작성</title>
<!-- CSS -->
<link href="/resources/include/admin.css" rel="stylesheet">

<!-- js -->
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		$("#cancleInsert").click(function() {
			history.back();
		})

		$("#insertAnswer").click(function() {
			var q_state = $(this).data("state");

			if (q_state == '2') {
				alert("이미 등록된 답변이 있습니다.")
			} else {
				//입력 값 체크
				if (!chkData("#q_content", "답변 내용을")) {
					return;
				} else {
					$("#writeAnswerForm").attr({
						"method" : "POST",
						"action" : "/adminQuestion/insertAnswer"
					})

					$("#writeAnswerForm").submit();
				}
			}

		})
	})
</script>
</head>
<body>
	<div id="container">

		<!-- 답변글 작성을 위한 정보 -->
		<form id="writeAnswerForm" name="writeAnswerForm"
			enctype="multipart/form-data">
			<input type="hidden" name="a_id" id="a_id"
				value="${adminAccount.a_id }"> <input type="hidden"
				name="c_id" id="c_id" value="${data.c_id }"> <input
				type="hidden" name="q_ref" id="q_ref" value="${data.q_ref }">
			<input type="hidden" name="q_step" id="q_step"
				value="${data.q_step }"> <input type="hidden" name="q_num"
				id="q_num" value="${data.q_num }">

			<!-- 내용 작성 -->
			<table border="1" class="table table-bordered">
				<tr>
					<td colspan="4"><input type="text" name="q_title" id="q_title"
						value="[re] ${data.q_title }"></td>
				</tr>

				<tr>
					<td>첨부파일</td>
					<td colspan="3"><input type="file" id="q_uploadFile"
						name="q_uploadFile"></td>
				</tr>
				<tr>
					<td colspan="4"><textarea rows="10" id="q_content"
							name="q_content"></textarea></td>
				</tr>
			</table>
		</form>
		<div class="button" align="center">
			<input type="button" id="insertAnswer" name="insertAnswer" value="등록"
				data-state="${detail.q_state }"> <input type="button"
				id="cancleInsert" name="cancleInsert" value="취소">
		</div>
	</div>
</body>
</html>