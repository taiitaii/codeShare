<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>CSCI201LProject</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/fonts/ionicons.min.css">
<link rel="stylesheet" href="assets/css/button.css">
<link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
<link rel="stylesheet" href="assets/css/Navigation-Clean-1.css">
<link rel="stylesheet" href="assets/css/Navigation-Clean.css">
<link rel="stylesheet" href="assets/css/styles.css">
</head>

<body style="background-color: rgb(30, 40, 51);">
	<%@ page import="finalProject.User"%>
	<%@ page import="finalProject.documentInfo"%>
	<%@ page import="java.util.ArrayList"%>
	<%
		User userService = new User();
		String email = (String) request.getAttribute("email");
		if (email == null) {
			email = (String) session.getAttribute("email");
		}
		ArrayList<documentInfo> projects = userService.getProjects(email);
		System.out.println("homePage: " + email);
	%>
	<div></div>
	<div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<nav class="navbar navbar-light navbar-expand-md navigation-clean"
						style="background-color: rgb(30, 40, 51);">
						<div class="container">
							<a class="navbar-brand" href="#"
								style="color: rgb(255, 255, 255);"><%=email%></a>
							<button data-toggle="collapse" class="navbar-toggler"
								data-target="#navcol-1">
								<span class="sr-only">Toggle navigation</span><span
									class="navbar-toggler-icon"></span>
							</button>
							<div class="collapse navbar-collapse" id="navcol-1">
								<ul class="nav navbar-nav ml-auto">
									<li class="nav-item" role="presentation"></li>
									<li class="nav-item" role="presentation"><a
										class="nav-link" href="index.html"
										style="color: rgb(255, 255, 255);">Logout</a></li>
									<li class="nav-item" role="presentation"></li>
								</ul>
							</div>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2 class="text-center" style="color: rgb(255, 255, 255);">Projects</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">
					<%
						for (int i = 0; i < projects.size(); i++) {
					%>
					<form method="post" action="TextEditorServlet">
						<input type="hidden" name="email" id="email" value=<%= email%>></input>
						<input type="hidden" name="documentID" id="documentID" value=<%= projects.get(i).getDocumentID()%>></input>
						<input type="hidden" name="documentName" id="documentName" value="<%= projects.get(i).getDocumentName()%>"></input>
						<button class="btn btn-primary btn-lg text-center" type="submit"
							style="background-color: #2980ef; margin: 5px;"><%=projects.get(i).getDocumentName()%></button>
					</form>
					<%
						}
					%>
					<div class="col-md-12 text-center">
						<div class="col-md-12 text-center">
							<form method="post" action="NewProject.jsp">
								<%
									session.setAttribute("email", email);
								%>
								<button class="btn btn-primary btn-lg text-center" type="submit"
									style="background-color: rgba(0, 0, 0, 0.1); margin: 5px;">+
									Add New Project</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>