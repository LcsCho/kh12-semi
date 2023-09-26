<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		// 체크박스가 변경될 때마다 호출되는 이벤트 핸들러
		$("input[type='checkbox']").change(function() {
			// 선택한 체크박스 값 가져오기
			var selectedValues = [];
			$("input[type='checkbox']:checked").each(function() {
				selectedValues.push($(this).val());
			});

			// 선택한 값을 서버로 전송 (Ajax 요청)
			$.ajax({
				type : "POST",
				url : "your_server_url", // 서버 URL을 여기에 입력
				data : {
					selectedValues : selectedValues
				},
				success : function(data) {
					// 서버로부터 받은 데이터를 출력할 요소에 추가
					$("#seatList").html(data);
				}
			});
		});
	});
</script>

<head>
<title>매치 예약</title>
</head>
<body>
	<div class="row">
		<form action="insert" method="post">
			<h1>매치 예약</h1>
			<!-- matchNo 값을 출력합니다. -->
			<p>
				경기장 이름: <span>${reservationVo.seatAreaPrice}</span>
			</p>
			<p>
				경기장 번호: <span>${reservationVo.seatAreaNo}</span>
			</p>
			<p>
				매치 번호: <span>${matchNo}</span>
			</p>
			<p>
				멤버아이디: <span></span>${name}</p>
			<input type="hidden" id="homeTeam" name="homeTeam" value="${matchNo}"><br>
			<input type="hidden" id="awayTeam" name="awayTeam" value="${matchNo}"><br>


			<input type="hidden" id="seatNo" name="matchNo" value="${matchNo}"><br>

			<c:forEach var="reservationVo" items="${list}">
				<div class="row">
					<input type="checkbox" name="seatAreaNo"
						value="${reservationVo.seatAreaNo}">${reservationVo.seatAreaZone}
					| ${reservationVo.seatAreaPrice}
				</div>
			</c:forEach>
			

			<label for="seatNo">좌석 번호:</label> <input type="text" id="seatNo"
				name="seatNo" required><br> <label for="seatAreaNo">좌석
				구역 번호:</label> <label for="reservationTicket">티켓 수:</label> <input
				type="text" id="reservationTicket" name="reservationTicket" required><br>

			<button type="submit">등록</button>
		</form>
	</div>

</body>
</html>





<%--<style>
			<c:forEach var="reservationVo" items="${list}">
				<div class="row">
					<select name="seatAreaNo"> 
					<option value="${reservationVo.seatNo}">${reservationVo.seatNo}</option>	
					</select>
				</div>
			</c:forEach>
.boxborder {
	box-shadow: 0px 0px 0px 1px #2d3436;
	padding: 1em;
}

.clickseat {
	height: 550px;
}

.seatreservation {
	padding: 5px;
	font-weight: bold;
	font-size: 16px;
	background-color: #360a01;
	color: white;
}

.float-container>.float-left {
	float: left;
	width: 70%;
	/* 왼쪽 영역이 70%로 설정 */
}

.float-container>.float-right {
	float: right;
	width: 30%;
	/* 오른쪽 영역이 30%로 설정 */
}

.image-container img {
	max-width: 100%;
	height: auto;
}

.checkbox {
	display: flex;
	align-items: center;
	/* 세로 중앙 정렬 */
	margin-bottom: 2.27%;
}

.btn {
	background-color: #360a01;
	color: white;
	width: 120px;
}

.seatrow {
	margin: 0.1em;
}
</style>

<!-- javascript 작성 공간 -->
<script>
	//     $(function(){

	//     for(var i = 0; i <120; i ++) {
	//         var input = document.createElement("input");
	//         input.type = "checkbox";
	//         input.name= "";
	//         input.value="";
	//         $(".inputzone").append(input);
	//     }
	// });


</script>
</head>



<form class="" action="" method="post" autocomplete="off">

	<div class="container w-600">


		<!-- 전체 진행단계를 알 수 있는 게이지 출력 -->
		<!-- <div class="row">
                <div class="progressbar">
                    <div class="guage"></div>
                </div>
            </div> -->

		<!-- 1단계 : 예매하기 -->
		<div class="row page">
			<div class="row seatreservation">
				<h2 class="left ms-10">예매하기</h2>
			</div>

			<!-- 왼쪽에 이미지를 추가하는 부분 (col 사용) -->
			<div class="float-container">
				<div class="float-left">
					<div class="image-container boxborder">
						<img src="/images/seatimage.png">
					</div>
				</div>


				<!-- 체크박스를 사용하여 구역 선택 -->
				<div class="boxborder">
					<label for="seatAreaZone">구역 선택:</label>
					<div class="checkbox">
						<c:forEach var="reservationVo" items="${list}">
							<div class="row">
								<input type="checkbox" name="seatAreaNo"
									value="${reservationVo.seatAreaNo}">${reservationVo.seatAreaZone}
								| ${reservationVo.seatAreaPrice}
							</div>
						</c:forEach>
					</div>
				</div>

			</div>
		</div>
		
		
		<c:forEach var="i" begin="${vo.begin}" end="${vo.end}" step="1">
		<input type="checkbox" value="${reservationVo.seatAreaZone}">
		</c:forEach>
		
		
		
		
		
		<div class="row right">
			<button type="button" class="btn btn-prev">이전단계</button>
			<button type="button" class="btn btn-next">다음단계</button>
		</div>
	</div>
	<!-- 2단계 : 좌석선택 -->
	<div class="row page">
		<div class="row seatreservation">
			<h2 class="left ms-10">좌석선택</h2>
		</div>
		<div class="row float-container boxborder">

			<div class="float-left clickseat boxborder">
				<div class="row"
					style="height: 30%; background-color: green; color: white; font-weight: bold; display: flex; justify-content: center; align-items: center;">
					GROUND</div>

				<div class="row">A zone</div>
				<div class="inputzone"></div>


			</div>

			<div class="float-right clickseat">
				<div style="height: 50%;">
					<img src="./image/seatimage.png" style="max-block-size: 45%;"
						class="mt-10 ms-20">
				</div>
				<div class="boxborder ms-10">선택좌석(0석)</div>
				<div>
					선택된 좌석: <span id="selectedSeats"></span>
				</div>
			</div>
		</div>

		<div class="row right">
			<button type="button" class="btn btn-prev">이전단계</button>
			<button type="button" class="btn btn-next">다음단계</button>
		</div>
	</div>

	<!-- 3단계 : 예매완료 -->
	<div class="row page">
		<div class="row">
			<h2>3단계 : 예매완료</h2>
		</div>


		<div class="row right">
			<button type="button" class="btn btn-prev">이전단계</button>
			<button type="button" class="btn btn-next">다음단계</button>
		</div>
	</div>

	<!-- 5단계 : 주소 -->
	<div class="row page">
		<div class="row right">
			<button type="button" class="btn btn-prev">이전단계</button>
			<button type="button" class="btn btn-next">다음단계</button>
			<button type="submit" class="btn btn-positive">가입하기</button>
		</div>
	</div>

	</div>

</form> --%>







<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>