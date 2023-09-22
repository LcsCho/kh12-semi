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
</style>
<aside>
                    <div class="flex-container vertical center">
                        <div class="row">
                            <h2><a href="/admin/team/register" class="link">팀 등록</a></h2>
                        </div>
                        <div class="row">
                            <h2><a href="/admin/team/list" class="link">팀 목록</a></h2>
                        </div>
                        <!-- <div class="row">
                            <h2><a href="#" class="link">메뉴3</a></h2>
                        </div>
                        <div class="row">
                            <h2><a href="#" class="link">메뉴4</a></h2>
                        </div>
                        <div class="row">
                            <h2><a href="#" class="link">메뉴5</a></h2>
                        </div> -->
                    </div>
                </aside>
                  <article>