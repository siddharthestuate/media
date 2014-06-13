<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String userId = (String) request.getSession().getAttribute("userSessionId"); %>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"
	rel="stylesheet" />
<link href="<c:url value="/resources/css/styles.css"/>" rel="stylesheet" />
<link href="<c:url value="/resources/css/DT_bootstrap.css"/>"
	rel="stylesheet" />
<fieldset>
	<div class="row" style="width: 98%">

		<div class="col-md-3">
			<div class="thumbnail photoBox photoBoxHorizontal" onclick="suggestion('<%=userId%>')"style="cursor: pointer">
				<img src="<c:url value="/resources/images/talent.png"/>"
					alt="...">
				<!-- <h3>Planner</h3>
				<div class="captionPlanner">
					<span>17 March</span>
					<div class="pull-left">Event on this day</div>
					<div class="pull-right">12.00</div>
					<div class="clearfix"></div>
					<div class="pull-left">Second Event</div>
					<div class="pull-right">12.00</div>
					<div class="clearfix"></div>
					<div class="pull-left">Something to do today</div>
					<div class="pull-right">12.00</div>
					<div class="clearfix"></div>
					<span>17 March</span>
					<div class="pull-left">Event on the day</div>
					<div class="pull-right">12.00</div>
					<div class="clearfix"></div>
					<div class="pull-left">Other event for the day</div>
					<div class="pull-right">12.00</div>
					<div class="clearfix"></div>
				</div> -->
			</div>
		</div>

		<div class="col-md-3">
			<div class="thumbnail photoBox photoBoxHorizontal">
				<img src="<c:url value="/resources/images/chat_icon.png"/>"
					alt="...">
				<h3>Huddle</h3>
				<div class="captionHuddle">

					<div class="row chatbox">
						<div class="col-md-5">
							<a href="#">Chat 1</a>
						</div>
						<div class="col-md-3">
							<a href="#">Reply</a>
						</div>
						<div class="col-md-4">
							<a href="#">End Como</a>
						</div>
					</div>

					<div class="row">
						<p class="chatMsg">
							Lorem ipsum dolor sit amet, consectetur adipisicing elit. <a
								href="#">Read More</a>
						</p>
					</div>

					<div class="row chatbox">
						<div class="col-md-5">
							<a href="#">Chat 1</a>
						</div>
						<div class="col-md-3">
							<a href="#">Reply</a>
						</div>
						<div class="col-md-4">
							<a href="#">End Como</a>
						</div>
					</div>

					<div class="row">
						<p class="chatMsg">
							Lorem ipsum dolor sit amet, consectetur adipisicing elit. <a
								href="#">Read More</a>
						</p>
					</div>



				</div>
			</div>
		</div>

		<div class="col-md-6">
			<div class="thumbnail photoBox photoBoxVertical">
				<img src="<c:url value="/resources/images/stage-show.jpg"/>"
					alt="..." style="height: 221px;">
				<div class="caption">
					<h3>P2P</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam</p>
					<div class="captionBG" style="height: 221px;"></div>
				</div>
			</div>
		</div>

	</div>


	<div class="clearfix"></div>


	<div class="row colPad5" style="width: 95%">

		<div class="col-md-3">
			<div class="thumbnail photoBox photoBoxHorizontal">
				<img src="<c:url value="/resources/images/graduation.jpg"/>"
					alt="...">
				<h3>Manage It</h3>
				<div class="caption">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
					<div class="captionBG" style="height: 61px;"></div>
				</div>
			</div>
		</div>

		<div class="col-md-3">
			<div class="thumbnail photoBox photoBoxHorizontal">
				<img src="<c:url value="/resources/images/graduation.jpg"/>"
					alt="...">
				<h3>Talent Management</h3>
				<div class="caption">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
					<div class="captionBG" style="height: 61px;"></div>
				</div>
			</div>
		</div>

		<div class="col-md-3">
			<div class="thumbnail photoBox photoBoxHorizontal">
				<img src="<c:url value="/resources/images/graduation.jpg"/>"
					alt="...">
				<h3>Blackboard</h3>
				<div class="caption">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
					<div class="captionBG" style="height: 61px;"></div>
				</div>
			</div>
		</div>

		<div class="col-md-3">
			<div class="thumbnail photoBox photoBoxHorizontal">
				<h3>Track It</h3>
				<img src="<c:url value="/resources/images/graduation.jpg"/>"
					alt="...">
				<div class="caption">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
					<div class="captionBG" style="height: 61px;"></div>
				</div>
			</div>
		</div>

	</div>


	<div class="row" style="width: 98%">

		<div class="col-md-6">
			<div class="thumbnail photoBox photoBoxVertical">
				<img src="<c:url value="/resources/images/sound_editor.png"/>"
					alt="...">
				<div class="caption">
					<h3>My Studio</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam</p>
					<div class="captionBG" style="height: 340px;"></div>
				</div>
			</div>
		</div>

		<div class="col-md-6">
			<div class="thumbnail photoBox photoBoxVertical">
				<img src="<c:url value="/resources/images/sound_editor.png"/>"
					alt="...">
				<div class="caption">
					<h3>My Studio</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam</p>
					<div class="captionBG" style="height: 340px;"></div>
				</div>
			</div>
		</div>
	</div>



	<div class="row colPad5" style="width: 95%">

		<div class="col-md-5">
			<div class="thumbnail photoBox photoBoxHorizontal">
				<img src="<c:url value="/resources/images/sound_editor.png"/>"
					alt="...">
				<h3>Bookmarks</h3>
				<div class="caption">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam</p>
					<div class="captionBG" style="height: 79px;"></div>
				</div>
			</div>
		</div>

		<div class="col-md-3">
			<div class="thumbnail photoBox photoBoxHorizontal">
				<img src="<c:url value="/resources/images/sound_editor.png"/>"
					alt="...">
				<h3>Sales</h3>
				<div class="caption">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam</p>
					<div class="captionBG" style="height: 130px;"></div>
				</div>
			</div>
		</div>

		<div class="col-md-4">
			<div class="thumbnail photoBox photoBoxHorizontal">
				<h3>The Panel</h3>
				<img src="<c:url value="/resources/images/sound_editor.png"/>"
					alt="...">
				<div class="caption">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam</p>
					<div class="captionBG"  style="height: 96px;"></div>
				</div>
			</div>
		</div>

	</div>

</fieldset>