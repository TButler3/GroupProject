<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><c:out value="Review of ${ review.restaurant }"/></title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="/css/bootstrap.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link href="https://fonts.googleapis.com/css2?family=Cabin:wght@500&family=Playfair+Display&family=Shadows+Into+Light&display=swap" rel="stylesheet">

<!--  My css -->
<link rel="stylesheet" type="text/css" href="/css/singleReview.css"/>
</head>
<body>
	<header>
        <a href="/dashboard"><h4>Menu Critic</h4></a>
        <p>Welcome <c:out value="${user.userName}"/></p>
        <nav>
            <ul class="nav-links">
                <li><a href="/review/new">Write a Review</a></li>
                <li><a href="/reviews/user/${user.id}">Your Reviews</a></li>
                <li><a href="/logout">Logout</a></li>
            </ul>
        </nav>
    </header>
        <div class="hero">
        <div class="container">
            <div class="inner-text">
                <p>Planning a night out on the town?<br>
                Check out this review first.</p>
            </div>
        </div>
    </div>
	<div class="container">
		<div class="table">
			<table class="table table-striped">
				<thead>
					<tr><th><c:out value="Review of ${review.restaurant}"/></th></tr>
				</thead>
				<tbody>
					<tr><td>
						<c:choose>	
							<c:when test = "${review.user.id == sessionScope.id}">
								<c:out value="Posted by: "/>
								<c:out value="You!"/>
							</c:when>
							<c:otherwise>
								<c:out value="Posted by: "/>
								<c:out value="${review.user.userName}"/>
							</c:otherwise>
						</c:choose></td>
					</tr>
					<tr><td>
						Location:
						<c:out value=" ${review.city}, ${ review.state }"/></td>
					</tr>
					<tr id="dish"><td>
						Dish Eaten:
						<c:out value=" ${review.dish}" /></td> 
					</tr>
					<tr id="price"><td>
						Price: <c:out value=" $ ${review.price}" /></td> 
					</tr>
					<tr id="review"><td>
						Review: 
						<c:out value=" ${review.reviewX}" /></td> 
					</tr>
					<tr id="dateVisited"><td>
						Date of Visit: 
						<c:out value=" ${review.dateVisited.toString()}" /></td> 
					</tr>
					<c:if test = "${review.user.id == sessionScope.id}">
					<tr>
						<td class="table-links">
							<a href="/review/${review.id}/edit">Edit</a>
							<form action="/delete/${review.id}" method="POST">
	                        	<input type="hidden" name="_method" value="Delete"/>
	                        	<input class="view btn btn-link delete-link" type="submit" value="Delete"/>					
							</form>
						</td>
					</tr>
					</c:if>
				
				</tbody>
				
			</table>
		</div>
	</div>
</body>
</html>
