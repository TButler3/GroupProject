<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/css/dashboard.css"/>
<link href="https://fonts.googleapis.com/css2?family=Cabin:wght@500&family=Playfair+Display&family=Shadows+Into+Light&display=swap" rel="stylesheet">
</head>
<body>
	<header>
        <h4>Menu Critic</h4>
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
                Check out these reviews first.</p>
            </div>
        </div>
    </div>
    <div class="table">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Res Name</th>
                    <th>Location</th>
                    <th>Reviewed By</th>
                    <th>Rating</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="review" items="${reviews}">
                <tr>
                    <td><c:out value="${review.restaurant}"/></td>
                    <td><c:out value="${review.city}"/>, <c:out value="${review.state}"/></td>
                    <td><c:out value="${review.user.userName}"/></td>
                    <td><c:out value="${review.rating}"/></td>
                    <td class="table-links">
                        <a href="/review/${review.id}">View</a>
                        <c:if test="${review.user.id==id}">
                        <a href="/review/${review.id}/edit">Edit</a>
                        <form action="/delete/${review.id}" method="POST">
                        	<input type="hidden" name="_method" value="Delete"/>
                        	<input class="view btn btn-link delete-link" type="submit" value="Delete"/>
                        </form>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
             