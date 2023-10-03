<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
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
   </div>
   


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>