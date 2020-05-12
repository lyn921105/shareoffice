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
		
		/* 첨부파일 다운로드 */
		$("#download").click(function(){
			$("#q_data").attr("action", "/qna/qnaDownload");
			$("#q_data").submit();
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
	
	<div class="container">
		<div><h3>Q&A 문의글</h3></div>
		<form name="q_data" id="q_data" method="POST">
			<input type="hidden" name="q_num" value="${detail.q_num}"/>
			<input type="hidden" name="page" id="page" value="${param.page}"/>
			<input type="hidden" name="pageSize" id="pageSize" value="${param.pageSize}"/>
		</form>
		
		<!-- 상세 정보 시작 -->
		<div class="container" style="border: solid black 1px; min-height: 500px; margin-bottom: 8px;">
			<div style="margin: 0 auto;">
				<div class="form-group" style="margin: 8px;">
					<span class="form-static">${detail.q_title}</span>
					<span class="form-static pull-right">${detail.q_regdate}</span>
	 			</div>
				<div class="form-group" style="border-top: dotted black 1px;">
					<span class="form-static">${loginSuccess}</span>
					<a id="download" class="pull-right">${detail.q_file}</a>
				</div>
				<div class="form-group" style="margin-top: 8px;">
					<span class="form-static">${detail.q_content}</span>
				</div>
			</div>
		</div>
	</div>
	
	<div class="text-right">
		<c:choose>
			<c:when test="${detail.a_id eq admin}">
				<input type="button" class="btn btn-default" value="수정" id="qnaUpdateBtn">
				<input type="button" class="btn btn-default" value="삭제" id="qnaDeleteBtn">
				<input type="button" class="btn btn-default" value="목록" id="qnaListBtn">
			</c:when>
			<c:otherwise>
				<input type="button" class="btn btn-default" value="목록" id="qnaListBtn">
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>