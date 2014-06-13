<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table >
	<tr>
		<td colspan="2"><h3>Personal Information :</h3></td>
	</tr>
	<c:forEach items="${USERINFO}" var="info">
	<tr >
		<td>First Name :</td>
		<td><input type="text" id="firstName" value=${info.firstName }></td>
		<td><span id="fName" style="color: orange;"></span></td>
	</tr>
	<tr>
		<td>Last Name :</td>
		<td><input type="text" id="lastName" value=${info.lastName }></td>
		<td><span id="lName" style="color: orange;"></span></td>
	</tr>
	<tr>
		<td>Email :</td>
		<td><input type="text" id="emailId" value=${info.email } readonly="readonly" style="cursor: pointer"></td>
	</tr>
	<tr>
		<td>Telephone:</td>
		<td><input type="text" id="phone" value=${info.phone } onkeyup="return keypress()"></td>
		<td><span id="telephone" style="color: orange;"></span></td>
	</tr>
	<tr>
		<td>Country:</td>
		<td><select name="country" id="country">
			<option ${info.country == 'India'?"selected='selected'":"" } >India</option>
			<option ${info.country == 'USA'?"selected='selected'":"" } >USA</option>
			<option ${info.country == 'England'?"selected='selected'" :""} >England</option>
			<option ${info.country == 'France'?"selected='selected'":"" } >France</option>
			<option ${info.country == 'Germany'?"selected='selected'":"" } >Germany</option>
			<option ${info.country == 'China'?"selected='selected'":"" } >China</option>
			<option ${info.country == 'Japan'?"selected='selected'":"" } >Japan</option>
			<option ${info.country == 'Australia'?"selected='selected'":"" } >Australia</option>
			<option ${info.country == 'Italy'?"selected='selected'":"" } >Italy</option>
			<option ${info.country == 'Brazil'?"selected='selected'":"" } >Brazil</option>
        </select> </td>
	</tr>
	</c:forEach>
	<tr>
		<td><input type="button" class="btn btn-primary" value="Save" onclick="updateMyProfile()"></td>
	</tr>
</table>
<script>
	

</script>