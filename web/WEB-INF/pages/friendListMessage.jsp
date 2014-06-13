<%@page import="com.medialounge.reevo.dto.UserDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% ArrayList<UserDto> list = (ArrayList<UserDto>)request.getAttribute("friendList");
   String loginUser = (String)request.getAttribute("loginUser");
%>
	<table style="background-color: #AAF">
		
		<tr>
			<td style="width:22%;color:black; font-weight: bold;">To : </td>
			
			<td >
			<select id="messageTo" name="messageTo" style="font-size: 13px">
					<option value="">Select a Friend</option>
			<%for(UserDto user : list) {%>
					<option value="<%=user.getUserId()%>"><%=user.getFirstName() %> <%=user.getLastName() %></option>
			<%} %>
			</select>
			</td>
		</tr>
		<tr>
			<td style="display: none;"><input type="text" id="messageFrom" name="messageFrom" value="<%=loginUser%>">
			</td>
		</tr>
		<tr>
			<td style="display: none;"><input type="text" id="msgstatus" name="status" value="Unread">
			</td>
		</tr>
	</table></br>
	<table style="width: 400px; font-size:16px;background-color: #AAF">
		<tr>
			<td>
				<textarea placeholder="send Message.." rows="3" cols="100" id="msgdescription" name="description" style="font-style: normal; font-size:14px; color: red;width: 640px; height: 72px;"></textarea>
			</td>
		</tr>
		<tr>
			<td style="width:30%; font-weight: bold;"><input type="button" value="Send" onclick="saveMessage()"></td>
		</tr>
	</table>
</body>
</html>