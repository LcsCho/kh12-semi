<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="insert" method="post">
  경기장 이름: <input type="text" name="stadiumName" value="${stadiumDto.stadiumName}">
  <button type="submit">등록</button>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>