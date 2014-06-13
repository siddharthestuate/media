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
             &nbsp;&nbsp;Apply Job
         </div>
		<div class="panel-body">
             <div class="form-horizontal">
				<form>
					<c:if test="${! empty JOB_DETAILS}">
					<c:forEach items="${JOB_DETAILS}" var="job">
						<!-- <h5>Job Description</h5> -->
					<table class="form_table seeDetailslDIV">
						<span class="form_table" id="assignedMsg"></span>
						<tr>
							<td class="form_table_title"><b>Job Title</b></td>
							<td>:</td>
							<td class="form_table_value"><p style="word-wrap: break-word !important; width: 150px !important; display: block; position: relative;">${job.jobTitle}</p></td>
						</tr>
						<tr>
							<td class="form_table_title"><b>Description</b></td>
							<td>:</td>
							<td class="form_table_value"><p style="word-wrap: break-word !important; width: 150px !important; display: block; position: relative;">${job.description}</p></td>
						</tr>
						<tr>
							<td class="form_table_title"><b>Experience</b></td>
							<td>:</td>
							<td class="form_table_value">${job.experience}&nbsp;Year(s)</td>
						</tr>
						<tr>
							<td class="form_table_title"><b>Priority</b></td>
							<td>:</td>
							<td class="form_table_value">${job.priority}</td>
						</tr>
					</table>
					</c:forEach>
					</c:if>
				</form>
				<br />
				<table>
					<tr>
						<td>
						<!-- <h5>Apply Job</h5> -->
						<div class="form-group">
		                	 <label for="Comments" class="col-sm-3 control-label" style="text-align:left;">Skill Set</label>
		                 	<div class="col-sm-9">
		                     <textarea name="skill" rows="3" cols="50" style="resize: none;" maxlength="400" id="skillId" class="form-control form_textarea"></textarea>
							 <span id="skillErrorMsg" style="color: red;"></span>
	                 		</div>
             			</div>
						</td>
						<td><span style="font-size: x-small;float: right; margin: 0px 20px; margin-top: 35px;">(Max 400 characters)</span></td>
					</tr>
					<tr>
						<td>
							<div class="form-group">
				                 <label class="col-sm-3 control-label" style="text-align:left;">
				                     Resume&nbsp;&nbsp;<span class="astreik" title="* fields are mandatory!">*</span></label>
				                 <div class="col-sm-9">
				                 	<input name="uploadFile" type="file" id="uploadFile"> &nbsp;&nbsp;
									<span id="resumeErrorMsg" style="color: red;"></span>
				                 </div>
				             </div>
						</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<div class="form-group last">
				              <div class="col-sm-offset-3 col-sm-9">
				               	<input type="button" value="Apply Job" class="btn btn-primary"  id="applyJobId" onclick=" return applyForJob(${model.jobId},'applied');"/><span id="applyJobMsg"></span>
				              </div>
				            </div>
						</td>
						<td>&nbsp;</td>
					</tr>
				</table>    
             
			</div>
		</div>
				
     </div>
</body>
