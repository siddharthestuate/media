<%--
    File   	   : jobHomePage.jsp
    Created on : Dec 12, 2013, 02:30:33 PM
    Author     : Anirudhha
--%>

<%@page import="java.util.*"%>
<%@page import="com.medialounge.reevo.dto.JobDTO"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<%
	ArrayList<JobDTO> list = (ArrayList<JobDTO>) request.getAttribute("JOB_LIST");

	//ArrayList<JobDTO> jobTypeList = (ArrayList<JobDTO>) request.getAttribute("JOBTYPE_LIST");
	ArrayList<JobDTO> searchList = (ArrayList<JobDTO>) request.getAttribute("SEARCH_LIST");
%>
<html>
<head>
<title>Welcome To Job Page</title>
</head>
<style>
#jobTbl tr th {
	background-color: #AAA;
	padding: 5px;
}

#jobTbl tr:nth-child(even) {
	background-color: #ffd;
}

#jobTbl tr:nth-child(odd) {
	background-color: #ddd;
}

#jobTbl tr td {
	padding: 3px;
}
</style>
<body style="background-color: #E7E7E7" onload="getJobTypeList(); getJobList();">
<form:form method="post" commandName="jobName" action="getJobListByType">
	<div align="center">
		<span><h3>FEATURED JOBS</h3></span>
	</div>
	<div align="center">
			<table>
				<tr>
					<td>Select Job Type :</td>
					<td><div id="showJobTypeDiv"></div></td>
					<td><input type="button" id="searchBtn" value="Search" onclick="return validate();" /></td>
				</tr>
			</table>
	</div>
	</form:form>
	<div id="recordShow" align="center"></div>
	<br/><br/><div align="center">
		<a href="postJob">Add Job</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="listUsers">Home</a>
	</div>
</body>
</html>
<script>
function getJobTypeList() {
	 $.post("getJobTypeList", function(data, status) {
		$('#showJobTypeDiv').html(data);
	});
}

function getJobList() {
	 $.post("getJobList", function(data, status) {
		$('#recordShow').html(data);
	});
}

function validate() {
	if (document.forms[0].jobTypeBox.value == "") {
		alert("Please Select Type");
		return false;
	}
	callAjax();
}

function callAjax() {
	 $.post("getJobListByType?jobType="+document.forms[0].jobTypeBox.value, function(data, status) {
		//alert("HI: "+data);
		$('#recordShow').html(data);
	}); 
}
</script>