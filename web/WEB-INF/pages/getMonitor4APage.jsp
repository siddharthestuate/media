<!-- 
	Document : getMonitor4APage
	author   : Anirudhha
	Created on : 13th Jan 2014
 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src='<c:url value="resources/javascript/jquery.dataTables.js" />'></script>
<script src='<c:url value="resources/javascript/DT_bootstrap.js" />'></script>
<link href="<c:url value="resources/css/DT_bootstrap.css" />" rel="stylesheet">

<style>
#monitorTbl th{
	background-color: #3276B1;
	color : #fff;
} 
</style>

<script>
$('#monitorTbl').dataTable( {
	"sDom": "<'row_filters'<'span6'l><'span6'f>r>t<'row_filters'<'span6'i><'span6'p>>",
	"sPaginationType": "bootstrap",
	"oLanguage": {
		"sLengthMenu": "_MENU_ records per page"
	}
} );
</script>
<br/>
<table cellpadding="" cellspacing="" border="0" width="" class="table table-striped table-bordered" id="monitorTbl">
	<!-- <table  class="table table-striped table-bordered"> -->
		<thead>
			<tr>
				<th>Module Name</th>
				<th>Users Count</th>
				<th>Base Rate</th>
				<th>Actual Base Rate</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${MONITOR_LIST}" var="mon">
			<tr>
				<td>${mon.moduleName}</td>
				<td align="center">${mon.userCount}</td>
				<td align="center">${mon.baseRate4a}</td>
				<td align="center">${mon.actualRate4a}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>	


