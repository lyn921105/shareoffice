<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문상담예약</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	/* 방문 날짜 클릭시 */
	$(function(){
		$('#datePicker').datepicker({
			format: "yyyy-mm-dd",
			startDate: 'd', // 당일 이전날짜 선택 불가
			endDate: '+10d', // 당일로부터 10일까지 가능
			autoclose: true, // 날짜 클릭하면 자동으로 닫힘
			daysOfWeekDisabled: [0,6], // 토요일, 일요일 제외
			templates: { // 다음달 넘어가기 화살표
				leftArrow: '&laquo;',
				rightArrow: '&raquo;'
			},
			showWeekDays: true, // 요일을 보여줌
			title: "방문날짜",
			todayHighlight: true, // 당일 날짜 표시
		}).on("changeDate", function(){
			var aj_date = $("#datePicker").val(); // 사용자가 선택한 날짜 변수
			var dt = new Date(); // 현재시간 생성, 당일 날짜 변수
			var c_time = dt.getHours(); // 당일 상담 예약에 비교할 현재시간 변수
			
			// 선택한 날짜로 db에서 비교하여 상담 가능한 상태를 가져옴
			$.ajax({
				url: "/visit/visitList",
				type: "get",
				data: ({input_Vdate : aj_date}),
				success: function(data){
					// 시간 선택 가능, 시간 선택부분 초기화
					$("#v_time").prop("disabled", false);
					$('#v_time option').prop('disabled', false);
					$('#v_time option').css("background-color", "white");
					// 당일 상담 예약의 경우 1시간 전부터 선택 가능 처리
					if (aj_date == getDateFormat(dt)) {
						for(var j = 0; j < c_time; j++) {
							$('#v_time option[value="' + ((c_time + 1) - j) + '"]').prop('disabled', true);
							$('#v_time option:disabled').css("background-color", "lightgray");
						}
					}
					
					// 이미 상담 예약이 있는 경우 선택 불가
					for (var i = 0; i < data.length; i++) {
						if (data[i].v_status == 1) {
							$('#v_time option[value="' + data[i].v_time + '"]').prop('disabled', true);
							$('#v_time option:disabled').css("background-color", "lightgray");
						}
						
					}
				},
				error: function(xhr, Status, error){
					console.log("에러 : " + error);
				}
			});
		});
		
		/* 예약하기 버튼 클릭 시 처리 이벤트 */
		$("#visitInsertBtn").click(function(){
			var dt = new Date(); // 현재시간 생성, 당일 날짜 변수
			var c_time = dt.getHours(); // 당일 상담 예약에 비교할 현재시간 변수
			
			// 입력값 체크
			if (!chkSubmit($('#v_name'),"방문자 명을")) {
				return;
			} else if (!chkSubmit($('#v_phone'),"방문자 연락처를")) {
				return;
			} else if (!chkSubmit($('#datePicker'),"방문 날짜를")) {
				return;
			} else if ($('#v_time').val() == '점심시간') {
				alert("시간을 선택해주세요");
				return;
			} else {
				alert($("#v_name").val() + "님의 방문상담이 " + $("#datePicker").val() + " " + $("#v_time").val() + "시에 신청 되었습니다.");
				$("#visit_form").attr({
					"method":"POST",
					"action":"/visit/visitReservation"
				});
				$("#visit_form").submit();
			}
		});
		
		/* 돌아가기 버튼 클릭 시 처리 이벤트 */
		$("#homePageBtn").click(function(){
			if (confirm("메인 페이지로 돌아갑니까?")) {
				location.href="/";
			}
		});
	});
</script>
</head>
<body>
	<div class="container">
		
		<form class="form-horizontal" id="visit_form" name="visit_form">
			<div class="row">
			<div class="form-group">
				<label for="v_name">방문자명</label>			
				<input type="text" class="form-control" id="v_name" name="v_name" placeholder="이름">
			</div>
			<div class="form-group">
				<label for="v_phone">방문자연락처</label>			
				<input type="text" class="form-control" id="v_phone" name="v_phone" placeholder="'-'를 제외한 숫자만 입력">
			</div>
			<div class="form-group">
				<label for="v_date">방문날짜</label>			
				<input type="text" class="form-control" id="datePicker" name="v_date" placeholder="날짜를 선택해주세요">
			</div>
			<div class="form-group">
				<label for="v_time">방문시간</label>			
				<select class="form-control" id="v_time" name="v_time" disabled>
					<option value="10" disabled>10:00 ~ 11:00</option>
					<option value="11" disabled>11:00 ~ 12:00</option>
					<option hidden value="점심시간"></option>
					<option value="13" disabled>13:00 ~ 14:00</option>
					<option value="14" disabled>14:00 ~ 15:00</option>
					<option value="15" disabled>15:00 ~ 16:00</option>
					<option value="16" disabled>16:00 ~ 17:00</option>
					<option value="17" disabled>17:00 ~ 18:00</option>
				</select>
			</div>
			</div>
		</form>
		<div class="text-center">
			<input type="button" class="btn btn-primary" value="예약하기" id="visitInsertBtn">
			<input type="button" class="btn btn-default" value="돌아가기" id="homePageBtn">
		</div>
	</div>
</body>
</html>