<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 결과창</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
$(function(){
	/* 예약하기 버튼 클릭 시 처리 이벤트 */
	$("#reserveInsertBtn").click(function(){
		// 입력값 체크
		if (!chkSubmit($('#r_name'),"입금자명을")) {
			return;
		} else if (!chkSubmit($('#r_bank'),"입금은행을")) {
			return;
		} else {
			alert("예약이 완료되었습니다.");
			$("#res_form").attr({
				"method":"POST",
				"action":"/reservation/reservationInsert"
			});
			$("#res_form").submit();
		}
	});
	
	/* 돌아가기 버튼 클릭 시 처리 이벤트 */
	$("#resBackBtn").click(function(){
		if (confirm("입력 정보가 틀리면 \'확인\' 버튼을 눌러주세요. 예약 페이지로 돌아갑니다.")) {
			location.href="/reservation/reservationForm";
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
			location.href="/member/login";
		</c:if>
	</script>

	<form id="res_form" name="res_form">
		<div class=container style="background: #F8F8F8; margin-bottom: 10px;">
			<input type="hidden" id="c_id" name="c_id" value="${result.c_id}">
			<input type="hidden" id="r_company" name="r_company" value="${result.r_company}">
			<input type="hidden" id="r_phone" name="r_phone" value="${result.r_phone}">
			<input type="hidden" id="r_member" name="r_member" value="${result.r_member}">
			<input type="hidden" id="r_reserveDate" name="r_reserveDate" value="${result.r_reserveDate}">
			<input type="hidden" id="r_price" name="r_price" value="${result.r_price}">
			<input type="hidden" id="r_room" name="r_room" value="${result.r_room}">
			<input type="hidden" id="r_floor" name="r_floor" value="${result.r_floor}">
			<input type="hidden" id="r_endDate" name="r_endDate" value="${send_endDate}">
			<div class="text-center">
				<h3>입력하신 정보를 확인해 주세요</h3>
				<br>
			</div>
			<div class="form-group">
				<label>아이디</label>			
				<p>${result.c_id}</p>
			</div>
			<div class="form-group">
				<label>입주사명</label>			
				<p>${result.r_company}</p>
			</div>
			<div class="form-group">
				<label>핸드폰번호</label>			
				<p>${result.r_phone}</p>
			</div>
			<div class="form-group">
				<label>이용할 호실</label>
				<p>${result.r_floor}${result.r_room}호</p>
			</div>
			<div class="form-group col-xs-6">
				<label>입주희망날짜</label>			
				<p>${result.r_reserveDate}</p>
			</div>
			<div class="form-group col-xs-6">
				<label>만기날짜 (월/30일)</label>			
				<p>${send_endDate}</p>
			</div>
			<div class="form-group">
				<label>인원수</label>			
				<p>${result.r_member}</p>
			</div>
			<div class="form-group">
				<label>이용 금액</label>			
				<p>${result.r_price}</p>
			</div>
		</div>
		<div class="container" style="background: #F8F8F8;">
			<div class="text-center">
				<h3>계좌정보를 입력해주세요</h3>
			</div>
			<div class="form-group">
				<label>입금자명</label>
				<input type="text" class="form-control" id="r_name">
			</div>
			<div class="form-group">
				<label>입금은행</label>
				<input type="text" class="form-control" id="r_bank">
			</div>
		</div>
	</form>
		<div class="text-center">
			<input type="button" class="btn btn-primary" value="예약하기" id="reserveInsertBtn">
			<input type="button" class="btn btn-default" value="돌아가기" id="resBackBtn">
		</div>
</body>
</html>