<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:choose>
<c:when test="${sessionScope.level == '관리자'}"> 
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
</c:when>
<c:otherwise>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
</c:otherwise>
</c:choose>

<style>
	.note-viewer {
       line-height: 2 !important;
     }
     
     table {
            border-collapse: collapse;
        }

        table th {
            border-top: #62676C 3px solid;
            border-bottom: #62676C 2px solid;
            background-color: #f1f1f1;
            font-weight: bold;
            height: 40px;
            font-size: 16px;
            font-weight: bold;
        }

        table td {
            border-top: #D1CFCF 2px solid;
            border-bottom: #D1CFCF 2px solid;
            border-right: #D1CFCF 3px solid;
            height: 35px;
			padding-top: 0.4em;
        }

        td:nth-last-child(1),
        th:nth-last-child(1) {
            border-right: none;
        }
        
          .btn, .btn.btn-positive {
            width: 100px;
            height: 40px;
            font-size: 15px;
            border-radius: 0px;
            
        }
		.btn.row{
		padding-top: 0.8em;
		}
		
		.btn.edit{
		 border-color: blue;
	    background-color: #e17055;
	    color: white;
		}
		
		.container>.float-container{
		margin-top : 15px;
		margin-bottom: 15px;
			}


</style>
<!--  댓글과 관련된 처리를 할 수 있도록 jQuery 코드 구현 -->
<script>

</script>


<div class="container w-1000">

<div class="float-container ms-10 me-10">
	<div class="row col-2 left">
		<h3>
			${boardDto.boardNo}번 게시글
			<c:if test="${boardDto.boardUtime != null}">
				(수정됨)
			</c:if>
		</h3>
		</div>
       <div class="row  col-2 right">
       <fmt:formatDate value="${boardDto.boardCtime}" pattern="y년 M월 d일 (E) a h시 m분"/>
	</div>
</div>

<table class="w-1000">
<tr>
    <th>
            <div class="row left ms-20">
                <h2>${boardDto.boardTitle}</h2>
            </div>

    </th>
</tr>
<tr>
<td>
	<%-- 게시글 내용(본문) --%>
	<div class="row left note-viewer ms-20 me-10" style="min-height:250px">
		${boardDto.boardContent}
	</div>
	</td>
</tr>
</table>	
	<%-- 댓글 목록이 표시될 영역 --%>
	<div class="row left reply-list"></div>
	
	<%-- 각종 버튼이 위치하는 곳 --%>
	<div class="row right">
		<a class="btn btn-positive row" href="write">
			새글
		</a>
		
		<%-- 수정/삭제는 소유자일 경우만 나와야 한다 --%>
<%-- 		<c:if test="${sessionScope.level == '관리자'}"> --%>
		<a class="btn btn-edit row" href="edit?boardNo=${boardDto.boardNo}">		
			수정
		</a>
		<a class="btn btn-negative row" href="delete?boardNo=${boardDto.boardNo}">
			삭제
		</a>
<%-- 		</c:if> --%>
		<a class="btn row" href="list">
			목록
		</a>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>