<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {

		/* console.log($("#o_status" + 4).html())
		console.log('${roomMain.get(' + "04" +' ).getO_status()}');
		
		console.log('${roomMain.get("04").getO_status()}')
		
		
		for (i = 1; i<11; i++){
			if (i < 10){
				var x = "0" + i;
			} else {
				var x = String(i);
			}
			
			$("#o_status" + i).html()
		} */

		// 첫 호실 현황 페이지 진입시 default값인 1층의 상태 정보 불러오기
		$("#o_status1").html('${roomMain.get("01").getO_status()}');
		$("#o_status2").html('${roomMain.get("02").getO_status()}');
		$("#o_status3").html('${roomMain.get("03").getO_status()}');
		$("#o_status4").html('${roomMain.get("04").getO_status()}');
		$("#o_status5").html('${roomMain.get("05").getO_status()}');
		$("#o_status6").html('${roomMain.get("06").getO_status()}');
		$("#o_status7").html('${roomMain.get("07").getO_status()}');
		$("#o_status8").html('${roomMain.get("08").getO_status()}');
		$("#o_status9").html('${roomMain.get("09").getO_status()}');
		$("#o_status10").html('${roomMain.get("10").getO_status()}');

		/* 층 클릭 시 도면 변경 처리 이벤트 */
		$("#floor").change(function() {

			var fn = $(this).val()

			$(".o_status").empty();
			$(".o_floor").html(fn);

			$.ajax({
				url : "/adminRoom/change",
				type : "GET",
				data : ({
					o_floor : fn
				}),
				cache : false,
				success : function(data) {

					for (i = 0; i < data.length; i++) {
						for (m = 1; m < 11; m++) {

							if ($("#o_room" + m).html() == data[i].o_room) {

								$("#o_status" + m).html(data[i].o_status);
							}
						}
					}
				}
			})
		})

		// 호실 등록 버튼 클릭 시 호실 등록 팝업창 열기
		$("#resister").on(
				"click",
				function() {
					openResister = window.open("/adminRoom/resister",
							"roomresister", "width=500, height=700");
					
					openResister.focus();
					
					openResister.document.getElementById("cInput").value='111';

					openResister.document.getElementById("cInput").text($(
							"#o_floor" + 4).text()
							+ $("#o_room" + 4).text());

					
				})
				$("#bt").on("click", function(){
					openResister.document.getElementById("cInput").value="111";
				})

	})
</script>
<style type="text/css">
table {
	width: 50%;
	text-align: center;
}

table, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
</head>

<body>
	<h1 id="resister">클릭</h1>
	<form id="form">
	<input type="hidden" id="hidden" value="123">
	</form>
	<input type="button" id="bt" value="버튼"/>
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
		<table>
			<tr>
				<td id="rn4"><p id="o_floor4" class="o_floor">1</p>
					<p id="o_room4">04</p>
					<p id="o_status4" class="o_status"></p></td>
				<td id="rn5"><p id="o_floor5" class="o_floor">1</p>
					<p id="o_room5">05</p>
					<p id="o_status5" class="o_status"></p></td>
				<td id="rn6"><p id="o_floor6" class="o_floor">1</p>
					<p id="o_room6">06</p>
					<p id="o_status6" class="o_status"></p></td>
				<td id="rn7"><p id="o_floor7" class="o_floor">1</p>
					<p id="o_room7">07</p>
					<p id="o_status7" class="o_status"></p></td>
			</tr>
			<tr>

				<td id="rn3"><p id="o_floor3" class="o_floor">1</p>
					<p id="o_room3">03</p>
					<p id="o_status3" class="o_status"></p></td>

				<td colspan="2" rowspan="3">로비</td>

				<td id="rn8"><p id="o_floor8" class="o_floor">1</p>
					<p id="o_room8">08</p>
					<p id="o_status8" class="o_status"></p></td>
			</tr>
			<tr>
				<td id="rn2"><p id="o_floor2" class="o_floor">1</p>
					<p id="o_room2">02</p>
					<p id="o_status2" class="o_status"></p></td>
				<td id="rn9"><p id="o_floor9" class="o_floor">1</p>
					<p id="o_room9">09</p>
					<p id="o_status9" class="o_status"></p></td>
			</tr>
			<tr>
				<td id="rn1"><p id="o_floor1" class="o_floor">1</p>
					<p id="o_room1">01</p>
					<p id="o_status1" class="o_status"></p></td>
				<td id="rn10"><p id="o_floor10" class="o_floor">1</p>
					<p id="o_room10">10</p>
					<p id="o_status10" class="o_status"></p></td>
			</tr>
		</table>
	</div>
</body>
</html>