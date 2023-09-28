<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<style>

	.main-image{
	            box-shadow: 0px 0px 0px 1px #360a01;
	        }
	.box {
	    box-shadow: 0px 0px 0px 2px #CCCCCC;
	    border-radius: 5px;
	    height: 300px;
	    display: flex; /* 수직 정렬을 위해 flex 사용 */
	    flex-direction: column; /* 내용을 세로로 정렬 */
	    align-items: center; /* 수직 정렬 */
	    justify-content: center; /* 수평 정렬 */
	}
	
	.box img {
	    display: inline; /* 이미지를 인라인으로 표시하여 같은 라인에 배치 */
	}
	
	.container  >.row::after {
	        content: "";
	        clear: both;
	        display: table;   
	 }
	
	    .col-3 {
	        float: left;
	        width: 30%;
	    }
	    .btn{
	        width: 250px;
	    }
	    .font{
	    font-size: 18px
	    }
	    
		.stadium{
			font-size: 18px;
			font-weight: bold;
			color: #00000;
		}
		
		.btn.before{
			filter: brightness(100%);
		}
		
		.btn.ing{
		background-color: #fa2828;
		}
		
		.btn.ing >.link{
		color: #ffffff;
		}
		
		

</style>

<script>


</script>

<div class="container w-1000">
    <div class="row mb-30">
        <img src="./images/main.jpg" width="1000" class="main-image">
    </div>

    <div class="row left mb-20">
        <label class="open">예매오픈</label>
    </div>
    
	<div class="container">
    <c:set var="days" value="${now.time + (1 * 24 * 60 * 60 * 1000)}" />
    <c:forEach var="group"  items="${voList}" varStatus="status"  begin="0" end="5" >
     <c:if test="${group.matchDate.time > days}">
        <c:if test="${status.index % 3 == 0}">
            <div class="row">
        </c:if>

        <div class="col-3 mb-20">
            <div class="box">
            <div class="row">
                <img src="./images/${group.awayTeamNo}.jpg" width="40%"> vs
                <img src="./images/${group.homeTeamNo}.jpg" width="40%">
                </div>
                <hr width="80%">
                <label class="font mt-10">
                    <fmt:formatDate value="${group.matchDate}" pattern="yyyy.MM.dd  (E) HH:mm" />
                </label>
                <label class="mt-10 stadium">${group.stadiumName}</label>
                <div>
                <c:choose>
                            		<c:when test="${now.time >= group.matchDate.time - (4 * 24 * 60 * 60 * 1000)}">
                                		<div class="btn ing">
									    <a href="/reservation/insert?matchNo=${group.matchNo}" class="link">
									        예매하기
									    </a>
									</div>
                            		</c:when>
                            		<c:otherwise>
                                		<div class="btn before link">예매 오픈 예정</div>
                            		</c:otherwise>
                      </c:choose>
                </div>
                
            </div>
        </div>
    </c:if>
    </c:forEach>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>