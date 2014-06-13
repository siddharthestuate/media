<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table>
	<c:forEach items="${USER_LIST}" var="user">
		<tr>
			<td colspan="3"> <img src="/MediaLounge/resources${user.contentPath}" height="150" width="150" /></td>
		</tr>
		<tr>
			<td>First Name</td>
			<td>:</td>
			<td>${user.firstName}</td>
		</tr>
		<tr>
			<td>Last Name</td>
			<td>:</td>
			<td>${user.lastName}</td>
		</tr>
		<tr>
			<td>E-mail</td>
			<td>:</td>
			<td>${user.email}</td>
		</tr>
	</c:forEach>
</table>