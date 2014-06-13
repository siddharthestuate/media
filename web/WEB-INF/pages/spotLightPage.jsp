<%@page import="com.medialounge.reevo.dto.MediaDto"%>
<%@page import="com.medialounge.reevo.dto.UserDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.medialounge.reevo.dto.MediaReviewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		int i = 1,j=1;
		boolean flag = false;
		String loginUser = (String)request.getSession().getAttribute("userSessionId");
	%>
	 <c:set var="loginuser" value="<%=loginUser %>" scope="page" />
	 <c:set var="flag" value="${false }" scope="page" />
		  <c:forEach items="${mediaReview}" var="mediaR">
		 		<c:if test="${mediaR.reviewerUserId ==  loginuser || mediaR.userId == loginuser }">
		 			<c:set var="flag" value="${true }" scope="page" />
		 		</c:if>
		 </c:forEach>
				<c:if test="${flag }">
					<ul class="media-list">
						<li class="media">
						 <c:forEach items="${userList}" var="user">
								 <div id="spImg<%=i%>" style="display: none">
									 <a class="pull-left" > 
									 <c:choose>
							  			<c:when test="${user.contentPath == null}">
							 				<img class="media-object" src="/MediaLounge/resources/dummy/dummy.jpg" height="200px" width="200px">
							 			 </c:when>
							 		 	<c:otherwise>
							    			<img class="media-object" src="/MediaLounge${user.contentPath}"  height="200px" width="200px">
							 		 	</c:otherwise>
									</c:choose>
									Name :<h5 class="media-heading">${user.firstName} ${user.lastName} </h5>
									 </a>
								</div>
								<%i++; %>
						</c:forEach>
						<%int k = 1;%>
						<c:forEach items="${userList}" var="user">
								<div id="spuser<%=k%>" style="display: none">
										<div class="media-body">
												
										</div>
								</div>
								<%k++; %>
						</c:forEach>
						<%
						 j = 1;
						%>
						<c:forEach items="${mediaReview}" var="mediaR">
									<div id="spdata<%=j%>" style="display: none">
											<div class="media-body">
													<h5 class="media-heading">${mediaR.title}</h5>
													<p>${mediaR.comments} </p>
											</div>
									</div>
									<%j++; %>
						</c:forEach>
				</c:if>
	
<div id="spotLightCount" style="display: none"><%=j %></div>
<c:if  test="${!flag }">
	 <a class="pull-left" href="#">
        <img class="media-object" src="<c:url value="/resources/images/spotlight_1.gif"/>" alt="Article"></a>
			<div class="media-body">
				<h4 class="media-heading">Pharrell Named GQ's Hitmaker Of The
					Year 2013</h4>
				<p>Consulted he eagerness unfeeling deficient existence of.
					Calling nothing end fertile for venture way boy. Esteem spirit
					temper too say adieus who direct esteem. It esteems luckily mr or
					picture placing drawing no. Apartments frequently or motionless on
					reasonable projecting expression. Way mrs end gave tall walk fact
					bed.</p>

				<p>
					So delightful up dissimilar by unreserved it connection frequently.
					Do an high room so in paid. Up on cousin ye dinner should in. Sex
					stood tried walls manor truth shy and three his. Their to years so
					child truth. Honoured peculiar families sensible up likewise by on
					in. <a href="#">Read More...</a>
				</p>
			</div></li> 
	</ul>
</c:if>

</body>
</html>