<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="text" id="cInput" value="test" /><h1>호실 등록</h1>
	<div>
		<form>
		<h3>수용 가능 인원수</h3>
		<select>
			<option value="1">1명</option>
			<option value="2">2명</option>
			<option value="3">3명</option>
			<option value="4">4명</option>
			<option value="6">6명</option>
			<option value="7">7명</option>
		</select>
		<h3>기본 정보(창측/내측)</h3>
		<select>
			<option value="창측">창측</option>
			<option value="내측">내측</option>
		</select>
		<h3>가격</h3>
		<input type="text" placeholder="가격을 입력하세요(단위 : 원)" />
		<h3>사진 첨부</h3>
		<input type="file" />
		<h3>호실 상태</h3>
		<select>
			<option value="사용">사용 가능</option>
			<option value="사용 불가">사용 불가능</option>
		</select>
		<br/>
		<input type="submit" value="등록" />
		<input type="reset" value="초기화" />
		<input type="button" value="닫기" onClick="window.close()">
		</form>
	</div>
</body>
</html>