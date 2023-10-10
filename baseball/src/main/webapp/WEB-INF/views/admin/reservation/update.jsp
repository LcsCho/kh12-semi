<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>

<form action="update" method="post">
    <div id="checkboxContainer">
        <!-- JavaScript로 동적으로 checkbox가 추가될 위치 -->
    </div>

    <script>
        // 좌석 그리드의 최대 행 및 열 수
        var maxNumRows = 8; // 최대 행 수
        var maxNumCols = 12; // 최대 열 수

        <c:forEach var="SeatListDto" items="${list}">
            var seatNo = "${SeatListDto.seatNo}";
            var seatRow = "${SeatListDto.seatRow}";
            var seatCol = "${SeatListDto.seatCol}";
            var seatStatus = "${SeatListDto.seatStatus}";

            var checkbox = $("<input>")
                .attr("type", "checkbox")
                .attr("value", seatNo)
                .attr("name", "seatNo")
                .addClass("custom-checkbox");

            // seatStatus가 'N'일 때 checkbox 체크
            if (seatStatus === 'N') {
                checkbox.prop('checked', true);
            }

            // seatRow와 seatCol을 텍스트로 추가
            var seatText = $("<span>")
                .text(seatRow + "-" + seatCol + ":" + seatStatus)
                .addClass("seat-text");

            // checkbox와 seatText를 한 줄에 배치
            var seatContainer = $("<div>")
                .addClass("seat-container")
                .append(checkbox)
                .append(seatText);

            // 12개의 좌석이 한 줄에 찍히도록 줄 바꿈 처리
            if ($("#checkboxContainer input").length % maxNumCols === 0) {
                $("#checkboxContainer").append("<br>");
            }

            // seatContainer를 #checkboxContainer에 추가
            $("#checkboxContainer").append(seatContainer);
        </c:forEach>
    </script>
    
    <!-- 수정 버튼을 추가 -->
    
    <!-- select 요소를 추가하여 seatStatus 값을 선택할 수 있도록 함 -->
    <label for="seatStatus">Seat 상태 선택:</label>
    <select id="seatStatus" name="seatStatus">
        <option value="Y">Y</option>
        <option value="N">N</option>
        <option value="R">R</option>
    </select>
    
    <button>수정</button>
</form>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>