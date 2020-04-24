<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#o_floor").html("${o_floor}")

		// 저장 버튼 클릭 시 처리 이벤트
		$("#roomInsertBtn").click(function() {
			// 입력값 체크

			$("#form").attr({
				"method" : "POST",
				"action" : "/adminRoom/roomInsert"
			})
			$("#form").submit();
			alert("호실 등록 성공");
			window.opener.location.reload();
			window.close();
		})

	})
</script>
</head>
<body>
	<h1>${o_floor }${o_room }호 등록</h1>
	<div>
		<form id="form" enctype="multipart/form-data">
			<%-- 층과 호실 번호는 hidden으로 보냄 --%>
			<input type="hidden" name="o_floor" value="${o_floor }"> <input
				type="hidden" name="o_room" value="${o_room }">
			<h3>수용 가능 인원수</h3>
			<select name="o_member">
				<option value="1">1명</option>
				<option value="2">2명</option>
				<option value="3">3명</option>
				<option value="4">4명</option>
				<option value="6">6명</option>
				<option value="7">7명</option>
			</select>
			<h3>기본 정보(창측/내측)</h3>
			<select name="o_info">
				<option value="1">창측</option>
				<option value="2">내측</option>
			</select>
			<h3>가격</h3>
			<input type="text" name="o_price" placeholder="가격을 입력하세요(단위 : 원)" />
			<h3>사진 첨부</h3>
			<h2>(1개 이상 첨부해주세요!)</h2>
			<input type="file" name="thumbfile"><br />
			<input type="file" name="file1"><br />
			<input type="file" name="file2"><br />
			<input type="file" name="file3"><br />

			<h3>호실 상태</h3>
			<select name="o_status">
				<option value="1">사용 가능</option>
				<option value="2">사용 불가능</option>
			</select> <br />
		</form>
	</div>
	<div>
		<input type="button" value="저장" id="roomInsertBtn"> <input
			type="button" value="닫기" onClick="window.close()">
	</div>
</body>
</html>