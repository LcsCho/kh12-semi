<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/stadiumSidebar.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/insert.css">

<form action="insert" method="post">
<table>
<tr>
	<th>경기장 이름</th>
	<td><input type="text" name="stadiumName" value="${stadiumDto.stadiumName}" class="form-input w-100"></td>
</tr>
  </table>
  <button type="submit" class="btn">경기장 등록</button>
</form>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>