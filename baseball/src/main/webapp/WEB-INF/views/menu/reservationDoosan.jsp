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


    .btn{
        font-size: 18px;
        margin: 0.5em;
        border-radius: 5px;
        background-color: #110f29;
        color: white;
        border: none;
    }

    .team-choice{
        margin-left: -1.5em;
        height: 60px;
    }

    .doosan, .lg{
        margin-left: 2em;
        font-size: 20px;
        border-radius: 5px;
        background-color: #110f29;
        color: white;
        margin-bottom: 2em;
        width: 80px;'

    }
    .doosan{
        margin-left: 2em;
        background-color: #110f29;
    }
    .lg{
        background-color: #bf0838;
        margin-left: 0em;
        text-align: center;
    }
    
   
    table {border-collapse: collapse; margin-left: auto; margin-right: auto;}
    td{border-bottom: 1px solid #D1CFCF; padding: 3px; width: 900px; height: 130px;}

    .flex-container{
        padding-top: 0.3em;
        justify-content : center;
        align-items : center;
        text-align: center;       
    }
    .day{
        font-size: 30px;
        font-weight: bold;
    }

    .vs{
        font-size: 30px;
        color: #878787;
    }


    .col-2.left{
        font-size: 18px;
        font-weight: bold;
        color: #878787;
    }

    .font{
        font-size: 20px;
        font-weight: bold;
        color: #404040;
    }
    .font-2{
        font-size: 15px;
        font-weight: bold;
        color: #404040;
    }
    
    .col-7-1, .col-7-5{
        width: 25%;
    }
    .col-7-2{
        width: 18%;
    }
    .col-7-4{
        width: 30%;
    }
        </style>

 <div class="container w-1000">
 
				<a href="/reservation/doosan" class="btn doosan">두산</a> 
                 <a href="/reservation/lg" class="btn lg">LG</a>

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


                   <table>
   
             <tbody>
                  <tr>
                    <td>
                        <div class="row flex-container">

                            <div class="row col-7-1">
                                <div class="day">10. 03</div>
                            </div>
                            <div class="row col-7-2">
                                <div class="col-2 left">(화)</div>
                                <div class="col-2 left">18:30</div>
                            </div>
                            <div class="row col-7">
                                <img src="/images/두산로고.png" width="90%">
                            </div>
                            <div class="row col-7">
                                <div class="vs">VS</div>
                            </div>
                            <div class="row col-7">
                                <img src="/images/엘지로고.png" width="90%">
                            </div>
                            <div class="row col-7-4">
                                <div class="font">두산 VS LG</div>
                                <div class="font-2">잠실 야구장</div>
                            </div>
                            <div class="row col-7-5">
                                <div class="btn reservation">예매하기</div>
                            </div>
                        </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                        <div class="row flex-container">

                            <div class="row col-7-1">
                                <div class="day">10. 03</div>
                            </div>
                            <div class="row col-7-2">
                                <div class="col-2 left">(화)</div>
                                <div class="col-2 left">18:30</div>
                            </div>
                            <div class="row col-7">
                                <img src="/images/두산로고.png" width="90%">
                            </div>
                            <div class="row col-7">
                                <div class="vs">VS</div>
                            </div>
                            <div class="row col-7">
                                <img src="/images/엘지로고.png" width="90%">
                            </div>
                            <div class="row col-7-4">
                                <div class="font">두산 VS LG</div>
                                <div class="font-2">잠실 야구장</div>
                            </div>
                            <div class="row col-7-5">
                                <div class="btn reservation">예매하기</div>
                            </div>
                        </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                        <div class="row flex-container">

                            <div class="row col-7-1">
                                <div class="day">10. 03</div>
                            </div>
                            <div class="row col-7-2">
                                <div class="col-2 left">(화)</div>
                                <div class="col-2 left">18:30</div>
                            </div>
                            <div class="row col-7">
                                <img src="/images/두산로고.png" width="90%">
                            </div>
                            <div class="row col-7">
                                <div class="vs">VS</div>
                            </div>
                            <div class="row col-7">
                                <img src="/images/엘지로고.png" width="90%">
                            </div>
                            <div class="row col-7-4">
                                <div class="font">두산 VS LG</div>
                                <div class="font-2">잠실 야구장</div>
                            </div>
                            <div class="row col-7-5">
                                <div class="btn reservation">예매하기</div>
                            </div>
                        </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                        <div class="row flex-container">

                            <div class="row col-7-1">
                                <div class="day">10. 03</div>
                            </div>
                            <div class="row col-7-2">
                                <div class="col-2 left">(화)</div>
                                <div class="col-2 left">18:30</div>
                            </div>
                            <div class="row col-7">
                                <img src="/images/두산로고.png" width="90%">
                            </div>
                            <div class="row col-7">
                                <div class="vs">VS</div>
                            </div>
                            <div class="row col-7">
                                <img src="/images/엘지로고.png" width="90%">
                            </div>
                            <div class="row col-7-4">
                                <div class="font">두산 VS LG</div>
                                <div class="font-2">잠실 야구장</div>
                            </div>
                            <div class="row col-7-5">
                                <div class="btn reservation">예매하기</div>
                            </div>
                        </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                        <div class="row flex-container">

                            <div class="row col-7-1">
                                <div class="day">10. 03</div>
                            </div>
                            <div class="row col-7-2">
                                <div class="col-2 left">(화)</div>
                                <div class="col-2 left">18:30</div>
                            </div>
                            <div class="row col-7">
                                <img src="/images/두산로고.png" width="90%">
                            </div>
                            <div class="row col-7">
                                <div class="vs">VS</div>
                            </div>
                            <div class="row col-7">
                                <img src="/images/엘지로고.png" width="90%">
                            </div>
                            <div class="row col-7-4">
                                <div class="font">두산 VS LG</div>
                                <div class="font-2">잠실 야구장</div>
                            </div>
                            <div class="row col-7-5">
                                <div class="btn reservation">예매하기</div>
                            </div>
                        </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                        <div class="row flex-container">

                            <div class="row col-7-1">
                                <div class="day">10. 03</div>
                            </div>
                            <div class="row col-7-2">
                                <div class="col-2 left">(화)</div>
                                <div class="col-2 left">18:30</div>
                            </div>
                            <div class="row col-7">
                                <img src="/images/두산로고.png" width="90%">
                            </div>
                            <div class="row col-7">
                                <div class="vs">VS</div>
                            </div>
                            <div class="row col-7">
                                <img src="/images/엘지로고.png" width="90%">
                            </div>
                            <div class="row col-7-4">
                                <div class="font">두산 VS LG</div>
                                <div class="font-2">잠실 야구장</div>
                            </div>
                            <div class="row col-7-5">
                                <div class="btn reservation">예매하기</div>
                            </div>
                        </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                        <div class="row flex-container">

                            <div class="row col-7-1">
                                <div class="day">10. 03</div>
                            </div>
                            <div class="row col-7-2">
                                <div class="col-2 left">(화)</div>
                                <div class="col-2 left">18:30</div>
                            </div>
                            <div class="row col-7">
                                <img src="/images/두산로고.png" width="90%">
                            </div>
                            <div class="row col-7">
                                <div class="vs">VS</div>
                            </div>
                            <div class="row col-7">
                                <img src="/images/엘지로고.png" width="90%">
                            </div>
                            <div class="row col-7-4">
                                <div class="font">두산 VS LG</div>
                                <div class="font-2">잠실 야구장</div>
                            </div>
                            <div class="row col-7-5">
                                <div class="btn reservation">예매하기</div>
                            </div>
                        </div>
                    </td>
                  </tr>
                </tbody>
            </table>

                    </div>
        
                    </div>
              
                </div>
            </div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>