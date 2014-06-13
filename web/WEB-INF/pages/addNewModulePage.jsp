<%@page import="java.util.*"%>
<%@page import="com.medialounge.reevo.dto.OverviewDTO"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<style>
#carrierTbl tr:nth-child(even) {
	background-color: #fff;
}

#carrierTbl tr:nth-child(odd) {
	background-color: #ddd;
}

#carrierTbl tr td {
	padding: 3px;
}
/* .astreik {
	color: red;
	cursor: help;
} */

.error{
	color: red;
	font-weight: normal;
}
</style>

<% 	ArrayList<OverviewDTO> overViewModulesList = (ArrayList<OverviewDTO>) request.getAttribute("OverViewModulesList"); %>

<body style="background-color: #E7E7E7;" onload=" return loadData();">
	<!-- <h3>Add New Quick Over Module</h3> --><br/>
	<div style="color: orange;"><span id="showStatusMsg"></span></div>
	<form id="addNewModuleForm">
	<%-- <table> 
		<tr>
			<td><b>Module Name</b></td>
			<td><b>&nbsp;: &nbsp;</b></td>
			<!-- <td><input type="text"  name="moduleName" id="moduleName" /></td> -->
			<td>
				<select id="moduleNameSelectId" onchange="verifyOverViewModule(document.getElementById('moduleNameSelectId').value);">
					<option value="">Select</option>
					<% 	for (OverviewDTO dto : overViewModulesList) { %>
						<option value='<%= dto.getQuickOverViewModuleId()%>'><%=dto.getQuickOverViewModuleName()%></option>
					<% }%>
				</select>
				<span id="OverViewModuleSpanId"></span>
				<span id="span0" class="error"></span>
			</td>
		</tr>
		<tr>
			<td><b>Function Name</b></td>
			<td><b>&nbsp;: &nbsp;</b></td>
			<td colspan="3">
				<textarea rows="2" cols="50" name="description" id="des" style="overflow:auto;resize:none" placeholder="This field is required!"></textarea>
				<span id="span1" class="error"></span>
			</td>
		</tr>
		<!-- anirudhha -->
		<tr>
			<td><b>How It Works</b></td>
			<td><b>&nbsp;: &nbsp;</b></td>
			<td colspan="3">
				<textarea rows="2" cols="50" name="description" id="HIW" style="overflow:auto;resize:none" placeholder="This field is required!"></textarea>
				<span id="span2" class="error"></span>
			</td>
		</tr>
		<tr>
			<td><b>Why To Use</b></td>
			<td><b>&nbsp;: &nbsp;</b></td>
			<td colspan="3">
				<textarea rows="2" cols="50" name="description" id="WTU" style="overflow:auto;resize:none" placeholder="This field is required!"></textarea>
				<span id="span3" class="error"></span>
			</td>
		</tr>			
		<!-- anirudhha end -->
	</table> --%></br>
	<div class="panel panel-default" style="width: 100%;">
     	<div class="panel-heading">
             &nbsp;&nbsp;Add New Quick Over Module
         </div>
          <div class="panel-body">
             <div class="form-horizontal">
	             <div class="form-group">
	                 <label class="col-sm-3 control-label" style="text-align:left;">Module Name <span class="astreik" title="* fields are mandatory!">*</span></label>
	                 <div class="col-sm-9 form_dropdown">
						<select id="moduleNameSelectId" class="form-control" onchange="verifyOverViewModule(document.getElementById('moduleNameSelectId').value);">
							<option value="0">Select</option>
							<% 	for (OverviewDTO dto : overViewModulesList) { %>
								<option value='<%= dto.getQuickOverViewModuleId()%>'><%=dto.getQuickOverViewModuleName()%></option>
							<% }%>
						</select>
						<span id="OverViewModuleSpanId"></span>
						<span id="span0" class="error"></span>
	                 </div>
	             </div>
	             <div class="form-group">
	                 <label for="Comments" class="col-sm-3 control-label" style="text-align:left;">Function Name <span class="astreik" title="* fields are mandatory!">*</span></label>
	                 <div class="col-sm-9">
	                     <textarea id="des" maxlength="250" class="form-control form_textarea" rows="4" cols="20" style="width: 350px; height: 60px;"></textarea>
	                     <span style="font-size: x-small;float: right; margin: 0px 20px; margin-top: -50px;">(Max 250 characters)</span>
	                     <span id="span1" class="error"></span>
	                 </div>
	             </div>
	             <div class="form-group">
	                 <label for="Comments" class="col-sm-3 control-label" style="text-align:left;">How It Works <span class="astreik" title="* fields are mandatory!">*</span></label>
	                 <div class="col-sm-9">
	                     <textarea id="HIW" maxlength="250" class="form-control form_textarea" rows="4" cols="20" style="width: 350px; height: 60px;"></textarea>
	                     <span style="font-size: x-small;float: right; margin: 0px 20px; margin-top: -50px;">(Max 250 characters)</span>
	                     <span id="span2" class="error"></span>
	                 </div>
	             </div>
	             <div class="form-group">
	                 <label for="Comments" class="col-sm-3 control-label" style="text-align:left;">Why To Use <span class="astreik" title="* fields are mandatory!">*</span></label>
	                 <div class="col-sm-9">
	                     <textarea id="WTU" maxlength="250" class="form-control form_textarea" rows="4" cols="20" style="width: 350px; height: 60px;"></textarea>
	                     <span style="font-size: x-small;float: right; margin: 0px 20px; margin-top: -50px;">(Max 250 characters)</span>
	                 	 <span id="span3" class="error"></span>
	                 </div>
	             </div>
	             <div style="clear:both"><br/></div>
	             <div class="form-group last">
	                 <div class="col-sm-offset-3 col-sm-9">
	                 	<button type="button" onclick="return validateAddModule();" class="btn btn-primary" id="addOverViewDetailsId">Add </button>
						<button type="reset" class="btn btn-primary">Reset</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" onclick="return showQuickOverviewAdmin(0);" class="btn btn-primary" id="clearOverViewDetailsId">Back</button>
	                 </div>
	             </div>
             </div><!-- class="form-horizontal" -->
         </div> <!--class="panel-body"  -->
     </div><!--class="panel panel-default"  -->
		
	<form>
<script>
 function validateAddModule() {
	var moduleName = document.getElementById("moduleNameSelectId").value;
	var description = document.getElementById("des");
	var DescValue=description.value;
	
	var function_work = document.getElementById("HIW").value.trim();
	var why_to_use = document.getElementById("WTU").value.trim();

	if (moduleName == "0") {
		document.getElementById("span0").innerHTML = "<br/>Please Select Module Name";
		$('#OverViewModuleSpanId').html('');
		document.getElementById("moduleNameSelectId").focus();
		return false;
	}else{
		document.getElementById("span0").innerHTML = "";
	}
	
	if (DescValue == "") {
		document.getElementById("span1").innerHTML = "<br/>Please Enter Function name";
		document.getElementById("des").focus();
		return false;
	}else{
		document.getElementById("span1").innerHTML = "";
	}
	
	if(function_work == ""){
		document.getElementById("span2").innerHTML = "<br/> Please Enter how it works";	
		document.getElementById("HIW").focus();
		return false;
	}else{
		document.getElementById("span2").innerHTML = "";
	}
	
	if(why_to_use == ""){
		document.getElementById("span3").innerHTML = "<br/>Please Enter why to use";
		document.getElementById("WTU").focus();
		return false;
	}else{
		document.getElementById("span3").innerHTML = "";
	} 
	
	/* Function For Adding New Module for QuickOverView Module */
	 if (moduleName != "" && DescValue != '' && function_work != "" && why_to_use != "") {
		$.post("addOverView?moduleName=" + moduleName + "&description="	+ DescValue+"&functionWork="+function_work+"&whyToUse="+why_to_use, function(data, status) {
			$('#showStatusMsg').show();
			$('#showStatusMsg').html(data);
		})
		.fail(function() {
			genericException();	
		});
	} 
	$('#addNewModuleForm')[0].reset();
}
	 
function verifyOverViewModule(overViewModuleId){
	
	 $.post("checkOverViewModule?overViewModuleId=" + overViewModuleId  , function(data, status) {
			//$('#OverViewModuleSpanId').show();
			if(data =='This Module is Already Added') {
				$("#moduleNameSelectId").val('0');
			}
			document.getElementById("span0").innerHTML = "";
			$('#OverViewModuleSpanId').html(data);
		});
 }
</script>