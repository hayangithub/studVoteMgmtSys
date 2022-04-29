<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<div class="mobile-menu-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="mobile-menu">
                        <nav id="dropdown">
                            <ul class="mobile-menu-nav">
                                <li><a data-toggle="collapse" data-target="#Charts" href="#">Home WHY</a>
                                    <ul class="collapse dropdown-header-top">
                                        <li><a href="index.html">Dashboard WHY</a></li>
                                     <!--    <li><a href="index-2.html">Dashboard Two</a></li>
                                        <li><a href="index-3.html">Dashboard Three</a></li>
                                        <li><a href="index-4.html">Dashboard Four</a></li>
                                        <li><a href="analytics.html">Analytics</a></li>
                                        <li><a href="widgets.html">Widgets</a></li> -->
                                    </ul>
                                </li>
                                <li><a data-toggle="collapse" data-target="#demoevent" href="#">Administrative </a>
                                    <ul id="demoevent" class="collapse dropdown-header-top">
                                        <li><a href="inbox.html">Positions</a></li>
                                        <li><a href="view-email.html">Candidates</a></li>
                                        <li><a href="compose-email.html">Users</a></li>
                                        <li><a href="compose-email.html">Poll Results</a></li>
                                    </ul>
                                </li>
                              
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Mobile Menu end -->
    <!-- Main Menu area start-->
    <div class="main-menu-area mg-tb-40">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <ul class="nav nav-tabs notika-menu-wrap menu-it-icon-pro">
                        <li 
                         <c:if test="${home eq 'active'}">
						    <c:out value="${'class=active'}" />
						</c:if>
                        >
                        <a data-toggle="tab" href="#Home"><i class="notika-icon notika-house"></i> Home</a>
                        </li>
                        <li 
                        <c:if test="${administrative eq 'active'}">
						    <c:out value="${'class=active'}" />
						</c:if>
                        
                        ><a data-toggle="tab" href="#mailbox"><i class="notika-icon notika-mail"></i> Administrative</a>
                        </li>
                      
                    </ul>
                    <div class="tab-content custom-menu-content">
                        <div id="Home" 
                        <c:choose>
						  <c:when test="${dashboard eq 'active'}">
						     class="<c:out value="${'tab-pane in active notika-tab-menu-bg animated flipInX'}" />"
						  </c:when>
						  <c:otherwise>
						     class="<c:out value="${'tab-pane in notika-tab-menu-bg animated flipInX'}" />"
						  </c:otherwise>
						</c:choose>
                        >
                            <ul class="notika-main-menu-dropdown">
                                <li><a href="index.html">Dashboard</a>
                                </li>
                             
                            </ul>
                        </div>
                        <div id="mailbox" 
                         <c:choose>
						  <c:when test="${positionMenu eq 'active' || candidateMenu eq 'active'}">
						     class="<c:out value="${'tab-pane in active notika-tab-menu-bg animated flipInX'}" />"
						  </c:when>
						  <c:otherwise>
						     class="<c:out value="${'tab-pane in notika-tab-menu-bg animated flipInX'}" />"
						  </c:otherwise>
						</c:choose>
                        >
                            <ul class="notika-main-menu-dropdown">
                               <li><a href="${pageContext.request.contextPath}/positions">Positions</a></li>
                               <li><a href="${pageContext.request.contextPath}/candidates">Candidates</a></li>
                               <li><a href="users">Users</a></li>
                               <li><a href="poll_results">Poll Results</a></li>
                               
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Main Menu area End-->