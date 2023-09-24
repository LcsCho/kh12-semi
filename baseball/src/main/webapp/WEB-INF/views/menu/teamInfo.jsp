<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
 table {
            border-collapse: collapse;
        }

        table th {
            border-top: #62676C 3px solid;
            border-bottom: #62676C 2px solid;
            border-right: #D1CFCF 2px solid;
            background-color: #f1f1f1;
            font-weight: bold;
            height: 40px;
            padding-top: 0.5em;
            font-size: 16px;
            color: #62676C;
            font-weight: bold;
        }

        table td {
            border-top: #D1CFCF 2px solid;
            border-bottom: #D1CFCF 2px solid;
            border-right: #D1CFCF 3px solid;
            width: 150px;
            height: 50px;
            padding-top: 0.3em;
        }

        td:nth-last-child(1),
        th:nth-last-child(1) {
            border-right: none;
        }

        th:nth-child(1) {
            width: 22%;
        }

        th:nth-child(2) {
            width: 13%;
        }

        th:nth-child(3) {
            width: 10%;
        }

        table td img {
            vertical-align: middle;
            /* 이미지를 수직 가운데 정렬 */
            padding-left: 1em;
        }

        table td .team-name {
            font-size: 18px;
            font-weight: bold;
            vertical-align: middle;
            /* 팀명을 이미지와 수직 가운데 정렬 */
            display: inline-block;
            /* span 요소를 인라인 블록으로 설정하여 나란히 표시 */
        }

        table td .team,
        .team-win {
            font-size: 18px;
            color: #818181;
            font-weight: bold;
            vertical-align: middle;
            display: inline-block;
        }

        table td .team-win {
            padding-left: 1em;
        }

        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
            width: 750px;
        }

        .t-data th {
            border-top: #D1CFCF 2px solid;
            border-bottom: #D1CFCF 2px solid;
            border-right: #D1CFCF 3px solid;
            background-color: #f1f1f1;
            height: 40px;
            padding-top: 0.5em;
            font-size: 16px;
            color: #3f3f3f;
            font-weight: bold;
            padding-left: 1em;
        }

        .t-data td {
            border-top: #D1CFCF 2px solid;
            border-bottom: #D1CFCF 2px solid;
            border-right: #D1CFCF 3px solid;
            width: 550px;
            height: 40px;
            padding-top: 0.7em;
            padding-left: 1em;
            font-weight: bold;
            color: #62676C;
        }

        .t-data td:nth-last-child(1),
        .t-data th:nth-last-child(1) {
            border-right: none;
        }

        .close-popup {
            padding-right: 0.5em;
        }
        
         a {
        color: inherit; 
        text-decoration: none; /* 텍스트 밑줄 제거 */
    }
</style>

<script>
$(document).ready(function () {
    // 팝업 열기
    $(".open-popup").click(function () {
        // 현재 열려있는 모든 팝업을 닫기
        $('.popup').fadeOut();
        var popupId = $(this).data("popup-id");
        $("#" + popupId).fadeIn();
    });

    // 팝업 닫기
    $(".close-popup").click(function () {
        $(".popup").fadeOut();
    });
});
</script>

    <table>
        <h3>팀 정보</h3>
        <br>
        
        
 <thead>
            <tr>
                <th>팀명</th>
                <th>창단연도</th>
                <th>연고지</th>
                <th>우승횟수(연도)</th>
            </tr>
        </thead>
        <tbody>
            <!-- SSG 구단정보-->
            <tr>
                <td>
                    <div class="row left">
                        <a href="#popup-ssg" class="open-popup" data-popup-id="popup-ssg">
                            <img src="/images/ssg_logo.png">
                            <span class="team-name">SSG 랜더스</span>
                        </a>
                        <div id="popup-ssg" class="popup float-container">
                            <div class="row left col-2">
                                SSG 랜더스 구단정보
                            </div>
                            <div class="row right clo-2">
                                <a href="#" class="close-popup">
                                    <i class="fa-regular fa-circle-xmark fa-xl"></i>
                                </a>
                            </div>
                            <table class="t-data">
                                <tr>
                                    <th>구단사무실</th>
                                    <td>(우 22234) 인천광역시 미추홀구 매소홀로 618 인천SSG랜더스필드 내</td>
                                </tr>
                                <tr>
                                    <th>전화/팩스</th>
                                    <td>032)455-2600 / Fax : 032)455-2699</td>
                                </tr>
                                <tr>
                                    <th>홈페이지</th>
                                    <td>
                                        <a href="http://www.ssglanders.com" target="_blank">www.ssglanders.com</a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>창단년도</th>
                                    <td>2021년</td>
                                </tr>
                                <tr>
                                    <th>연고지역</th>
                                    <td>인천광역시</td>
                                </tr>
                                <tr>
                                    <th>구단주</th>
                                    <td>정용진</td>
                                </tr>
                                <tr>
                                    <th>대표이사</th>
                                    <td>민경삼</td>
                                </tr>
                                <tr>
                                    <th>단장</th>
                                    <td>김성용</td>
                                </tr>
                                <tr>
                                    <th>감독</th>
                                    <td>김원형</td>
                                </tr>

                            </table>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="row">
                        <sapn class="team">2021</sapn>
                    </div>
                </td>
                <td>
                    <div class="row">
                        <sapn class="team">인천</sapn>
                    </div>
                </td>
                <td>
                    <div class="row left">
                        <span class="team-win">5회 (2007, 2008, 2010, 2018, 2022)
                            <br>※SK 와이번스 우승 기록 포함
                        </span>
                    </div>
                </td>
            </tr>

            <!-- 키움 구단정보-->
            <tr>
                <td>
                    <div class="row left">
                        <a href="#popup-kiwoom" class="open-popup" data-popup-id="popup-kiwoom">
                            <img src="/images/kiwoom_logo.png">
                            <span class="team-name">키움 히어로즈</span>
                        </a>

                        <!-- 팝업(상세)-->
                        <div id="popup-kiwoom" class="popup float-container">
                            <div class="row left col-2">
                                키움 히어로즈 구단정보
                            </div>
                            <div class="row right clo-2">
                                <a href="#" class="close-popup">
                                    <i class="fa-regular fa-circle-xmark fa-xl"></i>
                                </a>
                            </div>
                            <table class="t-data">
                                <tr>
                                    <th>구단사무실</th>
                                    <td>(우 08275) 서울특별시 구로구 경인로 430 고척스카이돔 내</td>
                                </tr>
                                <tr>
                                    <th>전화/팩스</th>
                                    <td>02)3660-1000 / 02)3660-1099</td>
                                </tr>
                                <tr>
                                    <th>홈페이지</th>
                                    <td>
                                        <a href="https://www.heroesbaseball.co.kr" target="_blank">www.heroesbaseball.co.kr </a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>창단년도</th>
                                    <td>2008년</td>
                                </tr>
                                <tr>
                                    <th>연고지역</th>
                                    <td>서울특별시</td>
                                </tr>
                                <tr>
                                    <th>구단주</th>
                                    <td>박세영</td>
                                </tr>
                                <tr>
                                    <th>대표이사</th>
                                    <td>위재민</td>
                                </tr>
                                <tr>
                                    <th>단장</th>
                                    <td>고형욱</td>
                                </tr>
                                <tr>
                                    <th>감독</th>
                                    <td>홍원기</td>
                                </tr>

                            </table>
                </td>
                <td>
                    <div class="row">
                        <sapn class="team">2008</sapn>
                    </div>
                </td>
                <td>
                    <div class="row">
                        <sapn class="team">서울</sapn>
                    </div>
                </td>
                <td>
                    <div class="row left">
                        <span class="team-win">-
                        </span>
                    </div>
                </td>
            </tr>

            <!-- LG 구단정보-->
            <tr>
                <td>
                    <div class="row left">
                        <a href="#popup-lg" class="open-popup" data-popup-id="popup-lg">
                            <img src="/images/lg_logo.png">
                            <span class="team-name">LG 트윈스</span>
                        </a>

                        <!-- 팝업(상세)-->
                        <div id="popup-lg" class="popup float-container">
                            <div class="row left col-2">
                                LG 트윈스 구단정보
                            </div>
                            <div class="row right clo-2">
                                <a href="#" class="close-popup">
                                    <i class="fa-regular fa-circle-xmark fa-xl"></i>
                                </a>
                            </div>
                            <table class="t-data">
                                <tr>
                                    <th>구단사무실</th>
                                    <td>서울특별시 송파구 올림픽로 25 잠실야구장 내(우05500)</td>
                                </tr>
                                <tr>
                                    <th>전화/팩스</th>
                                    <td>- / 02)2005-5800</td>
                                </tr>
                                <tr>
                                    <th>홈페이지</th>
                                    <td>
                                        <a href="https://www.lgtwins.com" target="_blank">www.lgtwins.com</a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>창단년도</th>
                                    <td>1990년</td>
                                </tr>
                                <tr>
                                    <th>연고지역</th>
                                    <td>서울특별시</td>
                                </tr>
                                <tr>
                                    <th>구단주</th>
                                    <td>구광모</td>
                                </tr>
                                <tr>
                                    <th>대표이사</th>
                                    <td>김인석</td>
                                </tr>
                                <tr>
                                    <th>단장</th>
                                    <td>차명석</td>
                                </tr>
                                <tr>
                                    <th>감독</th>
                                    <td>염경엽</td>
                                </tr>

                            </table>
                </td>
                <td>
                    <div class="row">
                        <sapn class="team">1990</sapn>
                    </div>
                </td>
                <td>
                    <div class="row">
                        <sapn class="team">서울</sapn>
                    </div>
                </td>
                <td>
                    <div class="row left">
                        <span class="team-win">2회 (1990, 1994)
                        </span>
                    </div>
                </td>
            </tr>

            <!-- KT 구단정보-->
            <tr>
                <td>
                    <div class="row left">
                        <a href="#popup-kt" class="open-popup" data-popup-id="popup-kt">
                            <img src="/images/kt_logo.png">
                            <span class="team-name">KT 위즈</span>
                        </a>

                         <!-- 팝업(상세)-->
                        <div id="popup-kt" class="popup float-container">
                            <div class="row left col-2">
                                KT 위즈 구단정보
                            </div>
                            <div class="row right clo-2">
                                <a href="#" class="close-popup">
                                    <i class="fa-regular fa-circle-xmark fa-xl"></i>
                                </a>
                            </div>
                            <table class="t-data">
                                <tr>
                                    <th>구단사무실</th>
                                    <td>(우 16308) 경기도 수원시 장안구 경수대로 893 수원 케이티 위즈 파크 내</td>
                                </tr>
                                <tr>
                                    <th>전화/팩스</th>
                                    <td>1899-5916 / (031) 274-5945</td>
                                </tr>
                                <tr>
                                    <th>홈페이지</th>
                                    <td>
                                        <a href="https://www.ktwiz.co.kr" target="_blank">www.ktwiz.co.kr</a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>창단년도</th>
                                    <td>2013년</td>
                                </tr>
                                <tr>
                                    <th>연고지역</th>
                                    <td>수원시</td>
                                </tr>
                                <tr>
                                    <th>구단주</th>
                                    <td>구현모</td>
                                </tr>
                                <tr>
                                    <th>대표이사</th>
                                    <td>신현옥</td>
                                </tr>
                                <tr>
                                    <th>단장</th>
                                    <td>나도현</td>
                                </tr>
                                <tr>
                                    <th>감독</th>
                                    <td>이강철</td>
                                </tr>

                            </table>
                </td>
                <td>
                    <div class="row">
                        <sapn class="team">2013</sapn>
                    </div>
                </td>
                <td>
                    <div class="row">
                        <sapn class="team">수원</sapn>
                    </div>
                </td>
                <td>
                    <div class="row left">
                        <span class="team-win">1회 (2021)
                        </span>
                    </div>
                </td>
            </tr>

            <!-- KIA 구단정보-->
            <tr>
                <td>
                    <div class="row left">
                        <a href="#popup-kia" class="open-popup" data-popup-id="popup-kia">
                            <img src="/images/kia_logo.png">
                            <span class="team-name">KIA 타이거즈</span>
                        </a>

                        <!-- 팝업(상세)-->
                        <div id="popup-kia" class="popup float-container">
                            <div class="row left col-2">
                                KIA 타이거즈 구단정보
                            </div>
                            <div class="row right clo-2">
                                <a href="#" class="close-popup">
                                    <i class="fa-regular fa-circle-xmark fa-xl"></i>
                                </a>
                            </div>
                            <table class="t-data">
                                <tr>
                                    <th>구단사무실</th>
                                    <td>(우 61255) 광주광역시 북구 서림로 10 광주-기아 챔피언스 필드 내 2층</td>
                                </tr>
                                <tr>
                                    <th>전화/팩스</th>
                                    <td>070)7686-8000 / 062)525-5350</td>
                                </tr>
                                <tr>
                                    <th>홈페이지</th>
                                    <td>
                                        <a href="https://www.tigers.co.kr" target="_blank">www.tigers.co.kr</a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>창단년도</th>
                                    <td>2001년</td>
                                </tr>
                                <tr>
                                    <th>연고지역</th>
                                    <td>광주광역시</td>
                                </tr>
                                <tr>
                                    <th>구단주</th>
                                    <td>송호성</td>
                                </tr>
                                <tr>
                                    <th>대표이사</th>
                                    <td>최준영</td>
                                </tr>
                                <tr>
                                    <th>단장</th>
                                    <td>심재학</td>
                                </tr>
                                <tr>
                                    <th>감독</th>
                                    <td>김종국</td>
                                </tr>

                            </table>
                </td>
                <td>
                    <div class="row">
                        <sapn class="team">2001</sapn>
                    </div>
                </td>
                <td>
                    <div class="row">
                        <sapn class="team">광주</sapn>
                    </div>
                </td>
                <td>
                    <div class="row left">
                        <span class="team-win">11회 (1983, 1986~1989, 1991, 1993, 1996, 1997, 2009, 2017)
                            <br>※ 해태 타이거즈 우승 기록 포함
                        </span>
                    </div>
                </td>
            </tr>

            <!-- NC 구단정보-->
            <tr>
                <td>
                    <div class="row left">
                        <a href="#popup-nc" class="open-popup" data-popup-id="popup-nc">
                            <img src="/images/nc_logo.png">
                            <span class="team-name">NC 다이노스</span>
                        </a>

                        <!-- 팝업(상세)-->
                        <div id="popup-nc" class="popup float-container">
                            <div class="row left col-2">
                                NC 다이노스 구단정보
                            </div>
                            <div class="row right clo-2">
                                <a href="#" class="close-popup">
                                    <i class="fa-regular fa-circle-xmark fa-xl"></i>
                                </a>
                            </div>
                            <table class="t-data">
                                <tr>
                                    <th>구단사무실</th>
                                    <td>경상남도 창원시 마산회원구 삼호로 63 창원NC파크 내(우51323)</td>
                                </tr>
                                <tr>
                                    <th>전화/팩스</th>
                                    <td>1644 - 9112 / 055) 608-8299</td>
                                </tr>
                                <tr>
                                    <th>홈페이지</th>
                                    <td>
                                        <a href="https://www.ncdinos.com" target="_blank">www.ncdinos.com</a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>창단년도</th>
                                    <td>2011년</td>
                                </tr>
                                <tr>
                                    <th>연고지역</th>
                                    <td>창원시</td>
                                </tr>
                                <tr>
                                    <th>구단주</th>
                                    <td>김택진</td>
                                </tr>
                                <tr>
                                    <th>대표이사</th>
                                    <td>이진만</td>
                                </tr>
                                <tr>
                                    <th>단장</th>
                                    <td>임선남</td>
                                </tr>
                                <tr>
                                    <th>감독</th>
                                    <td>강인권</td>
                                </tr>

                            </table>
                </td>
                <td>
                    <div class="row">
                        <sapn class="team">2011</sapn>
                    </div>
                </td>
                <td>
                    <div class="row">
                        <sapn class="team">창원</sapn>
                    </div>
                </td>
                <td>
                    <div class="row left">
                        <span class="team-win">1회 (2020)
                        </span>
                    </div>
                </td>
            </tr>

            <!-- 삼성 구단정보-->
            <tr>
                <td>
                    <div class="row left">
                        <a href="#popup-samsung" class="open-popup" data-popup-id="popup-samsung">
                            <img src="/images/samsung_logo.png">
                            <span class="team-name">삼성 라이온즈</span>
                        </a>

                        <!-- 팝업(상세)-->
                        <div id="popup-samsung" class="popup float-container">
                            <div class="row left col-2">
                                삼성 라이온즈 구단정보
                            </div>
                            <div class="row right clo-2">
                                <a href="#" class="close-popup">
                                    <i class="fa-regular fa-circle-xmark fa-xl"></i>
                                </a>
                            </div>
                            <table class="t-data">
                                <tr>
                                    <th>구단사무실</th>
                                    <td>(우 42250) 대구광역시 수성구 야구전설로 1 대구삼성라이온즈파크 내</td>
                                </tr>
                                <tr>
                                    <th>전화/팩스</th>
                                    <td>(053)780-3300 / -</td>
                                </tr>
                                <tr>
                                    <th>홈페이지</th>
                                    <td>
                                        <a href="https://www.samsunglions.com" target="_blank">www.samsunglions.com </a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>창단년도</th>
                                    <td>1982년</td>
                                </tr>
                                <tr>
                                    <th>연고지역</th>
                                    <td>대구광역시</td>
                                </tr>
                                <tr>
                                    <th>구단주</th>
                                    <td>유정근</td>
                                </tr>
                                <tr>
                                    <th>대표이사</th>
                                    <td>유정근</td>
                                </tr>
                                <tr>
                                    <th>단장</th>
                                    <td>홍준학</td>
                                </tr>
                                <tr>
                                    <th>감독</th>
                                    <td>박진만</td>
                                </tr>

                            </table>
                </td>
                <td>
                    <div class="row">
                        <sapn class="team">1982</sapn>
                    </div>
                </td>
                <td>
                    <div class="row">
                        <sapn class="team">대구</sapn>
                    </div>
                </td>
                <td>
                    <div class="row left">
                        <span class="team-win">8회 (1985, 2002, 2005, 2006, 2011~2014)
                        </span>
                    </div>
                </td>
            </tr>

            <!-- 롯데 구단정보-->
            <tr>
                <td>
                    <div class="row left">
                        <a href="#popup-lotte" class="open-popup" data-popup-id="popup-lotte">
                            <img src="/images/lotte_logo.png">
                            <span class="team-name">롯데 자이언츠</span>
                        </a>

                        <!-- 팝업(상세)-->
                        <div id="popup-lotte" class="popup float-container">
                            <div class="row left col-2">
                                롯데 자이언츠 구단정보
                            </div>
                            <div class="row right clo-2">
                                <a href="#" class="close-popup">
                                    <i class="fa-regular fa-circle-xmark fa-xl"></i>
                                </a>
                            </div>
                            <table class="t-data">
                                <tr>
                                    <th>구단사무실</th>
                                    <td>부산광역시 동래구 사직로 45 사직야구장 내(우47874)</td>
                                </tr>
                                <tr>
                                    <th>전화/팩스</th>
                                    <td>051)590-9000 / 051)506-0090</td>
                                </tr>
                                <tr>
                                    <th>홈페이지</th>
                                    <td>
                                        <a href="https://www.giantsclub.com" target="_blank">www.giantsclub.com</a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>창단년도</th>
                                    <td>1982년</td>
                                </tr>
                                <tr>
                                    <th>연고지역</th>
                                    <td>부산광역시</td>
                                </tr>
                                <tr>
                                    <th>구단주</th>
                                    <td>신동빈</td>
                                </tr>
                                <tr>
                                    <th>대표이사</th>
                                    <td>이강훈</td>
                                </tr>
                                <tr>
                                    <th>단장</th>
                                    <td>성민규</td>
                                </tr>
                                <tr>
                                    <th>감독</th>
                                    <td>래리 서튼</td>
                                </tr>
                                </table>
                            </td>
                            <td>
                                <div class="row">
                                    <sapn class="team">1982</sapn>
                                </div>
                            </td>
                            <td>
                                <div class="row">
                                    <sapn class="team">부산</sapn>
                                </div>
                            </td>
                            <td>
                                <div class="row left">
                                    <span class="team-win">2회 (1984, 1992)
                                    </span>
                                </div>
                            </td>
                        </tr>
            
            <!-- 두산 구단정보-->
            <tr>
                <td>
                    <div class="row left">
                        <a href="#popup-doosan" class="open-popup" data-popup-id="popup-doosan">
                            <img src="/images/doosan_logo.png">
                            <span class="team-name">두산 베어스</span>
                        </a>

                        <!-- 팝업(상세)-->
                        <div id="popup-doosan" class="popup float-container">
                            <div class="row left col-2">
                                두산 베어스 구단정보
                            </div>
                            <div class="row right clo-2">
                                <a href="#" class="close-popup">
                                    <i class="fa-regular fa-circle-xmark fa-xl"></i>
                                </a>
                            </div>
                            <table class="t-data">
                                <tr>
                                    <th>구단사무실</th>
                                    <td>서울특별시 송파구 올림픽로 25 잠실야구장 내(우05500)</td>
                                </tr>
                                <tr>
                                    <th>전화/팩스</th>
                                    <td>02)2240-1777 / 02)2240-1788</td>
                                </tr>
                                <tr>
                                    <th>홈페이지</th>
                                    <td>
                                        <a href="https://www.doosanbears.com" target="_blank">www.doosanbears.com</a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>창단년도</th>
                                    <td>1982년</td>
                                </tr>
                                <tr>
                                    <th>연고지역</th>
                                    <td>서울특별시</td>
                                </tr>
                                <tr>
                                    <th>구단주</th>
                                    <td>박정원</td>
                                </tr>
                                <tr>
                                    <th>대표이사</th>
                                    <td>전풍</td>
                                </tr>
                                <tr>
                                    <th>단장</th>
                                    <td>김태룡</td>
                                </tr>
                                <tr>
                                    <th>감독</th>
                                    <td>이승엽</td>
                                </tr>

                            </table>
                            <td>
                                <div class="row">
                                    <sapn class="team">1982</sapn>
                                </div>
                            </td>
                            <td>
                                <div class="row">
                                    <sapn class="team">서울</sapn>
                                </div>
                            </td>
                            <td>
                                <div class="row left">
                                    <span class="team-win">26회 (1982, 1995, 2001, 2015, 2016, 2019)
                                        <br>※ OB 베어스 우승 기록 포함
                                    </span>
                                </div>
                            </td>   
                </td>
            </tr>

            <!-- 한화 구단정보-->
            <tr>
                <td>
                    <div class="row left">
                        <a href="#popup-hanwha" class="open-popup" data-popup-id="popup-hanwha">
                            <img src="/images/hanwha_logo.png">
                            <span class="team-name">한화 이글스</span>
                        </a>

                        <!-- 팝업(상세)-->
                        <div id="popup-hanwha" class="popup float-container">
                            <div class="row left col-2">
                                한화 이글스 구단정보
                            </div>
                            <div class="row right clo-2">
                                <a href="#" class="close-popup">
                                    <i class="fa-regular fa-circle-xmark fa-xl"></i>
                                </a>
                            </div>
                            <table class="t-data">
                                <tr>
                                    <th>구단사무실</th>
                                    <td>(우 35021) 대전광역시 중구 대종로 373 한화생명 이글스파크 내</td>
                                </tr>
                                <tr>
                                    <th>전화/팩스</th>
                                    <td>042)630-8200 / 042)632-2929</td>
                                </tr>
                                <tr>
                                    <th>홈페이지</th>
                                    <td>
                                        <a href="https://www.hanwhaeagles.co.kr" target="_blank">www.hanwhaeagles.co.kr</a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>창단년도</th>
                                    <td>1986년</td>
                                </tr>
                                <tr>
                                    <th>연고지역</th>
                                    <td>대전광역시</td>
                                </tr>
                                <tr>
                                    <th>구단주</th>
                                    <td>김승연</td>
                                </tr>
                                <tr>
                                    <th>대표이사</th>
                                    <td>박찬혁</td>
                                </tr>
                                <tr>
                                    <th>단장</th>
                                    <td>손혁</td>
                                </tr>
                                <tr>
                                    <th>감독</th>
                                    <td>최원호</td>
                                </tr>

                            </table>
                </td>
                <td>
                    <div class="row">
                        <sapn class="team">1986</sapn>
                    </div>
                </td>
                <td>
                    <div class="row">
                        <sapn class="team">대전</sapn>
                    </div>
                </td>
                <td>
                    <div class="row left">
                        <span class="team-win">1회 (1999)
                        </span>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>