<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src='<c:url value="resources/javascript/jquery.dataTables.js" />'></script>
<script src='<c:url value="resources/javascript/DT_bootstrap.js" />'></script>
<link href="<c:url value="resources/css/DT_bootstrap.css" />" rel="stylesheet">

<script>
	$('#expertSuggestionTbl').dataTable({
		"sDom": "<'row_filters'<'span6'l><'span6'f>r>t<'row_filters'<'span6'i><'span6'p>>",
		"sPaginationType": "bootstrap",
		"oLanguage": {
			"sLengthMenu": "_MENU_ records per page"
		}
	});
</script>	
<style>
 	.tdClass{
 		font-weight: bold;
 	} 
</style>
<style>
#expertSuggestionTbl  tr th thead {
	background-color: #3276B1;
	padding: 5px;
	color: #fff;
}
</style>

<%-- <c:set var="count" value="0" scope="page"/> --%>
	<table  style="width: 100% ;cellpadding:0 ;cellspacing:0;" border="1" class="table table-striped table-bordered" id="expertSuggestionTbl"  >
	<thead style="background-color: #3276B1; color: white;"> 
		<tr>
			<th>Media</th>
			<th>From</th>
			<th>Type</th>
			<th style="text-align: center">Action</th>
		</tr>
	</thead>	
	<tbody>
		<c:forEach items="${suggestionList }" var="sugg">
			<%-- <c:set var="count" value="${count+1 }" scope="page"/> --%>
			<tr>
				<td><p style="word-wrap: break-word !important; width: 140px !important; display: block; position: relative;"> ${sugg.mediaId.mediaName  }</p></td>
				<td><p style="word-wrap: break-word !important; width: 140px !important; display: block; position: relative;"> ${sugg.userId.firstName } ${sugg.userId.lastName }</p></td>
				<td>
					<c:if test="${sugg.type == 'journalist' }">
						LAIF Review
					</c:if>
					<c:if test="${sugg.type == 'vs' }">
						Air Play Review
					</c:if>
					<c:if test="${sugg.type == 'dj' }">
						PAO Review
					</c:if>
					<c:if test="${sugg.type == 'anchor' }">
						IMC Review
					</c:if>
				</td>
				<td style="text-align: center">
					<input type="button" class="btn btn-primary" value="Review" style="padding: 4px 6px" onclick="reviewSuggestion('${sugg.mediaReviewId }')" >
					<input type="button" class="btn btn-primary" value="Ignore" style="padding: 4px 6px" onclick="ignoreSuggestion('${count }','${sugg.mediaReviewId }')" >
				</td>
				<%-- <td align="center">
					
				</td> --%>
			</tr>
		</c:forEach>
	</tbody>
	<%-- <c:if test="${count == 0 }">
		<tr>
			<td colspan="5" align="center">
				<h3>No Data Available!!</h3>
			</td>
		</tr>
	</c:if>	 --%>
	</table>
