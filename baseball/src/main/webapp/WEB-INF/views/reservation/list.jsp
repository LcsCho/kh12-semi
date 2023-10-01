<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>
$(function(){
    $("#confirm").on("click", function(){
        var result = confirm("취소하시겠습니까?");
        if (result) {
            // 사용자가 확인을 클릭한 경우
            alert("취소되었습니다.");
        } else {
            // 사용자가 취소를 클릭한 경우
            alert("취소하지 않았습니다.");
        }
    });
});
</script>
<div class="row">
    <form action="delete" method="post">
        <table class="table table-hover table-border">

            <thead>
                <tr>
                    <th>예매번호</th>
                    <th>열</th>
                    <th>행</th>
                    <th>좌석번호</th>
                    <th>홈팀</th>
                    <th>어웨이팀</th>
                    <th>예매날짜</th>
                    <th>상세</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody align="center">

                <c:forEach var="reservationVo" items="${list}">
                    <tr>
                        <td><input type="checkbox" name="seatNo" value="${reservationVo.seatNo}"></td>
                        <td>${reservationVo.reservationNo}</td>
                        <td>${reservationVo.seatCol}</td>
                        <td>${reservationVo.seatRow}</td>
                        <td>${reservationVo.seatNo}</td>
                        <td>${reservationVo.homeTeam}</td>	
                        <td>${reservationVo.awayTeam}</td>
                        <td>${reservationVo.reservationDate}</td>
                        <td><a href="/reservation/detail?reservationNo=${reservationVo.reservationNo}">상세</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <!-- 선택된 예매 번호 배열을 서버로 전송하는 버튼 -->
        <button id="confirm" class="btn btn-origin">예매 취소하기</button>
    </form>
</div>



					
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>