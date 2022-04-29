<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
					 <form:form id="editPositionForm"
					action="${pageContext.request.contextPath}/edit-candidate-done" method="POST" modelAttribute="candidate">
					<input type="hidden" name="candidateId" value="${candidate.candidateId}"/>
					<!-- Candidate Exist Check -->
					<c:if test="${errorHandler.errorCode eq '0008' }">
                        <div class="basic-tb-hd">
                            <p class="error"> <c:out value="${candidate.candidateName}"/>  <c:out value="${errorHandler.errorMessage}"/> </p>
                        </div>
                    </c:if>
                    <!-- Validation Check -->
                     <c:if test="${errorHandler.errorCode eq '0009' }">
                        <div class="basic-tb-hd">
                            <p class="error"> <c:out value="${errorHandler.errorMessage}"/> </p>
                        </div>
                    </c:if>
					
						<div class="cmp-tb-hd cmp-int-hd">
							<h2>Update Candidate</h2>
						</div>
						<div class="form-example-int form-horizental">
							<div class="form-group">
								<div class="row">
									<div class="col-lg-2 col-md-3 col-sm-3 col-xs-12">
										<label class="hrzn-fm">Candidate Title</label>
									</div>
									<div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
										<div class="nk-int-st">
											<input type="text" name="candidateName" value="${candidate.candidateName}"
                                         class="form-control" placeholder="Enter Position Title">
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="form-example-int form-horizental mg-t-15">
								<div class="form-group">
									<div class="row">
										<div class="col-lg-2 col-md-3 col-sm-3 col-xs-12">
											<label class="hrzn-fm">Status</label>
										</div>
										<div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
											<div class="nk-int-st">
												<div class="bootstrap-select fm-cmp-mg">
													<select class="selectpicker" name="status">
														<option value="A"
															<c:if test="${candidate.status eq 'A'}">
													  selected
													</c:if>>Active</option>
														<option value="I"
															<c:if test="${candidate.status eq 'I'}">
													  selected
													</c:if>>Inactive</option>
													</select>
												</div>
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
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
    <!-- Form Element area End-->

     <jsp:include page="/WEB-INF/jsp/admin/templates/footer.jsp" /> 
</body>

</html>