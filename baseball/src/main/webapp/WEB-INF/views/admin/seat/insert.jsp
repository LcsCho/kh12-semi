<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/seatSidebar.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/insert.css">
<script>
	
</script>

<form action="insert" method="post">
<table>
         <!-- 좌석 구역 -->
         <!--
            좌석구역: <select class="form-input w-100" name="seatAreaNo" class="w-100" id="seatAreaNo">
               <c:forEach var="seatAreaDto" items="${list}">
                  <option value="${seatAreaDto.seatAreaNo}">${seatAreaDto.seatAreaZone} | ${seatStadium.stadiumName} </option>
               </c:forEach>
            </select>
         
               좌석구역: <select class="form-input w-100" name="seatAreaNo"
                  id="seatAreaNo">
                  <c:forEach var="seatAreaDto" items="${list}">
                     <option value="${seatAreaDto.seatAreaNo}">
                        ${seatAreaDto.seatAreaZone} |
                        ${requestScope.seatStadium.stadiumName}</option>
                  </c:forEach>
               </select>
          -->
         <tr>
          <th>좌석구역</th>
            <td><select class="form-input w-100" name="seatAreaNo"
               id="seatAreaNo">
               <c:forEach var="FindStadiumNameDto" items="${list}">
                  <option value="${FindStadiumNameDto.seatAreaNo}">
                     ${FindStadiumNameDto.stadiumName}  |
                     ${FindStadiumNameDto.seatAreaZone} |
                     ${FindStadiumNameDto.seatAreaPrice} 원  |
                     ${FindStadiumNameDto.seatCount}석</option>
               </c:forEach>
            </select>
            </td>
            <div class="row">
               <!--             좌석구역: <input name="seatAreaNo" class="form-input w-100" type="number"> -->
            </div>
            <!-- 일단 이렇게 하고  -->
            <!-- 나중에 경기장을 선택하면 자동으로 value에 숫자 값을 넣을 수 있게 만드는게 목표 -->
         <tr>
         	<th>좌석수행</th>
         	<td>
            <input name="seatCol" class="form-input w-100" type="number">
            </td>
         </tr>
        <tr>
			<th>좌석수열</th>
            <td><input name="seatRow" class="form-input w-100" type="number">
         	</td>
         <tr>
         	<th>예매상태</th>
            	<td><select name="seatStatus"  class="form-input w-100">
               <option value="Y">가능</option>
               <option value="N">불가능</option>
               <option value="R">예매중</option>
            </select>
			</td>
		</tr>
</table>
      <div class="row w-100">
         <button type="submit" class="btn">좌석 등록</button>
      </div>
</form>



<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
