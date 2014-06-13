<!DOCTYPE html>
<%@page import="java.util.*" %>
<%@page import="com.medialounge.reevo.dto.UserDto"%>
<%@page import="com.medialounge.reevo.dto.SkillDTO"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%
	ArrayList<UserDto> list = (ArrayList<UserDto>) request.getAttribute("myInfoList");
	ArrayList<SkillDTO> skillList = (ArrayList<SkillDTO>) request.getAttribute("MYSKILL_LIST");
%>
<style>
.tdSpace{
	 padding-right: 10px;
}
textarea{
    resize:none;
}
input::-moz-placeholder {  
  	color: #898989!important;  
} 
input::-webkit-input-placeholder {  
    color: #898989!important;  
}
 input:-ms-input-placeholder {  
    color: #898989!important;
}    

</style>
<div>
	<div align="left">
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
								<%}else{
								%> 
									<img src="/MediaLounge/resources/dummy/world_map.jpg" width="550" height="200">
								<%}%>							
							</td>
						</tr>
						
						<tr>
							<td colspan="" rowspan="5" style="width: 220px; height: 210px">
							<%
								String path = "";
							try{
								path = dto.getContentPath();
								
							}catch(Exception n){
								path="";
							}
								if(!(path == null)){
								%>
								<img id="myLatestPhoto" src="<%=request.getContextPath()%><%=dto.getContentPath() %>" width="200" height="210" />
								<%}else{
								%> 
									<img id="myLatestPhoto" src="/MediaLounge/resources/dummy/dummy.jpg" width="200" height="210" style="padding:1px;border:1px solid #021a40;">
								<%}%>
								
							</td>
							<%-- <td colspan="3">
								<table>
								<form:form method="post" commandName="uploadPhoto" action="photoUpload" enctype="multipart/form-data">
									<tr>
										<td><input name="userPhoto" id="userPhoto" type="file" /></td>
										<td><input type="button" value="Upload" class="btn btn-primary" onclick="uploadUserPhoto();" /></td>
									</tr>
								</form:form>	
								</table>
							</td> --%>
						</tr>
						
						<!-- </table> -->
						<tr>
						<td>
						<div id="showProfile" align="left" style="height: 210px">
							<table>
								<tr>
									<!-- <td>First Name</td>
									
									<td>:</td> -->
									<%if(dto.getNickName() == null || dto.getNickName().equalsIgnoreCase("null") || dto.getNickName().trim().equalsIgnoreCase("")){ %>
									<td style="color: #00AFEC"><h3><%=dto.getFirstName()%></h3></td>
									<%}else{ %>
									<td style="color: #00AFEC"><h3><%=dto.getNickName()%></h3></td>
									<%} %>
								</tr>
								<tr>
									<!-- <td>Last Name</td>
									<td>:</td> -->
									<td style="color: #00AFEC"><%=dto.getFirstName()%> <%=dto.getLastName() %></td>
								</tr>
								<tr>
									<!-- <td>E-mail</td>
									<td>:</td> -->
									<td style="color: #00AFEC"><%=dto.getEmail() %></td>
								</tr>
								<tr>
									<!-- <td>Telephone</td>
									<td>:</td> -->
									<%if(dto.getPhone() == 0) {%>
									<td style="color: #00AFEC">No Phone-No. Found!!</td>
									<%}else{ %>
									<td style="color: #00AFEC"><%=dto.getPhone() %></td>
									<%} %>
								</tr>
								<tr>
									<!-- <td>Country</td>
									<td>:</td> -->
									<td style="color: #00AFEC"><%=dto.getCountry() %></td>
								</tr>
								<tr>
									<!-- <td>Zip-Code</td>
									<td>:</td> -->
									<td style="color: #00AFEC"><%=dto.getZipcode() %></td>
									<td><input type="text" name="latitude" id="latitude" value="<%=dto.getLatitude() %>" style="display: none"></td>
	                        		<td><input type="text" name="longitude" id="longitude" value="<%=dto.getLongitude() %>" style="display: none"></td>
								</tr>
								<tr>
									<!-- <td>Role</td>
									<td>:</td> -->
									<%if(dto.getRole() == null  || dto.getRole().equalsIgnoreCase("null") || dto.getRole().trim().equalsIgnoreCase("")) {%>
									<td style="color: #00AFEC">No Role Found!!</td>
									<%}else{ %>
									<td style="color: #00AFEC"><%=dto.getRole() %></td>
									<%} %>
								</tr>
								<tr>
									<!-- <td>Genre</td>
									<td>:</td> -->
									<%if(dto.getGenre() == null || dto.getGenre().equalsIgnoreCase("null") || dto.getGenre().trim().equalsIgnoreCase("")) {%>
									<td style="color: #00AFEC">No Genre Found!!</td>
									<%}else{ %>
									<td style="color: #00AFEC"><%=dto.getGenre() %></td>
									<%} %>
								</tr>
								<!-- <tr>
									<td><input type="button" class="btn btn-primary" value="Edit" onclick="editMyProfile()"></td>
								</tr> -->
								<div onclick="editMyProfile()" style="float: right; color: #00AFEC; cursor: pointer;">Edit</div>
							</table>
						</div>
						<div id="showEditProfile" style="display: none; height: 210px">
							<table>
								<tr>&nbsp;</tr>
								<tr>
								<!-- <td>First Name</td>
									<td>:</td> -->
									<td style="display: none"><input type="text" id="firstName" value='<%=dto.getFirstName()%>'></td>
									<%-- <td style="display: none"><span id="fName" style="color: orange;"></span></td> --%>
								</tr> 
								<tr>
									<%if(dto.getNickName() == null || dto.getNickName().equalsIgnoreCase("null") ||dto.getNickName().trim().equalsIgnoreCase("")){ %>
									<td><input type=text id="nickName" name="nickName" placeholder="Enter NickName" onkeyup="validateProfileInfo()" maxlength="40"></td>
									<%}else{ %>
									<td><input type=text id="nickName" name="nickName" placeholder="Enter NickName" value="<%=dto.getNickName()%>" onkeyup="validateProfileInfo()" maxlength="40"></td>
									<%} %>
									<td><span id="nickNameError" style="color: orange;"></span></td>
									<td></td>
								</tr>
								<tr>
									<!-- <td>Last Name</td>
									<td>:</td> -->
									<td style="display: none"><input type="text" id="lastName" value='<%=dto.getLastName() %>'></td>
									<%-- <td style="display: none"><span id="lName" style="color: orange;"></span></td> --%>
									<td style="color: #00AFEC"><%=dto.getFirstName()%> <%=dto.getLastName() %></td>
								</tr>
								<tr>
									<!-- <td>E-mail</td>
									<td>:</td> -->
									<td style="display: none"><input type="text" id="emailId" value=<%=dto.getEmail() %> readonly="readonly" style="cursor: pointer"></td>
									<td style="color: #00AFEC"><%=dto.getEmail() %> </td>
								</tr>
								<tr>
									<!-- <td>Telephone</td>
									<td>:</td> -->
									<%if(dto.getPhone() != 0){ %>
									<td><input type="text" id="phone" value=<%=dto.getPhone() %> onkeyup="return validatePhone()" placeholder="Enter Phone No." maxlength="14"></td>
									<%}else{ %>
									<td><input type="text" id="phone" value=""  placeholder="Enter Phone No." maxlength="14" onkeyup="return validatePhone()"></td>
									<%} %>
									<td><span id="telephone" style="color: orange;"></span></td>
									<td></td>
								</tr>
								<tr>
									<!-- <td>Country</td>
									<td>:</td> -->
									<td>
									<select name="country" id="country">
										<option <%=(dto.getCountry().equalsIgnoreCase("India") ?"selected='selected'":"")%> >India</option>
										<option <%=(dto.getCountry().equalsIgnoreCase("USA") ?"selected='selected'":"" )%> >USA</option>
										<option <%=(dto.getCountry().equalsIgnoreCase("England") ?"selected='selected'" :"")%> >England</option>
										<option <%=(dto.getCountry().equalsIgnoreCase("France") ?"selected='selected'":"" )%> >France</option>
										<option <%=(dto.getCountry().equalsIgnoreCase("Germany") ?"selected='selected'":"" )%> >Germany</option>
										<option <%=(dto.getCountry().equalsIgnoreCase("China") ?"selected='selected'":"" )%> >China</option>
										<option <%=(dto.getCountry().equalsIgnoreCase("Japan") ?"selected='selected'":"" )%> >Japan</option>
										<option <%=(dto.getCountry().equalsIgnoreCase("Australia") ?"selected='selected'":"")%> >Australia</option>
										<option <%=(dto.getCountry().equalsIgnoreCase("Italy") ?"selected='selected'":"" )%> >Italy</option>
										<option <%=(dto.getCountry().equalsIgnoreCase("Brazil") ?"selected='selected'":"" )%> >Brazil</option>
							        </select>
							        </td>
								</tr>
								<tr>
									<!-- <td>Zip-Code</td>
									<td>:</td> -->
									<td><input type="text" id="zipcode" value=<%=dto.getZipcode() %> onblur="latlong()" placeholder="Enter Zipcode" onkeyup="validateProfileInfo()" maxlength="28"></td>
									<td><span id="zip" style="color: orange;"></span></td>
									<td><input type="text" name="latitude" id="latitude" value="" style="display: none"></td>
	                        		<td><input type="text" name="longitude" id="longitude" value="" style="display: none"></td>
								</tr>
								<tr>
									<%if(dto.getRole() == null || dto.getRole().equalsIgnoreCase("null") ||dto.getRole().trim().equalsIgnoreCase("")) {%>
									<td><input type="text" id="role"  placeholder="Enter ROLE" onkeyup="validateProfileInfo()" maxlength="40"></td>
									<%}else{ %>
									<td><input type="text" id="role" value="<%=dto.getRole()%>" placeholder="Enter Role" onkeyup="validateProfileInfo()" maxlength="40"></td>
									<%} %>
									<td><span id="roleError" style="color: orange;"></span></td>
									<td></td>
								</tr>
								<tr>
									<%if(dto.getGenre() == null || dto.getGenre().equalsIgnoreCase("null") ||dto.getGenre().trim().equalsIgnoreCase("")) {%>
									<td><input type="text" id="genre"  placeholder="Enter GENRE" onkeyup="validateProfileInfo()" maxlength="40"></td>
									<%}else{ %>
									<td><input type="text" id="genre" value="<%=dto.getGenre()%>" placeholder="Enter Genre" onkeyup="validateProfileInfo()" maxlength="40"></td>
									<%} %>
									<td><span id="genreError" style="color: orange;"></span></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="hidden"  id="statusID" value="<%=dto.getStatusMessage()%>" readonly="readonly" /></td>
								</tr>
								<tr>
									<td><input type="hidden"  id="photoID" value="<%=dto.getContentPath()%>" readonly="readonly" /></td>
								</tr>
								<div onclick="viewMyProfile()" style="float: right; color: #00AFEC; cursor: pointer;">&nbsp;&nbsp;Cancel</div>
								<div onclick="updateMyProfile()" style="float: right; color: #00AFEC; cursor: pointer;">Update</div>
							</table>
						</div>
						</td>
						</tr>
						<!-- <tr>
							<td><input name="userPhoto" id="userPhoto" type="file" /></td>
							<td><input type="button" value="Upload" class="btn btn-primary" onclick="uploadUserPhoto();" /></td>
						</tr> -->
						</table>
				<!-- 2nd  -->
				<input name="userPhoto" id="userPhoto" type="file" style="margin-top: 5px;" />
				<input type="button" value="Upload" class="btn btn-primary" onclick="uploadUserPhoto();" style="padding: 3px 23px" /><span id="showLoadingUserPic" style="display: none;"><img src="<c:url value="/resources/images/loading.gif" />"/></span>
				<br/><span id="errorUploadingImage" style="color: red;"></span>
				 <table>
			<tr>
				<td colspan="8"><h3>Expert Type :</h3></td>
			</tr>
			<tr>
				<td>
					<%if((dto.getDj().trim()).equalsIgnoreCase("N")) {%>
						<input type="checkbox" name="dj" id="dj"> 
					<%}else{%>
						<input type="checkbox" name="dj" checked="checked" id="dj"> 
					<%} %>
				</td>
				
				<td class="tdSpace">PAO</td>
				<td>
					<%if((dto.getAnchor().trim()).equalsIgnoreCase("N")) {%>
						<input type="checkbox" name="anchor" id="anchor">
					<%}else{%>
						<input type="checkbox" name="anchor" checked="checked" id="anchor"> 
					<%} %>
				</td>
				<td class="tdSpace">IMC</td>
				<td>
					<%if((dto.getVs().trim()).equalsIgnoreCase("N")) {%>
						<input type="checkbox" name="vs" id="vs">
					<%}else{%>
						<input type="checkbox" name="vs" checked="checked" id="vs"> 
					<%} %>
				</td>
				<td class="tdSpace">Air Play</td>
				<td>
					<%if((dto.getJournalist().trim()).equalsIgnoreCase("N")) {%>
						<input type="checkbox" name="journalist" id="journalist">
					<%}else{%>
						<input type="checkbox" name="journalist" checked="checked" id="journalist"> 
					<%} %>
				</td>
				<td class="tdSpace">LAIF</td>
				<td><input type="button" value="Submit" onclick="saveExpertise();" class="btn btn-primary"/></td>
			</tr>
		</table>
		<span id="showExpertMsg"></span>
				
		<%} %>
		<hr>
	</div><br/>
	
	<table width="100%" style="margin-top: -20px;">
		<tr>
			<td width="49%">
				<!-- Bio -->
					<div> 
						<span><h3>Bio</h3></span>
						<div id="showBioDiv">
						<a style="cursor: pointer; float: right; margin-top: -30px;" onclick="editBioDiv();">Edit</a>
						<table>
							<tr>
								<c:forEach items="${myInfoList}" var="bio">
									<td style="word-wrap: break-word !important; position:absolute; width:270px;">${bio.bio }</td>
								</c:forEach>
							</tr>
						</table>
						</div>
						<!-- for editing -->
						<div id="showEditBioDiv" style="display: none;">
						<table width="50%">
							<tr>
								<c:forEach items="${myInfoList}" var="bio">
									<%-- <td width="50%"><textarea style="width: 265px; height: 136px;" id="editText">${bio.bio }</textarea></td> --%>
									<td width="50%"><textarea rows=4 cols=40 style="width: 265px!important; height:136px!important; resize: none;" name="mediaComments" maxlength="1500" id="editText" class="form-control form_textarea">${bio.bio }</textarea></td>
								</c:forEach>
							</tr>
							<tr><td><a style="cursor: pointer;" onclick="updateBioDiv();">Update</a></td></tr>
						</table>
						</div>
					</div>
				<!-- Bio  ends-->
			</td>
			<td width="2%"><hr style="border-left:1px solid #D7D7D7; height:200px"></td>
			<td width="49%">
				<div id="loadInspDiv"></div>
				<!-- Inspiration -->
				<div>
					<div id="showInspireUserPhotoDiv" >
						<table>
							<c:set var="count" value="0" scope="page"/>
							<tr>
							<c:forEach items="${INSPIRE_LIST}" var="user">
							<c:if test="${count < 4}">
									<td>
										<table>
											<tr>
												<td>
													<c:if test="${user.toUserEntity.contentPath != null}">
														<img src="<c:url value="${user.toUserEntity.contentPath}" />" width="60px" height="70px" >
													</c:if>
													<c:if test="${user.toUserEntity.contentPath == null}">
														<img src="/MediaLounge/resources/dummy/dummy.jpg" width="60px" height="70px" >
													</c:if>
												</td>
											</tr>
											<tr><td align="center"><span>${user.toUserEntity.firstName}</span></td></tr>
										</table>
										<c:set var="count" value="${count+1}" scope="page"/>
									</td>
							</c:if>
							</c:forEach>
						    </tr>
							<tr>
							<c:set var="count" value="0" scope="page"/>
							<c:forEach items="${INSPIRE_LIST}" var="user">
								<c:if test="${count >= 4}">
									<td>
										<table>
											<tr>
												<td>
													<c:if test="${user.toUserEntity.contentPath != null}">
														<img src="<c:url value="${user.toUserEntity.contentPath}" />" width="60px" height="70px" >
													</c:if>
													<c:if test="${user.toUserEntity.contentPath == null}">
														<img src="/MediaLounge/resources/dummy/dummy.jpg" width="60px" height="70px" >
													</c:if>
												</td>
											</tr>
											<tr><td align="center"><span>${user.toUserEntity.firstName}</span></td></tr>
										</table>
										<c:set var="count" value="${count+1}" scope="page"/>
									</td>
									<%-- <td>
										<table border="1">
											<tr><td align="center"><span>${user.toUserEntity.firstName}</span></td></tr>
										</table>
									</td> --%>
								</c:if>
								<c:set var="count" value="${count+1}" scope="page"/>
							</c:forEach>
							<tr>
						</table>
					</div>
					<span><h3>Inspiration</h3></span>
					<div id="inspiredUserDiv"></div>
					<table>
						<tr>
						<c:forEach items="${INSPIRE_LIST}" var="user">
							<span>${user.toUserEntity.firstName} ${user.toUserEntity.lastName },</span>
						</c:forEach>
						<td></td>
						</tr>
					</table>
					<a onclick="loadInspriedUsers();" style="cursor: pointer;">Add</a>
				</div>
				<!-- Inspiration ends -->
			</td>
		</tr>
		<tr><td colspan="3"><hr></td></tr>
	</table>
	<!-- for Favorite and charts start -->
	<table width="100%" style="margin-top: -20px;">
		<tr>
			<td width="49%">
				<div style="min-height: 460px;">
					<div>
						<span><h3>Favorites</h3></span>
						<a style="cursor: pointer; float: right; margin-top: -30px;">Edit</a>
					</div>
					<table>
						<tr>
							<c:forEach items="${USERLIST}" var="user">
								<td>
									<c:if test="${user.contentPath == null}">
										<img src="/MediaLounge/resources/dummy/dummy.jpg" width="50px" height="50px" onclick="loadUser('${user.userId}');" style="cursor: pointer;">
									</c:if>
									<c:if test="${user.contentPath != null}">
										<img src="<c:url value="${user.contentPath}" />" width="50px" height="50px" onclick="loadUser('${user.userId}');" style="cursor: pointer;">
									</c:if>
								</td>
								
							
							</c:forEach>
						</tr>						
					</table>
					<table>
						<tr> 
							<td height="70%"><img src="<c:url value="/resources/images/scout.png"/>" height="300" width="300"></td>
						</tr> 
					</table>
				</div>
			</td>
			<td width="2%"><hr style="border-left:1px solid #D7D7D7; height:200px"></td>
			<td width="49%">
			    <div style="min-height: 460px;">
					<div>
						<span><h3>Chart</h3></span>
					</div> 
					<table border="0">
						<c:if test="${not empty mediaDtoList}">
							<c:forEach items="${mediaDtoList}" var="media">
								<tr>
									<td width="30%" align="center" valign="middle">
										<a  id = '${media.mediaId}' class="pull-left" data-target="#mediasViewPopUp" data-toggle="modal" onClick="mediasViewPopUp('${media.contentType}','${media.mediaPath}','${media.mediaId}')">
										<c:if test="${media.contentType =='image/jpeg' || media.contentType =='image/png' || media.contentType =='image/gif' || media.contentType =='image/pjpeg' || media.contentType =='image/tiff' || media.contentType =='text/xml'}">
									       <img class="media-object" src="<c:url value="${media.mediaPath}" />" width="70" height="50" style="cursor: pointer;" /><br>
									     </c:if>
									     </a>
									     <a  id = '${media.mediaId}' class="pull-left" data-target="#mediasViewPopUp" data-toggle="modal" onClick="mediasViewPopUp('${media.contentType}','${media.mediaPath}','${media.mediaId}')">
									     <c:if test="${media.contentType =='video/mp4' || media.contentType =='video/mpeg' || media.contentType =='video/ogg' || media.contentType =='video/quicktime' || media.contentType =='video/webm'}">
											<img class="media-object" src="<c:url value="/resources/images/mediaVideo.jpg" />" width="70" height="50" style="cursor: pointer;"/><br>
										</c:if>
										</a>
										<a  id = '${media.mediaId}' class="pull-left" data-target="#mediasViewPopUp" data-toggle="modal" onClick="mediasViewPopUp('${media.contentType}','${media.mediaPath}','${media.mediaId}')">
										<c:if test="${media.contentType =='audio/mp3' || media.contentType =='audio/basic' || media.contentType =='audio/L24' || media.contentType =='audio/mpeg' || media.contentType =='audio/webm'}">
											<img class="media-object" src="<c:url value="/resources/images/mediaAudio.jpg" />" width="70" height="50" style="cursor: pointer;"/><br>										
										</c:if>	
										</a>
								    </td>&nbsp;&nbsp;
									<td width="40%" valign="top"><b><font color="#00afec">${media.mediaName}</font></b> <br />Album name & Year<br />Total Downloads<br />Role on content</td>&nbsp;&nbsp;
									<td width="30%" valign="top">&nbsp;<b><font color="#00afec">Feature&nbsp;Artist</font></b> <br />&nbsp;Play now <br />&nbsp;&nbsp;Add to wishlist <br />&nbsp;&nbsp;Buy it</td>
								</tr>
							</c:forEach>
						</c:if>
						
						<c:if test="${empty mediaDtoList}">
							<tr>
								<td>Data not uploaded </td>
							</tr>
						</c:if>
					</table>
				</div>
			</td>
		</tr>
		<tr><td colspan="3"><hr></td></tr>
	</table>
	<!-- for Favorite and charts end -->
	
	<!-- my skills -->
	<div style="margin-top: -20px;">
		<span><h3>My Skills</h3></span>
			<table>
				<thead>
					<tr>
						<th>Expertise</th>
						<th>Skill</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${MYSKILL_LIST}" var="skill">
						<tr>
							<td>#${skill.jobTypeId.description} </td>
							<td>#${skill.skills} </td>
						</tr>
					</c:forEach>
				</tbody>
			</table><a style="cursor: pointer;" onclick="showMySkillDiv();">Add Skill</a>
			<div id="loadAddSkillPage" ></div>
		</div>
		
	</div>
	<!-- my skills ends-->
</div>
