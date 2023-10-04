<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
<c:when test="${sessionScope.level == '관리자'}"> 
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>
</c:when>
<c:otherwise>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
</c:otherwise>
</c:choose>

<style>
table {
            border-collapse: collapse;
        }

        table th {
            border-top: #62676C 3px solid;
            border-bottom: #62676C 2px solid;         
            background-color: #f1f1f1;
            font-weight: bold;
            height: 40px;
            padding-top: 0.5em;
            font-size: 16px;
            font-weight: bold;
        }

        table td {
            border-top: #D1CFCF 2px solid;
            border-bottom: #D1CFCF 2px solid;      
            height: 40px;
			padding-top: 0.6em;
			font-size: 16px;
            color: #62676C;
            font-weight: bold;
        }

        td:nth-last-child(1),
        th:nth-last-child(1) {
            border-right: none;
        }
        
        td:nth-child(2){
        font-weight: bold;
         color: #ffffff;
        }
        
.custom-checkbox {
	display: inline-block;
	font-size: 18px;
	position: relative;
}

.custom-checkbox>[type=checkbox] {
	display: none;
}

.custom-checkbox>span {
	display: block;
	width: 1em;
	height: 1em;
	background-image: url("/images/checkbox-empty.png");
	background-size: 100%;
	background-position: center;
	background-repeat: no-repeat;
}

.custom-checkbox>[type=checkbox]:checked+span {
	
	background-image: url("/images/checkbox-check.png");
}

		.search-box {
            background-color: #f1f1f1;
            border: #D1CFCF 2px solid;
            display: flex;
            align-items: center;
            justify-content: center;
             height: 80px;
        }

        .form-input {
            height: 40px;
            font-size: 15px;
            margin: 0 10px;
        }
        .form-input.tite{
            width: 120px;
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

</style>

<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- javascript 작성 공간 -->
<script>
	$(function() {
		//전체선택과 개별체크박스에 대한 이벤트 구현
		$(".delete-btn").hide();

		//전체선택
		$(".check-all").change(function() {
			var check = $(this).prop("checked");
			$(".check-all, .check-item").prop("checked", check);

			if (check) {
				//$(".delete-btn").css("display", "inline-block");
				//$(".delete-btn").show();
				$(".delete-btn").fadeIn("fast");
				//$(".delete-btn").slideDown();
			} else {
				//$(".delete-btn").css("display", "none");
				//$(".delete-btn").hide();
				$(".delete-btn").fadeOut("fast");
				//$(".delete-btn").slideUp();
			}
		});

		//개별체크박스
		$(".check-item").change(
				function() {
					//var allCheck = 개별체크박스개수 == 체크된개별체크박스개수;
					//var allCheck = $(".check-item").length == $(".check-item:checked").length;
					var allCheck = $(".check-item").length == $(".check-item")
							.filter(":checked").length;
					$(".check-all").prop("checked", allCheck);

					if ($(".check-item").filter(":checked").length > 0) {
						$(".delete-btn").fadeIn("fast");
					} else {
						$(".delete-btn").fadeOut("fast");
					}
				});

		$(".delete-form").submit(function(e) {
			return confirm("정말 삭제하시겠습니까?");
		});
	});
</script>



<h3>공지사항</h3>
<br>

	<!-- 검색창 -->
	<form action="list" method="get">
        <div class="row search-box w-1000">
            <select name="type" required class="form-input tite">
                <option value="board_title">제목</option>
            </select> <input type="search" name="keyword" required class="form-input w-65" placeholder="검색어 입력"
                value="${param.keyword}">
            <button type="submit" class="btn btn-positive">
                검색
            </button>
        </div>
    </form>
	
	<!-- 폼 시작 -->
	<form class="delete-form" action="deleteByAdmin" method="post">

		<%-- 글쓰기는 로그인 상태인 경우에만 출력 --%>
		<c:if test="${sessionScope.name != null}">
			<div class="row right">
				<c:if test="${sessionScope.level == '관리자'}">
					<button type="submit" class="btn btn-negative delete-btn">
						 일괄삭제
					</button>
				</c:if>

				<a href="write" class="btn row"> 글쓰기
				</a>
			</div>
		</c:if>

		<%-- 
		검색일 경우 검색어를 추가로 출력 
		(참고) 논리 반환값을 가지는 getter 메소드는 get이 아니라 is로 시작한다
	--%>
		<c:if test="${vo.search}">
			<div class="row left">&quot;${vo.keyword}&quot;에 대한 검색 결과</div>
		</c:if>

		<table width="1000px">
				<thead>
					<tr>
						<c:if test="${sessionScope.level == '관리자'}">
							<th>
								<!-- 전체선택 체크박스 --> <label class="custom-checkbox"> <input
									type="checkbox" class="check-all"><span></span>
							</label>
							</th>
						</c:if>
						<th>번호</th>
						<th width="50%">제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				
				<tbody align="center">
					<c:forEach var="boardDto" items="${list}">
						<tr>
							<c:if test="${sessionScope.level == '관리자'}">
								<td>
									<!-- 개별항목 체크박스 --> 
								<label class="custom-checkbox"> <input
										type="checkbox" class="check-item" name="boardNoList"
										value="${boardDto.boardNo}"> <span></span>
								</label>
								</td>
							</c:if>
							<td>${boardDto.boardNo}</td>
							<td align="left">
								<!-- 제목을 누르면 상세페이지로 이동 --> <a class="link"
								href="detail?boardNo=${boardDto.boardNo}">
									${boardDto.boardTitle} </a>
							</td>
							<td>${boardDto.boardCtime}</td>
							<td>${boardDto.boardReadcount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		<!-- 폼 종료 -->
	</form>

	<div class="row page-navigator mv-30">
		<!-- 이전 버튼 -->
		<c:if test="${!vo.first}">
			<a href="list?${vo.prevQueryString}"> <i
				class="fa-solid fa-angle-left"></i>
			</a>
		</c:if>

		<!-- 숫자 버튼 -->
		<c:forEach var="i" begin="${vo.begin}" end="${vo.end}" step="1">
			<c:choose>
				<c:when test="${vo.page == i}">
					<a class="on">${i}</a>
				</c:when>
				<c:otherwise>
					<a href="list?${vo.getQueryString(i)}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 다음 버튼 -->
		<c:if test="${!vo.last}">
			<a href="list?${vo.nextQueryString}"> <i
				class="fa-solid fa-angle-right"></i>
			</a>
		</c:if>
	</div>



</table>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>