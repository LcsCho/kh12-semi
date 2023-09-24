<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/seatSidebar.jsp"></jsp:include>
<div class="container w-400">


      <c:forEach var="seatSeletDto" items="${list}">
      <div class="row">
           <a href="/admin/seat/listByStadium?stadiumName=${seatSeletDto.stadiumName}" class="btn btn-origin w-25">${seatSeletDto.stadiumName}</a>
      </div>
      </c:forEach>
      
      
</div>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>