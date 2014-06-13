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

function addFavourite(from,to) {
	$.post("addFavourite?from="+from+"&to="+to, function(data, status) {
		$('#bumpArea').html(data);
	});
}
function showfav(){
	$('#favlist').hide();
	$('#showPendingFavourite').hide();
	$('#showFavourite').show();
	$('#showMaybeFavourite').hide();
}
function showPendingfav() {
	$('#favlist').hide();
	$('#showPendingFavourite').show();
	$('#showFavourite').hide();
	$('#showMaybeFavourite').hide();
}
function showMaybefav() {
	$('#favlist').hide();
	$('#showPendingFavourite').hide();
	$('#showFavourite').hide();
	$('#showMaybeFavourite').show();
}
function actionFavouriteBump(bumpId,action) {
	$.post("actionFavouriteBump?bumpId="+bumpId+"&action="+action, function(data, status) {
		$('#bumpArea').html(data);
	});
}
</script>
<div id="favlist">
<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="bumpID" style="width: 100%">
	<thead>
		<tr>
			<td style="background-color: #3276B1;color: #fff;">Name</td>
			<td style="background-color: #3276B1;color: #fff;">Email</td>
			<td align="center" style="background-color: #3276B1;color: #fff;">Favourite</td>
			
		</tr>
	</thead>	
	<tbody>	
		<c:set var="count" value="0" scope="page"/>
		
		<c:forEach items="${BUMPFAVLIST}" var="fav">
			<c:set var="count" value="${count+1 }" scope="page"/>
		</c:forEach>
		<c:if test="${count > 0 }">
			<c:forEach items="${USERLIST}" var="user">
				<tr>
					<td>${user.firstName } ${user.lastName }</td>
					<td>${user.email }</td>
					<c:set var="flag" value="${true }" scope="page" />
					<c:forEach items="${BUMPFAVLIST}" var="fav">
						<c:if test="${(fav.toUser.userId != user.userId || fav.fromUser.userId != user.userId) && fav.favourite != 'Y'  }">
							<c:if test="${fav.favourite != 'N'  }">
							<c:set var="flag" value="${false }" scope="page" />
							<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="ADD" onclick="addFavourite('${loginUser }','${user.userId}')"></td>
							</c:if>
						</c:if>
						<c:if test="${(fav.toUser.userId == user.userId || fav.fromUser.userId == user.userId) && fav.favourite == 'Y' }">
						<c:set var="flag" value="${false }" scope="page" />
							<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="ADDED" disabled="disabled"></td>
						</c:if>
					</c:forEach>
					<c:if test="${flag }">
						<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="ADD" onclick="addFavourite('${loginUser }','${user.userId}')"></td>
					</c:if>
				</tr>	
			</c:forEach>
		</c:if>
		<c:if test="${count == 0 }">
			<c:forEach items="${USERLIST}" var="user">
				<tr>
					
					<td>${user.firstName }</td>
					<td>${user.email }</td>
					<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="ADD" onclick="addFavourite('${loginUser }','${user.userId}')"></td>
				</tr>	
			</c:forEach>
		</c:if>
	</tbody>
</table>
</div>
<div id="showFavourite" style="display: none; ">
	<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="bumpID" style="width: 100%">
		<tr>
			<td style="background-color: #3276B1;color: #fff;">Name</td>
			<td style="background-color: #3276B1;color: #fff;">Email</td>
		</tr>
		<c:forEach items="${BUMPFAVLIST}" var="fav">
			<c:if test="${fav.favourite == 'Y' && fav.favStatus == 'yes' }">
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
<div id="showPendingFavourite" style="display: none; ">
<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="bumpID" style="width: 100%">
		<tr>
			<td style="background-color: #3276B1;color: #fff;">Name</td>
			<td style="background-color: #3276B1;color: #fff;">Email</td>
			<td colspan="3" align="center" style="background-color: #3276B1;color: #fff;">Action</td>
		</tr>
		<c:forEach items="${BUMPFAVLIST }" var="fav">
		<c:if test="${fav.favourite == 'Y' && fav.favStatus == null }">
			
			<c:if test="${fav.toUser.userId == loginUser }">
				<tr>
					<td>${fav.fromUser.firstName } ${fav.fromUser.lastName }</td>
					<td>${fav.fromUser.email }</td>
					<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="YES" onclick="actionFavouriteBump('${fav.bumpId }','yes')"></td>
					<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="NO" onclick="actionFavouriteBump('${fav.bumpId }','no')"></td>
					<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="MAY-BE" onclick="actionFavouriteBump('${fav.bumpId }','maybe')"></td>
				</tr>
			</c:if>
		</c:if>
		</c:forEach>
	</table>
</div>
<div id="showMaybeFavourite" style="display: none; ">
<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="bumpID" style="width: 100%">
		<tr>
			<td style="background-color: #3276B1;color: #fff;">Name</td>
			<td style="background-color: #3276B1;color: #fff;">Email</td>
			<td colspan="2" align="center" style="background-color: #3276B1;color: #fff;">Action</td>
		</tr>
		<c:forEach items="${BUMPFAVLIST }" var="fav">
		<c:if test="${fav.favourite == 'Y' && fav.favStatus == 'maybe' }">
			
			<c:if test="${fav.toUser.userId == loginUser }">
				<tr>
					<td>${fav.fromUser.firstName } ${fav.fromUser.lastName }</td>
					<td>${fav.fromUser.email }</td>
					<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="YES" onclick="actionFavouriteBump('${fav.bumpId }','yes')"></td>
					<td align="center"><input class="btn btn-primary" style="padding: 2px 6px" type="button" value="NO" onclick="actionFavouriteBump('${fav.bumpId }','no')"></td>
				</tr>
			</c:if>
		</c:if>
		</c:forEach>
	</table>
</div>

<button type="button" class="btn btn-primary" id="favBump" onclick="showfav()">Favourites</button>
<button type="button" class="btn btn-primary" id="maybeBump" onclick="showPendingfav()">Pending Favourites</button>
<button type="button" class="btn btn-primary" id="favBump" onclick="showMaybefav()">MAY-BE</button>