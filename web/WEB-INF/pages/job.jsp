<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.medialounge.reevo.dto.JobDTO"%>
<%@page import="java.util.ArrayList"%>


<script src='<c:url value="resources/javascript/jquery.dataTables.js" />'></script>
<script src='<c:url value="resources/javascript/DT_bootstrap.js" />'></script>
<link href='<c:url value="resources/css/DT_bootstrap.css" />'  rel="stylesheet" />

<%-- <script src="<c:url value="/resources/javascript/jquery.js"/>"></script>
<script src="<c:url value="/resources/javascript/bootstrap.min.js" />"></script>
<script src='<c:url value="/resources/javascript/jquery.dataTables.js" />'></script>
<script src="<c:url value="/resources/javascript/DT_bootstrap.js" />"></script> --%>

<style>
#jobInner tr th {
	background-color: #3276B1;
	padding: 5px;
	color: #fff;
}
</style>
 <script>
 
$('#jobInner').dataTable( {
	"sDom": "<'row_filters'<'span6'l><'span6'f>r>t<'row_filters'<'span6'i><'span6'p>>",
	"sPaginationType": "bootstrap",
	"oLanguage": {
		"sLengthMenu": "_MENU_ records per page"
	}
} );

</script> 

<%
	ArrayList<JobDTO> jobTypeList = (ArrayList<JobDTO>) request.getAttribute("JOB_LIST");
	String userName = (String) request.getAttribute("userName");
	//System.out.println("UserName:" + userName);
%>
<div>
	<%@ include file="/WEB-INF/pages/jobExachangeLoad.jsp" %>
	<!-- <button type="button" class="btn btn-primary" id="submitBump" onclick="jobExachangePostIt('postId')">Post It</button>&nbsp;&nbsp;
	<button type="button" class="btn btn-primary" id="submitBump" onclick="jobExachangePostIt('theBoard')">The Board</button>&nbsp;&nbsp;
	<button type="button" class="btn btn-primary" id="submitBump" onclick="showFeaturedJobPage()">Job Alerts</button>&nbsp;&nbsp;
	<button type="button" class="btn btn-primary" id="submitBump" onclick="jobExachangeMyJobs()">My Jobs</button>&nbsp;&nbsp;
	<button type="button" class="btn btn-primary" id="submitBump" onclick="jobExachangeTheTable()">The Table</button>&nbsp;&nbsp; -->
</div>
<br>
<div>
<table cellpadding="" cellspacing="" border="0" width="" class="table table-striped table-bordered" id="jobInner">
	<thead>
		<tr>
			<th>Job Type</th>
			<th>Job Title</th>
			<th>Posted By</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${JOB_LIST}" var="job">
			<tr>
				<td><p style="word-wrap: break-word !important; width: 70px !important; display: block; position: relative;">${job.jobTypeEntity.description }</p></td>
				<td><p style="word-wrap: break-word !important; width: 180px !important; display: block; position: relative;">${job.jobTitle}</p></td>
				<td><p style="word-wrap: break-word !important; width: 180px !important; display: block; position: relative;">${job.userEntity.email}</p></td>
				<c:if test="${model.loginUser == job.userEntity.email }" >
					<td><a style="color: blue;cursor: pointer" onclick="PostedJobsViewers(${job.jobId},'${job.jobTitle}');" id="seeDetailsId">See Details</a></td>
				</c:if>
				<c:if test="${model.loginUser !=job.userEntity.email}">
					<td><a style="color: green; cursor: pointer;" onclick="getJobDetails(${job.jobId});" id="applyHereId">Apply Here?</a></td>
				</c:if>
			</tr>
		</c:forEach>
	</tbody>
</table></div>
<div align="center">
		<c:if test="${TYPE == 'postId'}">
		<a data-toggle="modal" data-target="#myModel5" onclick="addNewJob();" style="font-size: 16" class="btn btn-primary"><b>Add New Job</b></a>
		</c:if>
</div>
