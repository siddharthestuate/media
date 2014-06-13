<%@page import="java.util.*"%>
<%@page import="com.medialounge.reevo.dto.UserDto"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta charset="utf-8">
<title>Media Lounge</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/DT_bootstrap.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/medialounge.css" />" rel="stylesheet">
   
<script src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script src="http://code.jquery.com/qunit/qunit-1.10.0.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js1/jquery.cookiess.js" />"></script>
<link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
 	
 	
</head>
<%
	ArrayList<UserDto> list = (ArrayList<UserDto>) request.getAttribute("USER_TYPE_LIST");
	String userType = request.getAttribute("USER").toString();
	String sessinUser = (String)request.getSession().getAttribute("userSessionId");
	int loginUser = Integer.parseInt(sessinUser);
%>


<%-- <select size="5" style="width: 200px;" id="listUsers"  class="form-control">
	<%
		if(list.size() > 0){
		for (UserDto dto : list) {
			if(dto.getUserId() != loginUser){
	%>
	<option value="<%=dto.getUserId()%>"><%=dto.getFirstName()%></option>
	<%
		}
			}
		}else{
	%>
	<option style="color: red;">No Users Found</option>
	<%} %>
</select> --%>

		<div class="form-group">
          <div class="col-sm-9 form_dropdown">
				<select size="5" id="listUsers"  class="form-control">
					<%
						if(list.size() > 0){
						for (UserDto dto : list) {
							if(dto.getUserId() != loginUser){
					%>
					<option value="<%=dto.getUserId()%>"><%=dto.getFirstName()%></option>
					<%
						}
							}
						}else{
					%>
					<option style="color: red;">No Users Found</option>
					<%} %>
				</select>
			<span id="errorExpertType" style="color: orange;"></span>
          </div>
      </div>