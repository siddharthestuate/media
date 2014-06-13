<!-- 
	Document :  loadAllUserList.jsp
	Author : Anirudhha 
	Created : 9th Jan 2014
 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src='<c:url value="resources/javascript/jquery.js" />' ></script> 
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src='<c:url value="resources/javascript/bootstrap.min.js" />'></script>
<script src='<c:url value="resources/javascript/jquery.dataTables.js" />'></script>
<script src='<c:url value="resources/javascript/DT_bootstrap.js" />'></script>
<link href='<c:url value="resources/css/bootstrap.min.css" />' rel="stylesheet" />
<link href='<c:url value="resources/css/styles.css" />'  rel="stylesheet" />
<link href='<c:url value="resources/css/DT_bootstrap.css" />'  rel="stylesheet" />

<style>
#insprTbl th{
	background-color: #3276B1;
	color : #fff;
}
</style>
<script>
$('#insprTbl').dataTable( {
	"sDom": "<'row_filters'<'span6'l><'span6'f>r>t<'row_filters'<'span6'i><'span6'p>>",
	"sPaginationType": "bootstrap",
	"oLanguage": {
		"sLengthMenu": "_MENU_ records per page"
	}
} );
</script>

<table id="insprTbl" class="table table-striped table-bordered" >
	<thead>
		<tr>
			<th> </th>
			<th>Name</th>
			<th>Email</th>
		</tr>
	</thead>
	<tbody>
<%
	boolean flag = false;
%>

<c:forEach items="${USER_LIST}" var="user">
	<tr>
		<c:forEach items="${INSPIRE_LIST2}" var="ins">
			<c:set var="insId" value="${ins.toUserEntity.userId}" scope="page" />
			<c:choose>
				<c:when test="${user.userId == insId && !flag}">
					<%
						flag = true;
					%>
					<td><input type="checkbox" name="chkedUser" value="${user.userId}" checked="checked" /></td>
				</c:when>
			</c:choose>
		</c:forEach>
		<%
			if (!flag) {
		%>
		<td><input type="checkbox" name="chkedUser" value="${user.userId}" /></td>
		<%
			}
				flag = false;
		%>
		<td>${user.firstName} ${user.lastName}</td>
		<td>${user.email}</td>
	</tr>
</c:forEach>
	</tbody>
</table>
<a class="btn btn-primary" onclick="saveInspiredUsers();">Save</a> 
<a class="btn btn-primary" onclick="closeInsprDiv();">Close</a>
