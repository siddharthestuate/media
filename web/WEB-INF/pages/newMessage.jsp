<%@page import="java.util.ArrayList"%>
<%ArrayList msgCountUserList = (ArrayList)request.getAttribute("user");%>
<span id="buzzMessage" style="display: none"><%=msgCountUserList %></span>
<table>
<tr>
	<td>
			<div id="messegedfriend">
			</div>
	</td>
	<td></td>
	<td>
		<div style="width:390px; margin: auto;" >
			<div id="chatMessage"></div>
		</div>
	</td>
</tr>			
</table>	
