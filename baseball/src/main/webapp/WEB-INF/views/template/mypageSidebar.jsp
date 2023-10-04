<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
  section {
        min-height: 400px;
        display: flex;
    }
    section > aside {
        width: 200px;
    }
    section > article {
        flex-grow: 1;
    }
    .flex-container {
            display: flex;
        }
        .inline-flex-container {
            display: inline-flex;
        }
        .flex-container.auto-width > *,
        .inline-flex-container.auto-width > * {
            flex-grow: 1;
        }
        .flex-container.vertical,
        .inline-flex-container.vertical {
            flex-direction: column;
        }
        .flex-container.align-center,
        .inline-flex-container.align-center {
            justify-content: center;
            align-items: center;
        }
        .flex-container.allow-wrap,
        .inline-flex-container.allow-wrap {
            flex-wrap: wrap;
        }
        .memberInfo{
     	border-top: #62676C 3px solid;
		border-bottom: #62676C 3px solid;
		border-right: #D1CFCF 2px solid;
		border-left: #D1CFCF 2px solid;
		font-size: 12px;
		padding: 1em;
        }
</style>
<aside>
                    <div class="flex-container vertical center">
                    <div class="row memberInfo">

                            <h2>${memberDto.memberId} 님의<br> 회원 정보</h2>
                        </div>
                        <div class="row">
                          <h4><a href="change" class="link">개인정보 변경</a></h4>
                        </div>
                        <div class="row">
                            <h4><a href="password" class="link">비밀번호 변경</a></h4>
                        </div>
                       <div class="row"> 
                         <h4><a href="/reservation/list" class="link">예매내역</a></h4> 
                      </div>
                     <div class="row"> 
                            <h4><a href="/reservation/cancelList" class="link">취소내역</a></h4>
                       </div> 
	                <div class="row"> 
                            <h4><a href="exit" class="link">회원탈퇴</a></h4>
                       </div> 
                    </div>
                </aside>
                  <article>