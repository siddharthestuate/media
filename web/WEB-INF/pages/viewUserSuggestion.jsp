<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<br/>
<div>
<c:forEach items="${VIEW_SUGGESTION}" var="view">
<table>
	<tr>
		<c:if test="${view.fromUser.contentPath == null}">
			<td rowspan="4" ><img src="/MediaLounge/resources/dummy/dummy.jpg" width="100px" height="100px" ></td>
		</c:if>
		<c:if test="${view.fromUser.contentPath != null}">
		<td rowspan="4" ><img src="<c:url value="${view.fromUser.contentPath}" />" width="100px" height="100px" ></td>
		</c:if>
		<!-- <td rowspan="4" ><img src="/MediaLounge/resources/dummy/dummy.jpg" width="100px" height="100px" ></td> -->
		<td><h4 style="color: #00AFEC">&nbsp;&nbsp;${view.fromUser.firstName } ${view.fromUser.lastName}</h4></td>
	</tr>
	<tr><td style="color: #00AFEC">&nbsp;&nbsp;${view.fromUser.email }</td></tr>
	<tr><td style="color: #00AFEC">&nbsp;&nbsp;${view.fromUser.country }</td></tr>
	<tr><td style="color: #00AFEC">&nbsp;&nbsp;Distance : <span style="color: black;">&nbsp;${DISTANCE }</span></tr>
</table>
</br>
<table>
	<tr>
		<td style="color: #00AFEC;width: " width="20%"><b>Suggestion Type </b></td>
		<td style="width: "><b>:</b></td>
		<td style="width: " width="80%">${view.suggestionType }</td>
	</tr>
	<tr>
		<td style="color: #00AFEC;width: " width="20%"><b>Description </b></td>
		<td style="width: "><b>:</b></td>
		<td style="width: " width="80%"><p style="word-wrap: break-word !important; width: 450px !important; display: block; position: relative;">${view.description }</p></td>
	</tr>
</table>
</c:forEach></br>
<input type="button" class="btn btn-primary" value="Back" onclick="getAdminSuggestion();">
</div>