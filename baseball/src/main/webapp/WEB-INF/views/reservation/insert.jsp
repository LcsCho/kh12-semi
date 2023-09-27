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
	
    	                        var checkbox = $("<input>").attr("type", "checkbox").attr("value", response[index].seatNo).attr("name", "seatNo");

    	                        checkbox.change(function(){
    	                            if ($(this).is(":checked")) {
    	                                ticketCount++;
    	                            } else {
    	                                ticketCount--;
    	                            }

    	                            ticketCountElement.text(ticketCount);
    	                            var ticket = $("#reservationTicket").attr("value", ticketCount);
    	                        });

    	                        checkboxContainer.append(checkbox);
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
            <div id="seat-checkbox"></div>
 

            <div id="ticket-count">티켓 수: <span id="ticket-count-value">0</span></div>
<input type="hidden" id="reservationTicket" name="reservationTicket">
            <button >등록</button>
        </form>
    </div>
    
    
</body>
</html>





<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>