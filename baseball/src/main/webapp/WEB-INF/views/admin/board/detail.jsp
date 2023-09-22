<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	.note-viewer {
       line-height: 2 !important;
     }
</style>
<!--  댓글과 관련된 처리를 할 수 있도록 jQuery 코드 구현 -->
<script>

</script>

<script id="reply-template" type="text/template">
<div class="row flex-container view-container">
			<div class="w-75">
				<div class="row left">
					<h3 class="replyWriter">작성자</h3>
				</div>
				<div class="row left">
					<pre class="replyContent">내용</pre>
				</div>
				<div class="row left">
					<span class="replyTime">yyyy-MM-dd HH:mm:ss</span>
				</div>
			</div>
			<div class="w-25">
				<div class="row">
					<button class="btn btn-edit">
						<i class="fa-solid fa-edit"></i>
					</button>
				</div>
				<div class="row">
					<button class="btn btn-negative btn-delete">
						<i class="fa-solid fa-trash"></i>
					</button>
				</div>
		</div>
</div>
</script>


<div class="container w-800">
	<div class="row">
		<h1>
			${boardDto.boardNo}번 게시글
			<c:if test="${boardDto.boardUtime != null}">
				(수정됨)
			</c:if>
		</h1>
	</div>

	<div class="row right">
				<fmt:formatDate value="${boardDto.boardCtime}" pattern="y년 M월 d일 E a h시 m분 s초"/>
	</div>
	<div class="row left">
		<h2>${boardDto.boardTitle}</h2>
	</div>
	
	<%-- 게시글 내용(본문) --%>
	<div class="row left note-viewer" style="min-height:250px">
		${boardDto.boardContent}
	</div>
	
	<%-- 댓글 목록이 표시될 영역 --%>
	<div class="row left reply-list"></div>
	
	<%-- 각종 버튼이 위치하는 곳 --%>
	<div class="row right">
		<a class="btn btn-positive" href="write">
			<i class="fa-solid fa-pen"></i>
			새글
		</a>
		
		<%-- 수정/삭제는 소유자일 경우만 나와야 한다 --%>
<%-- 		<c:if test="${sessionScope.level == '관리자'}"> --%>
		<a class="btn btn-negative" href="edit?boardNo=${boardDto.boardNo}">
			<i class="fa-solid fa-pen-to-square"></i>
			수정
		</a>
		<a class="btn btn-negative" href="delete?boardNo=${boardDto.boardNo}">
			<i class="fa-solid fa-trash"></i>
			삭제
		</a>
<%-- 		</c:if> --%>
		<a class="btn" href="list">
			<i class="fa-solid fa-list"></i>
			목록
		</a>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>