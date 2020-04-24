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

		/* 첨부파일 이미지 보여주기 위한 속성 추가 */
		$("#thumbImage").attr({
			src : "/uploadStorage/room/${rvo.o_thumb}",
			width : "100px",
			height : "100px"
		})

		var image1 = "<c:out value='${rvo.o_image1}' />";
		if (image1 != "") {
			$("#Image1").attr({
				src : "/uploadStorage/room/${rvo.o_image1}",
				width : "100px",
				height : "100px"
			})
		}
		var image2 = "<c:out value='${rvo.o_image2}' />";
		if (image2 != "") {
		$("#Image2").attr({
			src : "/uploadStorage/room/${rvo.o_image2}",
			width : "100px",
			height : "100px"
		})
		}
		var image3 = "<c:out value='${rvo.o_image3}' />";
		if (image3 != "") {
		$("#Image3").attr({
			src : "/uploadStorage/room/${rvo.o_image3}",
			width : "100px",
			height : "100px"
		})
		}
		// 수정 버튼 클릭 시 처리 이벤트
		$("#roomUpdateBtn").click(function() {
			// 입력값 체크

			$("#form").attr({
				"method" : "POST",
				"action" : "/adminRoom/roomUpdate"
			})
			$("#form").submit();
			alert("호실 수정 성공")
			window.opener.location.reload();
			window.close();
		})

		// 삭제 버튼 클릭 시 처리 이벤트
		$("#roomDeleteBtn").click(function() {
			// 입력값 체크

			$("#form").attr({
				"method" : "POST",
				"action" : "/adminRoom/roomDelete"
			})
			$("#form").submit();
			alert("호실 삭제 성공")
			window.opener.location.reload();
			window.close();
		})

		// 파일 삭제 버튼 클릭 시 처리 이벤트
		$(".fileDelete").click(function() {
			var o_floor = "${o_floor }";
			var o_room = "${o_room}";
			var imageNum = $(this).next().val();
			console.log(imageNum)

			var o_image1 = "";
			var o_image2 = "";
			var o_image3 = "";

			switch (imageNum) {
			case '1':
				o_image1 = "${rvo.o_image1}"
				break;
			case '2':
				o_image2 = "${rvo.o_image2}"
				break;
			case '3':
				o_image3 = "${rvo.o_image3}"
				break;
			}

			console.log(o_floor);
			console.log(o_room);
			console.log(o_image1);
			console.log(o_image2);
			console.log(o_image3);

			$.ajax({
				url : "/adminRoom/fileDelete",
				type : "GET",
				data : ({
					o_floor : o_floor,
					o_room : o_room,
					o_image1 : o_image1,
					o_image2 : o_image2,
					o_image3 : o_image3,
				}),
				cache : false,
				success : function(data) {
					location.reload();
				}
			})

		})
	})
</script>
</head>

<body>
	<h1>${rvo.o_room }${rvo.getO_room() }</h1>
	<h1>${o_floor }${o_room }호정보변경및삭제</h1>
	<div>
		<form id="form" enctype="multipart/form-data">
			<%-- 층과 호실 번호는 hidden으로 보냄 --%>
			<input type="hidden" name="o_floor" value="${o_floor }"> <input
				type="hidden" name="o_room" value="${o_room }"> <input
				type="hidden" name="o_thumb" value="${rvo.o_thumb }"> <input
				type="hidden" name="o_image1" value="${rvo.o_image1 }"> <input
				type="hidden" name="o_image2" value="${rvo.o_image2 }"> <input
				type="hidden" name="o_image3" value="${rvo.o_image3 }">
			<h3>수용 가능 인원수</h3>

			<select name="o_member" id="o_member">
				<c:forEach var="i" begin="1" end="7">
					<c:if test="${i eq rvo.o_member }">
						<option value=${i } selected>${i }명</option>
					</c:if>
					<c:if test="${i ne rvo.o_member }">
						<option value=${i }>${i }명</option>
					</c:if>
				</c:forEach>
			</select>
			<h3>기본 정보(창측/내측)</h3>
			<select name="o_info">
				<c:forEach var="i" begin="1" end="2">
					<c:choose>
						<c:when test="${i eq 1 }">
							<c:set var="info" value="창측" />
						</c:when>
						<c:otherwise>
							<c:set var="info" value="내측" />
						</c:otherwise>
					</c:choose>
					<c:if test="${i eq rvo.o_info }">
						<option value=${i } selected>${info }</option>
					</c:if>
					<c:if test="${i ne rvo.o_info }">
						<option value=${i }>${info }</option>
					</c:if>
				</c:forEach>
			</select>
			<h3>가격</h3>
			<input type="text" name="o_price" value="${rvo.o_price }" />
			<h3>사진 첨부</h3>
			<h2>(1개 이상 첨부해주세요!)</h2>
			<br />

			<!-- 첨부파일 유무 확인 -->
			<h3>대표 이미지</h3>
			<img id="thumbImage">
			<p>파일 변경</p>
			<input type="file" name="thumbfile">
			<hr />
			<c:choose>
				<c:when test="${not empty rvo.o_image1 }">
					<h3>이미지 1</h3>
					<img id="Image1">
					<p>파일 변경</p>
					<input type="file" name="file1">
					<input type="button" value="파일 삭제" class="fileDelete">
					<input type="hidden" value="1">
					<hr />
				</c:when>
				<c:when test="${empty rvo.o_image1 }">
					<h3>이미지 1</h3>
					<input type="file" name="file1">
					<hr />
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${not empty rvo.o_image2 }">
					<h3>이미지 2</h3>
					<img id="Image2">
					<p>파일 변경</p>
					<input type="file" name="file2">
					<input type="button" value="파일 삭제" class="fileDelete">
					<input type="hidden" value="2">
					<hr />
				</c:when>
				<c:when test="${empty rvo.o_image2 }">
					<h3>이미지 2</h3>
					<input type="file" name="file2">
					<hr />
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${not empty rvo.o_image3 }">
					<h3>이미지 3</h3>
					<img id="Image3">
					<p>파일 변경</p>
					<input type="file" name="file3">
					<input type="button" value="파일 삭제" class="fileDelete">
					<input type="hidden" value="3">
					<hr />
				</c:when>
				<c:when test="${empty rvo.o_image3 }">
					<h3>이미지 3</h3>
					<input type="file" name="file3">
					<hr />
				</c:when>
			</c:choose>
			<h3>호실 상태</h3>
			<select name="o_status">
				<c:forEach var="i" begin="1" end="2">
					<c:choose>
						<c:when test="${i eq 1 }">
							<c:set var="status" value="사용가능" />
						</c:when>
						<c:otherwise>
							<c:set var="status" value="사용불가" />
						</c:otherwise>
					</c:choose>
					<c:if test="${i eq rvo.o_status }">
						<option value=${i } selected>${status }</option>
					</c:if>
					<c:if test="${i ne rvo.o_status }">
						<option value=${i }>${status }</option>
					</c:if>
				</c:forEach>
			</select> <br />
		</form>
	</div>
	<div>
		<input type="button" value="수정" id="roomUpdateBtn"> <input
			type="button" value="삭제" id="roomDeleteBtn"> <input
			type="button" value="닫기" onClick="window.close()">
	</div>
</body>
</html>