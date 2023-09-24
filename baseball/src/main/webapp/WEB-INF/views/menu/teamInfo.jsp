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
</style>

    <table>
        <h3>구단 소개</h3>
        <br>
        <thead>
            <tr>
                <th>팀명</th>
                <th>창단연도</th>
                <th>연고지</th>
                <th>우승횟수(연도)</th>
            </tr>
        </thead>
        <tr>
            <td>
                <div class="row left">
                    <img src="/images/ssg_logo.png">
                    <span class="team-name">SSG 랜더스</span>
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

        <tr>
            <td>
                <div class="row left">
                    <img src="/images/kiwoom_logo.png">
                    <span class="team-name">키움 히어로즈</span>
                </div>
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

        <tr>
            <td>
                <div class="row left">
                    <img src="/images/lg_logo.png">
                    <span class="team-name">LG 트윈스</span>
                </div>
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

        <tr>
            <td>
                <div class="row left">
                    <img src="/images/kt_logo.png">
                    <span class="team-name">KT 위즈</span>
                </div>
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

        <tr>
            <td>
                <div class="row left">
                    <img src="/images/kia_logo.png">
                    <span class="team-name">KIA 타이거즈</span>
                </div>
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

        <tr>
            <td>
                <div class="row left">
                    <img src="/images/nc_logo.png">
                    <span class="team-name">NC 다이노스
                    </span>
                </div>
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

        <tr>
            <td>
                <div class="row left">
                    <img src="/images/lotte_logo.png">
                    <span class="team-name">롯데 자이언츠
                    </span>
                </div>
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

        <tr>
            <td>
                <div class="row left">
                    <img src="/images/doosan_logo.png">
                    <span class="team-name">두산 베어스
                    </span>
                </div>
            </td>
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
        </tr>

        <tr>
            <td>
                <div class="row left">
                    <img src="/images/hanwha_logo.png">
                    <span class="team-name">한화 이글스
                    </span>
                </div>
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
        <tbody>

        </tbody>
    </table>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>