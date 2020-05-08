<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 글 작성</title>
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function(){
		/* 저장 버튼 클릭 시 처리 이벤트 */
		$("#qnaInsertBtn").click(function(){
			// 입력값 체크
			if (!chkSubmit($('#q_title'),"제목을")) {
				return;
			} else if (!chkSubmit($('#q_content'),"작성할 내용을")) {
				return;
			} else {
				alert("문의가 완료되었습니다.");
				$("#f_writeForm").attr({
					"method":"POST",
					"action":"/qna/qnaWrite"
				});
				$("#f_writeForm").submit();
			}
		});
		
		/* 돌아가기 버튼 클릭 시 처리 이벤트 */
		$("#qnaListBtn").click(function(){
			if (confirm("Q&A 목록으로 돌아갑니까?")) {
				location.href="/qna/qnaList";
			}
		});
	});
</script>
</head>
<body>
	<!-- 비로그인시 처리 -->
	<script type="text/javascript">
		<c:if test="${empty loginSuccess}">
			alert("로그인이 필요합니다");
			location.href="/login/login";
		</c:if>
	</script>

	<div>
		<div><h3>Q&A 글작성</h3></div>
		
		<div>
			<form class="form-horizontal" id="f_writeForm" name="f_writeForm" enctype="multipart/form-data">
				<table class="form-group">
					<tr>
						<td>글제목</td>
						<td><input type="text" name="q_title" id="q_title" class="form-control"></td>
					</tr>
					
					<tr>
						<td>내용</td>
						<td><textarea name="q_content" id="q_content" class="form-control" rows="7"></textarea></td>
					</tr>
					
					<tr>
						<td>파일첨부</td>
						<td><input type="file" name="q_uploadFile"
						id="q_uploadFile"></td>
					<tr>
				</table>
			</form>
		</div>
	</div>
	
	<div>
		<input type="button" class="btn btn-primary" value="문의하기" id="qnaInsertBtn">
		<input type="button" class="btn btn-default" value="돌아가기" id="qnaListBtn">
	</div>
</body>
</html>