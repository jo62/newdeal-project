<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- Footer ========================================================================================== -->

     <footer>
        <div class="row">
            <div class="col-lg-12">
                <ul class="list-unstyled">
                    <li class="pull-right"><a href="#top">위로 이동</a></li>                    
	                  <li><a href="<%=request.getContextPath()%>/member/main">BitCamp 홈</a></li>                    
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">도움말</a></li>
                    <li><a href="#" id="memberOut" sessionID="${sessionID}">회원탈퇴</a></li>                  
                </ul>
                <p>© BitCamp 2018.</p>
            </div>
        </div>
    </footer>
</div>

<script>
	$('#memberOut').click(function(){
		var mid = $('#memberOut').attr('sessionID');
		
		$.ajax({
			url : '<%=request.getContextPath()%>/member/memberDelete/' + mid,
			type : 'DELETE',
			success : function(){
				/* alert("success"); */
				/* sessionStorage.removeItem("sessionID"); */
				location.href ="<%=request.getContextPath()%>/member/login";
			},
			error : function(){
				alert("error");
			}
		})
	});
</script>
</body>
</html>
