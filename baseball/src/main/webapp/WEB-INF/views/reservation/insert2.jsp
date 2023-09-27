<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script src="/js/multipage.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<html>
<head>
<title>매치 예약</title>

<script>
$(function(){
	
	$("[name=seatAreaNo]").change(function(){
		var seatAreaNo = $(this).val();
		if(seatAreaNo.length == 0) return;
		
		var params = new URLSearchParams(location.search);
		var matchNo = params.get("matchNo");
		
		$.ajax({
			url:"http://localhost:8080/reservation/selectSeatAreaZone",
			method:"post",
			data:{
				seatAreaNo: seatAreaNo ,
				matchNo : matchNo 
			},
			success:function(response){
				console.log(response);
				
				var lastSeat = response[response.length - 1];
                var numCols = lastSeat.seatCol;
                var numRows = lastSeat.seatRow;

                var checkboxContainer = $("#seat-checkbox");
                checkboxContainer.empty(); 
                
                var ticketCount = 0;
                var ticketCountElement = $("#ticket-count-value");
                for (var i = 0; i < numRows; i++) {
                    for (var j = 0; j < numCols; j++) {
                        var index = i * numCols + j;
                        var seatStatus = response[index].seatStatus; // 서버 응답에서 seatStatus 가져오기

                        var checkbox = $("<input>").attr("type", "checkbox").attr("value", response[index].seatNo).attr("name", "seatNo");

                        // seatStatus 정보를 출력
                        var seatStatusElement = $("<span>").text(seatStatus);

                        checkbox.change(function(){
                            if ($(this).is(":checked")) {
                                ticketCount++;
                            } else {
                                ticketCount--;
                            }

                            ticketCountElement.text(ticketCount);
                            var ticket = $("#reservationTicket").attr("value", ticketCount);
                        });

                        // 좌석과 seatStatus를 checkboxContainer에 추가
                        checkboxContainer.append(checkbox);
                        checkboxContainer.append(seatStatusElement);
                    }
                    checkboxContainer.append("<br>");
                }
            },
        });
    });
	
	
});
    	
    	//다중 예약처리를 하려고 json형태의 리스트로 저장 하고 ajax로 보냈는데 문자열로 들어가서 파싱을 해보려 했지만 실패하고
    	//파싱을한 배열에 for문을 돌러 list의 length만큼 0번부터 출력한 값을 자동으로 insert 하려 했지만 실패
    	//1개씩은 예매가 된다
    	//예매 된 좌석은 이제 disable로 처리를 해야한다
    </script>

<style>
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
<script src="multipage.js"></script>
<script>

    </script>
</head>

<body>
	<form  action="insert" method="post" autocomplete="off">
		<h1>매치 예약</h1>
		<!-- matchNo 값을 출력합니다. -->
		<p>
			매치 번호: <span>${matchNo}</span>
		</p>
		<p>
			멤버아이디: <span>${name}</span>
		</p>

		<div class="container w-600">

			<!-- 1단계 : 예매하기 -->
			<div class="row page">
				<div class="row seatreservation">
					<h2 class="left ms-10">예매하기</h2>
				</div>

				<!-- 왼쪽에 이미지를 추가하는 부분 (col 사용) -->
				<div class="float-container">
					<div class="float-left">
						<div class="image-container boxborder">
							<img src="./image/seatimage.png">
						</div>
					</div>


					<!-- 체크박스를 사용하여 구역 선택 -->
					<div class="boxborder">
						<label>구역 선택:</label> <label>좌석 구역 선택:</label>
						 <select name="seatAreaNo" id="selectedSeatArea" required>
							<option value="">선택하세요</option>
							<c:forEach var="reservationVo" items="${list}">
								<option value="${reservationVo.seatAreaNo}">
									${reservationVo.seatAreaZone}</option>
							</c:forEach>
						</select>

					</div>
				</div>
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
						       <label>좌석 번호:</label>
            <div id="seat-checkbox">${reservationVo.seatStatus}</div>
					</div>
						
						
					<div class="float-right clickseat">
						<div style="height: 50%;">
							<img src="./image/seatimage.png" style="max-block-size: 45%;"
								class="mt-10 ms-20">
						</div>
						<button type="button" class="refresh-button">새로고침</button>
						<div class="boxborder ms-10">
							선택된 좌석<label class="selected-seats"></label>
						</div>
						<div class="row left">
							<label class="selected-seats-list"></label>
						</div>
					</div>
				</div>

				<div class="row right">
					<button type="button" class="btn btn-next">다음단계</button>
					<button type="button" class="btn btn-prev">이전단계</button>
					<button type="submit" class="btn">예매하기</button>
				</div>
			</div>

			<!-- 3단계 : 예매완료 -->


		</div>

	</form>
</body>

</html>




<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>




