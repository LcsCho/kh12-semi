<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/mypageSidebar.jsp"></jsp:include>

<style>
table {
	border-collapse: collapse;
	text-align: center; 
 	display: flex;
  	justify-content: center; 
  	align-items: center; 
  	margin-top: 2em;
  	margin-bottom: 2em;
}

table th {
	border-top: #62676C 3px solid;
	border-bottom: #62676C 2px solid;
	border-right: #D1CFCF 2px solid;
	background-color: #f1f1f1;
	font-weight: bold;
    width: 150px;
	height: 74px;
	font-size: 18px;
	color: #62676C;
	font-weight: bold;
	display: flex;
  	justify-content: center; 
  	align-items: center; 
}

table td {
	border-top: #D1CFCF 2px solid;
	border-bottom: #D1CFCF 2px solid;
	border-right: #D1CFCF 3px solid;
    width: 500px;
	padding-top: 0.4em;
	font-size: 20px;
}

td:nth-last-child(1), th:nth-last-child(1) {
	border-right: none;
}

.form-input,
.btn {
	    display: inline-block;
	    text-decoration: none;
	    vertical-align: bottom;
	    font-size: 18px;
	    padding: 0.5em 1em;
	    outline: none;
	    /*outline은 입력 창 선택 시 강조 효과 */
	    border-radius: 0.1em;
	    line-height: 1.2em;
	    border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}


</style>
<!-- daum 우편 API cdn -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    $(function(){
        //검색버튼, 우편번호 입력창, 기본주소 입력창을 클릭하면 검색 실행
        $(".post-search").click(function(){
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    //document.querySelector("[name=memberPost]").value = data.zonecode;
                    $("[name=memberPost]").val(data.zonecode);
                    //document.querySelector("[name=memberAddr1]").value = addr;
                    $("[name=memberAddr1]").val(addr);
                    // 커서를 상세주소 필드로 이동한다.
                    //document.querySelector("[name=memberAddr2]").focus();
                    $("[name=memberAddr2]").focus();
                    $(".post-clear").show();
                }
            }).open();
        });
        
        //x버튼 누르면 주소 지우기
        $(".post-clear").click(function(){
        	$("[name=memberPost],[name=memberAddr1],[name=memberAddr2]").val("").removeClass("success fail");
        });
        $("[name=memberAddr2]").on("input blur", function(){
			var post = $("[name=memberPost]").val();
			var addr1 = $("[name=memberAddr1]").val();
			var addr2 = $("[name=memberAddr2]").val();
			if(post.length == 0 && addr1.length == 0 && addr2.length == 0) {
				$(".post-clear").hide();				
			}
			else {
				$(".post-clear").show();        	
			}
        });
        $(".post-clear").hide();
    });
 </script>
       
<c:if test="${param.error != null}">
	<h4 style="color:red">입력하신 비밀번호가 일치하지 않습니다</h4>
</c:if>

<h4>해당 화면을 클릭하면 수정이 가능합니다</h4>
<form action="change" method="post" autocomplete="off">

		 <table>
            <tr>
                <th>
                    닉네임
                </th>
                <td><input type="text" name="memberNick" value="${memberDto.memberNick}" class="form-input w-100" required></td>
            </tr>
            <tr>
                <th>
                    이메일
                </th>
                <td> <input type="email" name="memberEmail" value="${memberDto.memberEmail}" class="form-input w-100" ></td>
            </tr>
            <tr>
                <th>
                    연락처
                </th>
                <td><input type="tel" name="memberTel" value="${memberDto.memberTel}" class="form-input w-100" ></td>
            </tr>
            <tr>
                <th>
                    생년월일
                </th>
                <td><input type="date" name="memberBirth" value="${memberDto.memberBirth}"  class="form-input w-100"></td>
            </tr>
            <tr>
                <th>
                    우편번호
                </th>
          <td>
            <input type="text" name="memberPost" size="6" maxlength="6"
                placeholder="우편번호" value="${memberDto.memberPost}" class="form-input w-100 post-search">
       
    </td>
            </tr>
            <tr>
            	<th>
            		기본주소
            	</th>
            	<td>
            	<input type="text" name="memberAddr1" size="50" 
            placeholder="기본주소" value="${memberDto.memberAddr1}" class="form-input w-100 post-search">
            </td>
            </tr>
            <tr>
            	<th>상세주소</th>
            	<td>
            	 <input type="text" name="memberAddr2" size="50" 
            placeholder="상세주소" value="${memberDto.memberAddr2}" class="form-input w-100 post-input">
            	</td>
            </tr>
            <tr>
                <th>
                    등급
                </th>
                <td>
                <div class="form-input w-100">
                ${memberDto.memberLevel}
                 </div>
                </td>
            </tr>
            <tr>
                <th>
                    가입일
                </th>
                <td>
                <div class="form-input w-100">
                <fmt:formatDate value="${memberDto.memberJoin}" 
                    pattern="y년 M월 d일 E a h시 m분 s초"/>
                     </div>
                    </td>
            </tr>
            <tr>
                <th>
                    마지막로그인
                </th>
                <td>
                <div class="form-input w-100">
                <fmt:formatDate value="${memberDto.memberLastLogin}" 
                    pattern="y년 M월 d일 E a h시 m분 s초"/>
                     </div>
                    </td>
            </tr>
            <tr>
                <th>
                    마지막변경일
                </th>
                <td> 
                <div class="form-input w-100">
                 <fmt:formatDate value="${memberDto.memberLastUpdate}" 
                    pattern="y년 M월 d일 E a h시 m분 s초"/>
                     </div>
                    </td>
            </tr>
             <tr>
                <th>
                    비밀번호 확인
                </th>
                <td> <input type="password" name="memberPw" class="form-input w-100" required>
            </tr>
    </table>
		
	<div class="row">
	<button type="submit" class="btn">정보변경</button>
	</div>
	
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>