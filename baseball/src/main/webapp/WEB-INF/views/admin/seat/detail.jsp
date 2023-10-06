<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/seatSidebar.jsp"></jsp:include>

<div class="container w-500">
   <div class="row">
      <h1>좌석 상세</h1>
   </div>
   
   
   
   <div class="row">
      <table class="table table-border table-stripe">
         <tr>
            <th>경기장</th>
            <td>${seatListDto.stadiumName}</td>
         </tr>
         <tr>
            <th>구역</th>
            <td>${seatListDto.seatAreaZone}</td>
         </tr>
         <tr>
            <th>좌석번호</th>
            <td>${seatListDto.seatNo}</td>
         </tr>
         <tr>
            <th>열</th>
            <td>${seatListDto.seatRow}</td>
         </tr>
         <tr>
            <th>행</th>
            <td>${seatListDto.seatCol}</td>
         </tr>
         <tr>
            <th>상태</th>
            <td>${seatListDto.seatStatus}</td>
         </tr>
         

      </table>   
   </div>
   
</div>


<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>