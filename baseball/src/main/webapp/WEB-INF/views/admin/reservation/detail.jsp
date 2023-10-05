<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
.btn.btn-positive {
	width: 100px;
	height: 40px;
	font-size: 14px;
	border-radius: 0px;
	padding-right: 1.6em;
	padding-top: 0.8em;
}
</style>
   <div class="row">
   <div class="row bold-font">
   	<h1>예매 상세 내역</h1>
   	</div>
      <table class="table table-border table-stripe ">
         <tr>
            <th width="25%">예매번호</th>
            <td>${adminReservationListVO.reservationNo}</td>
         </tr>
         <tr>
            <th>열</th>
            <td>${adminReservationListVO.seatCol}</td>
         </tr>
         <tr>
            <th>행</th>
            <td>${adminReservationListVO.seatRow}</td>
         </tr>
         <tr>
            <th>좌석번호</th>
            <td>${adminReservationListVO.seatNo}</td>
         </tr>
         <tr>
            <th>홈팀</th>
            <td>
               ${adminReservationListVO.homeTeam}
           
            </td>
         </tr>
         <tr>
            <th>어웨이팀</th>
            <td>${adminReservationListVO.awayTeam}</td>
         </tr>

         <tr>
            <th>예매시간</th>
            <td>
               <fmt:formatDate value="${adminReservationListVO.reservationDate}" 
                           pattern="y년 M월 d일 E a h시 m분"/>
            </td>
         </tr>
                
      </table>
      <div class="row right">
      	<a href="list" class="btn btn-positive">목록으로</a>
      </div>
   </div>
   


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>