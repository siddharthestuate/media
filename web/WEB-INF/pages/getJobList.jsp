<%@page import="java.util.*"%>
<%@page import="com.medialounge.reevo.dto.JobDTO"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	ArrayList<JobDTO> jobTypeList = (ArrayList<JobDTO>) request.getAttribute("JOB_LIST");
	String userName = (String)request.getAttribute("userName");
	//System.out.println("UserName:"+userName);
%>

<%
	if (jobTypeList.size() > 0) {
%>
<%-- :::Login User:<%=request.getParameter("userName") %>> --%>
<table align="center" id="jobTbl" cellspacing="0" frame="box">
	<thead>
		<tr>
			<th>Job Type</th>
			<th>Job Title</th>
			<th>Posted By</th>
			<th>Year Of Exp.</th>
			<th>Priority</th>
			<!-- <th>Description</th> -->
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${JOB_LIST}" var="job">
			<tr>
				<td>${job.jobTypeEntity.description }</td>
				<td>${job.jobTitle}</td>
				<td>${job.userEntity.email}</td>
				<td align="center">${job.experience }</td>
				<td>${job.priority }</td>
				<%-- <td>${job.description }</td> --%>
				
				<c:if test="${model.loginUser ==job.userEntity.email}">
					<td><a style="color: blue;" href="PostedJobViewers?jobId=${job.jobId}&jobTitle=${job.jobTitle}">More Details?</a></td>
				</c:if>
				<c:if test="${model.loginUser !=job.userEntity.email}">
					<td><a style="color: green;"
						href="getJobForm?jobId=${job.jobId}&jobTitle=${job.jobTitle}&jobDesc=${job.description}&loginUser=${model.loginUser}">Apply Here?</a></td>
				</c:if>

				<%-- <td><a href="getJobForm?jobId=${job.jobId}&jobTitle=${job.jobTitle}&jobDesc=${job.description}">More Details?</a></td> --%>
			</tr>
		</c:forEach>
	</tbody>
</table>
<br>
<!-- <a href="getPostedJobs">Posted Jobs List </a> -->
<%
	} else {
%>
<h3>No Data Found!</h3>
<%
	}
%>

<%
	request.removeAttribute("JOB_LIST");
%>