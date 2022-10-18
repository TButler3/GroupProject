<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><c:out value="Review of ${ review.restaurant }"/></title>
</head>
<body>
	<div class="container">
		<div class=header>
			<div class="left">
				<h1>MenuCritic</h1>
				<h3><c:out value="Welcome, ${ user.userName }"/></h3>
			</div>
			<div class="right">
				<a href="/dashboard">Home</a>
				<a href="/reviews/new">Write a Review</a>
				<a href="/reviews/${user.id}">Your Reviews</a>
				<form class="logout" action="/logout" method="POST"><input id="logout" class="btn btn-link" type="submit" value="Log Out"/></form>
			</div>
			
		</div>
		<main>
			<div class="top">
				<h2><c:out value="Review of ${review.restaurant}"/></h2>
				<a href="/dashboard">Home</a>
			</div>
			<div class="section">
				<c:choose>	
					<c:when test = "${review.user.id == sessionScope.userId}">
						<p><c:out value="Posted by: "/></p>
						<p><c:out value="You!"/></p>
					</c:when>
					<c:otherwise>
						<p><c:out value="Posted by: "/></p>
						<p><c:out value="${review.user.userName}"/></p>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="section">
				<p>Location: </p>
				<p><c:out value="${review.city}, ${ review.state }"/></p>
			</div>
			<div class="section" id="dish">
				<p>Dish Eaten: </p>
				<p><c:out value="${review.dish}" /></p> 
			</div>
			<div class="section" id="price">
				<p>Price: </p>
				<p><c:out value="$ ${review.price}" /></p> 
			</div>
			<div class="section" id="review">
				<p>Review: </p>
				<p><c:out value="${review.review}" /></p> 
			</div>
			<div class="section" id="dateVisited">
				<p>Date of Visit: </p>
				<p><c:out value="${review.dateVisited}" /></p> 
			</div>
			<c:if test = "${review.user.id == sessionScope.userId}">	
				<form action="/review/${review.id}/edit" method="GET"><input type="submit" value="Edit"/></form>
			</c:if>
		</main>
	</div>
</body>
</html>