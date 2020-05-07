<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입주 예약 리스트</title>
<!-- CSS -->
<link href="/resources/include/admin.css" rel="stylesheet">

<!-- js -->
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
$(function(){
	//이름 클릭 시 상세 페이지 이동을 위한 처리 이벤트
	$(".goDetail").click(function(){
		var r_num=$(this).data("num");
		
		$("#r_num").val(r_num);
		
		$("#detailForm").attr({
			"method":"get",
			"action":"/adminReservation/moveInDetail"
		})
		
		$("#detailForm").submit();
	})
})
</script>
</head>
<body>



	<!-- 상세 페이지 이동을 위한 Form -->
	<form id="detailForm" name="detailForm">
		<input type="hidden" name="r_num" id="r_num"> <input
			type="hidden" name="page" value="${data.page }"><!--  <input
			type="hidden" name="pageSize" value="5"> -->
	</form>

	<div class="container">

		<h1>입주 예약 현황</h1> <p>(신규요청: ${newRequest } 건)</p>
		<!-- 입주 상태에 따른 조회 옵션 -->
		<form id="listOption">
			<select id="search">
				<option value="viewAll">전체</option>
				<option value="wait">승인대기</option>
				<option value="cancle">취소</option>
			</select>
		</form>
		<!-- 리스트 출력 -->
		<div id="moveInList">
			<table class="moveInList table table-striped table-bordered">
				<colgroup>
					<!-- 번호 -->
					<col width="10%">
					<!-- 이름 -->
					<col width="15%">
					<!-- 연락처 -->
					<col width="15%">
					<!-- 인원 -->
					<col width="10%">
					<!-- 입주 예정일 -->
					<col width="18%">
					<!-- 신청일 -->
					<col width="18%">
					<!-- 승인상태 -->
					<col width="14%">
				<thead>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>연락처</th>
						<th>인원</th>
						<th>입주예정일</th>
						<th>신청일</th>
						<th>승인상태</th>
					</tr>
				</thead>
				<!-- 데이터 출력 -->
				<tbody id="list">
					<c:choose>
						<c:when test="${not empty moveInList }">
							<c:forEach var="list" items="${moveInList }" varStatus="status">
								<tr class="goDetail" data-num="${list.r_num }"
									style="diplay: inline;">
									<td>${count - status.index}</td>
									<td>${list.c_id }</td>
									<td>${list.r_phone }</td>
									<td>${list.r_member }명</td>
									<td>${list.r_reserveDate }</td>
									<td>${list.r_regdate }</td>
									<c:choose>
										<c:when test="${list.r_status eq 99}">
											<td>취소</td>
										</c:when>
										<c:when test="${list.r_status eq 0}">
											<td>승인대기</td>
										</c:when>
									</c:choose>
								</tr>

							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="7" class="tac">등록된 예약이 존재하지 않습니다</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<!-- 페이지 네비게이션 -->
		<br> <br>
		<div id="qnaPage">
			<tag:paging page="${param.page }" total="${total }" list_size="10"></tag:paging>
		</div>
	</div>




</body>
</html>