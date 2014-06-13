<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String userId = (String) request.getSession().getAttribute("userSessionId"); %>
<script>
$('#favouriteID').dataTable( {
	"sDom": "<'row_filters'<'span6'l><'span6'f>r>t<'row_filters'<'span6'i><'span6'p>>",
	"sPaginationType": "bootstrap",
	"oLanguage": {
		"sLengthMenu": "_MENU_ records per page"
	}
} );

function checkfav() {
	$.ajax({
		url : 'checkfav',
		type : 'POST',
		data : {
			
		},
		success : function(data) {
			$('#mainContainer').html(data);
		},
		error : function(xhr,ajaxOptions,thrownError) {
			alert(xhr.responseText);
			alert(thrownError);
		}
	});
}
</script>
<c:set var="loginUser" value="<%=userId %>" scope="page"/>
<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="favouriteID" style="width: 100%">
	<thead>
		<tr>
			<td style="background-color: #3276B1;color: #fff;">Name</td>
			<td style="background-color: #3276B1;color: #fff;">Email</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${FAVLIST }" var="fav">
			<c:if test="${fav.fromUser.userId != loginUser }">
				<tr>
					<td>${fav.fromUser.firstName } ${fav.fromUser.lastName }</td>
					<td>${fav.fromUser.email }</td>
				</tr>
			</c:if>
			<c:if test="${fav.toUser.userId != loginUser }">
				<tr>
					<td>${fav.toUser.firstName } ${fav.toUser.lastName }</td>
					<td>${fav.toUser.email }</td>
				</tr>
			</c:if>
		</c:forEach>
	</tbody>
</table>
<input type="button" class="btn btn-primary" value="Pending Favourites" onclick="checkfav();">
<input type="button" class="btn btn-primary" value="Back" onclick="loadBumpDetails('<%=userId%>');">
