<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		$("#o_floor").html("${o_floor}")

		// 저장 버튼 클릭 시 처리 이벤트
		$("#roomInsertBtn").click(function() {
			// 입력값 체크
			if (!chkSubmit($("#o_price"), "가격을")) {
				return;
			} else if ($("#thumbfile").val() == "") {
				alert("썸네일 이미지는 필수로 첨부해야 합니다.");
				return;
			} else {
				if (!chkFile($("#thumbfile"))) {
					return;
				}
				
				var result = confirm("입력한 정보로 호실을 등록하시겠습니까?");
				if (result){
					$("#form").attr({
						"method" : "POST",
						"action" : "/adminRoom/roomInsert"
					})
					$("#form").submit();
					alert("호실 등록 성공!");
					window.opener.location.reload();
					window.close();
				}
			}
		})
	})
</script>
<style type="text/css">
h2 {
	font-weight: bold;
}
th {
	font-weight: bold;
}

th, td {
	text-align: center;
}

#o_price {
	width: 200px;
}
</style>
</head>
<body>
	<h2>${o_floor }${o_room }<span>호 등록</span>
	</h2>
	<hr />
	<div>
		<form id="form" enctype="multipart/form-data">
			<%-- 층과 호실 번호는 hidden으로 보냄 --%>
			<input type="hidden" name="o_floor" value="${o_floor }"> <input
				type="hidden" name="o_room" value="${o_room }">
		<table class="table table-striped">
			<tr>
				<th>수용 가능 인원수</th>
				<td><select name="o_member">
						<option value="1">1명</option>
						<option value="2">2명</option>
						<option value="3">3명</option>
						<option value="4">4명</option>
						<option value="6">6명</option>
						<option value="7">7명</option>
				</select></td>
			</tr>
			<tr>
				<th>기본 정보(창측/내측)</th>
				<td><select name="o_info">
						<option value="1">창측</option>
						<option value="2">내측</option>
				</select></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" id="o_price" name="o_price"
					placeholder="가격을 입력하세요(단위 : 원)" /></td>
			</tr>
			<tr>
				<th>사진 첨부</th>
				<td>
					<h5 style="color: red;">(1개 이상 첨부해주세요!)</h5> <input type="file"
					id="thumbfile" name="thumbfile">
					<hr /> <input type="file" name="file1">
					<hr /> <input type="file" name="file2">
					<hr /> <input type="file" name="file3">
					<hr />
				</td>
			</tr>
			<tr>
				<th>호실 상태</th>
				<td><select name="o_status">
						<option value="1">사용 가능</option>
						<option value="2">사용 불가능</option>
				</select> <br /></td>
			</tr>
		</table>
		</form>
	</div>
	<div class="text-center">
		<input type="button" value="저장" id="roomInsertBtn" class="btn">
		<input type="button" value="닫기" onClick="window.close()" class="btn">
	</div>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>