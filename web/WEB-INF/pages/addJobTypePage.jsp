<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<br/>
<div class="panel panel-default" style="width: 100%;">
	<c:forEach items="${JOBTYPES}" var="jobType">
		<input type="text" name="jobType" value="${jobType.description }" style="display: none">
	</c:forEach>
	<div class="panel-heading">
    	&nbsp;&nbsp;Job Type
    </div>
	<div class="panel-body">
      	<div class="form-horizontal">
      		 <div class="form-group">
                 <label class="col-sm-3 control-label" style="text-align:left;">
                     Job Type <span class="astreik" title="* fields are mandatory!">*</span></label>
                 <div class="col-sm-9">
                     <input type="text" id="addJobType" name="addJobType" maxlength="40" class="form-control form_textbox" onkeyup="jobTypeValidation()">
                     <span style="font-size: x-small;float: right; margin: 0px 70px; margin-top: -23px;">(Max 40 characters)</span>
                     <span id="errorJobType" style="color: orange;"></span>
                 </div>
	        </div>
	        <div style="clear:both"><br/></div>
	        <div class="form-group last">
                <div class="col-sm-offset-3 col-sm-9">
                	<button type="button" class="btn btn-primary" onclick="return addJobType();">Save</button>
                </div>
	       </div>
    	</div>
	</div>
</div>
