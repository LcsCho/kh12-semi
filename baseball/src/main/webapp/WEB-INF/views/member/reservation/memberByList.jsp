<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<div class="container w-400">
   <table class="table table-slit" border="1" width="800">
      <thead>
         <tr>
            <th>예매번호</th>
            <th>경기시간</th>
            <th>경기장</th>
            <th>홈팀</th>
            <th>어웨팀</th>
         </tr>
      </thead>
      <tbody align="center">
         <c:forEach var="reservationDto" items="${list}">
            <tr>
               <td>${reservationDto.reservationNo}</td>
               <td>${reservationDto.matchDate}</td>
               <td>${reservationDto.stadiumName}</td>
               <td>${reservationDto.homeTeam}</td>
               <td>${reservationDto.awayTeam}</td>
            </tr>
         </c:forEach>
      </tbody>
   </table>
   </div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>