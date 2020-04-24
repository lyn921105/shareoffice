<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
<!-- CSS -->
<link href="/resources/include/css/common.css" rel="stylesheet">
<link href="/resources/include/admin.css" rel="stylesheet">

<!-- js -->
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript"
	src="/resources/include/js/jquery.from.min.js"></script>
<script type="text/javascript">
	$(function() {
		//선택한 옵션에 따라 테이블 내용 변경
		$("#stateOption").change(function() {
			var option = $(this).val();
			if (option == "notAnswer") {
				$("td:contains('답변완료')").parent().css("display", "none");
				$("td:contains('관리자')").parent().css("display", "none");
			}
			if (option == "viewAll") {
				$("td:contains('답변완료')").parent().css("display", "");
				$("td:contains('관리자')").parent().css("display", "");
			}

		})

		//페이징 처리
		if ("<c:out value='${data.pageSize}'/>" != "") {
			$("#pageSize").val("<c:out value='${data.pageSize}'/>");
		}

	})
</script>

</head>
<body>
	<!-- 상세 페이지 이동을 위한 Form -->
	<form id="detailForm" name="detailForm">
		<input type="hidden" name="q_num" id="q_num"> <input
			type="hidden" name="page" value="${data.page }"> <input
			type="hidden" name="pageSize" value="10">
	</form>

	<div class="qnaContainer">
		<!-- 문의 글 상태에 따른 조회 옵션 -->
		<h1>문의 관리</h1>
		<select id="stateOption" name="stateOption">
			<option value="viewAll">전체 문의</option>
			<option value="notAnswer">미답변</option>
		</select>

		<!-- 문의글  리스트 출력 -->
		<div id="qnaList">
			<table class="qnaList">
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
				<tbody id="list">
					<c:choose>
						<c:when test="${not empty qnaList }">
							<c:forEach var="qna" items="${qnaList }" varStatus="status">
								<tr class="allList" data-num="${qna.q_num }"
									style="diplay: inlien;">
									<td>${qna.q_num }</td>
									<td class="goDetail tal">${qna.q_title }</td>
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
		<div id="qnaPage">
			<tag:paging page="${param.page }" total="${total }"
				list_size="10"></tag:paging>
		</div>
	</div>

</body>
</html>