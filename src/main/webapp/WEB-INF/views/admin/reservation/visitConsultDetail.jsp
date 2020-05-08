<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문 상담 상세</title>
<!-- CSS -->
<link href="/resources/include/admin.css" rel="stylesheet">

<!-- js -->
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
$(function(){
	$("#consultComplete").click(function(){
		var result = confirm("상태를 변경하시겠습니까? 변경 후에는 수정이 불가능합니다.");
		
		if(result){
			$("#v_data").attr({
				"method":"get",
				"action":"/adminReservation/updateConsultState"
			})
			
			$("#v_data").submit();
		} else{
			
			return;
		}

	})
	
	$("#backList").click(function(){
		location.href="/adminReservation/consultList";
	})
})
</script>

</head>
<body>
	<div id="container">
	
	<form id="v_data">
			<input type="hidden" id="v_num" name="v_num" value="${detail.v_num }" />
			<%-- <input type="hidden" name="page" id="page" value="${param.page }" /> --%>
			
		</form>
		
		<h1>방문 상담 상세</h1>
		<table id="visiterDetail" class="table table-bordered">
			<thead>
				<tr>
					<td colspan="4">상담자 정보</td>
				</tr>
				<tr>
					<td>예약시 이름</td>
					<td colspan="3">${detail.v_name }</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td colspan="3">${detail.v_phone }</td>
				</tr>
				<tr>
					<td>방문예정일</td>
					<td>${detail.v_date }</td>
					<td>방문예정시간</td>
					<td>${detail.v_time }:00~${detail.v_time +1}:00</td>
				</tr>
				<tr>
					<td>상담상태</td>
					<c:choose>
						<c:when test="${detail.v_status eq 1}">
							<td colspan="3">상담전&nbsp;<input type="button" value="상담완료"
								id="consultComplete" name="consultComplete"></td>
						</c:when>
						<c:when test="${detail.v_status eq 2}">
							<td colspan="3">상담완료</td>
						</c:when>
					</c:choose>
		</table>
		<div class="button">
			<input type="button" value="목록" id="backList" name="backList">
		</div>

	</div>

</body>
</html>