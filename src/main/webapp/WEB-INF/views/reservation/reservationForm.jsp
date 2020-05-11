<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온라인 예약</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	/* 페이지 진입시 예약 안내문 팝업으로 출력 */
	// 안 될시에 팝업차단 체크
	window.open("/reservation/resInfo", "_blank", "width=800, height=400");
});

$(function(){
	/* 호실보기 버튼 누를 시 처리 이벤트*/
	$("#room_select").click(function(){
		window.open("/reservation/roomPop", "_blank", "width=500, height=700");
		
		/* 만기날짜, 인원수 및 가격 초기화 */
		$("#set_endDate").attr('disabled', true);
		$("#set_endDate").val("3");
		$("#send_endDate").val("");
		$("#r_member").attr('disabled', true);
		$("#r_member").val("1");
		$("#r_price").val("");
	});
	
	/* 만기날짜 선택시 만기날짜 표기, 인원수 선택 활성, 가격 계산*/
	$("#set_endDate").change(function() {
		/* 만기 날짜 변수 */
		let r_res = new Date($("#r_reserveDate").val());
		let month = Number($(this).val());
		let date = new Date();
		
		/* 만기 날짜 계산 */
		r_res.setDate(r_res.getDate() + (month * 30));
		$("#r_endDate").val(r_res);
		
		/* 만기 날짜 출력*/
		date = getDateFormat(r_res);
		$("#send_endDate").val(date);
		
		/* 선택한 호실을 DB에 전송할 변수 */
		let o_fl = $("#r_floor").val();
		let o_ro = $("#r_room").val();
		
		/* 가격 설정 */
		$.ajax({
			url : "/reservation/totalMoney",
			type : "GET",
			data : ({
				o_floor : o_fl,
				o_room : o_ro
			}),
			success : function(data) {
				$("#r_price").val(data.o_price * month);
				
				// 선택호실 변경시 초기화
				$("#r_member").prop('disabled', true);
				$("#r_member option").prop('disabled', true);
				$("#r_member option").css("background-color", "white");
				
				$("#r_member").attr('disabled', false);
				for (let i = 1; i <= data.o_member; i++) {
					$('#r_member option[value="' + i + '"]').prop('disabled', false);
				}
				$('#r_member option:disabled').css("background-color", "lightgray");
			},
			error: function(xhr, Status, error){
				console.log("에러 : " + error);
			}
		});
	});
	
	
	/* 예약하기 버튼 클릭 시 처리 이벤트 */
	$("#reserveInsertBtn").click(function(){
		// 입력값 체크
		if (!chkSubmit($('#r_company'),"입주사명을")) {
			return;
		} else if (!chkSubmit($('#r_phone'),"연락처를")) {
			return;
		} else if (!chkSubmit($('#r_fr'),"호실을")) {
			return;
		} else if (!chkSubmit($('#r_reserveDate'),"입주희망날짜를")) {
			return;
		} else if (!chkSubmit($('#send_endDate'),"만기날짜를")) {
			return;
		} else if ($("#check").prop("checked") == false) {
			alert("약관에 동의하셔야 예약이 가능합니다.")
			return;
		} else {
			$("#res_form").attr({
				"method":"POST",
				"action":"/reservation/reservationResult"
			});
			$("#res_form").submit();
		}
	});
	
	/* 돌아가기 버튼 클릭 시 처리 이벤트 */
	$("#homePageBtn").click(function(){
		if (confirm("메인 페이지로 돌아갑니까?")) {
			location.href="/";
		}
	});
	
	/* 팝업 안내문 버튼 클릭시 */
	$("#res_info").click(function(){
		window.open("/reservation/resInfo", "_blank", "width=800, height=400");
	});
});
</script>
<style>
	/* 이용약관 */
	#terms {
		position: relative;
		overflow: auto;
		margin-top: 8px;
		margin-bottom: 8px;
		height: 88px;
		padding: 12px;	
		border: 1px solid #dadada;
		box-sizing: border-box;
	}
</style>
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
		<form id="res_form" name="res_form">
			<input type="hidden" id="r_room" name="r_room">
			<input type="hidden" id="r_floor" name="r_floor">
			<input type="hidden" id="r_endDate" name="r_endDate">
			<div class="form-group">
				<label for="c_id">아이디</label>			
				<input type="text" class="form-control" id="c_id" name="c_id" value="${loginSuccess}" readonly>
			</div>
			<div class="form-group">
				<label for="r_company">입주사명</label>			
				<input type="text" class="form-control" id="r_company" name="r_company">
			</div>
			<div class="form-group">
				<label for="r_phone">핸드폰 번호</label>			
				<input type="text" class="form-control" id="r_phone" name="r_phone">
			</div>
			<div class="form-group">
				<label for="r_fr">호실 선택</label>
				<input type="button" class="btn btn-primary" id="room_select" value="호실 보기">		
				<input type="text" class="form-control" id="r_fr" name="r_fr" placeholder="호실 보기에서 선택 가능합니다" readonly style="margin-top: 8px;">
			</div>
			<div class="form-group col-xs-3">
				<label for="r_reserveDate">입주희망날짜</label>			
				<input type="text" class="form-control" id="r_reserveDate" name="r_reserveDate" placeholder="호실 보기에서 선택 가능합니다" readonly>
			</div>
			<div class="form-group col-xs-3">
				<label for="set_endDate">만기날짜</label>
				<input type="text" class="form-control" id="send_endDate" name="send_endDate" placeholder="만기날짜를 선택해주세요" readonly>
			</div>
			<div class="form-group col-xs-6">
				<label for="set_endDate">만기날짜 (월/30일) 선택</label>		
				<select class="form-control" id="set_endDate" disabled>
					<option value="3">3개월</option>
					<option value="4">4개월</option>
					<option value="5">5개월</option>
					<option value="6">6개월</option>
					<option value="7">7개월</option>
					<option value="8">8개월</option>
					<option value="9">9개월</option>
					<option value="10">10개월</option>
					<option value="11">11개월</option>
					<option value="12">12개월</option>
				</select>
			</div>
			<div class="form-group">
				<label for="r_member">인원수</label>			
				<select class="form-control" id="r_member" name="r_member" disabled>
					<option value="1" disabled>1명</option>
					<option value="2" disabled>2명</option>
					<option value="3" disabled>3명</option>
					<option value="4" disabled>4명</option>
					<option value="5" disabled>5명</option>
					<option value="6" disabled>6명</option>
				</select>
			</div>
			<div class="form-group">
				<label for="r_price">이용 금액</label>			
				<input type="text" class="form-control" id="r_price" name="r_price" readonly>
			</div>
			<div class="checkbox">
				<label><input type="checkbox" id="check">(필수) 워크트리 예약을 위한 필수 개인정보 수집 및 활용에 동의합니다.</label>
				<a data-toggle="collapse" href="#terms">(보기)</a>
			</div>
			<div class="form-group col-xs-6">
				<input type="button" class="btn btn-default" id="res_info" value="예약 안내문">			
			</div>
			<div class="form-group col-xs-6 panel-collapse collapse" id="terms">
				<h3>여러분을 환영합니다.</h3>
				<p>네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
					네이버 서비스를 이용하시거나 네이버 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
					다양한 네이버 서비스를 즐겨보세요.</p>
			</div>
		</form>
	</div>
	<div class="text-center">
		<input type="button" class="btn btn-primary" value="예약하기" id="reserveInsertBtn">
		<input type="button" class="btn btn-default" value="돌아가기" id="homePageBtn">
	</div>
</body>
</html>