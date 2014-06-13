<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div style="background-color: #E7E7E7; width: 200px; margin-top: 2px;">
	<%
		ArrayList user = (ArrayList) request.getAttribute("user");
		//System.out.println("user --->"+user);
		String loginUser = (String) request.getAttribute("loginUser");
	%>
	<br/>
	<h5 align="center" style="color: black;">
		<b><span style="cursor: pointer;"
			onclick="getFriendContactList('<%=loginUser%>')" >New Message</span></b>
	</h5>
	<br/>
	<p style="display: none">
		<span class="userInfoClr"> <strong>Search:</strong>
		</span> <input type="text" style:"height:10px;"="">
	</p>
	<ul class="list-group" style="overflow-y: scroll; height: 247px;">
		<%
			for (int i = 0; i < user.size(); i++) {
		%>
		<li class="list-group-item"><a href="#"
			onclick="getMessage('<%=loginUser%>','<%=user.get(i)%>')" ><%=user.get(++i)%></a>
			<% if((Integer.parseInt(user.get(++i)+""))!= 0){%>
				<span class="badge" ><%=user.get(i) %></span></li>
		<%
			}
			}
		%>
	</ul>
</div>
</body>
</html>