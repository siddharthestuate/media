<!DOCTYPE html>
<%@page import="java.util.*" %>
<%@page import="com.medialounge.reevo.dto.JobDTO" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta charset="utf-8">
<title>Media Lounge</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/DT_bootstrap.css" />" rel="stylesheet">
    
    <link href="<c:url value="/resources/css/mediaLounge.css" />" rel="stylesheet">
    
    <script src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
	<script src="http://code.jquery.com/qunit/qunit-1.10.0.js"></script>
	<script type="text/javascript" src="<c:url value="/resources/js1/jquery.cookiess.js" />"></script>
	<link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
 	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

	<style type="text/css">
		.seeDetailslDIV{
			border-radius: 8px;
			background-color: #EBEBEB;
		}
	</style>	
</head>

<body style="align: center; background-color: #E7E7E7">

<div>
	<%@ include file="/WEB-INF/pages/jobExachangeLoad.jsp" %>
</div><br />

<div class="panel panel-default" style="width: 100%;">
     	 <div class="panel-heading">
             &nbsp;&nbsp;Job Details
         </div>
         <% int i=1; %>

	<c:if test="${!empty userArrayList}">
		<c:set var="myVar" value="on" />
		<c:forEach items="${userArrayList}" var="user" varStatus='on'>
		    <c:set var="job_id" value="${user.jobId.jobId}" scope="page" />
		    <c:set var="assignee_id" value="${user.userId.userId}" scope="page" /><br />
		    
				<table class="form_table seeDetailslDIV" style="width:70%;">
					<c:if test="${myVar == 'on'}">
						<tr>
							<td class="form_table_title"><b>Job Title</b></td>
							<td>:</td>
							<td class="form_table_value"><p style="word-wrap: break-word !important; width: 150px !important; display: block; position: relative;">${user.jobId.jobTitle}</p></td>
						</tr>
						<tr>
							<td class="form_table_title"><b>Description</b></td>
							<td>:</td>
							<td class="form_table_value"><p style="word-wrap: break-word !important; width: 150px !important; display: block; position: relative;">${user.jobId.description}</p></td>
						</tr>
						<tr>
							<td class="form_table_title"><b>Experience</b></td>
							<td>:</td>
							<td class="form_table_value">${user.jobId.experience}&nbsp;Year(s)</td>
						</tr>
						<tr>
							<td class="form_table_title"><b>Priority</b></td>
							<td>:</td>
							<td class="form_table_value">${user.jobId.priority}</td>
						</tr>
						<c:set var="myVar" value="off" />
					</c:if>
				</table>
			

				<form>
					<table frame="box" class="form_table">
						<span class="form_table" id="assignedMsg"></span>
						<tr>
							<td class="form_table_title"><b>User</b></td>
							<td>:</td>
							<td class="form_table_value"><%= i %></td>
						</tr>
						<tr>
							<td class="form_table_title"><b>Applied By</b></td>
							<td>:</td>
							<td class="form_table_value"><p style="word-wrap: break-word !important; width: 150px !important; display: block; position: relative;">${user.userId.email}</p></td>
						</tr>
						<tr>
							<td class="form_table_title"><b>Skill</b></td>
							<td>:</td>
							<td class="form_table_value"><p style="word-wrap: break-word !important; width: 150px !important; display: block; position: relative;">${user.skill}</p></td>
						</tr>
						<c:if test="${! empty user.docsPath}">
							<tr>
								<td class="form_table_title"><b>Documents</b></td>
								<td>:</td>
								<td class="form_table_value"><a href="downloadDocuments.html?doc_path=${user.docsPath}">Download</a></td>
							<tr>
						</c:if>
						<c:if test="${ empty user.docsPath}">
							<tr>
								<td class="form_table_title"><b>Documents</b></td>
								<td>:</td>
								<td class="form_table_value"><a>No Download Available</a></td>
							<tr>
						</c:if>
						<tr>
							<td colspan="3" class="form_table_title"><input type="button" value="Assigned" class="btn btn-primary"  id="jobFormBackButtonId4" onclick="jobExchangeAssigned('${job_id}','${assignee_id}');"/><br /></td>
						</tr>

					</table>
				</form>
		<% i++ ;  %> 
		</c:forEach>
		
	</c:if>
	<c:if test="${empty userArrayList}">
		<br>
		<h3 style="color: green"><center>No Replies for Your Post</center></h3><br />
	</c:if>
     </div>
</body>
