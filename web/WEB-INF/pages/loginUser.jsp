<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="utf-8">
<title>Media Lounge</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/DT_bootstrap.css" />" rel="stylesheet">
    
    <script src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
	<script src="http://code.jquery.com/qunit/qunit-1.10.0.js"></script>
	<script type="text/javascript" src="<c:url value="/resources/js1/jquery.cookiess.js" />"></script>
	<link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
	<!-- <script src="//maps.googleapis.com/maps/api/js?sensor=false"></script> 
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script> -->
 	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

	<!-- <script type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
	</script> -->
    
     <script type="text/javascript">
	
		
		function loginUserFinish(){
			//alert("email ==> "+ $("#inputEmail3").val()+"  password ==> "+$("#inputPassword3").val());
			$.ajax({
			    url: 'loginUserFinish',
			    type: 'POST',
			    data : {
					'email' : $("#inputEmail3").val(),
					'password':$("#inputPassword3").val()
				},
			    success: function(data){
			    	 if(data == "Failure"){
			    		  $("#statusMessage").html("<font color=red> - Invalid Credentials </font>");
			    		  $("#inputEmail3").val("");
			    		  $("#inputPassword3").val("");
			    	  }else{
			    		//  alert("data loginuser.jsp ==> "+ data+ " 888 ==> ");
			    		  $("#statusMessage").html(""); 
			    		  // $.cookie("reevoUserEmail", $("#inputEmail3").val(),{ expires: date });
			    		   /* window.location.href = "listUsers"; */
			    		   activeLogin();
			    		   /* window.location.href = "newHomePage"; */
			    	  }
			    },
			    error: function (xhr, ajaxOptions, thrownError) {
			       // alert(xhr.responseText);
			       // alert(thrownError);
			       genericException();	
			      }
			  });
		}
		
		function genericException() {
			window.location.href = "genericException"; 
		}
		
	</script>
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="javascript/html5shiv.js"></script>
      <script src="javascript/respond.min.js"></script>
    <![endif]-->
    
    <style type="text/css">
		body { 
		  background: url(resources/images/login.jpg) no-repeat center center fixed; 
		  -webkit-background-size: cover;
		  -moz-background-size: cover;
		  -o-background-size: cover;
		  background-size: cover;
		}
		
		.navbar-brand-logo:hover,
		.navbar-brand-logo:active{
			color: #fff;
			text-decoration: none;
		}
		
		.panel-default {
		/*opacity: 0.9;*/
		margin-top:30px;
		}
		.form-group.last { margin-bottom:0px; }
	</style>

<script>
	function activeLogin(){
		var N= navigator.appName;
		var UA= navigator.userAgent;
		var temp;
		var browserVersion= UA.match(/(opera|chrome|safari|firefox|msie)\/?\s*(\.?\d+(\.\d+)*)/i);
		if(browserVersion && (temp= UA.match(/version\/([\.\d]+)/i))!= null)
		browserVersion[2]= temp[1];
		browserVersion= browserVersion? [browserVersion[1], browserVersion[2]]: [N, navigator.appVersion,'-?'];
		<%-- alert('<%=(String) request.getSession().getAttribute("userSession")%>'); --%>
		 $.ajax({
			url : "/MediaLounge/saveActiveLogins",
			type : 'GET',
			data : {
				browser : browserVersion[0], version : browserVersion[1]
			},
			success : function(response) {
				window.location.href = "newHomePage";
			},
			error : function() {
				window.location.href = "genericException";
			}
		});
	}
	
    function register(){
        document.getElementById("login").style.display = "none";
        document.getElementById("register").style.display = "";
    }
    
    function loginPageDisplay() {
    	document.getElementById("login").style.display = "";
        document.getElementById("register").style.display = "none";
	}
    
    function resetAll(){
    	document.getElementById("fName").innerHTML = "";
    	document.getElementById("lName").innerHTML = "";
    	document.getElementById("checkEmail").innerHTML = "";
    	document.getElementById("pwd").innerHTML = "";
    	document.getElementById("country").innerHTML = "";
    	document.getElementById("month").innerHTML = "";
    	document.getElementById("date").innerHTML = "";
    	document.getElementById("year").innerHTML = "";
    	document.getElementById("zip").innerHTML = "";
    }
	
	function validateEmail() {
		var checkemail = document.getElementById("email").value;
		if(checkemail == null || checkemail.trim() ==""){
			document.getElementById("checkEmail").innerHTML = "Enter Email";
			document.getElementById("email").value = "";
			document.getElementById("email").focus();
		}
		else{
			document.getElementById("checkEmail").innerHTML = "<img src=/MediaLounge/resources/images/loading.gif>";
			$.ajax({
				url : '/MediaLounge/checkEmail',
				type : 'POST',
				data : {
					email : checkemail
				},
				success : function(response) {
					if(response=="success"){
						document.getElementById("checkEmail").innerHTML = "Available";
					}
					else
						{
							document.getElementById("checkEmail").innerHTML = "Email Already Exist!!";
							document.getElementById("email").value = "";
							document.getElementById("email").focus();
						}
				},
				error : function() {
					
				}
			});
		}

	}
	
	function validate() {
		var flag = true;
		var fName = document.getElementById("firstName").value;
		if(fName == null || fName.trim() ==""){
			document.getElementById("fName").innerHTML = "Enter First Name";
			document.getElementById("firstName").value = "";
			document.getElementById("firstName").focus();
			flag = false;
		}
		else{
			document.getElementById("fName").innerHTML = "";
		 	var lName = document.getElementById("lastName").value;
			if(lName == null || lName.trim() ==""){
				document.getElementById("lName").innerHTML = "Enter Last Name";
				document.getElementById("lastName").value = "";
				document.getElementById("lastName").focus();
				flag = false;
			} 
			else{
				document.getElementById("lName").innerHTML = "";
			 	var email = document.getElementById("email").value;
				if(email == null || email.trim() ==""){
					document.getElementById("checkEmail").innerHTML = "Enter Email";
					document.getElementById("email").value = "";
					document.getElementById("email").focus();
					flag = false;
				}
				else{
					document.getElementById("checkEmail").innerHTML = "";
					var pass = document.getElementById("password").value;
					if(pass == null || pass.trim() ==""){
						document.getElementById("pwd").innerHTML = "Enter Password";
						document.getElementById("password").value = "";
						document.getElementById("password").focus();
						flag = false;
					}
					else{
						document.getElementById("pwd").innerHTML = "";
						var country = document.getElementById("inputCountry3").value;
						if(country == "select"){
							document.getElementById("country").innerHTML = "Choose any One Country";
							document.getElementById("inputCountry3").value = "";
							document.getElementById("inputCountry3").focus();
							flag = false;
						}
						else{
							document.getElementById("country").innerHTML = "";
							var zipcode = document.getElementById("zipcode").value;
							if(zipcode == null || zipcode.trim() == ""){
								document.getElementById("zip").innerHTML = "Enter Zip-Code";
								document.getElementById("zipcode").value = "";
								document.getElementById("zipcode").focus();
								flag = false;
							}
							else{
								document.getElementById("zip").innerHTML = "";
								var month = document.getElementById("inputDobMonth3").value;
								if(month == "0"){
									document.getElementById("month").innerHTML = "Choose Month";
									document.getElementById("inputDobMonth3").value = "";
									document.getElementById("inputDobMonth3").focus();
									flag = false;
								}
								else{
									document.getElementById("month").innerHTML = "";
									var date = document.getElementById("inputDobDay3").value;
									if(date == "0"){
										document.getElementById("date").innerHTML = "Choose Date";
										document.getElementById("inputDobDay3").value = "";
										document.getElementById("inputDobDay3").focus();
										flag = false;
									}
									else{
										document.getElementById("date").innerHTML = "";
										var year = document.getElementById("inputDobYear3").value;
										if(year == "0"){
											document.getElementById("year").innerHTML = "Choose Year";
											document.getElementById("inputDobYear3").value = "";
											document.getElementById("inputDobYear3").focus();
											flag = false;
										}
										else{
											var gender = $('input[name=gender]:radio:checked').val();
											var latitude = document.getElementById("latitude").value;
											var longitude = document.getElementById("longitude").value;
											$.ajax({
												url : 'userRegisterFinish',
												type : 'GET',
												data : {
													 fName:fName , lName:lName , email:email , pass:pass , country:country , gender:gender , zipcode:zipcode ,latitude :latitude , longitude :longitude , dobMonth:month , dobDate:date , dobYear:year, 
												},
												success : function(response) {
													window.location.href = "loginUserHome";
												},
												error : function() {
													/*  document.getElementById("login").style.display = "none";
												     document.getElementById("register").style.display = ""; */
												},
											}); 
										}
									}
								}
							}
						}
					}
				}
			}
		}
		/* return flag; */
	}
    /* var jqxhr = $.get( "test", function() {
    	  alert( "success" );
    	})
    	  .done(function() {
    	    alert( "second success" );
    	  })
    	  .fail(function() {
    	    alert( "error" );
    	  })
    	  .always(function() {
    	    alert( "finished" );
    	});
    	 
    	// Perform other work here ...
    	 
    	// Set another completion function for the request above
    	jqxhr.always(function() {
    	  alert( "second finished" );
    	}); */
    	function latlong(){
    		geocoder = new google.maps.Geocoder();
    		var zipcode = document.getElementById("zipcode").value;
    		 geocoder.geocode({
    		        'address': zipcode
    		    }, function(results, status) {
    		        if (status == google.maps.GeocoderStatus.OK) {
    		           var loc = results[0].geometry.location;
    		           loc = loc +"";
    		           var arr=new Array();
    		       	 	arr = loc.split(",");
    		       	 	var arr1 = new Array();
    		       		for ( var j = 0; j < arr.length; j++)
    		       		{
    			       		var str = "";
    			       		for ( var i = 0; i < arr[j].length; i++)
    			       		{
    				       	 	if(arr[j].charAt(i) == '(' || arr[j].charAt(i) == '"' || arr[j].charAt(i) == ')')
    				       	  	{
    				       	  	}
    				       	  	else
    				       	  	{
    					       	 	var str2 = arr[j].charAt(i);
    					       	 	str = str + str2;
    				       		}
    				       	}
    			       		arr1.push(str);
    	       	 		}
    		       		$('#latitude').val(arr1[0]);
    		       		$('#longitude').val(arr1[1]);
    	        } else {
    	        	document.getElementById("zip").innerHTML = "Enter valid Zip-Code";
    	        	document.getElementById("zipcode").value = "";
    	        	document.getElementById("zipcode").focus();
    	        }
    	    });
    	}   	
 
</script>
</head>

<body>

<div id="login" class="container login" style="display:;">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
        	
            <div class="pull-left">
            	<a class="navbar-brand-logo" href="#">RECORED EVOLUTION</a>
        	</div>
            
            <div class="clearfix"></div>
            <form method="post" commandName="users" id="loginForm" action="loginUserFinish.html" border="1" class="pure-form pure-form-aligned">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <!-- <span class="glyphicon glyphicon-lock"></span> Login  <span id="statusMessage"></span></div> -->
                    <c:choose>
					    <c:when test="${empty message}">
						  <span class="glyphicon glyphicon-lock"></span> Login  <span id="statusMessage"></span></div>
					    </c:when>
					    <c:otherwise>
						<span id="statusMessage"><font color=red> ${message} </font></span> <br /><span class="glyphicon glyphicon-lock"></span> Login </div>
					    </c:otherwise>
					</c:choose>
					
                <div class="panel-body">
                    <form  class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-3 control-label">
                            Email</label>
                        <div class="col-sm-9">
                            <input type="email" class="form-control" id="inputEmail3" placeholder="Email" required> 
			    			<%-- <form:input type="email" cssClass="form-control" id="inputEmail3" path="email" /> --%>
                        </div>
                    </div>
                    <div class="form-group" style="padding-top: 35px">
                        <label for="inputPassword3" class="col-sm-3 control-label">
                            Password</label>
                        <div class="col-sm-9">
                             <input type="password" class="form-control" id="inputPassword3" placeholder="Password" required> 
			    			<%-- <form:password cssClass="form-control" id="inputPassword3" path="password" /> --%>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"/>
                                    Remember me
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group last">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="button" id="submitForm" class="btn btn-success btn-sm" onclick="loginUserFinish()">
                                Sign in</button>
                                 <button type="reset" class="btn btn-default btn-sm">
                                Reset</button>
                        </div>
                    </div>
                    </form>
                </div>
                <div class="panel-footer">
                    Not Registred? <a href="#" onclick="register();">Register here</a></div>
            </div>
            </form>
        </div>
    </div>
</div>

<div id="register" class="container login" style="display:none;">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">

            <div class="pull-left">
                <a class="navbar-brand-logo" href="#">RECORED EVOLUTION</a>
            </div>

            <div class="clearfix"></div>
			<form:form method="post" class="pure-form pure-form-aligned">
            <div class="panel panel-default" style="width: 460px;">
            	<div class="panel-heading">
                    <span class="glyphicon glyphicon-lock"></span> Register
                    <span style="float: right; cursor: pointer; margin-top: -6px"><img  src="<c:url value="/resources/images/close.png"/>" width="40px" height="30px" onclick="loginPageDisplay()"></span>
                    </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                        <label for="inputFirstName3" class="col-sm-3 control-label">
                            First Name</label>
                        <div class="col-sm-9">
                            <input type="text" name="firstName" id="firstName" placeholder="First Name" class="form-control"  maxlength="25"/>
                        	<span id="fName" style="color: orange;"></span>
                        </div>
                    </div>
                    <div style="clear:both"><br/></div>
                    <div class="form-group">
                        <label for="inputLastName3" class="col-sm-3 control-label">
                            Last Name</label>
                        <div class="col-sm-9">
                            <input type="text" name="lastName" id="lastName" placeholder="Last Name"  class="form-control"  maxlength="25"/>
                        	<span id="lName" style="color: orange;"></span>
                        </div>
                    </div>
                    <div style="clear:both"><br/></div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-3 control-label">
                            Email</label>
                        <div class="col-sm-9">
                            <input type="email" name="email" id="email" class="form-control"  placeholder="Email" onblur="validateEmail()" maxlength="30">
                        	<span id="checkEmail" style="color: orange;"></span>
                        </div>
                    </div>
                    <div style="clear:both"><br/></div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-3 control-label">
                            Password</label>
                        <div class="col-sm-9">
                            <input type="password" name="password" id="password" class="form-control"  placeholder="password" maxlength="25">
                            <span id="pwd" style="color: orange;"></span>
                        </div>
                    </div>
                    <div style="clear:both"><br/></div>
                    <div class="form-group">
                        <label for="inputGender3" class="col-sm-3 control-label">
                            Gender</label>
                        <div class="col-sm-9">
                            <!-- <select name="gender" class="form-control" id="inputGender3" required>
                                <option value="select" selected="1">Select</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select> -->
                            <input type="radio" name="gender" value="Male" id="Male"checked>Male &nbsp; 
							<input type="radio" name="gender"value="Female" id="Female">Female
                        </div>
                    </div>
                    <div style="clear:both"><br/></div>
                    <div class="form-group">
                        <label for="inputCountry3" class="col-sm-3 control-label">Country</label>
                        <div class="col-sm-9">
                             <select name="country" class="form-control" id="inputCountry3" required>
                                <option value="select" selected="1">Select</option>
                                <option value="India">India</option>
                                <option value="USA">USA</option>
                                <option value="England">England</option>
                                <option value="France">France</option>
                                <option value="Germany">Germany</option>
                                <option value="China">China</option>
                                <option value="Japan">Japan</option>
                                <option value="Australia">Australia</option>
                                <option value="Italy">Italy</option>
                                <option value="Brazil">Brazil</option>
                            </select> 
                            <span id="country" style="color: orange; "></span>
                        </div>
                    </div>
                    <div style="clear:both"><br/></div>
                    <div class="form-group">
                        <label for="inputZip3" class="col-sm-3 control-label">
                            Zip-Code</label>
                        <div class="col-sm-9">
                            <input type="text" name="zipcode" id="zipcode" class="form-control"  placeholder="zipcode" onblur="latlong()" maxlength="25">
                            <span id="zip" style="color: orange;"></span>
                        </div>
                        <input type="text" name="latitude" id="latitude" value="" style="display: none">
                        <input type="text" name="longitude" id="longitude" value="" style="display: none">
                    </div>
                    <div style="clear:both"><br/></div> 
                     <div class="form-group">
                        <label for="inputDob3" class="col-sm-3 control-label">
                            Birthday</label>
                        <div class="col-sm-9" style="width:100px !important;">
                        <select name="dobMonth" class="form-control" id="inputDobMonth3" style="width: 90px;" required>
                            <option value="0" selected="1">Month</option>
                            <option value="01">Jan</option>
                            <option value="02">Feb</option>
                            <option value="03">Mar</option>
                            <option value="04">Apr</option>
                            <option value="05">May</option>
                            <option value="06">Jun</option>
                            <option value="07">Jul</option>
                            <option value="08">Aug</option>
                            <option value="09">Sep</option>
                            <option value="10">Oct</option>
                            <option value="11">Nov</option>
                            <option value="12">Dec</option>
                            </select>
                            <span id="month" style="color: orange; "></span> 
                        </div><div class="col-sm-9" style="width:95px !important;">
                        <select name="dobDate" class="form-control" id="inputDobDay3" style="width: 90px;" required>
                            <option value="0" selected="1">Day</option>
                            <option value="01">1</option>
                            <option value="02">2</option>
                            <option value="03">3</option>
                            <option value="04">4</option>
                            <option value="05">5</option>
                            <option value="06">6</option>
                            <option value="07">7</option>
                            <option value="08">8</option>
                            <option value="09">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                            <option value="25">25</option>
                            <option value="26">26</option>
                            <option value="27">27</option>
                            <option value="28">28</option>
                            <option value="29">29</option>
                            <option value="30">30</option>
                            <option value="31">31</option>
                        </select>
                        <span id="date" style="color: orange; "></span> 
                        </div>
                        <div class="col-sm-9" style="width:100px !important;">
                        <select name="dobYear" class="form-control" id="inputDobYear3" style="width: 90px;" required>
                            <option value="0" selected="1">Year
                            </option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option><option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option><option value="1939">1939</option><option value="1938">1938</option><option value="1937">1937</option><option value="1936">1936</option><option value="1935">1935</option><option value="1934">1934</option><option value="1933">1933</option><option value="1932">1932</option><option value="1931">1931</option><option value="1930">1930</option><option value="1929">1929</option><option value="1928">1928</option><option value="1927">1927</option><option value="1926">1926</option><option value="1925">1925</option><option value="1924">1924</option><option value="1923">1923</option><option value="1922">1922</option><option value="1921">1921</option><option value="1920">1920</option><option value="1919">1919</option><option value="1918">1918</option><option value="1917">1917</option><option value="1916">1916</option><option value="1915">1915</option><option value="1914">1914</option><option value="1913">1913</option><option value="1912">1912</option><option value="1911">1911</option><option value="1910">1910</option><option value="1909">1909</option><option value="1908">1908</option><option value="1907">1907</option><option value="1906">1906</option><option value="1905">1905</option>
                        </select>
                        <span id="year" style="color: orange; "></span> 
                        </div>
                    </div>
                    <div style="clear:both"><br/></div>
                    <div class="form-group last">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="button" class="btn btn-success btn-sm" onclick="return validate()">
                                Register</button>
                            <button type="reset" class="btn btn-default btn-sm" onclick="resetAll()">
                                Reset</button>
                        </div>
                    </div>
                    </form>
                </div>
                <div class="panel-footer">
                    </div>
            </div>
            </form:form>
        </div>
    </div>
</div>

</body>
</html>
