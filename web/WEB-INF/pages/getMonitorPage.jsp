<!-- 
	Document : getMonitorPage
	author   : Anirudhha
	Created on : 7th Jan 2014
 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
				<th>Average Per Week</th>
				<th>Base Rate</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${MONITOR_LIST}" var="mon">
			<tr>
				<td>${mon.moduleName}</td>
				<td align="center">${mon.userCount}</td>
				<%-- <td align="center">${mon.average}</td> --%>
				
				
				<c:if test="${mon.average < 60}">
					<td align="center"><fmt:formatNumber value="${mon.average}" maxFractionDigits="0" /> secs</td>
				</c:if>
				<c:if test="${mon.average > 60}">
					<c:if test="${(mon.average/60 )< 60}">
						<td align="center"><fmt:formatNumber value="${(mon.average/60 )}" maxFractionDigits="0" /> mins</td>
					</c:if>
					<c:if test="${(mon.average/60 )> 60}">
						<c:if test="${((mon.average/60 )/60)< 24}">
							<td align="center"><fmt:formatNumber value="${((mon.average/60 )/60)}" maxFractionDigits="0" /> hrs</td>
						</c:if>
						<c:if test="${((mon.average/60 )/60)> 24}">
							<c:if test="${(((mon.average/60 )/60)/24) < 7}">
								<td align="center"><fmt:formatNumber value="${(((mon.average/60 )/60)/24)}" maxFractionDigits="0" /> days</td>
							</c:if>
							<c:if test="${(((mon.average/60 )/60)/24) > 7}">
								<td align="center"><fmt:formatNumber value="${((((mon.average/60 )/60)/24)/7)}" maxFractionDigits="0" /> weeks</td>
							</c:if>
						</c:if>
					</c:if>
				</c:if>
				
				
				<td align="center">${mon.baseRate4b}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>	


