<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/matchSidebar.jsp"></jsp:include>

<div class="container w-500">
   <div class="row">
      <h1>경기결과</h1>
   </div>
   
   
   
   <div class="row">
      <table class="table table-border table-stripe">
         <tr>
            <th>좌석번호</th>
            <td>${seatSeletDto.seatNo}</td>
         </tr>
         <tr>
            <th>구역</th>
            <td>${seatSeletDto.seatAreaZone}</td>
         </tr>
         <tr>
            <th>경기장</th>
            <td>${seatSeletDto.stadiumName}</td>
         </tr>
         <tr>
            <th>열</th>
            <td>${seatSeletDto.seatRow}</td>
         </tr>
         <tr>
            <th>행</th>
            <td>${seatSeletDto.seatCol}</td>
         </tr>
         <tr>
            <th>상태</th>
            <td>${seatSeletDto.seatStatus}</td>
         </tr>
         

      </table>   
   </div>
      <div class="row">
      <a href="list">
         목록으로
      </a>
      <a href="change?matchNo=${matchDto.matchNo}">
         수정
      </a>
      <br>
      <a href="/">
         홈으로
      </a>
   </div>
</div>


<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>