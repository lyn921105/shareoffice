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
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
</head>
<body>
	<h2>상담 / 이용률 통계</h2>
	<hr />
	<div class="container">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#consult">상담</a></li>
			<li><a data-toggle="tab" href="#use">이용률</a>
		</ul>
		<div class="tab-content">
			<div id="consult" class="tab-pane fade in active">
				<canvas id="consultChart" width="400" height="400"></canvas>
			</div>
			<div id="use" class="tab-pane fade">
				<canvas id="useChart" width="400" height="400"></canvas>
			</div>
		</div>
	</div>
</body>
<script>

	// 상담 라인차트
	var ctx = document.getElementById("consultChart");
	var consultChart = new Chart(ctx, {
		type : 'line',
		data : {
			labels : [ <c:forEach items="${lineChart }" var="item" varStatus="status">
							<c:out value="${item.v_time}"/> + '시',
						</c:forEach> ],
			datasets : [ {
				label : '인원수',
				data : [<c:forEach items="${lineChart }" var="item" varStatus="status">
					<c:out value="${item.v_count}"/>,
				</c:forEach>],
				backgroundColor : [ 'rgba(180, 242, 225, 0.2)'],
				borderColor : [ 'rgba(180, 242, 225, 1)',
						'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)', 'rgba(255, 221, 21, 1)' ],
				borderWidth : 1
			} ]
		},
		options : {
			title : {
				display : true,
				fontSize : '16',
				fontColor : "FFFFFF",
				text : '전월 상담 인원수'
			},
			responsive : false,
			scales : {
				yAxes : [ {
					ticks : {
						beginAtZero : true
					}
				} ]
			}
		}
	});

	// 이용률 파이차트
	var btx = document.getElementById("useChart");
	var useChart = new Chart(btx, {
		type : 'pie',
		data : {
			labels : [ <c:forEach items="${pieChart }" var="item" varStatus="status">
			<c:out value="${item.r_member}"/> + "인실",
			</c:forEach> ],
			datasets : [ {
				data : [ <c:forEach items="${pieChart }" var="item" varStatus="status">
				<c:out value="${item.r_count}"/>,
				</c:forEach> ],
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)' ],
				borderColor : [ 'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)' ],
				borderWidth : 1
			}]
		},
		options : {
			title : {
				display : true,
				fontSize : '16',
				fontColor : "FFFFFF",
				text : '전월 인원별 호실 이용률'
			},
			responsive : false,
			scales : {
				xAxes : [ {
					display : false
				} ],
				yAxes : [ {
					display : false,
					ticks : {
						beginAtZero : true
					}
				} ]
			}
		}
	})
</script>
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</html>