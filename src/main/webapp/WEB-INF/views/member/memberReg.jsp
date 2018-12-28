<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/boardNav.jsp"%>

<div class="row">
<div class="col-lg-12">
            <div class="page-header2">
                <h3>회원정보</h3>
            </div>


            <div class="table-responsive">
                <table class="table table-bordered">
                    <colgroup>
                        <col width="120">
                        <col width="*">
                        <col width="120">
                        <col width="*">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th class="text-center">ID</th>
                        <td class="text-left">
                        	<input type="text" class="form-control" placeholder="아이디" value="gglim">
                        </td>
                        <th class="text-center">회원명</th>
                        <td class="text-left">
                        	<input type="text" class="form-control" placeholder="이름" value="임경균">
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center">생년월일</th>
                        <td class="text-left">                        
                        	<input type="text" class="form-control" placeholder="이름" value="2014.02.19">                       	
                        </td>
                        <th class="text-center">성별</th>
                        <td class="text-left">
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
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center">전화번호</th>
                        <td class="text-left">
                        	<input type="text" class="form-control" placeholder="이름" value="010-0000-00000"> 	
                        </td>
                        <th class="text-center">주소</th>
                        <td class="text-left">
                        	<input type="text" class="form-control" placeholder="이름" value="서울시 금천구 가산동">	
                       	</td>
                    </tr>
                    </tbody>
                </table>
            </div>

            
            <div class="pull-right">
                <a href="#" class="btn btn-success btn-default">저장</a>
                <a href="./list.html" class="btn btn-large btn-default">목록</a>
            </div>
        </div>
      </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>