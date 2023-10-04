<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<c:choose>
    <c:when test="${isReply}">
    <h3>답글 작성</h3>
    </c:when>
    <c:otherwise>
      <div class="container w-600">
        <div class="row">
            <h2>게시글 작성</h2>
        </div>
    </c:otherwise>
</c:choose>

<form action="write" method="post" autocomplete="off">
<%-- 답글일 때만 추가 정보를 전송--%> 
    <c:if test="${isReply}">
    <input type="hidden" name="boardParent" value="${originDto.boardNo}">
    </c:if>

    <c:choose>
    <c:when test="${isReply}">
         <div class="row left">
            <label>제목</label>
            <input type="text" name="boardTitle" class="form-input w-100">
        </div>
    </c:when>
    <c:otherwise>
         <div class="row left">
            <label>제목</label>
            <input type="text" name="boardTitle" class="form-input w-100">
        </div>
    </c:otherwise>
</c:choose>
        <div class="row left">
            <label>내용</label>
            <textarea name="boardContent" class="form-input fixed w-100"></textarea>
        </div>
        <div class="row right">
            <button class="btn btn-positive">글쓰기</button>
            <a href="list" class="btn">목록</a></div>
    </form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
신예지 — 2023.09.05. 오후 12:59
전체복사좀용
예슬님
컨트롤에이
박예슬 — 2023.09.05. 오후 1:00
<script>

        window.addEventListener("load", function(){
            var buttonList = document.querySelectorAll(".btn")

            //반복문으로 이벤트 설정 및 실행 코드 작성
            for(var i=0; i<buttonList.length; i++){
                buttonList[i].addEventListener("click", function(){
                    //this == 클릭한 버튼(주인공)
                    var target = document.querySelector(".target");
                    // target.style.color = buttonList[i].dataset.color; //오답(여기서 [i]는 사용불가)
                    target.style.color = this.dataset.color; 
                });
            };

            // buttonList[0].addEventListener("click", function(){
            //     var target = document.querySelector(".target");
            //     target.style.color = "black";
            // });
            // buttonList[1].addEventListener("click", function(){
            //     var target = document.querySelector(".target");
            //     target.style.color = "blue";
            // });
            // buttonList[2].addEventListener("click", function(){
            //     var target = document.querySelector(".target");
            //     target.style.color = "red";
            // });
        });

    </script>
<body>
    <div class="container w-500">
    <div class="row">
        <h1>색상 변경 예제</h1>
    </div>
    <div class="row">
    <h1 class="target">Hello Javascript!</h1>
    </div>
    <div class="row">
    <button class="btn" data-color="black">검정</button>
    <button class="btn" data-color="blue">파랑</button>
    <button class="btn" data-color="red">빨강</button>
</div>
    <div class="row">
    <button class="btn" data-color="yellow">노랑</button>
    <button class="btn" data-color="#cdcdcd">그레이</button>
    <button class="btn" data-color="green">그린</button>
</div>
</div>
</body>
박예슬 — 2023.09.07. 오후 5:15
document.querySelector("[name=memberPost]").value = data.zonecode;
                document.querySelector("[name=memberAddr1]").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.querySelector("[name=memberAddr2]").focus();
박예슬 — 오늘 오전 9:28
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

확장
message.txt
11KB
﻿
박예슬
박예슬#6455
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

input[type="checkbox"].custom-checkbox {
	display: none;
margin-left: 5px;
}

.custom-checkbox-label {
	cursor: pointer;
	display: inline-block;
}

.custom-checkbox-label i {
	font-size: 20px; /* 아이콘 크기 조절 */
	color: #360a01; /* 아이콘 색상 설정 */
}

/* 체크된 상태일 때 아이콘 변경 */
input[type="checkbox"].custom-checkbox:checked+.custom-checkbox-label i
	{
	color: #952323; /* 체크된 상태의 아이콘 색상 설정 */
}
/* 체크된 상태일 때 이미지 변경 */
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script>
	$(function() {
		// 좌석 번호에 change 이벤트 발생시 수행하는 함수
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
								return; // 비어있으면 리턴

							var params = new URLSearchParams(location.search);
							// url에 있는 matchNo를 저장
							var matchNo = params.get("matchNo");

							$
									.ajax({
										url : "http://localhost:8080/reservation/selectSeatAreaZone",
										method : "post",
										data : {
											seatAreaNo : seatAreaNo,
											matchNo : matchNo
										},
										// 성공시
										success : function(response) {
											console.log(response);
											// 마지막 번호 정보
											var lastSeat = response[response.length - 1];
											// 마지막 컬럼 값
											var numCols = lastSeat.seatCol;
											// 마지막 로우 값
											var numRows = lastSeat.seatRow;

											// 이름을 checkboxcontainer로 저장
											var checkboxContainer = $("#seat-checkbox");
											// 체크박스의 내용을 초기화
											checkboxContainer.empty();
											// 티켓을 초기화
											var ticketCount = 0;
											// 티켓의 요소를 엘리멘트로 저장
											var ticketCountElement = $("#ticket-count-value");
											// for 문을 사용하여 checkbox를 자동으로 생성
											for (var i = 0; i < numRows; i++) {
												for (var j = 0; j < numCols; j++) {
													// 배열에 있는 요소를 가져오기 위한 index
													var index = i * numCols + j;
													// 응답에서 status값 저장
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
																	"custom-checkbox")
															

													var icon = $("<i>")
															.addClass(
																	"fa-solid fa-couch");

													var iconLabel = $("<label>")
															.addClass(
																	"custom-checkbox-label")
															.append(checkbox) // 체크박스를 라벨에 추가
															.append(icon);
													// 빈칸 생성
													if (j % 4 == 0) {
														var blank = $("<span>")
																.addClass(
																		"blank")
																.text("　");
														checkboxContainer
																.append(blank);
													}
													// seatStatus 정보를 출력
													var label = $("<label>")
															.addClass(
																	"seat-label");

													// 라벨 아래에 좌석 번호와 상태 표시
													label.append((i + 1) + "-"
															+ (j + 1));
													// 만약에 seatStatus가 N이라면 선택이 되어있고 disable로 처리
													if (response[index].seatStatus == "N") {
														checkbox
																.attr(
																		"checked",
																		true)
																.attr(
																		"disabled",
																		true);
														icon.css("color", "#952323");
													}

													// 반복문에서 col row를 생성했으므로 for문안에 있어야 함
													// 체크박스 4개 이상 제약 조건
													checkbox
															.change(function() {
																var currentCheckbox = $(this);
																var currentIcon = currentCheckbox
																		.parent()
																		.find(
																				"i");

																if (currentCheckbox
																		.is(":checked")) {
																	if (ticketCount >= 4) {
																		currentCheckbox
																				.prop(
																						"checked",
																						false);
																		alert("최대 4개 구매 가능합니다!");
																	} else {
																		ticketCount++;
																	}
																	// 체크된 상태일 때 아이콘 색상 변경
																	currentIcon
																			.css(
																					"color",
																					"#952323");
																} else {
																	ticketCount--;
																	// 체크 해제된 상태일 때 아이콘 색상 원래 색상으로 변경
																	currentIcon
																			.css(
																					"color",
																					"#360a01");
																}
																// 티켓 카운트 요소가 있는 곳에 text로 티켓의 수를 출력
																ticketCountElement
																		.text(ticketCount);
																// 티켓이라는 변수에 id가 reservationTicket인 곳에 value를 ticketcount로 설정
																var ticket = $(
																		"#reservationTicket")
																		.attr(
																				"value",
																				ticketCount);
															});

													// 좌석과 seatStatus를 checkboxContainer에 추가
													checkboxContainer
															.append(iconLabel);

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
message.txt
11KB