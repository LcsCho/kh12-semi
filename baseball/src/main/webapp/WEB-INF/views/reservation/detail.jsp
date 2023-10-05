<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="/css/list.css">
    
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
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
   <div class="row">
   <div class="row bold-font">
   	<h1>예매 상세 내역</h1>
   	</div>
      <table class="table">
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
      <div class="row right">
      	<a href="list" class="btn btn-positive">목록으로</a>
      </div>
   </div>
   


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>