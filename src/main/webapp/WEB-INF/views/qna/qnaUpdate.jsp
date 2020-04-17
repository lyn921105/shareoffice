<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정 화면</title>
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function(){
		/* 수정 버튼 클릭 시 처리 이벤트 */
		$("#qnaUpdateBtn").click(function(){
			// 입력값 체크
			if (!chkSubmit($('#q_title'),"제목을")) {
				return;
			} else if (!chkSubmit($('#q_content'),"작성할 내용을")) {
				return;
			} else {
				$("#f_updateForm").attr({
					"method":"POST",
					"action":"/qna/qnaUpdate"
				});
				$("#f_updateForm").submit();
			}
		});
		
		/* 돌아가기 버튼 클릭 시 처리 이벤트 */
		$("#qnaDetailBtn").click(function(){
			location.href="/qna/qnaDetail?q_num=${updateData.q_num}";
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div><h3>Q&A 글수정</h3></div>

		<div>
			<form id="f_updateForm" name="f_updateForm">
				<input type="hidden" id="q_num" name="q_num" value="${updateData.q_num}" />
				<input type="hidden" name="q_file" id="q_file" value="${updateData.q_file}" />
				<input type="hidden" name="page" id="page" value="${param.page}"/>
				<input type="hidden" name="pageSize" id="pageSize" value="${param.pageSize}"/>
			
				<table class="form-group">
					<tr>
						<td>글제목</td>
						<td><input type="text" name="q_title" id="q_title" value="${updateData.q_title}" class="form-control"></td>
					</tr>
					
					<tr>
						<td>내용</td>
						<td><textarea name="q_content" id="q_content" class="form-control" rows="7">${updateData.q_content}</textarea></td>
					</tr>
					
					<tr>
						<td>파일첨부</td>
						<td><input type="file" name="file"
						id="file"></td>
					<tr>
				</table>
			</form>
		</div>
	</div>
	
	<div class="text-center">
		<input type="button" class="btn btn-primary" value="수정하기" id="qnaUpdateBtn">
		<input type="button" class="btn btn-default" value="돌아가기" id="qnaDetailBtn">
	</div>
</body>
</html>