<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
    <title>MyFeed</title>
</head>
<body>
<h2>Number Validation</h2>
	<form:form method="post" commandName="myFeed" action="saveNumber.html">

		<table>
			<tr>
				<td><form:label path="userNumber">User Number</form:label></td>
				<td><form:input path="userNumber" /><font color="red"><form:errors path="userNumber" /></font></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Submit" /></td>
			</tr>
		</table>

	</form:form>
</body>

	
</body>
</html>