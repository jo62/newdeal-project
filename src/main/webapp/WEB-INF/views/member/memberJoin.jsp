<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div class="row">
        <div class="col-lg-12">

            <div class="page-header">
                <h2 id="container">회원 가입하기</h2>
            </div>

            <div class="well">
                <p>회원가입을 위해 아래 내용들을 작성해 주세요.</p>
                <form class="form-horizontal" action="#">
                    <fieldset>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">아이디</label>

                            <div class="col-lg-10">
                                <input type="text" class="form-control" placeholder="아이디">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">이름</label>

                            <div class="col-lg-10">
                                <input type="text" class="form-control" placeholder="이름">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">비밀번호</label>

                            <div class="col-lg-10">
                                <input type="password" class="form-control" placeholder="비밀번호">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">비밀번호 확인</label>

                            <div class="col-lg-10">
                                <input type="password" class="form-control" placeholder="비밀번호 확인">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">생년월일</label>

                            <div class="col-lg-10">
                                <input type="text" class="form-control" placeholder="생년월일 (입력 예: 2000-12-01)">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">성별</label>

                            <div class="col-lg-10">
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
                                        남자
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                                        여자
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">전화번호</label>

                            <div class="col-lg-10">
                                <input type="text" class="form-control" placeholder="전화번호">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">우편번호</label>

                            <div class="col-lg-10">
                                <input type="text" class="form-control" placeholder="우편번호">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">주소</label>

                            <div class="col-lg-10">
                                <input type="text" class="form-control" placeholder="주소">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <button type="submit" class="btn btn-primary">확인</button>
                                <a href="./login.html" class="btn btn-large btn-default">취소</a>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>

    </div>

</body>
</html>