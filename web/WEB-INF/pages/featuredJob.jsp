<%-- <script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
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

<%
	ArrayList<JobDTO> list = (ArrayList<JobDTO>) request.getAttribute("FEATURED_LIST");
	 /* for(JobDTO dto: list){
		System.out.println(dto.getUserEntity().getEmail());
		System.out.println(dto.getJobTypeEntity().getDescription());
		System.out.println(dto.getDescription());
		System.out.println(dto.getExperience());
		System.out.println(dto.getPriority());
		
	} */
%>
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
		<!-- <div align="center">
			<h3>FEATURED JOB</h3>
		</div> -->
		<br />
		<%
			if (list.size() > 0) {
		%>
		<div>
			<table align="center" id="featuredJobTbl" cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>Job</th>
						<th>Posted By</th>
						<th>Year Of Exp.</th>
						<th>Priority</th>
						<th>Description</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${FEATURED_LIST}" var="job">
						<tr>
							<td><p style="word-wrap: break-word !important; width: 70px !important; display: block; position: relative;">${job.jobTypeEntity.description }</p></td>
							<td><p style="word-wrap: break-word !important; width: 150px !important; display: block; position: relative;">${job.userEntity.email}</p></td>
							<td align="center">${job.experience }</td>
							<td>${job.priority }</td>
							<td><p style="word-wrap: break-word !important; width: 150px !important; display: block; position: relative;">${job.description }</p></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<%
			} else {
		%>
		<div align="center">
			<h3>No Post Found!</h3>
		</div>
		<%
			}
		%>
		
</body>
</html>