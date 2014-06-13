<!-- 
	Document : mediaUserCategory.jsp
	Author : Anirudhha
	Created on: 24- Dec 2013 03:46 PM
 -->
 <style>
 	.tdClass{
 		font-weight: bold;
 	} 
 </style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<table id="myTbl">
	<tr>
		<td class="tdClass">Expert Type</td>
		<td>:</td>
		<td>
			<select id="userType" onchange="loadUserType(this.value);" style="width: 200px;">
				<option value="">Select</option>
				<option value="dj">DJ</option>
				<option value="vs">VS</option>
				<option value="anchor">Anchor</option>
				<option value="journalist">Journalist</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="tdClass">Experts List</td>
		<td>:</td>
		<td>
			<div id="loadUsersByType"></div>
		</td>
	</tr>
	<tr >
		<td class="tdClass">Title </td>
		<td>:</td>
		<td>
			<input type="text" id="userTitle" name="userTitle" placeholder="Enter Title.." style="width: 350px;"> 	
		</td>
	</tr>
	<tr >
		<td class="tdClass">Comments </td>
		<td>:</td>
		<td>
			<textarea id="userComments" rows="4" cols="20" placeholder="Provide a comments..." style="width: 350px; height: 60px;"></textarea>
		</td>
	</tr>
</table>
<script>
$( document ).ready(function() {
	//document.getElementById("tr1").style.display = "none";
	//document.getElementById("tr2").style.display = "none";
});

function loadUserType(value){
		if(value == null || value == ""){
			alert("Please Select User Type");
			return false;
		}else{
			 $.post("getUserCategoryByType?userType="+value, function(data, status) {
				 $('#loadUsersByType').html(data);
				// showDiv();
				});
		}
	}
	
	function showDiv(){
		//document.getElementById("tr1").style.display = "block";
		//document.getElementById("tr2").style.display = "block";
	}
</script>