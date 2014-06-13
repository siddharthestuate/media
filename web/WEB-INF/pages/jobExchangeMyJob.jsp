<%-- <%@page import="java.util.*"%>
<%@page import="com.medialounge.reevo.dto.JobDTO"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src='<c:url value="resources/javascript/jquery.js" />' ></script> 
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src='<c:url value="resources/javascript/bootstrap.min.js" />'></script>
<script src='<c:url value="resources/javascript/jquery.dataTables.js" />'></script>
<script src='<c:url value="resources/javascript/DT_bootstrap.js" />'></script>
<link href='<c:url value="resources/css/bootstrap.min.css" />' rel="stylesheet" />
<link href='<c:url value="resources/css/styles.css" />'  rel="stylesheet" />
<link href='<c:url value="resources/css/DT_bootstrap.css" />'  rel="stylesheet" /> --%>

<%@page import="java.util.*"%>
<%@page import="com.medialounge.reevo.dto.JobDTO"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src='<c:url value="resources/javascript/jquery.dataTables.js" />'></script>
<script src='<c:url value="resources/javascript/DT_bootstrap.js" />'></script>
<link href="<c:url value="resources/css/DT_bootstrap.css" />" rel="stylesheet">


<style>
#featuredJobTbl tr th {
	background-color: #3276B1;
	padding: 5px;
	color: #fff;
}
</style>
<script type="text/javascript">
$('#featuredJobTbl').dataTable({
	"sDom": "<'row_filters'<'span6'l><'span6'f>r>t<'row_filters'<'span6'i><'span6'p>>",
	"sPaginationType": "bootstrap",
	"oLanguage": {
		"sLengthMenu": "_MENU_ records per page"
	}
});
</script>
<html>
<head>
<title>Featured Job</title>
</head>
<div>
	<%@ include file="/WEB-INF/pages/jobExachangeLoad.jsp" %>
	<!-- <button type="button" class="btn btn-primary" id="submitBump" onclick="jobExachangePostIt('postId')">Post It</button>&nbsp;&nbsp;
	<button type="button" class="btn btn-primary" id="submitBump" onclick="jobExachangePostIt('theBoard')">The Board</button>&nbsp;&nbsp;
	<button type="button" class="btn btn-primary" id="submitBump" onclick="showFeaturedJobPage()">Job Alerts</button>&nbsp;&nbsp;
	<button type="button" class="btn btn-primary" id="submitBump" onclick="jobExachangeMyJobs()">My Jobs</button>&nbsp;&nbsp;
	<button type="button" class="btn btn-primary" id="submitBump" onclick="jobExachangeTheTable()">The Table</button>&nbsp;&nbsp; -->
</div>
<body style="background-color: #E7E7E7;">
		
		<br />
		<%-- <div>
			<table align="center" id="featuredJobTbl" cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>Assingner Name</th>
						<th>Assingnee Name</th>
						<th>Job Title</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${JOB_EXCHNAGE_LIST}" var="job">
						<tr>
							<td>${job.assignerUserEntity.firstName}</td>
							<td>${job.assigneeUserEntity.firstName}</td>
							<td>${job.jobEntity.jobTitle}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div> --%>
		<div>
			<table align="center" id="featuredJobTbl" cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
				<thead>
					<tr>
						<c:if test="${TYPE == 'exchangeTheTable'}">
						<th>Assigned To</th>
						</c:if>
						
						<c:if test="${TYPE == 'exchangeMyJob'}">
						<th>Assigneer</th>
						</c:if>
						
						<th>Email Name</th>
						<!-- <th>Role</th> -->
						<th>Job Title</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${JOB_EXCHNAGE_LIST}" var="job">
						<c:if test="${TYPE == 'exchangeTheTable'}">
							<tr>
								<td><p style="word-wrap: break-word !important; width: 150px !important; display: block; position: relative;">${job.assigneeUserEntity.firstName} ${job.assigneeUserEntity.lastName}</p></td>
								<td><p style="word-wrap: break-word !important; width: 170px !important; display: block; position: relative;">${job.assigneeUserEntity.email}</p></td>
								<%-- <td>${job.assigneeUserEntity.role}</td> --%>
								<td><p style="word-wrap: break-word !important; width: 170px !important; display: block; position: relative;">${job.jobEntity.jobTitle}</p></td>
							</tr>
						</c:if>
						
						<c:if test="${TYPE == 'exchangeMyJob'}">
							<tr>
								<td><p style="word-wrap: break-word !important; width: 150px !important; display: block; position: relative;">${job.assignerUserEntity.firstName}</p></td>
								<td><p style="word-wrap: break-word !important; width: 170px !important; display: block; position: relative;">${job.assignerUserEntity.email}</p></td>
								<%-- <td>${job.assignerUserEntity.role}</td> --%>
								<td><p style="word-wrap: break-word !important; width: 170px !important; display: block; position: relative;">${job.jobEntity.jobTitle}</p></td>
							</tr>
						</c:if>
						
					</c:forEach>
				</tbody>
			</table>
		</div>
		
</body>
</html>