<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="">

<head>
     <jsp:include page="/WEB-INF/jsp/admin/templates/header.jsp" />  
</head>

<body>
 	<jsp:include page="/WEB-INF/jsp/admin/templates/topHeaderArea.jsp" />  
	<jsp:include page="/WEB-INF/jsp/admin/templates/mainMenu.jsp" />  

    <!-- Form Examples area start-->
    <div class="form-example-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="form-example-wrap">
                        <div class="cmp-tb-hd">
                            <h2>Basic Example</h2>
                            <p>Individual form controls automatically receive some global styling. All textual 'input', 'textarea', and 'select' elements with <code>.form-control</code> are set to width: 100%; by default. Wrap labels and controls in <code>.form-group</code> for optimum
                                spacing.</p>
                        </div>
                        <div class="form-example-int">
                            <div class="form-group">
                                <label>Email Address</label>
                                <div class="nk-int-st">
                                    <input type="text" class="form-control input-sm" placeholder="Enter Email">
                                </div>
                            </div>
                        </div>
                        <div class="form-example-int mg-t-15">
                            <div class="form-group">
                                <label>Password</label>
                                <div class="nk-int-st">
                                    <input type="text" class="form-control input-sm" placeholder="Password">
                                </div>
                            </div>
                        </div>
                        <div class="form-example-int mg-t-15">
                            <div class="fm-checkbox">
                                <label><input type="checkbox" class="i-checks"> <i></i> Don't forget to check me out</label>
                            </div>
                        </div>
                        <div class="form-example-int mg-t-15">
                            <button class="btn btn-success notika-btn-success">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="form-example-wrap mg-t-30">
                        <div class="cmp-tb-hd cmp-int-hd">
                            <h2>Inline Form</h2>
                        </div>
                        <div class="row">
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                <div class="form-example-int form-example-st">
                                    <div class="form-group">
                                        <div class="nk-int-st">
                                            <input type="text" class="form-control input-sm" placeholder="Enter Email">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                <div class="form-example-int form-example-st">
                                    <div class="form-group">
                                        <div class="nk-int-st">
                                            <input type="text" class="form-control input-sm" placeholder="Password">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-3 col-xs-12">
                                <div class="form-example-int form-example-st">
                                    <div class="fm-checkbox">
                                        <label><input type="checkbox" class="i-checks"> <i></i> Remember me</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-3 col-xs-12">
                                <div class="form-example-int">
                                    <button class="btn btn-success notika-btn-success">Submit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="form-example-wrap mg-t-30">
                        <div class="cmp-tb-hd cmp-int-hd">
                            <h2>Horizontal Form</h2>
                        </div>
                        <div class="form-example-int form-horizental">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12">
                                        <label class="hrzn-fm">Email Address</label>
                                    </div>
                                    <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                        <div class="nk-int-st">
                                            <input type="text" class="form-control input-sm" placeholder="Enter Email">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-example-int form-horizental mg-t-15">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12">
                                        <label class="hrzn-fm">Password</label>
                                    </div>
                                    <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                        <div class="nk-int-st">
                                            <input type="text" class="form-control input-sm" placeholder="Password">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-example-int form-horizental mg-t-15">
                            <div class="row">
                                <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12">
                                </div>
                                <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                    <div class="fm-checkbox">
                                        <label><input type="checkbox" class="i-checks"> <i></i> Remember me</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-example-int mg-t-15">
                            <div class="row">
                                <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12">
                                </div>
                                <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                    <button class="btn btn-success notika-btn-success">Submit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Form Examples area End-->
      <jsp:include page="/WEB-INF/jsp/admin/templates/footer.jsp" /> 
</body>

</html>