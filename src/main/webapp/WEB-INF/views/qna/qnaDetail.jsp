<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글상세 보기</title>
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	var butChk = 0; // 수정버튼과 삭제버튼을 구별하기 위한 변수
	$(function(){
		$("#idChk").hide();
		
		/* 목록 버튼 클릭 시 처리 이벤트 */
		$("#qnaListBtn").click(function(){
			location.href="/qna/qnaList";
		});
		
		/* 수정 버튼 클릭 시 처리 이벤트 */
		$("#qnaUpdateBtn").click(function(){
			$("#q_data").attr("action", "/qna/qnaUpdateForm");
			$("#q_data").submit();
		});
		
		/* 삭제 버튼 클릭 시 처리 이벤트 */
		$("#qnaDeleteBtn").click(function(){
			//confirm하면 if문으로 result값 비교
			var result = confirm("문의하신 내용을 삭제하시겠습니까? 삭제한 글은 복구할 수 없습니다.");
			if (result) {
				location.href="/qna/qnaDelete?q_num=${detail.q_num}";
			} else {
				location.href="/qna/qnaDetail?q_num=${detail.q_num}";
			}
		});
		
	});
</script>
</head>
<body>
	<div class="container">
		<div><h3>Q&A 문의글</h3></div>
		<form name="q_data" id="q_data" method="POST">
			<input type="hidden" name="q_num" value="${detail.q_num}"/>
			<input type="hidden" name="page" id="page" value="${param.page}"/>
			<input type="hidden" name="pageSize" id="pageSize" value="${param.pageSize}"/>
			<input type="hidden" name="q_file" id="q_file" value="${detail.q_file}" />
		</form>
		
		<div class="pull-right">
			<input type="button" class="btn btn-default" value="수정" id="qnaUpdateBtn">
			<input type="button" class="btn btn-default" value="삭제" id="qnaDeleteBtn">
		</div>
		
		<!-- 상세 정보 시작 -->
		<div class="container">
			<table>
				<tbody class="form-group">
					<tr>
						<td>글제목</td>
						<td class="form-control">${detail.q_title }</td>
					</tr>
					
					<tr>
						<td>내용</td>
						<td class="form-control">${detail.q_content}</td>
					</tr>
					
					<c:if test="${detail.q_file != '' }">
					<tr>
						<td>첨부파일</td>
						<td colspan="3">
						<img id="fileImage"></td>
					</tr>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
	
	<div>
		<input type="button" class="btn btn-default pull-right" value="목록" id="qnaListBtn">
	</div>
</body>
</html>