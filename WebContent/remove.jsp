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
<link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
<link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
<link rel="stylesheet" href="assets/css/Navigation-Clean-1.css">
<link rel="stylesheet" href="assets/css/Navigation-Clean.css">
<link rel="stylesheet" href="assets/css/styles.css">
<link rel="stylesheet" href="assets/css/Team-Clean.css">
</head>

<body style="background-color: rgb(30, 40, 51);">
	<%@ page import="finalProject.User"%>
	<%
		String email = (String) session.getAttribute("email");
		System.out.println("Remove e: " + email);
		String removeEmail = (String) session.getAttribute("removeEmail");
		String documentID = (String) session.getAttribute("documentID");
		System.out.println("Remove di: " + documentID);
		String documentName = (String) session.getAttribute("documentName");
		System.out.println("Remove dn: " + documentName);

		User userService = new User();
	%>
	<div class="login-dark"
		style="background-image: url(&quot;assets/img/mojave.jpg&quot;);">
		<form method="post" action="Remove">
			<h2 class="sr-only">Login Form</h2>
			<input type="hidden" name="email" id="email" value=<%=email%>></input>
			<input type="hidden" name="removeEmail" id="removeEmail"
				value=<%=removeEmail%>></input> <input type="hidden"
				name="documentID" id="documentID" value=<%=documentID%>></input> <input
				type="hidden" name="documentName" id="documentName"
				value="<%=documentName%>"></input>
			<p class="text-center">
				Confirm you would like to remove editing access from
				<%=removeEmail%></p>
			<div class="form-group">
				<button class="btn btn-primary btn-block bg-danger border-danger"
					type="submit">Remove</button>
			</div>
			<a class="forgot" href="#">Return to collaborators</a>
		</form>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>