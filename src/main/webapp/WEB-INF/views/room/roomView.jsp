<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호실 안내</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script>
$(function() {
	$(".room").click(function(){
		var img_thumb = $(this).children(".img_hide1").attr("src");
		var img_image1 = $(this).children(".img_hide2").attr("src");
		var img_image2 = $(this).children(".img_hide3").attr("src");
		var img_image3 = $(this).children(".img_hide4").attr("src");
		
		$("#img_thumb").attr("src", img_thumb);
		$("#img_image1").attr("src", img_image1);
		$("#img_image2").attr("src", img_image2);
		$("#img_image3").attr("src", img_image3);
		
		$("#report").html($(this).children(".report").val());
	});
});
</script>
</head>
<body>
	<div class="container">
		<div class="row content">
			<div class="col-xs-10 text-center">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<ul class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
					</ul>
					
					<div class="carousel-inner">
						<div class="item active" style="height: 330px;">
							<img id="img_thumb" class="img-rounded" src="/uploadStorage/room/${roomImage.o_thumb}">
							<div class="carousel-caption">
								<h3>미안하다 이거 보여주려고 어그로 끌었다..</h3>
								<p>나루토 사스케 싸움수준 ㄹㅇ 실화냐?<p>
							</div>
						</div>
						<div class="item" style="height: 330px;">
							<img id="img_image1" class="img-rounded" src="/uploadStorage/room/${roomImage.o_image1}">
							<div class="carousel-caption">
								<h3>진짜 세계관최강자들의 싸움이다..</h3>
								<p>그찐따같던 나루토가 맞나?<p>
							</div>
						</div>
						<div class="item" style="height: 330px;">
							<img id="img_image2" class="img-rounded" src="/uploadStorage/room/${roomImage.o_image2}">
							<div class="carousel-caption">
								<h3>진짜 나루토는 전설이다..</h3>
								<p>진짜옛날에 맨날나루토봘는데 왕같은 존재인 호카게 되서<p>
							</div>
						</div>
						<div class="item" style="height: 330px;">
							<img id="img_image3" class="img-rounded" src="/uploadStorage/room/${roomImage.o_image3}">
							<div class="carousel-caption">
								<h3>내용 겁나기네</h3>
								<p>그만 써야지<p>
							</div>
						</div>
					</div>
					
					<a class="left carousel-control" href="#myCarousel" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#myCarousel" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right"></span>
						<span class="sr-only">next</span>
					</a>
				</div>
			</div>
			
			<div class="col-xs-2 text-center">
				<c:forEach items="${roomView}" var="room">
					<div class="room">
						<input type="button" class="btn btn-default report" value="1${room.o_room}호">
						<img class="img_hide1 img-rounded" src="/uploadStorage/room/${rvo.o_thumb}" style="display: none;">
						<img class="img_hide2 img-rounded" src="/uploadStorage/room/${rvo.o_image1}" style="display: none;">
						<img class="img_hide3 img-rounded" src="/uploadStorage/room/${rvo.o_image2}" style="display: none;">
						<img class="img_hide4 img-rounded" src="/uploadStorage/room/${rvo.o_image3}" style="display: none;">
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="form-control text-center" id="report" style="margin-top: 8px;">
			<span>101호</span>
		</div>
	</div>
</body>
</html>