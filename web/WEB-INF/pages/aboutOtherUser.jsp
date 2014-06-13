<!-- 
	Document : aboutOtherUser.jsp
	Author : Anirudhha 
	Created On : 21 Jan 2014 5.00 PM
 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.medialounge.reevo.dto.UserDto,java.util.ArrayList;"%>
<%
	ArrayList<UserDto> list = (ArrayList<UserDto>) request.getAttribute("ABT_USER_LIST");
%>
<div>
	<table>
		<%
			for(UserDto dto:list){
		%>
		<tr>
			<td colspan="5" align="center">
				<%
					String photo = "";
					try{
						photo = dto.getProfilePhoto();
					}catch(Exception n){
						photo="";
					}
					if(!(photo == null)){
				%> 
				<img src="<%=request.getContextPath()%><%=dto.getContentPath() %>" width="200" height="200" /> 
				<%}else{%> 
					<img src="/MediaLounge/resources/dummy/world_map.jpg" width="550" height="200"> 
				<%}%>
			</td>
		</tr>
		<tr>
			<td colspan="" rowspan="4" style="width: 220px; height: 200px">
				<%
					String path = "";
					try{
						path = dto.getContentPath();
						
					}catch(Exception n){
						path="";
					}
					if(!(path == null)){
				%> 
				<img src="<%=request.getContextPath()%><%=dto.getContentPath() %>" width="200" height="200" /> 
				<%}else{%> 
					<img src="/MediaLounge/resources/dummy/dummy.jpg" width="200" height="200" style="padding:1px;border:1px solid #021a40;"/> 
				<%}%>
			</td>
		</tr>
		<tr>
			<td>
				<div id="showProfile" align="left" style="height: 195px">
					<table>
						<tr>
						
							<%if(dto.getNickName() == null || dto.getNickName().equalsIgnoreCase("null") || dto.getNickName().trim().equalsIgnoreCase("")){ %>
							<td style="color: #00AFEC"><h3><%=dto.getFirstName()%></h3></td>
							<%}else{ %>
							<td style="color: #00AFEC"><h3><%=dto.getNickName()%></h3></td>
							<%} %>
						</tr>
						<tr>
							<td style="color: #00AFEC"><%=dto.getFirstName()%> <%=dto.getLastName() %></td>
						</tr>
						<tr>
							<td style="color: #00AFEC"><%=dto.getEmail() %></td>
						</tr>
						<tr>
							<%if(dto.getPhone() == 0) {%>
							<td style="color: #00AFEC">No Phone-No. Found!!</td>
							<%}else{ %>
							<td style="color: #00AFEC"><%=dto.getPhone() %></td>
							<%} %>
						</tr>
						<tr>
							<td style="color: #00AFEC"><%=dto.getCountry() %></td>
						</tr>
						<tr>
							<td style="color: #00AFEC"><%=dto.getZipcode() %></td>
							<td><input type="text" name="latitude" id="latitude"
								value="<%=dto.getLatitude() %>" style="display: none"></td>
							<td><input type="text" name="longitude" id="longitude"
								value="<%=dto.getLongitude() %>" style="display: none"></td>
						</tr>
						<tr>
							<%if(dto.getRole() == null || dto.getRole().trim().equalsIgnoreCase("")) {%>
							<td style="color: #00AFEC">No Role Found!!</td>
							<%}else{ %>
							<td style="color: #00AFEC"><%=dto.getRole() %></td>
							<%} %>
						</tr>
						<tr>
							<%if(dto.getGenre() == null || dto.getGenre().trim().equalsIgnoreCase("")) {%>
							<td style="color: #00AFEC">No Genre Found!!</td>
							<%}else{ %>
							<td style="color: #00AFEC"><%=dto.getGenre() %></td>
							<%} %>
						</tr>
					</table>
				</div>
				
			</td>
		</tr>
	</table>
	<div>
		<h3>Skill Details</h3>
		<%
			String dj = dto.getDj();
			String vs = dto.getVs();
			String journalist = dto.getJournalist();
			String anchor = dto.getAnchor();
			String fDj = "";
			String fVs = "";
			String fJournalist ="";
			String fAnchor = "";
			if (dj.equals("Y")) {
				fDj = "PAO";
			}else if(vs.equals("Y")){
				fVs = "Air Play";
			}else if(journalist.equals("Y")){
				fJournalist = "LAIF";
			}else if(anchor.equals("Y")){
				fAnchor = "IMC";
			}
		%>
		<span><%=fDj%> <%=fVs%> <%=fJournalist%> <%=fAnchor%></span>
		</div>
		<!-- Inspiration -->
		<div>
		<div id="showInspireUserPhotoDiv">
			<table>
				<tr>
					<c:forEach items="${INSPIRE_LIST}" var="user">
						<td>
							<table>
								<tr>
									<c:if test="${user.toUserEntity.contentPath == null}">
										<td><img src="/MediaLounge/resources/dummy/dummy.jpg" width="80" height="80" ></td>
									</c:if>
									<c:if test="${user.toUserEntity.contentPath != null}">
									<td><img src="<c:url value="${user.toUserEntity.contentPath}" />" width="80" height="80"></td>
									</c:if>
								</tr>
								<tr><td align="center"><span>${user.toUserEntity.firstName}</span></td></tr>
							</table>
						</td>
					</c:forEach>
				</tr>
			</table>
		</div>
		<span><h3>Inspiration</h3></span>
		<div id="inspiredUserDiv"></div>
		<table>
			<tr>
			<c:if test="${empty INSPIRE_LIST}">
				<span>No Inspiration Found!</span>
			</c:if>			
			<c:if test="${!empty INSPIRE_LIST}">
				<c:forEach items="${INSPIRE_LIST}" var="user">
					<td>${user.toUserEntity.firstName} ${user.toUserEntity.lastName },</td>
				</c:forEach>
			</c:if>
			</tr>
		</table>
		<hr>
	</div>
		
	<!-- Bio -->
	<div>
		<span><h3>Bio</h3></span>
		<div id="showBioDiv">
		<table>
			<tr>
				<td><p style="word-wrap: break-word !important; position:absolute; width:270px;">
					<%
					String bio = dto.getBio();
					if(bio == null){ %>
						<span>No Bio Found!</span>
					<%}else{ %>
						<%=bio %>
					<%} %>
					</p>
				</td>
			</tr>
		</table>
		</div>
	</div>
		
	<%} %>
</div>