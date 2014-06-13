
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<% String mediaId = request.getAttribute("mediaId").toString(); %>
<table>
	<tr align="left">
		<td><h4>Expert Type</h4></td>
		<td>:</td>
		<td>
			<select id="userType" onchange="loadExpertCommentType(this.value);" style="width: 200px;">
				<option value="">Select</option>
				<option value="dj">DJ</option>
				<option value="vs">VS</option>
				<option value="anchor">Anchor</option>
				<option value="journalist">Journalist</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<div id="loadUsersByType" style="height: 200px; width: 350px; overflow-y: scroll;"></div>
		</td>
	</tr>
</table>

<script>
function loadExpertCommentType(value){
	if(value == null || value == ""){
		alert("Please Select Expert Type");
		return false;
	}else{
		 $.post("getExpertCommentByExpertType?expertType="+value+"&mediaId="+<%=mediaId%>, function(data, status) {
			 $('#loadUsersByType').html(data);
			});
	}
}

</script>