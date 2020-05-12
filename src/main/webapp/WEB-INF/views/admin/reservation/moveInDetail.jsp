<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입주 예약 상세</title>
<!-- CSS -->
<link href="/resources/include/admin.css" rel="stylesheet">

<!-- js -->
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		$("#req_ok").click(function() {
			var result = confirm("상태를 변경하시겠습니까? 변경 후에는 수정이 불가능합니다.");

			if (result) {
				$("#r_data").attr({
					"method" : "get",
					"action" : "/adminReservation/updateReqState"
				})

				$("#r_data").submit();
			} else {

				return;
			}

		})

		$("#backList").click(function() {
			location.href = "/adminReservation/moveInList";
		})
	})
</script>

</head>
<body>
	<div id="container">

		<form id="r_data">
			<input type="hidden" id="r_num" name="r_num" value="${detail.r_num }" />
			<input type="hidden" name="page" id="page" value="${param.page }" />
			<input type="hidden" name="r_floor" id="r_floor" value="${detail.r_floor }">
			<input type="hidden" name="r_room" id="r_room" value="${detail.r_room }">
		</form>

		<h1>입주 예약 상세</h1>
		<table id="moveInDetail" class="table table-bordered">

			<tr>
				<td>예약자 아이디</td>
				<td>${detail.c_id }</td>
				<td>신청일</td>
				<td>${detail.r_regdate }</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td colspan="3">${detail.r_phone }</td>
			</tr>
			<tr>
				<td>이용호실</td>
				<td colspan="3">${detail.r_floor }${detail.r_room }</td>
			</tr>
			<tr>
				<td>이용인원</td>
				<td colspan="3">${detail.r_member }명</td>
			</tr>
			<tr>
				<td>입주예정일</td>
				<td colspan="3">${detail.r_reserveDate }</td>
			</tr>
			<tr>
				<td>퇴실예정일</td>
				<td colspan="3">${detail.r_endDate }</td>
			</tr>
			<tr>
				<td>이용금액</td>
				<td colspan="3">${detail.r_price }</td>
			</tr>
			<tr>
				<td>상태</td>
				<c:choose>
					<c:when test="${detail.r_status eq 5}">
						<td colspan="3">취소</td>
					</c:when>
					<c:when test="${detail.r_status eq 0}">
						<td colspan="3">승인대기 <input type="button" id="req_ok"
							name="req_ok" value="승인"></td>
					</c:when>
				</c:choose>
			</tr>
		</table>
		<div class="button" align="center">
			<input type="button" value="목록" id="backList" name="backList">
		</div>

	</div>

</body>
</html>