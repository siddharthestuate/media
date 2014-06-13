<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src='<c:url value="resources/javascript/jquery.js" />' ></script> 
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src='<c:url value="resources/javascript/bootstrap.min.js" />'></script>
<script src='<c:url value="resources/javascript/jquery.dataTables.js" />'></script>
<script src='<c:url value="resources/javascript/DT_bootstrap.js" />'></script>
<script>
$('#bumpID').dataTable({
	"sDom": "<'row_filters'<'span6'l><'span6'f>r>t<'row_filters'<'span6'i><'span6'p>>",
	"sPaginationType": "bootstrap",
	"oLanguage": {
		"sLengthMenu": "_MENU_ records per page"
	}
});

function addMutual(from,to) {
	$.post("addMutual?from="+from+"&to="+to, function(data, status) {
		$('#bumpArea').html(data);
	});
}
function showMutual(){
	$('#mutualList').hide();
	$('#showPendingMutual').hide();
	$('#showMutual').show();
	$('#showMaybeMutual').hide();
}
function showPendingMutual() {
	$('#mutualList').hide();
	$('#showPendingMutual').show();
	$('#showMutual').hide();
	$('#showMaybeMutual').hide();
}
function showMaybeMutual(){
	$('#mutualList').hide();
	$('#showPendingMutual').hide();
	$('#showMutual').hide();
	$('#showMaybeMutual').show();
}
function actionMutualBump(bumpId,action) {
	$.post("actionMutualBump?bumpId="+bumpId+"&action="+action, function(data, status) {
		$('#bumpArea').html(data);
	});
}
</script>
<div id="mutualList">
<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="bumpID" style="width: 100%">
	<thead>
		<tr>
			<td style="background-color: #3276B1;color: #fff;">Name</td>
			<td style="background-color: #3276B1;color: #fff;">Email</td>
			<td align="center" style="background-color: #3276B1;color: #fff;">Mutual</td>
			
		</tr>
	</thead>	
	<tbody>	
		<c:set var="count" value="0" scope="page"/>
		
		<c:forEach items="${BUMPMUTUALLIST}" var="fav">
			<c:set var="count" value="${count+1 }" scope="page"/>
		</c:forEach>
		<c:if test="${count > 0 }">
			<c:forEach items="${USERLIST}" var="user">
				<tr>
					<td>${user.firstName } ${user.lastName }</td>
					<td>${user.email }</td>
					<c:set var="flag" value="${true }" scope="page" />
					<c:forEach items="${BUMPMUTUALLIST}" var="fav">
						<c:if test="${(fav.toUser.userId != user.userId || fav.fromUser.userId != user.userId) && fav.mutual != 'Y' }">
							<c:if test="${fav.mutual != 'N'  }">
							<c:set var="flag" value="${false }" scope="page" />
							<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="ADD" onclick="addMutual('${loginUser }','${user.userId}')"></td>
							</c:if>
						</c:if>
						<c:if test="${(fav.toUser.userId == user.userId || fav.fromUser.userId == user.userId) && fav.mutual == 'Y' }">
						<c:set var="flag" value="${false }" scope="page" />
							<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="ADDED" disabled="disabled"></td>
						</c:if>
					</c:forEach>
					<c:if test="${flag }">
						<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="ADD" onclick="addMutual('${loginUser }','${user.userId}')"></td>
					</c:if>
				</tr>	
			</c:forEach>
		</c:if>
		<c:if test="${count == 0 }">
			<c:forEach items="${USERLIST}" var="user">
				<tr>
					<td>${user.firstName }</td>
					<td>${user.email }</td>
					<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="ADD" onclick="addMutual('${loginUser }','${user.userId}')"></td>
				</tr>	
			</c:forEach>
		</c:if>
	</tbody>
</table>
</div>
<div id="showMutual" style="display: none; ">
	<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="bumpID" style="width: 100%">
		<tr>
			<td style="background-color: #3276B1;color: #fff;">Name</td>
			<td style="background-color: #3276B1;color: #fff;">Email</td>
		</tr>
		<c:forEach items="${BUMPMUTUALLIST}" var="fav">
			<c:if test="${fav.mutual == 'Y' && fav.mutualStatus == 'yes' }">
				<c:if test="${fav.fromUser.userId != loginUser }">
				<tr>
					<td>${fav.fromUser.firstName } ${fav.fromUser.lastName }</td>
					<td>${fav.fromUser.email }</td>
				</tr>
			</c:if>
				<c:if test="${fav.toUser.userId != loginUser }">
					<tr>
						<td>${fav.toUser.firstName } ${fav.toUser.lastName }</td>
						<td>${fav.toUser.email }</td>
					</tr>
				</c:if>
			</c:if>
		</c:forEach>
	</table>
</div>
<div id="showPendingMutual" style="display: none; ">
<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="bumpID" style="width: 100%">
		<tr>
			<td style="background-color: #3276B1;color: #fff;">Name</td>
			<td style="background-color: #3276B1;color: #fff;">Email</td>
			<td colspan="3" align="center" style="background-color: #3276B1;color: #fff;">Action</td>
		</tr>
		<c:forEach items="${BUMPMUTUALLIST }" var="fav">
		<c:if test="${fav.mutual == 'Y' && fav.mutualStatus == null }">
			
			<c:if test="${fav.toUser.userId == loginUser }">
				<tr>
					<td>${fav.fromUser.firstName } ${fav.fromUser.lastName }</td>
					<td>${fav.fromUser.email }</td>
					<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="YES" onclick="actionMutualBump('${fav.bumpId }','yes')"></td>
					<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="NO" onclick="actionMutualBump('${fav.bumpId }','no')"></td>
					<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="MAY-BE" onclick="actionMutualBump('${fav.bumpId }','maybe')"></td>
				</tr>
			</c:if>
		</c:if>
		</c:forEach>
	</table>
</div>
<div id="showMaybeMutual" style="display: none; ">
<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="bumpID" style="width: 100%">
		<tr>
			<td style="background-color: #3276B1;color: #fff;">Name</td>
			<td style="background-color: #3276B1;color: #fff;">Email</td>
			<td colspan="3" align="center" style="background-color: #3276B1;color: #fff;">Action</td>
		</tr>
		<c:forEach items="${BUMPMUTUALLIST }" var="fav">
		<c:if test="${fav.mutual == 'Y' && fav.mutualStatus == 'maybe' }">
			
			<c:if test="${fav.toUser.userId == loginUser }">
				<tr>
					<td>${fav.fromUser.firstName } ${fav.fromUser.lastName }</td>
					<td>${fav.fromUser.email }</td>
					<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="YES" onclick="actionMutualBump('${fav.bumpId }','yes')"></td>
					<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="NO" onclick="actionMutualBump('${fav.bumpId }','no')"></td>
				</tr>
			</c:if>
		</c:if>
		</c:forEach>
	</table>
</div>
<button type="button" class="btn btn-primary" id="favBump" onclick="showMutual()">Mutuals</button>
<button type="button" class="btn btn-primary" id="favBump" onclick="showPendingMutual()">Pending Mutuals</button>
<button type="button" class="btn btn-primary" id="favBump" onclick="showMaybeMutual()">MAY-BE</button>
