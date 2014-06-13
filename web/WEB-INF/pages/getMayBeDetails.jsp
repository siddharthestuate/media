<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
<%String userId = (String) request.getSession().getAttribute("userSessionId"); %>
<script>
$('#maybeID').dataTable( {
	"sDom": "<'row_filters'<'span6'l><'span6'f>r>t<'row_filters'<'span6'i><'span6'p>>",
	"sPaginationType": "bootstrap",
	"oLanguage": {
		"sLengthMenu": "_MENU_ records per page"
	}
} );

$('#maybeMutualID').dataTable( {
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
 
 function actionFavourite(bumpId,status) {
		$.ajax({
			url : 'actionFavourites',
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
function viewfavourite() {
	$('#showFavourite').toggle("slow");
}
function viewmutual() {
	$('#showMutual').toggle("slow");
}
</script>
<input type="button" class="btn btn-primary" value="Favourite" style="width: 150px;" onclick="viewfavourite()" >
<div id="showFavourite" style="display: none">
<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="maybeID" style="width: 100%">
	<thead>
		<tr>
			<td style="background-color: #3276B1;color: #fff;">Name</td>
			<td style="background-color: #3276B1;color: #fff;">Email</td>
			<td style="background-color: #3276B1;color: #fff;">Favourite</td>
			<td colspan="2" align="center" style="background-color: #3276B1;color: #fff;">Action</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${MAYBELIST }" var="maybe">
		<c:if test="${maybe.favStatus == 'maybe' }">
			<tr>
				<td>${maybe.fromUser.firstName } ${maybe.fromUser.lastName }</td>
				<td>${maybe.fromUser.email }</td>
				<td>${maybe.favourite }</td>
				<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="YES" onclick="actionFavourite('${maybe.bumpId}','yes')"></td>
				<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="NO" onclick="actionFavourite('${maybe.bumpId}','no')"></td>
			</tr>
		</c:if>
		</c:forEach>
	</tbody>
</table>
</div></br></br></br>
<input type="button" class="btn btn-primary" value="Mutual" style="width: 150px;" onclick="viewmutual()">
<div id="showMutual" style="display: none">
<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="maybeMutualID" style="width: 100%">
	<thead>
		<tr>
			<td style="background-color: #3276B1;color: #fff;">Name</td>
			<td style="background-color: #3276B1;color: #fff;">Email</td>
			<td style="background-color: #3276B1;color: #fff;">Mutual</td>
			<td colspan="2" align="center" style="background-color: #3276B1;color: #fff;">Action</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${MAYBELIST }" var="maybe">
		<c:if test="${maybe.mutualStatus == 'maybe' }">
		<tr>
			<td>${maybe.fromUser.firstName } ${maybe.fromUser.lastName }</td>
			<td>${maybe.fromUser.email }</td>
			<td>${maybe.mutual }</td>
			<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="YES" onclick="actionMutual('${maybe.bumpId}','yes')"></td>
			<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="NO" onclick="actionMutual('${maybe.bumpId}','no')"></td>
		</tr>
		</c:if>
		</c:forEach>
	</tbody>
</table>
</div>
</br></br></br>
<input type="button" class="btn btn-primary" value="Back" onclick="loadBumpDetails('<%=userId%>');">