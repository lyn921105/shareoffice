<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 예약현황</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		/* 상세 페이지 이동을 위한 처리 이벤트 */
		$(".goDetail").click(function() {
			var r_num = $(this).attr("data-num");
			$("#r_num").val(r_num);

			//상세 페이지로 이동하기 위해 form추가
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/member/memberDetailForm"
			});
			$("#detailForm").submit();
		});
	})
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

	<!-- 상세 페이지 이동을 위한 FORM -->
	<form name="detailForm" id="detailForm">
		<input type="hidden" name="r_num" id="r_num">
	</form>

	<div class="container">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#reserve">나의
					예약정보</a></li>
			<li><a data-toggle="tab" href="#use">이용현황</a></li>
			<li><a data-toggle="tab" href="#done">이전 계약 현황</a></li>
		</ul>
		<div class="tab-content">
			<div id="reserve" class="tab-pane fade in active">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>예약번호</th>
							<th>입주기간</th>
							<th>입주호실</th>
							<th>금액</th>
							<th>입주사명</th>
							<th>상세정보</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty res_list1}">
								<c:forEach var="res" items="${res_list1}" varStatus="status">
									<tr data-num="${res.r_num}" class="goDetail">
										<th>${res.r_num}</th>
										<th>${res.r_reserveDate}~${res.r_endDate}</th>
										<th>${res.r_floor}${res.r_room}호</th>
										<th>${res.r_price}</th>
										<th>${res.r_company}</th>
										<c:choose>
											<c:when test="${res.r_status eq 0}">
												<th>예약</th>
											</c:when>
										</c:choose>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="text-center">
									<td colspan="6">예약정보가 없습니다</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>

			<div id="use" class="tab-pane fade">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>예약번호</th>
							<th>입주기간</th>
							<th>입주호실</th>
							<th>금액</th>
							<th>입주사명</th>
							<th>상세정보</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty res_list2}">
								<c:forEach var="res" items="${res_list2}" varStatus="status">
									<tr data-num="${res.r_num}" class="goDetail">
										<th>${res.r_num}</th>
										<th>${res.r_reserveDate}~${res.r_endDate}</th>
										<th>${res.r_floor}${res.r_room}호</th>
										<th>${res.r_price}</th>
										<th>${res.r_company}</th>
										<c:choose>
											<c:when test="${res.r_status eq 1}">
												<th>이용중</th>
											</c:when>
											<c:when test="${res.r_status eq 2}">
												<th>환불요청</th>
											</c:when>
										</c:choose>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="text-center">
									<td colspan="6">이용중인 호실이 없습니다</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>

			<div id="done" class="tab-pane fade">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>예약번호</th>
							<th>입주기간</th>
							<th>입주호실</th>
							<th>금액</th>
							<th>입주사명</th>
							<th>상세정보</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty res_list3}">
								<c:forEach var="res" items="${res_list3}" varStatus="status">
									<tr data-num="${res.r_num}">
										<th>${res.r_num}</th>
										<th>${res.r_reserveDate}~${res.r_endDate}</th>
										<th>${res.r_floor}${res.r_room}호</th>
										<th>${res.r_price}</th>
										<th>${res.r_company}</th>
										<c:choose>
											<c:when test="${res.r_status eq 3}">
												<th>환불완료</th>
											</c:when>
											<c:when test="${res.r_status eq 4}">
												<th>계약만료</th>
											</c:when>
											<c:otherwise>
												<th>취소</th>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="text-center">
									<td colspan="6">이전 계약현황이 없습니다</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>