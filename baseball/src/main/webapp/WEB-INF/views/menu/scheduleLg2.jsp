<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
        background-color: #bf0838;
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
    
    table {border-collapse: collapse; width: 800px; height: 800px;}
    td{border: 1px solid #D1CFCF; padding: 3px; width: 150px; height: 150px;}
    th{border: 1px solid #D1CFCF; font-weight: bold; height: 40px; padding-top: 0.5em;}
    th:nth-child(6) {color:#DD6045;} 
    th:nth-last-child(1) {color:#3D85B9;}
        </style>
        
<div class="row">
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
                    
                    <tr>
                    <c:forEach var="matchDto" items="${list}" varStatus="status">
                    <td>
                    	<div><img src="/images/vs두산.png" width="70%"></div>
                    	<div><fmt:formatDate value="${matchDto.matchDate}" pattern="yyyy-MM-dd HH:mm" /></div>
                    	<div>${matchDto.awayTeam}</div>
                    	<div>${matchDto.stadiumName}</div>
                    	  <div><c:choose>
                            <c:when test="${now.time >= matchDto.matchDate.time}">
                                예매 불가
                            </c:when>
                            <c:when test="${now.time >= matchDto.matchDate.time - (4 * 24 * 60 * 60 * 1000)}">
                                <a href="/reservation/insert?matchNo=${matchDto.matchNo}">예매하기</a>
                            </c:when>
                            <c:otherwise>
                                예매 전
                            </c:otherwise>
                        </c:choose></div>
                    </td>
                    
                    
                    </c:forEach>
                    </tr>
        </thead>

            
        <tbody align="center">
     		
          
        </tbody>
    </table>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>