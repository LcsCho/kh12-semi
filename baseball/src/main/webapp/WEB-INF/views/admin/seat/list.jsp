<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/seatSidebar.jsp"></jsp:include>
<div class="container w-400">
<table class="table table-slit" border="1" width="800">
   <thead>
      <tr>
         <th>경기장</th>
         <th>구역</th>
         <th>좌석번호</th>
         <th>열</th>
         <th>행</th>
         <th>좌석상태</th>

      </tr>
   </thead>
   <tbody align="center">
      <c:forEach var="seatSeletDto" items="${list}">
         <tr>
            <td>${seatSeletDto.stadiumName}</td>
            <td>${seatSeletDto.seatAreaZone}</td>
            <td>${seatSeletDto.seatNo}</td>
            <td>${seatSeletDto.seatRow}</td>
            <td>${seatSeletDto.seatCol}</td>
            <td>${seatSeletDto.seatStatus}</td>
<td><a href="/admin/seat/update?seatAreaZone=${seatSeletDto.seatAreaZone}&seatCol=${seatSeletDto.seatCol}&seatRow=${seatSeletDto.seatRow}&stadiumName=${seatSeletDto.stadiumName}">수정</a></td>
<td><a href="/admin/seat/detail?seatNo=${seatSeletDto.seatNo}">상세</a></td>      
<td><a href="/admin/seat/listByZone?seatAreaZone=${seatSeletDto.seatAreaZone}&stadiumName=${seatSeletDto.stadiumName}">존</a></td>      
<td><a href="/admin/seat/listByStadium?stadiumName=${seatSeletDto.stadiumName}">경기장</a></td>      
<td><a href="/admin/seat/listByZone?seatAreaZone=C">C</a></td>      

         </tr>
      </c:forEach>
   </tbody>
</table>
</div>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>