<%@page import="com.medialounge.reevo.dto.MessageDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<% Map mappedList = (Map)request.getAttribute("mappedList");
   ArrayList<MessageDTO> messages = (ArrayList<MessageDTO>)mappedList.get("messageList");
   String loginUser = (String)request.getAttribute("loginUser");
   String messageTo = (String)request.getAttribute("messageFrom");
%>
<div style="background-color: #AAF;width:660px;color: black;">
<div style="overflow-y: scroll; height: 200px;">
<table style="font-size:16px;background-color: #AAF; width: 650px;">
	
	<%for(MessageDTO messageDto : messages) {%>
	<tr>
		<td style="width:30%; font-weight: bold;"><%=mappedList.get(messageDto.getMessageFrom()) %></td>
		<td ><%=messageDto.getDescription()%></td>
		<td ></td> 
	</tr>
		<%} %>
	
</table>
</div>
</br>
<table style="font-size:14px;background-color: #AAF;">
	<tr>
	
		<td style="display: none"><input type="text" id="messageFrom" name="messageFrom" value="<%=loginUser %>"></td>
		<td style="display: none"><input type="text" id="messageTo" name="messageTo" value="<%=messageTo %>"></td>
		<td style="display: none"><input type="text" id="msgstatus" value="Unread"/></td>
		<td><textarea placeholder="reply.." rows="3" cols="50" id="msgdescription" name="description" style="width: 640px; height: 60px;"></textarea><td>
	</tr>
	<tr>
		<td><input type="button"  value="Reply" onclick="saveMessage()" style="font-size: 14px;"></td>
	</tr>
</table>
</div>
