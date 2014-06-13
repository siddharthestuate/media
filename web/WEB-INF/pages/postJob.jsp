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
    <link href="<c:url value="/resources/css/medialounge.css" />" rel="stylesheet">
    
    <script src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
	<script src="http://code.jquery.com/qunit/qunit-1.10.0.js"></script>
	<script type="text/javascript" src="<c:url value="/resources/js1/jquery.cookiess.js" />"></script>
	<link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
 	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
	
</head>

<body>
<div>
	<%@ include file="/WEB-INF/pages/jobExachangeLoad.jsp" %>
</div><br />

<div class="panel panel-default" style="width: 100%;">
     	<div class="panel-heading">
            &nbsp;&nbsp;Add New Job
             </div>
         <div class="panel-body">
             <div class="form-horizontal">
             <form:form method="post" commandName="jobName"  id="jobForm">
	             <div class="form-group">
	                 <label class="col-sm-3 control-label" style="text-align:left;">Job Type <span class="astreik" title="* fields are mandatory!">*</span></label>
	                 <div class="col-sm-9 form_dropdown">
                     	<form:select path="jobTypeId" class="form-control" onchange="onChangeJobType()">
							<%-- <form:option value="">Select</form:option> --%>
							<form:option value="${null}" label="Select">Select</form:option>
							<c:forEach items="${JOBTYPE_LIST}" var="job">
								<form:option value="${job.jobTypeId }">${job.jobTypeDescription }</form:option>
							</c:forEach>
						</form:select>
						<span id=jobTypeErrorMsg style="color: red;"></span>
	                 </div>
	             </div>
	             
	             <div class="form-group">
	                 <label class="col-sm-3 control-label" style="text-align:left;">
	                     Job Title <span class="astreik" title="* fields are mandatory!">*</span></label>
	                 <div class="col-sm-9">
	                     <form:input path="jobTitle" class="form-control form_textbox" maxlength="50" onkeyup="jobTitleValidation()" />
	                     <span style="font-size: x-small;float: right; margin: 0px 70px; margin-top: -23px;">(Max 50 characters)</span>
	                     <span id=jobTittleErrorMsg style="color: red;"></span>
	                 </div>
	             </div>
	             
	             <div class="form-group">
	                 <label class="col-sm-3 control-label" style="text-align:left;">Year Of Exp <span class="astreik" title="* fields are mandatory!">*</span></label>
	                 <div class="col-sm-9 form_dropdown">
						<form:select path="experience" class="form-control" onchange="onChangeExp()">
							<%-- <form:option value="">Select</form:option> --%>
							<form:option value="${null}" label="Select">Select</form:option>
							<%for (int i = 1; i < 9; i++) { %>
								<form:option value="<%=i%>"><%=i%></form:option>
							<%} %>
						</form:select>
						<span id=experienceErrorMsg style="color: red;"></span>
	                 </div>
	             </div>
	             
	             <div class="form-group">
	                 <label class="col-sm-3 control-label" style="text-align:left;">Priority <span class="astreik" title="* fields are mandatory!">*</span></label>
	                 <div class="col-sm-9 form_dropdown">
						<form:select path="priority" class="form-control" onchange="onChangePriority()" >
							<form:option value="">Select</form:option>
							<form:option value="High">High</form:option>
							<form:option value="Medium">Medium</form:option>
							<form:option value="Low">Low</form:option>
						</form:select>
						<span id=priorityErrorMsg style="color: red;"></span>
	                 </div>
	             </div>
	             
	             <div class="form-group">
	                 <label for="Comments" class="col-sm-3 control-label" style="text-align:left;">Description <span class="astreik" title="* fields are mandatory!">*</span></label>
	                 <div class="col-sm-9">
	                     <form:textarea path="description" class="form-control form_textarea" maxlength="400" placeholder="Provide a description..."/>
	                     <span style="font-size: x-small;float: right; margin: 0px 20px; margin-top: -50px;">(Max 400 characters)</span>
	                     <span id=descriptionErrorMsg style="color: red;"></span>
	                 </div>
	             </div>
	             
	             <div style="clear:both"><br/></div>
	             <div class="form-group last">
	                 <div class="col-sm-offset-3 col-sm-9">
	                 	<input type="button" value="PostJob" class="btn btn-primary" onclick="return validateJobPost();"/>&nbsp;&nbsp;<span id="postJobMsg"></span>
	                 </div>
	             </div>
             </form:form>
             </div>
         </div>
     </div>
</body>
