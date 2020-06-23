<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnSearch").click(function() {
		
		$.ajax({
			type: "GET"
			, url: "<%=request.getContextPath() %>/web/franman/search"
			, data: {
				franno: $("#modalvalue").val()
			}
			, dataType: "html"
			, success: function(result) {
				console.log("AJAX 성공")
				console.log(result)
				
				$("#myModal1 .modal-body").html(result)
			}
			, error: function() {
				console.log("AJAX 실패")
				
			}
		});
		
	})
})

</script>
	
	
	
<section class="wrapper">
	<h2 class="onlyh2">신규등록 대기목록</h2>
	<div class="tbcontainer">
		<table class="table table-bordered">
			<tr>
				<th style="width: 20%;">프렌차이즈 번호</th>
				<th style="width: 20%;">프렌차이즈 이름</th>
				<th style="width: 20%;">신규메뉴</th>
				<th style="width: 20%;">자세히보기</th>
			</tr>
			<c:forEach var="list1" items="${frankey }" varStatus="status">
			<tr>
				<td>${list1.franNo }</td>
				<td>${list1.franName }</td>
				<td>${menuval[status.index].menuName}</td>
				<td><button id="btnSearch" class="btn btn-default" type="button"
						data-toggle="modal" data-target="#myModal1">
							<span class="glyphicon glyphicon-search"></span>
						</button>
						<input type="hidden" id = "modalvalue" value="${list1.franNo }">
						</td>

			</tr>
			</c:forEach>
		</table>
		<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">정보 자세히보기</h4>
					</div>
					
					<div class="modal-body">
				
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
			</div>
		</div>
		
		</div>




</section>

