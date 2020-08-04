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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Code+Pro">
<link rel="stylesheet" href="assets/fonts/ionicons.min.css">
<link rel="stylesheet" href="assets/css/button.css">
<link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
<link rel="stylesheet" href="assets/css/Navigation-Clean-1.css">
<link rel="stylesheet" href="assets/css/Navigation-Clean.css">
<link rel="stylesheet" href="assets/css/styles.css">
<link rel="stylesheet" href="assets/css/Team-Clean.css">
</head>

<body style="background-color: rgb(30, 40, 51);">
	<%@ page import="finalProject.User"%>
	<%@ page import="java.util.ArrayList"%>
	<%
		String email = (String) session.getAttribute("email");
		System.out.println("Collaborators e: " + email);
		String documentID = (String) session.getAttribute("documentID");
		System.out.println("Collaborators di: " + documentID);
		String documentName = (String) session.getAttribute("documentName");
		System.out.println("Collaborators dn: " + documentName);
		User userService = new User();
		ArrayList<String> collaborators = userService.getCollaborators(email, documentID);
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
				<div class="col-md-12 text-center" style="width: 50%;">
					<h2 class="text-center" style="color: #f2f5f8;">Collaborators</h2>
					<p class="text-center" style="color: #dfe8ee;">Listed below are
						the users that have editing access to your document. Note that
						your document is still viewable by anyone.</p>
					<div>
						<%
							for (int i = 0; i < collaborators.size(); i++) {
						%>
						<form method="post" action="remove.jsp">
							<div class="btn-group btn-group-lg" role="group"
								style="margin: 5px;">
								<button class="btn btn-primary active" type="button"><%=collaborators.get(i)%></button>
								<%
									session.setAttribute("email", email);
										session.setAttribute("removeEmail", collaborators.get(i));
										session.setAttribute("documentID", documentID);
										session.setAttribute("documentName", documentName);
								%>
								<button class="btn btn-primary bg-danger border-danger"
									type="submit">Remove</button>
							</div>
						</form>
						<%
							}
						%>
					</div>
					<div>
						<form method="post" action="TextEditorServlet">
							<input type="hidden" name="email" id="email" value=<%=email%>></input>
							<input type="hidden" name="documentID" id="documentID"
								value=<%=documentID%>></input> <input type="hidden"
								name="documentName" id="documentName" value="<%=documentName%>"></input>
							<button class="btn btn-primary bg-info border-info" type="submit">
								Return to Editor</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>