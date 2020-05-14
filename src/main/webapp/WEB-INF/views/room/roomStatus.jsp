<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호실 이용 현황</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		var sysdate = new Date();
		// 첫 호실 현황 페이지 진입시 default값인 1층의 상태 정보 불러오기
		<c:forEach items="${roomMain}" var="item">
			for (let m = 1; m < 11; m++) {
				if (($("#o_room" + m).html() == "${item.o_room}") && ("${item.o_status}" == "2")) {
					$("#o_status" + m).html("(점검중)");
				} else if (($("#o_room" + m).html() == "${item.o_room}") && ("${item.r_endDate}" >= getDateFormat(sysdate))
						&& (!("${item.r_status}" == "3") || ("${item.r_status}" == "4") || ("${item.r_status}" == "5"))) {
					$("#o_status" + m).html("~${item.r_endDate}");
					$("#o_status" + m).parent(".td_hover").css("background-color", "rgb(125, 140, 255, 0.4)");
				}
			}
		</c:forEach>

		/* 층 클릭 시 도면 변경 처리 이벤트 */
		$("#floor").change(function() {
			var fn = $(this).val()

			$(".td_hover").css("background-color", "white");
			$(".o_status").empty();
			$(".o_floor").html(fn);

			$.ajax({
				url : "/room/change",
				type : "GET",
				data : ({
					o_floor : fn
				}),
				cache : false,
				success : function(data) {
					for (let i = 0; i < data.length; i++) {
						for (let m = 1; m < 11; m++) {
							if (($("#o_room" + m).html() == data[i].o_room) && (data[i].o_status == 2)) {
								$("#o_status" + m).html("(점검중)");
							} else if (($("#o_room" + m).html() == data[i].o_room) && (data[i].r_endDate >= getDateFormat(sysdate))
									&& (!(data[i].r_status == 3) || (data[i].r_status == 4) || (data[i].r_status == 5))) {
								$("#o_status" + m).html("~" + data[i].r_endDate);
								$("#o_status" + m).parent(".td_hover").css("background-color", "rgb(125, 140, 255, 0.4)");
							}
						}
					}
				}
			});
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
	<div>
		<h2>호실 현황</h2>
		<select id="floor">
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

				<td colspan="2" rowspan="3">층을 변경하셔서 볼 수 있습니다</td>

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
	</div>
</body>
</html>