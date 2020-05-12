<%@page
	import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Q&A</title>
<!-- CSS -->
<link href="/resources/include/admin.css" rel="stylesheet">

<!-- js -->
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		//페이지 로드 시 셀렉트 박스 설정
		$("#search").val("<c:out value='${data.search}'/>");

		if ($("#search").val() == 'notAnswer') {
			$('#notAnswer').attr('selected', 'selected');
		} else {
			$('#viewAll').attr('selected', 'selected');
		}

		//선택한 옵션에 따라 테이블 내용 변경
		$("#search").change(function() {

			goPage(1);
		});

		//행 클릭 시 상세 페이지 이동을 위한 처리 이벤트
		$(".goDetail").click(function() {
			var q_num = $(this).data("num");

			$("#q_num").val(q_num);

			$("#detailForm").attr({
				"method" : "get",
				"action" : "/adminQuestion/questionDetail"
			})

			$("#detailForm").submit();
		})

	})

	function goPage(page) {
		$("#page").val(page);
		$("#listOption").attr({
			"method" : "get",
			"action" : "/adminQuestion/qnaList"
		});
		$("#listOption").submit();
	}
</script>

</head>
<body>
	<!-- 상세 페이지 이동을 위한 Form -->
	<form id="detailForm" name="detailForm">
		<input type="hidden" name="q_num" id="q_num"> <input
			type="hidden" name="q_state" id="q_state" value="${qna.q_state }">
		<input type="hidden" name="page" value="${data.page }"> <input
			type="hidden" name="pageSize" value="5">
	</form>
	<h2>Q&A 관리</h2>
	<hr>
	<!-- 문의 글 상태에 따른 조회 옵션 -->
	<form id="listOption">
		<input type="hidden" id="page" name="page" value="${data.page }">

		<select id="search" name="search">
			<option id="viewAll" value="viewAll">전체 문의</option>
			<option id="notAnswer" value="notAnswer">미답변</option>
		</select>
	</form>
	<!-- 문의글  리스트 출력 -->
	<div id="qnaList">
		<table class="qnaList table table-striped table-bordered">
			<colgroup>
				<!-- 번호 -->
				<col width="10%">
				<!-- 제목 -->
				<col width="45%">
				<!-- 아이디 -->
				<col width="10%">
				<!-- 작성일자 -->
				<col width="25%">
				<!-- 답변상태 -->
				<col width="10%">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>아이디</th>
					<th data-date="q_regdate">작성일자</th>
					<th>답변상태</th>
				</tr>
			</thead>
			<!-- 데이터 출력 -->
			<tbody id="list">
				<c:choose>
					<c:when test="${not empty qnaList }">
						<c:forEach var="qna" items="${qnaList }" varStatus="status">
							<tr class="goDetail" data-num="${qna.q_num }"
								style="diplay: inline;">
								<td>${count - status.index}</td>
								<td>${qna.q_title }</td>
								<c:choose>
									<c:when test="${not empty qna.a_id }">
										<td>${qna.a_id }</td>
									</c:when>
									<c:otherwise>
										<td>${qna.c_id }</td>
									</c:otherwise>
								</c:choose>
								<td class="q_regdate">${qna.q_regdate }</td>
								<c:choose>
									<c:when test="${qna.q_state eq 1}">
										<td>미답변</td>
									</c:when>
									<c:when test="${qna.q_state eq 2}">
										<td>답변완료</td>
									</c:when>
									<c:otherwise>
										<td>관리자</td>
									</c:otherwise>
								</c:choose>
							</tr>

						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<!-- 페이지 네비게이션 -->
	<br>
	<br>
	<div id="qnaPage" align="center">
		<tag:paging page="${param.page }" total="${total }" list_size="10"></tag:paging>
	</div>
</body>
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</html>