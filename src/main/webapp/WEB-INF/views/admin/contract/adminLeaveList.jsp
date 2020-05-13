<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {

		

	})
	/* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한
		실질적인 처리 함수 */
	function goPage(page) {
		/* $("#keyword").val(""); */
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/adminContract/leaveList"
		});
		$("#f_search").submit();
	}
</script>
</head>
<body>
	<h2>퇴실 내역</h2>
	<hr />
	<br />
	<!-- 검색 기능 시작 -->
	<div id="searchfunction">
		<form id="f_search" name="f_search">
			<input type="hidden" id="search" name="search"
				value="${data.search }"> <input type="hidden" id="page"
				name="page" value="${data.page }"> <input type="hidden"
				id="pageSize" name="pageSize" value="10">
		</form>
	</div>
	<table class="table table-striped table-hover">
		<tr>
			<th>번호</th>
			<th>입주사명</th>
			<th>퇴실일</th>
			<th>비고</th>
		</tr>
		<c:forEach items="${leaveList }" var="item" varStatus="status">
			<tr>
				<td>${count - status.index }</td>
				<td>${item.r_company }</td>
				<td>${item.r_enddate }</td>
				<c:choose>
					<c:when test="${item.r_status eq 3 }">
						<td>환불</td>
					</c:when>
					<c:otherwise>
						<td>계약만료</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	</table>
	<!-- 리스트 종료 -->
	<!-- 페이지 네비게이션 시작 -->
	<div id="memberPage" style="text-align: center;">
		<tag:paging page="${param.page }" total="${total }" list_size="10" />
	</div>
	<!-- 페이지 네비게이션 종료 -->

	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>