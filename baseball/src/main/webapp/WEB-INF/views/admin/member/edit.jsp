<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
 
 <h2>회원정보 변경</h2>
<form action="edit" method="post" autocomplete="off">
 		<input type="hidden" name="memberId" value="${memberDto.memberId}"><br>
 		닉네임 <input type="text" name="memberNick" value="${memberDto.memberNick}" required><br>
		이메일 <input type="email" name="memberEmail" value="${memberDto.memberEmail}" > <br>
		전화번호 <input type="tel" name="memberTel" value="${memberDto.memberTel}" > <br>
		생년월일 <input type="date" name="memberBirth" value="${memberDto.memberBirth}" > <br>
		주소 <br>
		<input type="text" name="memberPost" size="6" maxlength="6"
			placeholder="우편번호" value="${memberDto.memberPost}"><br>
		<input type="text" name="memberAddr1" size="30" 
			placeholder="기본주소" value="${memberDto.memberAddr1}"><br>
		<input type="text" name="memberAddr2" size="30" 
			placeholder="상세주소" value="${memberDto.memberAddr2}"><br>
<!-- 		등급 <select> -->
<!-- 		<option value="member_level">일반</option> -->
<!-- 		<option value="member_level">VIP</option> -->
<!-- 		</select><br> -->
		<%-- radio button은 select box와 같은 역할을 한다 --%>
		등급
		<c:choose>
			<c:when test="${memberDto.memberLevel == 'VIP'}">
				<input type="radio" name="memberLevel" value="일반"> 일반
				<input type="radio" name="memberLevel" value="VIP" checked> VIP
				<input type="radio" name="memberLevel" value="관리자"> 관리자
			</c:when>
			<c:when test="${memberDto.memberLevel == '관리자'}">
				<input type="radio" name="memberLevel" value="일반"> 일반
				<input type="radio" name="memberLevel" value="VIP"> VIP
				<input type="radio" name="memberLevel" value="관리자" checked> 관리자
			</c:when>
			<c:otherwise>
				<input type="radio" name="memberLevel" value="일반" checked> 일반
				<input type="radio" name="memberLevel" value="VIP"> VIP
				<input type="radio" name="memberLevel" value="관리자"> 관리자
			</c:otherwise>
		</c:choose>
		<br>

	<button>정보변경</button>
 
 </form>
 
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
 