<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Contacts</title>
<style type="text/css">
	#listUsrTbl tr th {
		background-color: #AAA;
		padding: 5px;
		}
		
		#listUsrTbl tr:nth-child(even) {
			background-color: #ffd;
		}
		
		#listUsrTbl tr:nth-child(odd) {
			background-color: #ddd;
		}
		
		#listUsrTbl tr td {
			padding: 3px;
		}
    </style>
</head>

<body style="background-color: #E7E7E7;">
	<div align="center"><h3>Add Contacts</h3></div>
	<form:form method="POST" commandName="users" action="addContactsFinish">
		 <table cellspacing="0" frame="box" class="main-table" style="background-color: #E7E7E7;" id="listUsrTbl" align="center">
	        <tr>
	        	<th>Contact</th>
	            <th>First Name</th>
	            <th>Second Name</th>
	            <th>Telephone</th>
	            <th>Email</th>
	        </tr>
      <c:forEach items="${userArrayList}" var="user">
	            <tr>
	            	<td> <input type = "checkbox" name = "contactId" value = "${user.userId}" /> </td>
	                <td>${user.firstName}</td>
	                <td>${user.lastName}</td>
	                <td>${user.phone}</td>
	                <td>${user.email}</td>
	                
	            </tr>
	        </c:forEach>
	    </table>
	    <div align="center">
	    	<input type="submit" value="Add Contact"/><br/><br/>
	    	<p><a href="listUsers">Back</a></p>
	    </div>
    </form:form>
</body>
</html>