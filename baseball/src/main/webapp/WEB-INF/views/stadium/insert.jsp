<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="insert" method="post">
  경기장 이름: <input type="text" name="stadiumName" value="${stadiumDto.stadiumName}">
  좌석구역: <select name="stadiumZone">
    <option value="A">A</option>
    <option value="B">B</option>
    <option value="C">C</option>
  </select>
  좌석가격: <input type="number" name="stadiumZonePrice" value="${stadiumDto.stadiumZonePrice}">
  
<%--   <c:choose> --%>
<%--     <c:when test="${stadiumZone=='A'}"> --%>
<!--       <input type="hidden" name="stadiumZonePrice" value="20000"> -->
<%--     </c:when> --%>
<%--     <c:when test="${stadiumZone=='B'}"> --%>
<!--       <input type="hidden" name="stadiumZonePrice" value="20000"> -->
<%--     </c:when> --%>
<%--     <c:when test="${stadiumZone=='C'}"> --%>
<!--       <input type="hidden" name="stadiumZonePrice" value="10000"> -->
<%--     </c:when> --%>
<%--   </c:choose> --%>
  <button type="submit">등록</button>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>