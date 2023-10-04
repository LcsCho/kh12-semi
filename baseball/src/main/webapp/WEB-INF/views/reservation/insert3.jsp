<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>




<head>
<title>매치 예약</title>
<style>
* {
	font-family: 'KBO-Dia-Gothic_light';
}

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
	overflow: auto;
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
	margin: -5px;
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
.selected-seats-list {
	white-space: pre-line;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script>
$(function () {
    var selectedSeats = []; // 선택된 좌석을 저장하는 배열
    var maxSeats = 4; // 최대 선택 가능한 좌석 수
    var ticketCount = 0;
    var currentPage = 0; // 현재 페이지 번호
    var totalSeatPrice = 0;


    // 페이지 초기화 함수
    function initPage() {
        $(".page").hide(); // 모든 페이지 숨김
        $(".page:eq(" + currentPage + ")").show(); // 현재 페이지 표시

        // 이전 버튼 숨기기
        if (currentPage === 0) {
            $(".btn-prev").hide();
        } else {
            $(".btn-prev").show();
        }

        // 다음 버튼 숨기기 (마지막 페이지에서만 표시)
        if (currentPage === $(".page").length - 1) {
            $(".btn-next").hide();
        } else {
            $(".btn-next").show();
        }
    }


    // 초기화 함수
    function resetSeats() {
        // 선택된 좌석 목록 초기화
        selectedSeats = [];

        // 선택된 좌석 수 초기화
        ticketCount = 0;

        // 초기화된 좌석 수 표시
        $("#ticket-count-value").text(0);

        // 선택된 좌석 목록 업데이트
        $(".selected-seats-list").text("");

        // 각 체크박스의 초기화 처리
        $(".custom-checkbox-label").each(function () {
            var currentCheckboxLabel = $(this);
            var isDisabled = currentCheckboxLabel.find("input[type=checkbox]").prop("disabled");

            if (isDisabled) {
                // 좌석이 비활성화 상태인 경우 초기화하지 않고 넘김
                return;
            }

            var currentCheckbox = currentCheckboxLabel.find("input[type=checkbox]");
            currentCheckbox.prop("checked", false); // 체크박스 선택 상태 초기화

            var currentIcon = currentCheckboxLabel.find("i");
            currentIcon.css("color", "#360a01");
        });

        console.log("초기화 완료"); // 디버깅용 로그
    }

    // 페이지 초기화
    initPage();

    $(".btn-next").click(function () {
        // 선택한 구역을 가져옴
        var selectedArea = $("input[name=seatAreaNo]:checked").val();

        // 구역이 선택되지 않았을 때 경고 메시지를 표시
        if (!selectedArea) {
            alert("구역을 선택해주세요.");
            $(".page:eq(0)").show();
            $(".page:eq(1)").hide();
            $(".page:eq(2)").hide();
            return;
        }

        // 구역이 선택되었을 때 2단계로 이동
        if (currentPage < $(".page").length - 1) {
            currentPage++;
            initPage(); // 페이지 업데이트
        }
    });

    // "이전" 버튼 클릭 시 이전 페이지로 이동
    $(".btn-prev").click(function () {
        if (currentPage > 0) {
            currentPage--;
            resetSeats();
        }
        initPage(); // 페이지 업데이트
    });

    // 좌석 구역 선택 시 이벤트 처리
    $("[name=seatAreaNo]").on("input", function () {
        if (!$(this).prop("checked")) {
            // 체크박스가 해제된 경우, 모든 라디오 버튼 선택 해제
            $("[name=seatAreaNo]").prop("checked", false);
        }

        selectedSeatAreaNo = $(this).val();
        if (selectedSeatAreaNo.length == 0) return; // 비어있으면 리턴

        var params = new URLSearchParams(location.search);
        // url에 있는 matchNo를 저장
        var matchNo = params.get("matchNo");

        // AJAX 요청을 통해 좌석 정보를 가져와 처리
        $.ajax({
            url: "http://localhost:8080/reservation/selectSeatAreaZone",
            method: "post",
            data: {
                seatAreaNo: selectedSeatAreaNo,
                matchNo: matchNo
            },
            // 성공시
            success: function (response) {
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

                // 티켓의 요소를 엘리멘트로 저장
                var ticketCountElement = $("#ticket-count-value");

                // for 문을 사용하여 checkbox를 자동으로 생성
                for (var i = 0; i < numRows; i++) {
                    for (var j = 0; j < numCols; j++) {
                        // 배열에 있는 요소를 가져오기 위한 index
                        var index = i * numCols + j;
                        // 응답에서 status값 저장
                        var seatStatus = response[index].seatStatus;
                        var seatArea = response[index].seatAreaZone;

                        var seatPrice = response[index].seatAreaPrice;

                        console.log(seatArea);
                        var checkbox = $("<input>")
                            .attr("type", "checkbox")
                            .attr("value", response[index].seatNo)
                            .attr("name", "seatNo")
                            .addClass("custom-checkbox");

                        var icon = $("<i>")
                            .addClass("fa-solid fa-couch");

                        var iconLabel = $("<label>")
                            .addClass("custom-checkbox-label")
                            .append(checkbox) // 체크박스를 라벨에 추가
                            .append(icon);

                        // 빈칸 생성
                        if (j % 4 == 0) {
                            var blank = $("<span>")
                                .addClass("blank")
                                .text("　");
                            checkboxContainer.append(blank);
                        }

                        // seatcolrow 정보를 출력
                        var label = $("<label>")
                            .addClass("seat-label");
                        // 라벨 아래에 좌석 번호와 상태 표시
                        label.append((i + 1) + "-" + (j + 1));

                        // 만약에 seatStatus가 N이라면 선택이 되어있고 disable로 처리
                        if (seatStatus == "N") {
                            checkbox
                                .prop("checked", true)
                                // attr 대신 prop를 사용하여 checked 속성을 설정
                                .attr("disabled", true);
                            icon.css("color", "#952323");
                        }

                        checkboxContainer.append(iconLabel);
                        checkboxContainer.append(label);

                        // 클로저를 사용하여 고유한 index, seatCol, seatRow 값을 갖도록 처리
                        (function (currentIndex, currentSeatCol, currentSeatRow) {
                            checkbox.on("change", function () {
                                var currentCheckbox = $(this);
                                var currentIcon = currentCheckbox.parent().find("i");

                                var seatName = currentCheckbox.val();

                                if (currentCheckbox.is(":checked")) {
                                    if (ticketCount >= maxSeats) {
                                        alert("최대 " + maxSeats + "개 구매 가능합니다!");
                                        currentCheckbox.prop("checked", false);
                                        return;
                                    } else {
                                        ticketCount++;
                                        totalSeatPrice += seatPrice;

                                        selectedSeats.push({
                                            row: currentSeatRow,
                                            col: currentSeatCol
                                        });
                                        console.log("좌석 선택됨: Row " + currentSeatRow + ", Col " + currentSeatCol);
                                        console.log("선택된 좌석 목록: " + JSON.stringify(selectedSeats));
                                    }

                                    // 체크된 상태일 때 아이콘 색상 변경
                                    currentIcon.css("color", "#952323");
                                } else {
                                    ticketCount--;
                                    totalSeatPrice -= seatPrice;

                                    // 체크 해제된 상태일 때 아이콘 색상 원래 색상으로 변경
                                    var indexToRemove = selectedSeats.findIndex(function (seat) {
                                        return seat.row === currentSeatRow && seat.col === currentSeatCol;
                                    });

                                    if (indexToRemove !== -1) {
                                        selectedSeats.splice(indexToRemove, 1);
                                    }

                                    currentIcon.css("color", "#360a01");
                                    console.log("좌석 선택 해제됨: Row " + currentSeatRow + ", Col " + currentSeatCol);
                                    console.log("선택된 좌석 목록: " + JSON.stringify(selectedSeats));
                                }

                                // 티켓 카운트 요소가 있는 곳에 text로 티켓의 수를 출력
                                ticketCountElement.text(ticketCount);
                                $("#totalPrice").text(totalSeatPrice + " 원");
                                $("#seat-area-zone").text(seatArea);

                                $("#reservationTicket").attr("value", ticketCount);
                                $(".selected-seats-list").text(selectedSeats.map(function (seat) {
                                    return "　" + seatArea + "-" + seat.row + "-" + seat.col;
                                }).join("\n"));
                            });
                        })(index, response[index].seatCol, response[index].seatRow);
                    }
                    checkboxContainer.append("<br><br>");
                }
            },
        });
    });
		// "초기화" 버튼 클릭 이벤트 처리
		$(".refresh-button").click(function() {
			console.log("새로고침 버튼 클릭"); // 디버깅용 로그

			// 좌석 초기화 함수 호출
			resetSeats();

			// 선택된 좌석 배열 초기화
			selectedSeats = [];

			// 선택된 좌석 수 초기화
			ticketCount = 0;
			
			totalSeatPrice = 0;
		});

		// "다음" 버튼 클릭 시 2단계에서 3단계로 이동 
		// 또는 좌석을 선택하지 않았을 때 2단계에 남아있도록 함
		$(".show-reservation-info-button").click(function() {
			// 선택한 구역과 좌석 정보 가져오기
			var selectedArea = $("input[name=seatAreaNo]:checked").val();
			var selectedSeats = $(".selected-seats-list").text();

			// 예매 정보를 표시할 엘리먼트에 정보를 채워 넣음
			$(".seatAreaNo").text(selectedArea);
			$(".seatNo").text(selectedSeats);
			$(".seatPrice").text(totalSeatPrice)

			if (selectedSeats.trim() === "") {
				alert("좌석을 선택해주세요!"); // 좌석을 선택하지 않았을 때 경고 메시지 표시
				$(".page:eq(1)").show();
				$(".page:eq(2)").hide();

				// "다음" 버튼 다시 표시
				$(".show-reservation-info-button").show();
			} else {
				// 3단계 페이지 표시
				$(".page:eq(2)").show();

				// "다음" 버튼 숨김
				$(".show-reservation-info-button").hide();
			}
		});
		$(".btn-primary").click(function() {
			// 사용자가 확인 버튼을 클릭한 경우에만 확인 대화상자를 표시
			if (confirm("예매를 진행 하시겠습니까?")) {
				// 확인 버튼을 클릭한 경우의 동작을 여기에 추가
				// 예를 들어 예매를 진행하는 코드를 추가할 수 있습니다.
				alert("예매가 완료되었습니다."); // 예매가 성공적으로 진행되었음을 알림
			} else {
				// "아니요"를 클릭한 경우
				alert("예매가 취소되었습니다."); // 예매가 취소되었음을 알림
			}
		});

	});
</script>


</head>

<body>
	<form id="reservationForm" action="insert" method="post"
		enctype="multipart/form-data">

		<div class="container w-1000">
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
					<input type="hidden" id="matchNo" name="matchNo" value="${matchNo}"><br>
					<label>좌석 구역 선택:</label>
					<c:forEach var="reservationVo" items="${list}">
						<div class="row">
							<input class="btn" type="radio" name="seatAreaNo"
								id="selectedSeatArea" value="${reservationVo.seatAreaNo}">
							${reservationVo.seatAreaZone}:${reservationVo.seatAreaPrice} 원
						</div>
					</c:forEach>
				</div>

				<!-- "다음" 버튼 클릭 시 2단계로 이동 -->
				<div class="row right">
					<button type="button" class="btn btn-next">다음단계</button>
				</div>
			</div>
		</div>
		<!-- 2단계 : 좌석선택 -->
		<div class="container w-1000">
			<div class="row page">
				<div class="row seatreservation">
					<h2 class="left ms-10">좌석선택</h2>
				</div>
				<div class="row float-container boxborder">
					<div class="float-left clickseat boxborder">

						<div class="row">${reservationVo.seatAreaNo}</div>
						좌석구역: <span id="seat-area-zone">0</span>
						<div class="mt-20" id="seat-checkbox"></div>
					</div>
					<div class="float-right clickseat">
						<div style="height: 50%;">
							<img src="/images/seatimage.png" style="max-block-size: 45%;"
								class="mt-10 ms-20">
						</div>
						<button type="button" class="refresh-button btn btn-origin">새로고침</button>
						<div class="boxborder ms-10">
							<div id="ticket-count">
								선택된 좌석: <span id="ticket-count-value">0</span>
								<div id="totalPrice">0 원</div>
							</div>
						</div>
						<div class="row left">
							<label class="selected-seats-list"></label>
						</div>
						<input type="hidden" id="reservationTicket"
							name="reservationTicket">
					</div>
				</div>

				<div class="row right">
					<button type="button" class="btn btn-prev">이전단계</button>
					<button type="button"
						class="btn btn-next show-reservation-info-button">다음단계</button>
				</div>
			</div>
		</div>
		<!-- 3단계 : 예매완료 -->
		<div class="row page" style="display: none;">
			<div class="row">
				<h2>예매 정보 확인</h2>
			</div>
			<h3>예매 정보</h3>

			<table class="table table-hover table-border">

				<thead>
					<tr>
					<tr>
						<th>좌석번호</th>
						<th>총가격</th>
					</tr>
					</tr>
				</thead>
				<tbody align="center">

					<tr>
						<td><p>
								<span class="seatNo"></span>
							</p></td>
						<td><p>
								<span class="seatPrice"></span>
							</p></td>
					</tr>
				</tbody>
			</table>

			<div class="row right">
				<button type="button" class="btn btn-prev">이전단계</button>
				<button type="submit" class="btn btn-primary">예매 완료</button>
			</div>
		</div>
	</form>
</body>
</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>