<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<h2>개인정보 변경</h2>


<form action = "change" method="post">
	비밀번호<input type="password" name="memberPw" required> <br><br>
	닉네임<input type="text" name="memberNickname" required> <br><br>
	이메일<input type="email" name="memberEmail"> <br><br>
	연락처<input type="tel" name="memberContact"> <br><br>
	생년월일<input type="date" name="memberBirth"> <br><br>
		주소<br>
			 <input type = "text" name="memberPost" placeholder="우편번호" size="6" maxlength="6"> <br><br>
			 <input type = "text" name="memberAddr1" placeholder="기본주소"> <br><br>
			 <input type = "text" name="memberAddr2" placeholder="상세주소"> <br><br>
			
		<button>변경</button>
</form>

<c:if test="${param.error != null}">
<h3 style="color:salmon">기존 비밀번호가 일치하지 않습니다.</h3>
</c:if>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>