<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src='<c:url value="resources/javascript/jquery.dataTables.js" />'></script>
<script src='<c:url value="resources/javascript/DT_bootstrap.js" />'></script>
<link href="<c:url value="resources/css/DT_bootstrap.css" />" rel="stylesheet">

<script>
	$('#adminSuggestionTbl').dataTable({
		"sDom": "<'row_filters'<'span6'l><'span6'f>r>t<'row_filters'<'span6'i><'span6'p>>",
		"sPaginationType": "bootstrap",
		"oLanguage": {
			"sLengthMenu": "_MENU_ records per page"
		}
	});
</script>	
<br/>
<div>
<table  style="width: 100% ;cellpadding:0 ;cellspacing:0;" border="0" class="table table-striped table-bordered" id="adminSuggestionTbl"  >	
	<thead>
		<tr>
			<th style="background-color: #3276B1;color: #fff;">Suggestion Type</th>
			<th style="background-color: #3276B1;color: #fff;">Suggestion From</th>
			<th style="background-color: #3276B1;color: #fff; text-align: center;">Action</th>
		</tr>
	</thead>
	<tbody>
 		<c:forEach items="${adminSuggestion}" var="admin">	
 			<tr>
 				<td>${admin.suggestionType }</td>
 				<td>${admin.fromUser.email } </td>
 				<td align="center">
 					<img src='<c:url value="resources/dummy/view.GIF" />' height="30px" width="40px" onclick="viewSuggestionDescription('${admin.suggestionId}')" title="View" style="cursor: pointer; "/>
 					<img src='<c:url value="resources/dummy/delete.png" />' height="30px" width="40px" onclick="deleteAdminSuggestion('${admin.suggestionId}')" title="Delete" style="cursor: pointer; margin-left: 40px;"/>
 				</td>
 			</tr>
 		</c:forEach>
 	</tbody>
</table>
</div>