<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호실 이용 현황</title>
<link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/include/dist/css/bootstrap-datepicker.css" rel="stylesheet">
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
$(function(){
	var sysdate = new Date();
	
	/* 날짜 선택 */
	$('#datePicker').datepicker({
		format: "yyyy-mm-dd",
		startDate: 'd', // 당일 이전날짜 선택 불가
		endDate: '+10d', // 당일로부터 10일까지 선택가능
		autoclose: true, // 날짜 클릭하면 자동으로 닫힘
		templates: { // 다음달 넘어가기 화살표
			leftArrow: '&laquo;',
			rightArrow: '&raquo;'
		},
		showWeekDays: true, // 요일을 보여줌
		title: "입주 희망 날짜",
		todayHighlight: true, // 당일 날짜 표시
	}).on("changeDate", function(){
		/* 날짜 변경시 사용할 변수 */
		let aj_date = $("#datePicker").val(); // 사용자가 선택한 날짜 변수
		
		/* 상태값 초기화 */
		$(".td_hover").css("background-color", "white"); // 영역 색 초기화
		$(".o_status").empty(); // 날짜 초기화
		$("#send_fr").val(""); // 사용자에게 보여줄 호실 초기화
		$("#send_floor").val(""); // 층
		$("#send_room").val(""); // 방번호
		$(".o_floor").html("1"); // 1층 현황
		$("#floor").val("1"); // 1층 현황
		$("#floor").prop("disabled", false);
		
		// 선택한 날짜로 db에서 비교하여 상담 가능한 상태를 가져옴
		$.ajax({
			url: "/reservation/roomPopDate",
			type: "get",
			success: function(data){
				$('#send_date').val(aj_date); // 예약창으로 전송할 날짜
				/* 날짜 변경시 1층의 상태 정보 불러오기 */
				for (i = 0; i < data.length; i++) {
					for (m = 1; m < 11; m++) {
						if (($("#o_room" + m).html() == data[i].o_room) && (data[i].o_status == 2)) {
							$("#o_status" + m).html("(점검중)");
						} else if (($("#o_room" + m).html() == data[i].o_room) && (data[i].r_endDate >= aj_date)
								&& (!(data[i].r_status == 3) || (data[i].r_status == 4) || (data[i].r_status == 5))) {
							$("#o_status" + m).html("~" + data[i].r_endDate);
							$("#o_status" + m).parent(".td_hover").css("background-color", "rgb(125, 140, 255, 0.4)");
						}
					}
				}
			},
			error: function(xhr, Status, error){
				console.log("에러 : " + error);
			}
		});
	});
		/* 첫 호실 현황 페이지 진입시 default값인 1층의 상태 정보 불러오기 */
		<c:forEach items="${roomMain}" var="item">
			for (let m = 1; m < 11; m++) {
				if (($("#o_room" + m).html() == "${item.o_room}") && ("${item.o_status}" == "2")) {
					$("#o_status" + m).html("(점검중)");
				} else if (($("#o_room" + m).html() == "${item.o_room}") && ("${item.r_endDate}" >=
					getDateFormat(sysdate)) && (!("${item.r_status}" == "3") || ("${item.r_status}" == "4")
							|| ("${item.r_status}" == "5"))) {
					$("#o_status" + m).html("~${item.r_endDate}");
					$("#o_status" + m).parent(".td_hover").css("background-color", "rgb(125, 140, 255, 0.4)");
				}
			}
		</c:forEach>
		
		/* 층 변경 시 도면 변경 처리 이벤트 */
		$("#floor").change(function() {
			var fn = $(this).val();
			var date = $("#datePicker").val();
			if (date == '') {
				date = new Date();
				date = getDateFormat(date);
			}
			
			$(".td_hover").css("background-color", "white"); // 영역 색 초기화
			$(".o_status").empty();
			$("#send_fr").val("");
			$("#send_floor").val("");
			$("#send_room").val("");
			$(".o_floor").html(fn);

			$.ajax({
				url : "/reservation/popChange",
				type : "GET",
				data : ({
					o_floor : fn,
				}),
				cache : false,
				success : function(data) {
					console.log(data);
					for (i = 0; i < data.length; i++) {
						for (m = 1; m < 11; m++) {
							if (($("#o_room" + m).html() == data[i].o_room) && (data[i].o_status == 2)) {
								$("#o_status" + m).html("(점검중)");
							} else if (($("#o_room" + m).html() == data[i].o_room) && (data[i].r_endDate >= date)
									&& (!(data[i].r_status == 3) || (data[i].r_status == 4) || (data[i].r_status == 5))) {
								$("#o_status" + m).html("~" + data[i].r_endDate);
								$("#o_status" + m).parent(".td_hover").css("background-color", "rgb(125, 140, 255, 0.4)");
							}
						}
					}
				}
			})
		})

		/* 호실 선택시 값 전송, 해당 호실 선택 구분 색깔 표시 */
		$(".td_hover").click(function(){
			if ($("#send_date").val() != "") {
				if ($(this).children(".o_status").html() == "") {
					let send_f = $(this).children(".o_floor").html();
					let send_r = $(this).children(".o_room").html();
					$(".o_status:empty").parent(".td_hover").css("background-color", "white");
					$(this).css("background-color", "rgb(60, 179, 113, 0.4)");
					$("#send_floor").val(send_f);
					$("#send_room").val(send_r);
					$("#send_fr").val(send_f + send_r + "호");
				}
			}
		});	
		
		/* 선택한 날짜와 호실 전송 및 만기날짜 선택가능 */
		$("#send_all").click(function(){
			if (!chkSubmit($('#send_date'),"날짜를")) {
				return;
			} else if (!chkSubmit($('#send_fr'),"호실을")) {
				return;
			} else {
				opener.document.getElementById("r_reserveDate").value = document.getElementById("send_date").value;
				opener.document.getElementById("r_fr").value = document.getElementById("send_fr").value;
				opener.document.getElementById("r_floor").value = document.getElementById("send_floor").value;
				opener.document.getElementById("r_room").value = document.getElementById("send_room").value;
				opener.document.getElementById("set_endDate").disabled = false;
				window.close();
			}
		});
		
		/* 닫기 버튼 클릭시 */
		$("#close").click(function(){
			window.close();
		});
	});
</script>
<style type="text/css">
table {
	text-align: center;
	font-weight : bold;
}

td {
width : 120px;
height : 60px;
padding : 10px;
}
</style>
</head>
<body>
	<form id="form">
		<input type="hidden" id="hidden" value="123">
	</form>
	<div class="container">
		<h2>호실 현황</h2>
		<label>날짜 선택</label>
		<input type="text" class="form-control" id="datePicker" name="input_rDate" placeholder="날짜를 선택해주세요">
		<select class="form-control" id="floor" disabled>
			<option value="1">1층</option>
			<option value="2">2층</option>
			<option value="3">3층</option>
			<option value="4">4층</option>
			<option value="5">5층</option>
			<option value="6">6층</option>
			<option value="7">7층</option>
		</select>
		<table class="table table-bordered text-center">
			<tr>
				<td id="rn4" class="td_hover"><span id="o_floor4" class="o_floor">1</span><span
					id="o_room4" class="o_room">04</span>
				<span>호</span><p id="o_status4" class="o_status"></p></td>
				<td id="rn5" class="td_hover"><span id="o_floor5" class="o_floor">1</span><span
					id="o_room5" class="o_room">05</span>
				<span>호</span><p id="o_status5" class="o_status"></p></td>
				<td id="rn6" class="td_hover"><span id="o_floor6" class="o_floor">1</span><span
					id="o_room6" class="o_room">06</span>
				<span>호</span><p id="o_status6" class="o_status"></p></td>
				<td id="rn7" class="td_hover"><span id="o_floor7" class="o_floor">1</span><span
					id="o_room7" class="o_room">07</span>
				<span>호</span><p id="o_status7" class="o_status"></p></td>
			</tr>
			<tr>
				<td id="rn3" class="td_hover"><span id="o_floor3" class="o_floor">1</span><span
					id="o_room3" class="o_room">03</span>
				<span>호</span><p id="o_status3" class="o_status"></p></td>

				<td colspan="2" rowspan="3">원하는 호실을 선택해주세요</td>

				<td id="rn8" class="td_hover"><span id="o_floor8" class="o_floor">1</span><span
					id="o_room8" class="o_room">08</span>
				<span>호</span><p id="o_status8" class="o_status"></p></td>
			</tr>
			<tr>
				<td id="rn2" class="td_hover"><span id="o_floor2" class="o_floor">1</span><span
					id="o_room2" class="o_room">02</span>
				<span>호</span><p id="o_status2" class="o_status"></p></td>
				<td id="rn9" class="td_hover"><span id="o_floor9" class="o_floor">1</span><span
					id="o_room9" class="o_room">09</span>
				<span>호</span><p id="o_status9" class="o_status"></p></td>
			</tr>
			<tr>
				<td id="rn1" class="td_hover"><span id="o_floor1" class="o_floor">1</span><span
					id="o_room1" class="o_room">01</span>
				<span>호</span><p id="o_status1" class="o_status"></p></td>
				<td id="rn10" class="td_hover"><span id="o_floor10" class="o_floor">1</span><span
					id="o_room10" class="o_room">10</span>
				<span>호</span><p id="o_status10" class="o_status"></p></td>
			</tr>
		</table>
		
		<div class="form-group">
			<label>선택한 날짜</label>
			<input type="text" class="form-control" id="send_date" readonly>
		</div>
		<div class="form-group">
			<input type="hidden" class="form-control" id="send_floor" readonly>
		</div>
		<div class="form-group">
			<input type="hidden" class="form-control" id="send_room" readonly>
		</div>
		<div class="form-group">
			<label>선택한 호실</label>
			<input type="text" class="form-control" id="send_fr" readonly>
		</div>
	</div>
	<div class="text-center">
		<input type="button" id="send_all" class="btn btn-primary" value="전송">
		<input type="button" id="close" class="btn btn-default" value="닫기">
	</div>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
	<script src="/resources/include/dist/js/bootstrap-datepicker.js"></script>
</body>
</html>