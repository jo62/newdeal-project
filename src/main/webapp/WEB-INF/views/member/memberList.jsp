<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/boardNav.jsp"%>



		<div class="row">
			<div class="col-lg-12">

				<div id="communityList" class="tab-content">
					<!-- ★★★ 가입 커뮤니티 -->
					<div class="tab-pane fade active in" id="joined">
						<div class="page-header">
							<h2 id="container">회원목록</h2>
						</div>

						<div class="panel panel-default">
							<div class="panel-body">
								<form class="form-search">
									<div class="input-group">
										<input type="text" class="form-control"
											placeholder="회원명 또는 ID"> <span
											class="input-group-btn">
											<button type="submit" class="btn btn-primary">검색</button>
										</span>
									</div>
								</form>
							</div>
						</div>

						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<!-- 
                                <th class="text-center">번호</th>
                                 -->
										<th class="text-center">ID</th>
										<th class="text-center">회원명</th>
										<!-- 
                                <th class="text-center">전화번호</th>
                                <th class="text-center">가입일</th>
                                 -->
									</tr>
								</thead>
								<tbody>
									<!--<tr><td colspan="5" class="text-center">가입한 회원이 없습니다.</td></tr>-->
									<c:forEach var="list" items="${list}">
										<tr>
											<!-- <td class="text-center"></td> -->
											<td>${list.mid}</td>
											<%-- <td><a href="memberView/${list.mid}">${list.mname}</a></td> --%>
											<td><a href="#" onclick="memberView(${list.mid})">${list.mname}</a></td>

											<td><a href="./memberView">${list.mname}</a></td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%@ include file="/WEB-INF/views/common/footer.jsp"%>

		<script>
	function memberView(mid){
		$.ajax({
			url : "memberView/" + mid,
			type : "GET",
			data : {"mid" : mid},
			success : function(){
				/* alert("success"); */
				location.href ="memberView/" + mid;
			},
			error : function(){
				alert("error");
			}
		});
	}
</script>

		<%@ include file="/WEB-INF/views/common/footer.jsp"%>