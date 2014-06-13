<style>
.error{
	color: red;
	font-weight: normal;
}
</style>

<!-- <h3>Quick OverView - Edit Operation</h3> -->
<br/>
<input  type="hidden" name="id" id="id"  value="${model.QuickOverViewId}" />
<div style="color: orange;"><span id="showStatusMsg"></span></div>
	<%-- <table>
		<tr>
			<td>Module Name</td>
			<td><b>&nbsp;: &nbsp;</b></td>
			<td><input  type="text" name="moduleName" id="moduleName"  value="${model.overViewName}" disabled /></td>
		</tr>
		<tr>
			<td><br></td>
		</tr>
		<tr>
			<td>Function Name</td>
			<td><b>&nbsp;: &nbsp;</b></td>
			<td><textarea rows="2" cols="40" name="desc" id="desc">${model.desc}</textarea><span id="span1" class="error"></span></td>
		</tr>
		<tr>
			<td>How It Work</td>
			<td><b>&nbsp;: &nbsp;</b></td>
			<td><textarea rows="2" cols="40"  name="desc" id="HFW">${model.functionWork}</textarea><span id="span2" class="error"></span></td>
		</tr>
		<tr>
			<td>Why To Use</td>
			<td><b>&nbsp;: &nbsp;</b></td>
			<td><textarea rows="2" cols="40"  name="desc" id="WTU">${model.whyToUse}</textarea><span id="span3" class="error"></span></td>
		</tr>	
	</table> --%></br>
	
	<div class="panel panel-default" style="width: 100%;">
     	<div class="panel-heading">
             &nbsp;&nbsp;Quick OverView - Edit Operation
             </div>
         <div class="panel-body">
             <div class="form-horizontal">
	             <div class="form-group">
	                 <label class="col-sm-3 control-label" style="text-align:left;">Module Name</label>
	                 <div class="col-sm-9">
	                     <input type="text" name="moduleName" id="moduleName" placeholder="moduleName" class="form-control form_textbox" value="${model.overViewName}" disabled  />
	                     <span style="font-size: x-small;float: right; margin: 0px 80px; margin-top: -23px;">(Max 30 characters)</span>
	                 	<span id="mediaNameErrorMsg" style="color: red;"></span>
	                 </div>
	             </div>
             	 <div class="form-group">
	                 <label for="Comments" class="col-sm-3 control-label" style="text-align:left;">Function Name <span class="astreik" title="* fields are mandatory!">*</span></label>
	                 <div class="col-sm-9">
	                     <textarea id="desc" maxlength="250" class="form-control form_textarea" rows="4" cols="20" style="width: 350px; height: 60px;">${model.desc}</textarea>
	                     <span style="font-size: x-small;float: right; margin: 0px 20px; margin-top: -50px;">(Max 250 characters)</span>
	                     <span id="span1" class="error"></span>
	                 </div>
	             </div>
	             <div class="form-group">
	                 <label for="Comments" class="col-sm-3 control-label" style="text-align:left;">How It Works <span class="astreik" title="* fields are mandatory!">*</span></label>
	                 <div class="col-sm-9">
	                     <textarea id="HFW" maxlength="250" class="form-control form_textarea" rows="4" cols="20" style="width: 350px; height: 60px;">${model.functionWork}</textarea>
	                     <span style="font-size: x-small;float: right; margin: 0px 20px; margin-top: -50px;">(Max 250 characters)</span>
	                     <span id="span2" class="error"></span>
	                 </div>
	             </div>
	             <div class="form-group">
	                 <label for="Comments" class="col-sm-3 control-label" style="text-align:left;">Why To Use <span class="astreik" title="* fields are mandatory!">*</span></label>
	                 <div class="col-sm-9">
	                     <textarea id="WTU" maxlength="250" class="form-control form_textarea" rows="4" cols="20" style="width: 350px; height: 60px;">${model.whyToUse}</textarea>
	                     <span style="font-size: x-small;float: right; margin: 0px 20px; margin-top: -50px;">(Max 250 characters)</span>
	                 	 <span id="span3" class="error"></span>
	                 </div>
	             </div>
	             <div style="clear:both"><br/></div>
	             <div class="form-group last">
	                 <div class="col-sm-offset-3 col-sm-9">
	                 	<button type="button" class="btn btn-primary"  id="quickOverViewSaveId"  onclick=" return saveEditedOverView();">Save</button>
						<!-- <button type="button"  onclick="return showQuickOverview();" class="btn btn-primary"  id="clearOverViewDetailsId">Back</button> -->
						<button type="button"  onclick="return showQuickOverviewAdmin(0);" class="btn btn-primary"  id="clearOverViewDetailsId">Back</button>
	                 </div>
	             </div>
             
             
             
             </div>
         </div>
     </div>
	
<!-- <button type="button" class="btn btn-primary"  id="quickOverViewSaveId"  onclick=" return saveEditedOverView();">Save</button>
<button type="button"  onclick="return showQuickOverview();" class="btn btn-primary"  id="clearOverViewDetailsId">Back</button>
<button type="button"  onclick="return showQuickOverviewAdmin(0);" class="btn btn-primary"  id="clearOverViewDetailsId">Back</button> -->

