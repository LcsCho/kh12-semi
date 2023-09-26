<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<html>
<head>
    <title>매치 예약</title>
</head>
<body>
    <div class="row">
        <form id="reservationForm" action="insert" method="post">
            <h1>매치 예약</h1>
            <!-- matchNo 값을 출력합니다. -->
            <p>
                매치 번호: <span>${matchNo}</span>
            </p>
            <p>
                멤버아이디: <span>${name}</span>
            </p>
            <input type="hidden" id="homeTeam" name="homeTeam" value="${matchNo}"><br>
            <input type="hidden" id="awayTeam" name="awayTeam" value="${matchNo}"><br>
            <input type="hidden" id="matchNo" name="matchNo" value="${matchNo}"><br>

            <label>좌석 구역 선택:</label>
            <select name="seatAreaNo" id="selectedSeatArea" required>
                <option value="">선택하세요</option>
                <c:forEach var="reservationVo" items="${list}">
                    <option value="${reservationVo.seatAreaNo}">
                        ${reservationVo.seatAreaZone}
                    </option>
                </c:forEach>
            </select>

            <label>좌석 번호:</label>
           <%--
           <select name="seatNo" id="selectedSeatNo" required>
                <c:forEach var="seatListDto" items="${seatList}">
                    <option value="${list.seatNo}">${list.seatNo}</option>
                </c:forEach>
            </select>
            --%> 
            <input type="text" name="seatNo">

            <label>티켓 수:</label>
            <input type="number" id="reservationTicket" name="reservationTicket" required><br>

            <button >등록</button>
        </form>
    </div>
    
    <script>
        const seatAreaSelect = document.getElementById('selectedSeatArea');
        const seatNoSelect = document.getElementById('selectedSeatNo');

        seatAreaSelect.addEventListener('change', () => {
            const selectedArea = seatAreaSelect.value;
            
            // 선택한 구역에 해당하는 좌석 번호를 서버로부터 가져오는 Ajax 요청을 보내고,
            // 서버에서 받아온 데이터를 이용하여 좌석 번호를 업데이트합니다.
            
            // 아래는 예시로 Ajax를 사용하여 서버로부터 데이터를 가져오는 방법입니다.
            // 실제로는 서버와의 통신을 구현해야 합니다.
            fetch(`/seatAreaNo=${selectedArea}`)
                .then(response => response.json())
                .then(data => {
                    seatNoSelect.innerHTML = ''; // 기존 옵션을 지웁니다.
                    data.forEach(seatNumber => {
                        const option = document.createElement('option');
                        option.value = seatNumber;
                        option.textContent = seatNumber;
                        seatNoSelect.appendChild(option);
                    });
                })
                .catch(error => console.error(error));
        });

        // 폼 제출 전에 선택한 좌석을 input 필드에 설정
        document.getElementById('reservationForm').addEventListener('submit', () => {
            const selectedArea = seatAreaSelect.value;
            const selectedSeat = seatNoSelect.value;
            document.getElementById('selectedSeatArea').value = selectedArea;
            document.getElementById('selectedSeatNo').value = selectedSeat;
        });
    </script>
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