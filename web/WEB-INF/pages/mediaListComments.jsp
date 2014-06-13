<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<td>Comments<br>

<c:forEach items="${commentsList}" var="myComment">
	${myComment.username} : ${myComment.mediaComments}
	</br>
</c:forEach>
<br>
<!-- <div id="info"></div> -->
<textarea id="comments${index}" name="comments${index}" rows="3" cols="30"></textarea><a onclick="sendComments('${mediaId}','${userId}',${index});" style="cursor: pointer;">Submit</a>
</td>