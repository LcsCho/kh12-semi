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
		//좌석 번호에 change 이벤트 발생시 수행하는 함수
		$("[name=seatAreaNo]").change(function(){
			var seatAreaNo = $(this).val();
			if(seatAreaNo.length == 0) return;
            //비어있으면 리턴
			
			var params = new URLSearchParams(location.search);
            //url에 있는 matchNo를 저장
			var matchNo = params.get("matchNo");
			
			$.ajax({
				url:"http://localhost:8080/reservation/selectSeatAreaZone",
				method:"post",
				data:{
					seatAreaNo: seatAreaNo ,
					matchNo : matchNo 
				},
                //성공시
				success:function(response){
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
	                        .attr("type", "checkbox")
	                        .attr("value", response[index].seatNo)
	                        .attr("name", "seatNo");

	                        // seatStatus 정보를 출력
	                        var seatStatusElement = $("<span>").text(seatStatus);
	                      	//만약에 seatStatus가 N이라면 선택이 되어있고 disable로 처리
                            if(response[index].seatStatus == "N"){
                                checkbox
                                .attr("checked", true)
                                .attr("disabled", true);
                            }
                            
                            
                            //반복문에서 col row를 생성했으므로 for문안에 있어야 함
                            //체크박스 4개 이상 제약 조건
	                        checkbox.change(function(){
	                            if ($(this).is(":checked")) {
	                            	if(ticketCount  >= 4){
	                            		alert("최대 4개 구매 가능합니다!");
	                            		$(this).prop("checked" , false)
	                            	}
	                            	else{
	                                ticketCount++;}
	                                
	                            } else {
	                                ticketCount--;
	                            }
	                            
                                //티켓 카운트 요소가있는 곳에 text로 티켓의 수를 출력
	                            ticketCountElement.text(ticketCount);
                                //티켓이라는 변수에 id가 reservationTicket인 곳에 value를 ticketcount 로 설정
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
            <div id="seat-checkbox">${reservationVo.seatStatus}</div>
 

            <div id="ticket-count">티켓 수: <span id="ticket-count-value">0</span></div>
<input type="hidden" id="reservationTicket" name="reservationTicket">
            <button >등록</button>
        </form>
    </div>
    
    
</body>
</html>





<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>