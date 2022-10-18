<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Reviews</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="/css/bootstrap.css"/>
<!--  My css -->
<link rel="stylesheet" type="text/css" href="/css/style.css"/>
</head>
<body>
	<div class=header>
		<div class="left">
			<h1>MenuCritic</h1>
			<h3><c:out value="Welcome, ${ user.userName }"/></h3>
		</div>
		<div class="right">
			<a href="/dashboard">Home</a>
			<a href="/reviews/new">Write a Review</a>
			
			<form class="logout" action="/logout" method="POST"><input id="logout" class="btn btn-link" type="submit" value="Log Out"/></form>
		</div>
		
	</div>
	<main>
		<table class="table-striped table bordered">
			<tr>
				<th>Restaurant</th>
				<th>Rating</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="review" items="${reviews}">
				<tr>
					<td><c:out value="${review.restaurant}"/></td>
					<td><c:out value="${review.restaurant}"/></td>
					<td>
							<form action="/reviews/${review.id}" method="GET"><input class="view btn btn-link" type="submit" value="View"/></form>
							<form action="/reviews/${review.id}/edit" method="GET"><input class="view btn btn-link" type="submit" value="Edit"/></form>
							<form action="/reviews/${review.id}/delete" method="POST"><input class="view btn btn-link" type="submit" value="Delete"/></form>
					</td>
				</tr>
			</c:forEach>
		</table>
	
	</main>
</body>
</html>