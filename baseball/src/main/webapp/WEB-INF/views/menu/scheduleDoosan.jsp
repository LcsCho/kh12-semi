<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
.teamlogo{
                width: 30%;
                margin-right: -2em;
                margin-left: 2em;
            }
            .notice{
                margin-left: -1.5em;
                width: 70%;
                height: 180px;
                box-shadow: 0px 0px 0px 2px #D1CFCF;
            }
            .team-notice{
                width: 20%;
                color: #1AA8BB;
                font-weight: bold;
                font-size: 20px;
                padding-left: 2em;
                padding-top: 4em;
            }
            .pre-notice{
                padding-left: 1em;
                padding-top: 2em;
                width: 80%;
                color: #62676C;
            }


        .day{
            padding-left: 1em;
            font-size: 13px;
        }

        .font{
        font-weight: bold;
        font-size: 15px;
        color: #838383;
        margin-top: -1em;
    }

    .btn{
        font-size: 18px;
        margin: 0.5em;
        border-radius: 10px;
        background-color: #110f29;
        color: white;
        border: none;
    }

     .doosan, .lg{
        margin-left: 2em;
        font-size: 20px;
        border-radius: 5px;
        background-color: #110f29;
        color: white;
        margin-bottom: 2em;

    }
    .doosan{
        margin-left: 2em;
        background-color: #110f29;
    }
    .lg{
        background-color: #bf0838;
        margin-left: 0em;
    }
    
    table {border-collapse: collapse;}
    td{border: 1px solid #D1CFCF; padding: 3px; width: 150px; height: 205px;}
    th{border: 1px solid #D1CFCF; font-weight: bold; height: 40px; padding-top: 0.5em;}
    th:nth-child(6) {color:#DD6045;} 
    th:nth-last-child(1) {color:#3D85B9;}
        </style>

 <div class="container w-1000">
 
				<a href="/schedule/doosan" class="btn doosan">두산</a> 
                 <a href="/schedule/lg" class="btn lg">엘지</a>

                    <div class="float-container">
                        <div class="col-2 teamlogo">
                            <img src="/images/두산베어스.png" width="200px"> 
                        </div>
                        <div class="col-2 notice">
                            <div class="float-container">
                                <div class="col-2 team-notice">구단공지</div>
                                <div class="col-2 pre-notice">
                                    <pre>
* 온라인 구매는 경기 시작 1시간 후 까지 예매 가능
(단, 경기 시작 2시간 30분 전부터는 취소는 불가하오니 예매 시 참고)
* 경기 당일 입장시간이 많이 소요되니 일찍 방문 하시기 바랍니다.
* 36개월 이상 어린이는 티켓 구매 후 입장 가능.
* 권종선택 실수로 인한 예매권은 현장에서 교환/환불 불가합니다.
(현장에서 재구매 해야합니다.)
                                    </pre>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row left mb-20">
                           <label class="open">예매하기 <2023. 10></label>
                    </div>

                   <table>
                <thead>
                    <tr>
                        <th>월</th>
                        <th>화</th>
                        <th>수</th>
                        <th>목</th>
                        <th>금</th>
                        <th>토</th>
                        <th>일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>                           

                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <div class="row left">
                                <label class="day left">1</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <a href="#" class="btn">예매하기</a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="row left">
                                <label class="day left">2</label>
                            </div>
                            
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">3</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <a href="#" class="btn">예매하기</a>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">4</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <a href="#" class="btn">예매하기</a>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">5</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <a href="#" class="btn">예매하기</a>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">6</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <a href="#" class="btn">예매하기</a>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">7</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <a href="#" class="btn">예매하기</a>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">8</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <a href="#" class="btn">예매하기</a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="row left">
                                <label class="day left">9</label>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">10</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">11</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">12</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">13</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">14</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">15</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="row left">
                                <label class="day left">16</label>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">17</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">18</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">19</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">20</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">21</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">22</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="row left">
                                <label class="day left">23</label>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">24</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">25</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">26</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">27</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">28</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">29</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="row left">
                                <label class="day left">30</label>
                            </div>
                        </td>
                        <td>
                            <div class="row left">
                                <label class="day left">31</label>
                            </div>
                            <div class="row">
                                <img src="/images/vs엘지.png" width="50%">
                            </div>
                            <div class="row">
                                <label class="font">잠실야구장</label>
                            </div>
                            <div class="row">
                                <label class="font">10:8 11:00오픈</label>
                            </div>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>

                    </div>
        
                    </div>
              
                </div>
            </div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>