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
            <td>${reservationVO.reservationNo}</td>
         </tr>
         <tr>
            <th>열</th>
            <td>${reservationVO.seatCol}</td>
         </tr>
         <tr>
            <th>행</th>
            <td>${reservationVO.seatRow}</td>
         </tr>
         <tr>
            <th>좌석번호</th>
            <td>${reservationVO.seatNo}</td>
         </tr>
         <tr>
            <th>홈팀</th>
            <td>
               ${reservationVO.homeTeam}
           
            </td>
         </tr>
         <tr>
            <th>어웨이팀</th>
            <td>${reservationVO.awayTeam}</td>
         </tr>

         <tr>
            <th>예매시간</th>
            <td>
               <fmt:formatDate value="${reservationVO.reservationDate}" 
                           pattern="y년 M월 d일 E a h시 m분"/>
            </td>
         </tr>
         
         
      </table>
   </div>
   


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>