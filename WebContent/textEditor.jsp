<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background-color: #1e2833;">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>CSCI201LProject</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Code+Pro">
<link rel="stylesheet" href="assets/fonts/ionicons.min.css">
<link rel="stylesheet" href="assets/css/button.css">
<link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
<link rel="stylesheet" href="assets/css/Navigation-Clean-1.css">
<link rel="stylesheet" href="assets/css/Navigation-Clean.css">
<link rel="stylesheet" href="assets/css/styles.css">
</head>

<body style="background-color: rgb(30, 40, 51);">
	<%
		String email = (String) request.getAttribute("email");
		System.out.println("Text Editor e: " + email);
		String documentID = (String) request.getAttribute("documentID");
		System.out.println("Text Editor di: " + documentID);
		String documentName = (String) request.getAttribute("documentName");
		System.out.println("Text Editor dn: " + documentName);
	%>
	<div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<nav class="navbar navbar-light navbar-expand-md navigation-clean"
						style="background-color: rgb(30, 40, 51);">
						<div class="container">
							<a class="navbar-brand" href="#"
								style="color: rgb(255, 255, 255);"><%=documentName%></a>
							<button data-toggle="collapse" class="navbar-toggler"
								data-target="#navcol-1">
								<span class="sr-only">Toggle navigation</span><span
									class="navbar-toggler-icon"></span>
							</button>
							<div class="collapse navbar-collapse" id="navcol-1">
								<ul class="nav navbar-nav ml-auto">
									<li class="nav-item" role="presentation"></li>
									<li class="nav-item" role="presentation">
										<form id="myHomeForm" method="post" action="homePage.jsp">
											<input type="hidden" name="email" id="email" value=<%=email%>></input>
											<a class="nav-link" href="#"
												style="color: rgb(255, 255, 255);"
												onclick="document.getElementById('myHomeForm').submit();">Home</a>
										</form>
									</li>
									<li class="nav-item" role="presentation"><a
										class="nav-link" href="index.html"
										style="color: rgb(255, 255, 255);">Logout</a></li>
								</ul>
							</div>
						</div>
					</nav>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 col-lg-2 text-center">
					<form method="post" action="collaborators.jsp">
						<%
							session.setAttribute("email", email);
							session.setAttribute("documentID", documentID);
							session.setAttribute("documentName", documentName);
						%>
						<button class="btn btn-primary btn-lg" type="submit"
							style="margin: 5px; background-color: #007bff;">Collaborators</button>
					</form>
					<form method="post" action="add.jsp">
						<%
							session.setAttribute("email", email);
							session.setAttribute("documentID", documentID);
							session.setAttribute("documentName", documentName);
						%>
						<button class="btn btn-primary btn-lg" type="submit"
							style="margin: 5px; background-color: #4400ff;">Share</button>
					</form>
					<button class="btn btn-primary btn-lg" type="button"
						style="margin: 5px; background-color: #c400ff;">Save My
						File</button>
				</div>
				<div class="col-md-9 col-lg-10">
					<textarea
						style="width: 100%; height: 300%; font-family: 'Source Code Pro', monospace; font-size: 13px;"></textarea>
				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>