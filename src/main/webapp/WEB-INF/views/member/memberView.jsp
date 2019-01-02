<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/boardNav.jsp"%>

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
                        <td class="text-left">${member.mid}</td>
                        <th class="text-center">회원명</th>
                        <td class="text-left">${member.mname}</td>
                    </tr>
                    <tr>
                        <th class="text-center">주소</th>
                        <td class="text-left" colspan="3">${member.maddr}</td>
                    </tr>
                    <tr>
                        <th class="text-center">상세주소</th>
                        <td class="text-left">${member.maddrdeta}</td>
                        <th class="text-center">우편번호</th>
                        <td class="text-left">${member.maddrcode}</td>
                    </tr>
                    </tbody>
                </table>
            </div>

            
            <div class="pull-right">
            	  <!--button class="btn btn-success">수정</button-->
                <!-- <a href="./modify.html" class="btn btn-success btn-default">수정</a> -->
                <%-- <a href="../memberDelete/${member.mid}" class="btn btn-large btn-default">삭제</a> --%>
                <a href="" onclick="memberDelete('${member.mid}')" class="btn btn-large btn-default">삭제</a>
                <a href="<%=request.getContextPath()%>/member/memberList" class="btn btn-large btn-default">목록</a>
            </div>

        </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script>
	function memberDelete(mid){
		$.ajax({
			url : '<%=request.getContextPath()%>/member/memberDelete/' + mid,
			type : 'DELETE',
			success : function(){
				/* alert("success"); */
				location.href ="<%=request.getContextPath()%>/member/memberList";
			},
			error : function(){
				alert("error");
			}
		})
	}
</script>