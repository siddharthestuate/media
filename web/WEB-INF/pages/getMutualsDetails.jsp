<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String userId = (String) request.getSession().getAttribute("userSessionId"); %>
<script>
$('#pendingMutualID').dataTable( {
	"sDom": "<'row_filters'<'span6'l><'span6'f>r>t<'row_filters'<'span6'i><'span6'p>>",
	"sPaginationType": "bootstrap",
	"oLanguage": {
		"sLengthMenu": "_MENU_ records per page"
	}
} );

function actionMutual(bumpId,status) {
	$.ajax({
		url : 'actionMutual',
		type : 'POST',
		data : {
			bumpId : bumpId , status : status
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

<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="pendingMutualID" style="width: 100%">
	<thead>
		<tr>
			<td style="background-color: #3276B1;color: #fff;">Name</td>
			<td style="background-color: #3276B1;color: #fff;">Email</td>
			<td colspan="3" align="center" style="background-color: #3276B1;color: #fff;">Action</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${MUTUALLIST }" var="mutual">
		<tr>
			<td>${mutual.fromUser.firstName } ${mutual.fromUser.lastName }</td>
			<td>${mutual.fromUser.email }</td>
			<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="YES" onclick="actionMutual('${mutual.bumpId}','yes')"></td>
			<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="NO" onclick="actionMutual('${mutual.bumpId}','no')"></td>
			<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="MAY-BE" onclick="actionMutual('${mutual.bumpId}','maybe')"></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<input type="button" class="btn btn-primary" value="Back" onclick="loadBumpDetails('<%=userId%>');">