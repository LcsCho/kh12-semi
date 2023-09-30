<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<html>

<head>
<title>매치 예약</title>
<style>
.custom-checkbox {
	padding: 0; /* 여기에서 0으로 변경 */
	margin: 20; /* 오타 수정: margine -> margin */
	background-color: yellow; /* 배경색을 노란색으로 지정 */
}

.seat-label {
	position: relative;
	top: -13px;
	left: -22px
}

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
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script>
	$(function() {

		//좌석 번호에 change 이벤트 발생시 수행하는 함수
		$("[name=seatAreaNo]")
				.on(
						"input",
						function() {
							if (!$(this).prop("checked")) {
								// 체크박스가 해제된 경우, 모든 라디오 버튼 선택 해제
								$("[name=seatAreaNo]").prop("checked", false);
							}
							var seatAreaNo = $(this).val();
							if (seatAreaNo.length == 0)
								return;
							//비어있으면 리턴

							var params = new URLSearchParams(location.search);
							//url에 있는 matchNo를 저장
							var matchNo = params.get("matchNo");

							$
									.ajax({
										url : "http://localhost:8080/reservation/selectSeatAreaZone",
										method : "post",
										data : {
											seatAreaNo : seatAreaNo,
											matchNo : matchNo
										},
										//성공시
										success : function(response) {
											console.log(response);
											//마지막 번호 정보
											var lastSeat = response[response.length - 1];
											//마지막 컬럼 값
											var numCols = lastSeat.seatCol;
											//마지막 로우 값
											var numRows = lastSeat.seatRow;

											//이름을 checkboxcontainer로 저장
											var checkboxContainer = $("#seat-checkbox");
											//체크박스의 내용을 초기화
											checkboxContainer.empty();
											//티켓을 초기화
											var ticketCount = 0;
											//티켓의 요소를 엘리멘트로 저장
											var ticketCountElement = $("#ticket-count-value");
											//for 문을 사용하여 checkbox를 자동으로 생성
											for (var i = 0; i < numRows; i++) {
												for (var j = 0; j < numCols; j++) {
													//배열에 있는 요소를 가져오기 위한 index
													var index = i * numCols + j;
													//응답에서 status값 저장
													var seatStatus = response[index].seatStatus;
													//
													var checkbox = $("<input>")
															.attr("type",
																	"checkbox")
															.attr(
																	"value",
																	response[index].seatNo)
															.attr("name",
																	"seatNo")
															.addClass(
																	"custom-checkbox");
													//빈칸 생성
													if (j % 4 == 0) {
														var blank = $("<span>")
																.addClass(
																		"blank")
																.text("　　　");
														checkboxContainer
																.append(blank);
													}
													// seatStatus 정보를 출력
													var label = $("<label>")
															.addClass(
																	"seat-label");

													// 라벨 아래에 좌석 번호와 상태 표시
													label.append((i + 1) + "-"
															+ (j + 1)) //만약에 seatStatus가 N이라면 선택이 되어있고 disable로 처리
													if (response[index].seatStatus == "N") {
														checkbox
																.attr(
																		"checked",
																		true)
																.attr(
																		"disabled",
																		true);
													}

													//반복문에서 col row를 생성했으므로 for문안에 있어야 함
													//체크박스 4개 이상 제약 조건
													checkbox
															.change(function() {
																if ($(this)
																		.is(
																				":checked")) {
																	if (ticketCount >= 4) {
																		alert("최대 4개 구매 가능합니다!");
																		$(this)
																				.prop(
																						"checked",
																						false)
																	} else {
																		ticketCount++;
																	}

																} else {
																	ticketCount--;
																}

																//티켓 카운트 요소가있는 곳에 text로 티켓의 수를 출력
																ticketCountElement
																		.text(ticketCount);
																//티켓이라는 변수에 id가 reservationTicket인 곳에 value를 ticketcount 로 설정
																var ticket = $(
																		"#reservationTicket")
																		.attr(
																				"value",
																				ticketCount);
																
																
																
															});

													// 좌석과 seatStatus를 checkboxContainer에 추가
													checkboxContainer
															.append(checkbox);

													checkboxContainer
															.append(label);

												}
												checkboxContainer
														.append("<br><br>");
											}
										},
									});
						});

	});
</script>


</head>

<body>
	<div class="row">
		<form id="reservationForm" action="insert" method="post"
			enctype="multipart/form-data">
			<div class="container w-600">
				<h1>매치 예약</h1>
				<!-- matchNo 값을 출력합니다. -->
				<p>
					매치 번호: <span>${matchNo}</span>
				</p>
				<p>
					멤버아이디: <span>${name}</span>
				</p>
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
						<input type="hidden" id="homeTeam" name="homeTeam"
							value="${matchNo}"><br> <input type="hidden"
							id="awayTeam" name="awayTeam" value="${matchNo}"><br>
						<input type="hidden" id="matchNo" name="matchNo"
							value="${matchNo}"><br> <label>좌석 구역 선택:</label>
						<c:forEach var="reservationVo" items="${list}">
							<div class="row">
								<input class="btn" type="radio" name="seatAreaNo"
									id="selectedSeatArea" value="${reservationVo.seatAreaNo}">
								${reservationVo.seatAreaZone}
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="row right">
					<button type="button" class="btn btn-prev">이전단계</button>
					<button type="button" class="btn btn-next">다음단계</button>
				</div>
			</div>


			<%-- 2 페이지 --%>
			<div class="container w-1000">
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
							<label>좌석 번호:</label>
							<div class="mt-20" id="seat-checkbox"></div>
						</div>
						<div class="float-right clickseat">
							<div style="height: 50%;">
								<img src="/images/seatimage.png" style="max-block-size: 45%;"
									class="mt-10 ms-20">
							</div>
							<button type="button" class="refresh-button">새로고침</button>
							<div class="boxborder ms-10">
								선택된 좌석<label class="selected-seats"></label>
							</div>
							<div class="row left">
								<label class="selected-seats-list"></label>
							</div>
							<div id="ticket-count">
								티켓 수: <span id="ticket-count-value">0</span>
							</div>
							<input type="hidden" id="reservationTicket"
								name="reservationTicket">
						</div>
					</div>

					<div class="row right">
						<button type="button" class="btn btn-next">다음단계</button>
						<button type="button" class="btn btn-prev">이전단계</button>
						<button type="submit" class="btn">예매하기</button>
					</div>
				</div>
			</div>


		</form>
	</div>


</body>

</html>





<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>