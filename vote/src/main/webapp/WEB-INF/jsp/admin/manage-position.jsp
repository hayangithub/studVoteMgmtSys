<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html class="no-js" lang="">

<head>
<jsp:include page="/WEB-INF/jsp/admin/templates/header.jsp" />
</head>

<body>
	<jsp:include page="/WEB-INF/jsp/admin/templates/topHeaderArea.jsp" />
	<jsp:include page="/WEB-INF/jsp/admin/templates/mainMenu.jsp" />

	<!-- Form Element area Start-->
	<div class="form-element-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="form-example-wrap mg-t-30">
						<form id="addPositionForm"
							action="${pageContext.request.contextPath}/add-position"
							method="POST">
							<c:if test="${errorHandler.errorCode eq '0008' }">
								<div class="basic-tb-hd">
									<p class="error">
										<c:out value="${positionName}" />
										<c:out value="${errorHandler.errorMessage}" />
									</p>
								</div>
							</c:if>
							<c:if test="${errorHandler.errorCode eq '0009' }">
								<div class="basic-tb-hd">
									<p class="error">
										<c:out value="${errorHandler.errorMessage}" />
									</p>
								</div>
							</c:if>

							<div class="cmp-tb-hd cmp-int-hd">
								<h2>Add New Position</h2>
							</div>
							<div class="form-example-int form-horizental">
								<div class="form-group">
									<div class="row">
										<div class="col-lg-2 col-md-3 col-sm-3 col-xs-12">
											<label class="hrzn-fm">Position Title</label>
										</div>
										<div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
											<div class="nk-int-st">
												<input type="text" name="positionName"
													<c:if test="${errorHandler.errorCode eq '0008' }">
					                       value="${positionName}"
					                    </c:if>
													class="form-control" placeholder="Enter Position Title">
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="form-example-int mg-t-15">
								<div class="row">
									<div class="col-lg-2 col-md-3 col-sm-3 col-xs-12"></div>
									<div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
										<input type="submit" class="myButton_form_submit"
											value="Submit" />
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Form Element area End-->
	<br>
	<!-- Data Table area Start-->
	<div class="data-table-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="data-table-list">
						<div class="basic-tb-hd">
							<h2>Available Positions</h2>
						</div>
						<div class="table-responsive">
							<table id="data-table-basic" class="table table-striped">
								<thead>
									<tr>
										<th>No</th>
										<th>Position Title</th>
										<th>Create Date</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${positionList}" var="element"
										varStatus="loop">
										<tr>
											<td>${loop.count}</td>
											<td>${element.positionName}</td>
											<td><fmt:formatDate pattern="dd-MM-yyyy"
													value="${element.createDate}" /></td>
											<td><c:choose>
													<c:when test="${element.status eq 'I'}">
														<c:out value="${'Inactive'}" />
													</c:when>
													<c:when test="${element.status eq 'A'}">
														<c:out value="${'Active'}" />
													</c:when>
													<c:otherwise>
													</c:otherwise>
												</c:choose></td>
											<td>
											   <a href="${pageContext.request.contextPath}/edit-position/${element.positionId}"
												class="btn notika-btn-blue waves-effect"> Edit</a> 
												<button type="button" class="btn notika-btn-red waves-effect" onclick="showModal(${element.positionId})">Delete</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<th>No</th>
										<th>Position Title</th>
										<th>Create Date</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Data Table area End-->


	<div class="modal fade" id="deleteModal" role="dialog">
		<div class="modal-dialog modals-default">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<h2>Delete Position</h2>
					<p>Are You Sure You Want to Delete This Position</p>
				</div>
				<div class="modal-footer">
					<button type="button" onclick="deletePosition()" class="btn btn-default">Yes</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- Delete Form -->
	
	<form id="deletePositionForm" action="${pageContext.request.contextPath}/delete-position" method="POST">
	   <input type="hidden" name="positionId" id="positionId" value="" />
	</form>
	
	<jsp:include page="/WEB-INF/jsp/admin/templates/footer.jsp" />
	
	<script>
	function showModal(id) {
		  $('#deleteModal').modal('show');
		  $("#positionId").val(id)
		}
	
	
	  function deletePosition() {
		  $('#deletePositionForm').submit();
	  }
	
	</script>
	
</body>

</html>