<%@page import="java.util.*"%>
<%@page import="com.medialounge.reevo.dto.JobDTO"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	ArrayList<JobDTO> jobTypeList = (ArrayList<JobDTO>) request.getAttribute("JOBTYPE_LIST");
%>

<select id="jobTypeBox">
	<option value="">Select</option>
	<%
		for (JobDTO dto : jobTypeList) {
	%>
	<option value='<%=dto.getJobTypeId()%>'><%=dto.getJobTypeDescription()%></option>

	<%
		}
	%>
</select>

