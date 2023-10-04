<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp"></jsp:include>

   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

<style>
	        
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
			font-size: 18px
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
		
		:root {
            --swiper-theme-color : #black;
        } 

        .swiper {
            width: 100%;
            height: 100%;
        }

</style>

<script>
        $(function () {
            var swiper = new Swiper(".swiper", {
                // Optional parameters
                // direction: 'vertical', //슬라이드 방향
                loop: true, //슬라이드 순환 설정

                // If we need pagination
                pagination: { //페이지 번호 표시(분할)
                    el: ".swiper-pagination", //적용할 영역(요소)
                    type: 'bullets', //페이지네이션 유형 ('progressbar' | 'bullets' | 'fraction' | 'custom')
                    clickable:true, //페이지네이션 클릭가능여부
                },

                // Navigation arrows (이동 화살표)
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                    hideOnClick:true, //클릭 시 숨김 처리 여부
                },


                //자동재생
                autoplay:{
                    delay:1500, //재생간격(ms)
                    pauseOnMouseEnter:true, //마우스 진입 시 멈춤 여부
                    disableOnInteraction: false, //유저 상호작용 시 자동재생을 일시적으로 멈추지 않도록 설정
                },

                //이펙트(전환효과) 설정
                effect:"slide", // ('slide', 'fade', 'cube', 'coverflow', 'flip', 'creative', 'cards')
            });
        });
    </script>
    
<div class="container w-1000">

    <div class="row mb-30">
         <div class="swiper">
                <!-- Additional required wrapper -->
                <div class="swiper-wrapper">
                    <!-- Slides -->
                    <div class="swiper-slide">
                        <img src="./images/main1.jpg" class="main-image"  width="1000px" >
                    </div>
                    <div class="swiper-slide">
                        <img src="./images/main2.jpg" class="main-image"  width="1000px" >
                    </div>
                    <div class="swiper-slide">
                        <img src="./images/main3.jpg" class="main-image"  width="1000px" >
                    </div>
                    <div class="swiper-slide">
                        <img src="./images/main4.jpg" class="main-image"  width="1000px" >
                    </div>
                    <div class="swiper-slide">
                        <img src="./images/main5.jpg" class="main-image"  width="1000px" >
                    </div>
                </div>
                <!-- If we need pagination -->
                <div class="swiper-pagination"></div>

                <!-- If we need navigation buttons -->
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>

            </div>
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
                <img src="./images/${group.awayTeamNo}.jpg" width="35%"> vs
                <img src="./images/${group.homeTeamNo}.jpg" width="35%">
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



<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>