<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="text-center">

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

<body class="text-center" style="background-color: rgb(30, 40, 51);">
	<%
		String email = (String) session.getAttribute("email");
		String documentID = (String) session.getAttribute("documentID");
		String documentName = (String) session.getAttribute("documentName");
	%>
	<div class="login-dark"
		style="background-image: url(&quot;assets/img/mojave.jpg&quot;);">
		<form method="post" action="Add">
			<input type="hidden" name="email" id="email" value=<%=email%>></input>
			<input type="hidden" name="removeEmail" id="removeEmail"
				value=<%=email%>></input> <input type="hidden" name="documentID"
				id="documentID" value=<%=documentID%>></input> <input type="hidden"
				name="documentName" id="documentName" value="<%=documentName%>"></input>
			<h2 class="sr-only">Login Form</h2>
			<p>Enter the email of the collaborator you would like to give
				editing access to.</p>
			<div class="form-group">
				<input class="form-control" type="email" name="addEmail"
					placeholder="Email">
			</div>
			<div class="form-group">
				<button class="btn btn-primary btn-block bg-success border-success"
					type="submit">Add</button>
			</div>
		</form>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>