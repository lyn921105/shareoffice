<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {

		// 첫 호실 현황 페이지 진입시 default값인 1층의 상태 정보 불러오기
		<c:forEach items="${roomMain}" var="item">
		for (let m = 0; m < 10; m++) {
			if ($("#o_room" + m).html() == "${item.o_room}") {
				if ("${item.o_status}" == 1) {
					$("#o_status" + m).html("사용가능")
				} else {
					$("#o_status" + m).html("사용불가능")
				}
				$("#o_reserve" + m).val("${item.o_reserve}")
				if ("${item.o_reserve}" == 1) {
					$("#o_status" + m).parent("td").css("background-color",
							"rgb(125, 140, 255, 0.4)");
				}
			}
		}
		</c:forEach>

		// 층 클릭 시 도면 변경 처리 이벤트
		$("#floor")
				.change(
						function() {

							var fn = $(this).val()

							$(".o_status").empty();
							$(".o_floor").html(fn);
							$(".o_floor").parent("td").css("background-color",
									"white");
							$(".o_reserve").val("");

							$
									.ajax({
										url : "/adminRoom/change",
										type : "GET",
										data : ({
											o_floor : fn
										}),
										cache : false,
										success : function(data) {

											for (i = 0; i < data.length; i++) {
												for (m = 0; m < 10; m++) {

													if ($("#o_room" + m).html() == data[i].o_room) {
														$("#o_status" + m)
																.html(
																		data[i].o_status);
														$("#o_reserve" + m)
																.val(
																		data[i].o_reserve);
														if (data[i].o_reserve == 1) {
															$("#o_status" + m)
																	.parent(
																			"td")
																	.css(
																			"background-color",
																			"rgb(125, 140, 255, 0.4)");
														}
													}
												}
											}
											for (var i = 0; i < 10; i++) {
												if (i < 10) {
													var x = "0" + i;
												} else {
													var x = String(i);
												}
												if ($("#o_status" + i).html() == 1) {
													$("#o_status" + i).html(
															"사용가능")
												} else if ($("#o_status" + i)
														.html() == 2) {
													$("#o_status" + i).html(
															"사용불가능")
												}
											}
										}
									})
						})

		// 호실 버튼 클릭 시 호실 등록 팝업창 열기
		$(".roomInsert").click(
				function() {
					var o_res = $(this).children(".o_reserve").val();

					if (o_res == 1) {
						alert("현재 사용중인 호실의 정보 수정은 불가능합니다.");
						return;
					} else {
						var o_floor = $("#floor").val();
						var o_room = $(this).children('.o_room').html();

						var openResister = window.open(
								"/adminRoom/resister?o_floor=" + o_floor
										+ "&o_room=" + o_room, "roomresister",
								"width=500, height=700");
						openResister.focus();
					}
				})
	})
</script>
<style type="text/css">
table {
	width: 500px;
	text-align: center;
	font-weight : bold;
}
table, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
}
td {
width : 120px;
height : 60px;
padding : 10px;
}
</style>
</head>
<body>
	<h2>호실 현황</h2>
		<hr/>
		<select id="floor">
			<option value="1">1층</option>
			<option value="2">2층</option>
			<option value="3">3층</option>
			<option value="4">4층</option>
			<option value="5">5층</option>
			<option value="6">6층</option>
			<option value="7">7층</option>
		</select>
		<table>
			<tr>
				<td class="roomInsert"><input type="hidden" class="o_reserve"
					id="o_reserve3"><span id="o_floor3" class="o_floor">1</span><span
					id="o_room3" class="o_room">04</span><br /> <span id="o_status3"
					class="o_status"></span></td>
				<td class="roomInsert"><input type="hidden" class="o_reserve"
					id="o_reserve4"><span id="o_floor4" class="o_floor">1</span><span id="o_room4" class="o_room">05</span><br /> <span id="o_status4"
					class="o_status"></span></td>
				<td class="roomInsert"><input type="hidden" class="o_reserve"
					id="o_reserve5"><span id="o_floor5" class="o_floor">1</span><span id="o_room5" class="o_room">06</span><br /> <span id="o_status5"
					class="o_status"></span></td>
				<td class="roomInsert"><input type="hidden" class="o_reserve"
					id="o_reserve6"><span id="o_floor6" class="o_floor">1</span><span id="o_room6" class="o_room">07</span><br /> <span id="o_status6"
					class="o_status"></span></td>
			</tr>
			<tr>

				<td class="roomInsert"><input type="hidden" class="o_reserve"
					id="o_reserve2"><span id="o_floor2" class="o_floor">1</span><span id="o_room2" class="o_room">03</span><br /> <span id="o_status2"
					class="o_status"></span></td>

				<td colspan="2" rowspan="3">로비</td>

				<td class="roomInsert"><input type="hidden" class="o_reserve"
					id="o_reserve7"><span id="o_floor7" class="o_floor">1</span><span id="o_room7" class="o_room">08</span><br /> <span id="o_status7"
					class="o_status"></span></td>
			</tr>
			<tr>
				<td class="roomInsert"><input type="hidden" class="o_reserve"
					id="o_reserve1"><span id="o_floor1" class="o_floor">1</span><span id="o_room1" class="o_room">02</span><br /> <span id="o_status1"
					class="o_status"></span></td>
				<td class="roomInsert"><input type="hidden" class="o_reserve"
					id="o_reserve8"><span id="o_floor8" class="o_floor">1</span><span id="o_room8" class="o_room">09</span><br /> <span id="o_status8"
					class="o_status"></span></td>
			</tr>
			<tr>
				<td class="roomInsert"><input type="hidden" class="o_reserve"
					id="o_reserve0"><span id="o_floor0" class="o_floor">1</span><span id="o_room0" class="o_room">01</span><br /> <span id="o_status0"
					class="o_status"></span></td>
				<td class="roomInsert"><input type="hidden" class="o_reserve"
					id="o_reserve9"><span id="o_floor9" class="o_floor">1</span><span id="o_room9" class="o_room">10</span><br /> <span id="o_status9"
					class="o_status"></span></td>
			</tr>
		</table>
</body>
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</html>