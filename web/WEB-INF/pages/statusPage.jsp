<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% String userId = (String)request.getAttribute("userId"); %>
<table align="center">
	<tr>
		<td><h4>Update Your Status....</h4></td>
		<td style="display: none;"><input type="text" id="user" value=" <%=userId %> "></td>
	</tr>
	
	<tr>
		<td><textarea rows="1" cols="30" id="status" ></textarea></td>
	</tr>
	<tr>
		<td align="right"><input type="button" value="Send" onclick="saveStatus('<%=userId%>')"/></td>
	</tr>
</table>
</body>
</html>