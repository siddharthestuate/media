<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
	

</style>

<table align="center">
	<c:forEach items="${userDtosList}" var="com">
		<tr>
			<td>User</td>
			<td>:</td>
			<td>${com.type}</td>
		</tr>
		<tr>
			<td>E-mail</td>
			<td>:</td>
			<td>${com.email}</td>
		</tr>

		<tr>
			<td>Comments</td>
			<td>:</td>
			<td>${com.userComment}</td>
		</tr>
		<tr><td><hr/></td></tr>
	</c:forEach>
</table>