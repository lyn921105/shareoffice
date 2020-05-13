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
		$("#search").val("<c:out value='${data.search}'/>");

		if ($("#search").val == '0') {
			$("#d0").attr('selected', 'selected');
		} else if ($("#search").val() == '1') {
			$("#d1").attr('selected', 'selected');
		} else if ($("#search").val() == '2') {
			$("#d2").attr('selected', 'selected');
		}

		// 회원 리스트 조건 변경 메소드
		$("#division").change(function() {

			var division = $(this).val()

			$("#search").val(division);

			goPage(1);
		})
		
		// 계약 상세 정보 팝업 페이지 이동
		$(".list").click(
				function() {
					
					var r_num = $(this).attr("data-num");
					
					console.log(r_num)
					

					var openDetail = window.open(
							"/adminContract/refundDetail?r_num=" + r_num,
							"contractRefundDetail", "width=500, height=700");
					openDetail.focus();

				})

	})
	/* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한
	실질적인 처리 함수 */
function goPage(page) {
	$("#page").val(page);
	$("#f_search").attr({
		"method" : "get",
		"action" : "/adminContract/refundList"
	});
	$("#f_search").submit();
}
</script>
</head>
<body>
	<h2>환불 요청</h2>
	<hr/>
	<select id="division">
		<option id="d0" value="0">전체</option>
		<option id="d1" value="1">환불 대기</option>
		<option id="d2" value="2">환불 완료</option>
	</select>
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
	<!-- 검색 기능 종료 -->
	<table class="table table-striped table-hover">
		<tr>
			<th>번호</th>
			<th>요청 사용자</th>
			<th>환불 금액</th>
			<th>신청일</th>
			<th>지급일</th>
			<th>환불 상태</th>
		</tr>
		<c:forEach items="${refundList }" var="item" varStatus="status">
			<tr class="list" data-num="${item.r_num }">
				<td>${count - status.index }</td>
				<td class="company">${item.c_id }</td>
				<c:choose>
					<c:when test="${item.r_refundprice eq 0 }">
						<td>-</td>
					</c:when>
					<c:otherwise>
						<td>${item.r_refundprice }<span> 원</span></td>
					</c:otherwise>
				</c:choose>
				<td class="member">${item.r_regdate }</td>
				<c:choose>
					<c:when test="${item.r_status eq 2 }">
						<td>-</td>
					</c:when>
					<c:otherwise>
						<td>${item.r_refunddate }</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${item.r_status eq 3 }">
						<td>환불 완료</td>
					</c:when>
					<c:otherwise>
						<td>환불 대기</td>
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