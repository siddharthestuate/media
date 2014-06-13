<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src='<c:url value="resources/javascript/jquery.dataTables.js" />'></script>
<script src='<c:url value="resources/javascript/DT_bootstrap.js" />'></script>
<link href="<c:url value="resources/css/DT_bootstrap.css" />" rel="stylesheet">

<script>
	$('#adminAddJobTypeTbl').dataTable({
		"sDom": "<'row_filters'<'span6'l><'span6'f>r>t<'row_filters'<'span6'i><'span6'p>>",
		"sPaginationType": "bootstrap",
		"oLanguage": {
			"sLengthMenu": "_MENU_ records per page"
		}
	});
</script>	
<br/>
<button type="button" class="btn btn-primary" onclick="addJobTypePage()" style="float: ;">Add JobType</button>
<br/><br/>
<div>
<table style="width: 100% ;cellpadding:0 ;cellspacing:0;" border="0" class="table table-striped table-bordered" id="adminAddJobTypeTbl"  >
	<thead>
		<tr>
			<th style="background-color: #3276B1;color: #fff; text-align: center">JobType</th>
			<th style="background-color: #3276B1;color: #fff; text-align: center">Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${JOBTYPES}" var="jobType">
		<tr style="text-align: center">
			<td>${jobType.description }</td>
			<input type="hidden" name="jobType" value="${jobType.description }">
			<td><img src='<c:url value="/resources/dummy/delete.png" />' width="20px" height="20px" style="cursor: pointer" onclick="deleteJobType('${jobType.jobTypeId}')"></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>
