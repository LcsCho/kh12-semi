<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
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
    					
    				    // 마지막 배열의 seatCol 및 seatRow 값을 가져옴
    				    var lastSeat = response[response.length - 1];
    				    var numCols = lastSeat.seatCol;
    				    var numRows = lastSeat.seatRow;

    				    // 체크박스 컨테이너 선택
    				    var checkboxContainer = $("#checkboxContainer");
    				    checkboxContainer.empty(); // 기존 내용을 지웁니다.

    				    // 행 반복
    				  
    				    for (var i = 0; i < numRows; i++) {
    				        // 열 반복
    				        for (var j = 0; j < numCols; j++) {
    				            // 체크박스 생성 및 컨테이너에 추가
    				             var index = i * numCols + j;

    				            var checkbox = $("<input>").attr("type", "checkbox").attr("value",response[index].seatNo).attr("name","seatNo");
    				            checkboxContainer.append(checkbox);
    				        }
    				        // 줄 바꿈을 위한 <br> 추가
    				        checkboxContainer.append("<br>");
    				    }
    				},
    	        });
    	    });
    	});
    </script>
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
            <div id="checkboxContainer"></div>
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