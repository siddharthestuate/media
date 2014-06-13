<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		body { 
		  background: url(resources/images/login.jpg) no-repeat center center fixed; 
		  -webkit-background-size: cover;
		  -moz-background-size: cover;
		  -o-background-size: cover;
		  background-size: cover;
		}
		
		.navbar-brand-logo:hover,
		.navbar-brand-logo:active{
			color: #fff;
			text-decoration: none;
		}
		
		.panel-default {
		/*opacity: 0.9;*/
		margin-top:30px;
		}
		.form-group.last { margin-bottom:0px; }
	</style>


</head>

<body>

<div class="panel panel-default" style="width: 100%;">
     	<div class="panel-heading">
             &nbsp;&nbsp;Upload/Attach
             </div>
         <div class="panel-body">
             <div class="form-horizontal">
             <div class="form-group">
                 <label class="col-sm-3 control-label" style="text-align:left;">
                     Media Name&nbsp;&nbsp;<span class="astreik" title="* fields are mandatory!">*</span></label>
                 <div class="col-sm-9">
                     <input type="text" name="mediaName" id="mediaName" placeholder="Media Name" maxlength="30" id="inputFirstName3" class="form-control form_textbox" onkeyup="mediaNameValidation()" />
                     <span style="font-size: x-small;float: right; margin: 0px 80px; margin-top: -23px;">(Max 30 characters)</span>
                 	<span id="mediaNameErrorMsg" style="color: red;"></span>
                 </div>
             </div>
             
             <div class="form-group">
                 <label class="col-sm-3 control-label" style="text-align:left;">
                     Media File&nbsp;&nbsp;<span class="astreik" title="* fields are mandatory!">*</span></label>
                 <div class="col-sm-9">
                     <input type="file" name="mediaFile" id="mediaFile" placeholder="Media File" style="width:200px;" />
                 	<span id="mediaFileErrorMsg" style="color: red;"></span>
                 </div>
             </div>
            
             <!-- <div style="clear:both"><br/></div> -->
             <div class="form-group">
                 <label for="inputCountry3" class="col-sm-3 control-label" style="text-align:left;">Media Keys</label>
                 <div class="col-sm-9 form_dropdown">
                     <form:select path="mediaDtosList" onChange="setValueToMediaKey()" id="mediaKeySelectedValue" class="form-control" >
			         	<form:option value="" label="Select" />
			         	<span><form:options items="${mediaDtosList}" itemLabel="mediaSearchKey" itemValue="mediaSearchKey" /></span>
			         </form:select>
                 </div>
             </div>
             
             <!-- <div style="clear:both"><br/></div> -->
             <div class="form-group">
                 <label class="col-sm-3 control-label" style="text-align:left;">
                     Media Key&nbsp;&nbsp;<span class="astreik" title="* fields are mandatory!">*</span></label>
                 <div class="col-sm-9">
                     <input type="text" name="mediaSearchKey" id="mediaSearchKey" maxlength="20" placeholder="Media Key" id="mediaSearchKey" class="form-control form_textbox" onkeyup="mediaKeyValidation()" />
                     <span style="font-size: x-small;float: right; margin: 0px 80px; margin-top: -23px;">(Max 20 characters)</span>
                 	<span id="mediaKeyErrorMsg" style="color: red;"></span>
                 </div>
             </div>
             
             <div class="form-group">
                 <label for="Comments" class="col-sm-3 control-label" style="text-align:left;">
                     Comments</label>
                 <div class="col-sm-9">
                     <textarea rows=4 cols=40 style="resize: none;" name="mediaComments" maxlength="400" id="mediaComments" class="form-control form_textarea" onkeyup="mediaCommentsValidation()"></textarea><div></div>
                      <span style="font-size: x-small;float: right; margin: 0px 20px; margin-top: -50px;">(Max 400 characters)</span>
                     <span id=mediaCommentsErrorMsg style="color: red;"></span>
                 </div>
             </div>
             
             <c:if test="${fmfCheck =='Y'}">
             	<div class="form-group">
                  <label for="Comments" class="col-sm-3 control-label" style="text-align:left;">
                      FMF</label>
                  <div class="col-sm-9">
                      <input type="checkbox" name="mediaFmf" id="mediaFmf" disabled="disabled">
                  </div>
              </div>
             </c:if>
             
             <c:if test="${fmfCheck =='N'}">
             	<div class="form-group">
                  <label for="Comments" class="col-sm-3 control-label" style="text-align:left;">
                      FMF</label>
                  <div class="col-sm-9">
                      <input type="checkbox" name="mediaFmf" id="mediaFmf">
                  </div>
              </div>
             </c:if>
             
             <!-- <div style="clear:both"><br/></div> -->
             <div class="form-group last">
                 <div class="col-sm-offset-3 col-sm-9">
                 	<span id="showSpanId" style="display: none;"><img src="<c:url value="/resources/images/loading.gif" />"/></span>
                     <button type="button" id="uploadBtn" class="btn btn-primary" onclick="uploadFormData();">
                         Upload</button>&nbsp;&nbsp;<span id="uploadMsg" style="color: orange;"></span>
                    <!--  <button type="reset" class="btn btn-default btn-sm" onclick="resetAll()">
                         Reset</button> -->
                 </div>
             </div>
             </div>
         </div>
     </div>
</body>
