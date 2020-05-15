<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta charset="UTF-8">
<title>온라인 예약</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
$(function(){
	/* 환불하기 버튼 클릭 시 처리 이벤트 */
	$("#refundBtn").click(function(){
		$("#ref_form").attr({
			"method":"POST",
			"action":"/member/memberRefund"
		});
		$("#ref_form").submit();
	});
	
	/* 돌아가기 버튼 클릭 시 처리 이벤트 */
	$("#homePageBtn").click(function(){
		if (confirm("목록으로 돌아갑니까?")) {
			history.back();
		}
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
		<h3>변경은 환불요청 후 다시 예약을 부탁드립니다</h3>
		<form id="ref_form" name="ref_form">
			<input type="hidden" id="r_num" name="r_num" value="${res.r_num}">
			<div class="form-group">
				<label for="c_id">아이디</label>			
				<input type="text" class="form-control" id="c_id" name="c_id" value="${loginSuccess}" readonly>
			</div>
			<div class="form-group">
				<label for="r_company">입주사명</label>			
				<input type="text" class="form-control" id="r_company" name="r_company" value="${res.r_company}" readonly>
			</div>
			<div class="form-group">
				<label for="r_phone">핸드폰 번호</label>			
				<input type="text" class="form-control" id="r_phone" name="r_phone" value="${res.r_phone}" readonly>
			</div>
			<div class="form-group">
				<label for="r_fr">호실 선택</label>
				<input type="text" class="form-control" id="r_fr" name="r_fr" value="${res.r_floor}${res.r_room}호" readonly>
			</div>
			<div class="form-group col-xs-6">
				<label for="r_reserveDate">입주희망날짜</label>			
				<input type="text" class="form-control" id="r_reserveDate" name="r_reserveDate" value="${res.r_reserveDate}" readonly>
			</div>
			<div class="form-group col-xs-6">
				<label for="r_endDate">만기날짜 (월/30일)</label>			
				<input type="text" class="form-control" id="r_endDate" name="r_endDate" value="${res.r_endDate}" readonly>
			</div>
			<div class="form-group">
				<label for="r_member">인원수</label>
				<input type="text" class="form-control" id="r_member" name="r_member"value="${res.r_member}" readonly>
			</div>
			<div class="form-group">
				<label for="r_price">이용 금액</label>			
				<input type="text" class="form-control" id="r_price" name="r_price" value="${res.r_price}" readonly>
			</div>
		</form>
	</div>
	<div class="text-center">
		<input type="button" class="btn btn-primary" value="환불요청" id="refundBtn">
		<input type="button" class="btn btn-default" value="돌아가기" id="homePageBtn">
	</div>
</body>
</html>