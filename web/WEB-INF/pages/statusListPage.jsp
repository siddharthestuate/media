<%@page import="com.medialounge.reevo.dto.StatusDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page import="com.medialounge.reevo.dto.UserDto,java.util.ArrayList;" %>   

 <% int loginUser = Integer.parseInt(request.getSession().getAttribute("userSessionId") + "");

 %>
       <c:set var="login" value="<%=loginUser %>"></c:set>
       <c:set var="size" value="${SIZE }"></c:set>
       <c:if test="${size > 0 }">
	       <c:forEach items="${STATUS_LIST}" var="status">
	       		<c:if test="${status.userId.contentPath == null }">
		   			<div style="display: table-cell; width: 120px" align="left" id="profileImage">
		   				<img src="/MediaLounge/resources/dummy/dummy.jpg" width="195px" height="214px" style="border:1px solid #021a40; margin: 0px 0px 0px -1px;" />
		   			</div>
		   		</c:if>
		   		<c:if test="${status.userId.contentPath != null }">
		   			<div style="display: table-cell; width: 120px" align="left" id="profileImage">
		   				<img src="/MediaLounge${status.userId.contentPath}" width="194px" height="214px" style="margin: 0px 0px 0px 0px;" />
		   				<img src="/MediaLounge/resources/dummy/bottom_userPhoto.png" width="194px" height="25px" style="margin: -44px 0 0 0px;"/>
		   			</div>
				</c:if>
				<div style="display: block;padding: 0px 0px; margin-top: 20px" ><br/>
				<c:if test="${status.userId.userId == login}">
		    		 <p style="color: black; cursor: pointer; margin-top: 0px;" ondblclick="showStausBox();"><span class="userInfoClr"><strong>Status:</strong></span>
		    		 <span id="updatedStatus">
		    		 <c:choose>
			    		 <c:when test="${status.status == null || status.status.trim() == '' }">
			    		 	No Status Found!!
			    		 </c:when>
			    		 <c:otherwise>
			    		 	${status.status}
			    		 </c:otherwise>
		    		 </c:choose>
		    		 </span></p>
	    		</c:if>
		    	<c:if test="${status.userId.userId != login}">
		   		 	<p style="color: black; cursor: " ondblclick=""><span class="userInfoClr"><strong>Status:</strong></span>
		    		 <span id="updatedStatus">
		    		 <c:choose>
			    		 <c:when test="${status.status == null || status.status.trim() == '' }">
			    		 	No Status Found!!
			    		 </c:when>
			    		 <c:otherwise>
			    		 	${status.status}
			    		 </c:otherwise>
		    		 </c:choose>
		    		 </span></p>
		    	</c:if>
		    	</div>
	       </c:forEach>
	    </c:if>
	    <c:if test="${size == 0 }">
	    	<c:forEach items="${USER_LIST}" var="user">
	       		<c:if test="${user.contentPath == null }">
		   			<div style="display: table-cell; width: 120px" align="left" id="profileImage">
		   				<img src="/MediaLounge/resources/dummy/dummy.jpg" width="195px" height="214px" style="border:1px solid #021a40; margin: 0px 0px 0px -1px;" />
		   			</div>
		   		</c:if>
		   		<c:if test="${user.contentPath != null }">
		   			<div style="display: table-cell; width: 120px" align="left" id="profileImage">
		   				<img src="/MediaLounge${user.contentPath}" width="194px" height="214px" style="margin: 0px 0px 0px 0px;" />
		   				<img src="/MediaLounge/resources/dummy/bottom_userPhoto.png" width="194px" height="25px" style="margin: -44px 0 0 0px;"/>
		   			</div>
				</c:if>
				<div style="display: block;padding: 0px 0px; margin-top: 20px" ><br/>
				<c:if test="${user.userId == login}">
		    		 <p style="color: black; cursor: pointer; margin-top: 0px;" ondblclick="showStausBox();"><span class="userInfoClr"><strong>Status:</strong></span>
		    		 <span id="updatedStatus">
		    		 	No Status Found!!
		    		 </span></p>
	    		</c:if>
		    	<c:if test="${user.userId != login}">
		   		 	<p style="color: black; cursor: " ondblclick=""><span class="userInfoClr"><strong>Status:</strong></span>
		    		 <span id="updatedStatus">
		    			No Status Found!!
		    		 </span></p>
		    	</c:if>
		    	</div>
	       </c:forEach>
	    </c:if>
<script>
function showStausBox(){
	$('#errorMsgStatus').html("");
	$('#newPost').val("");
	$('#updateStatus').toggle("slow");
}

</script>

