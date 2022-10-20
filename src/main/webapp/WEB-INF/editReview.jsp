<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><c:out value="Edit your review of ${ review.restaurant }"/></title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="/css/bootstrap.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link href="https://fonts.googleapis.com/css2?family=Cabin:wght@500&family=Playfair+Display&family=Shadows+Into+Light&display=swap" rel="stylesheet">

<!--  My css -->
<link rel="stylesheet" type="text/css" href="/css/review.css"/>
</head>
<body>
	<header>
        <a href="/dashboard"><h4>Menu Critic</h4></a>

        <p>Welcome <c:out value="${review.user.userName}"/></p>
        <nav>
            <ul class="nav-links">
                <li><a href="/review/new">Write a Review</a></li>
                <li><a href="/dashboard">Home</a></li>

                <li><a href="/logout">Logout</a></li>
            </ul>
        </nav>
    </header>
    <div class="hero">
        <div class="container">
            <div class="inner-text">
                <p>Had a night out on the town?<br>
                Leave a review for others.</p>
            </div>
        </div>
    </div>
	<div class="container edit">
		
		<div class="top">
			<h2><c:out value="Editing your review of ${review.restaurant}"/></h2>
		</div>
		<main class="edit">
			<form:form action="/reviews/${review.id}/update" method="put" modelAttribute="review">
				<section>
					<form:label path="restaurant">Restaurant: </form:label>
					<form:errors path="restaurant" class="text-danger"/>
					<form:input path="restaurant"/>
				</section>
				<section>
					<form:label path="city">City: </form:label>
					<form:errors path="city" class="text-danger"/>
					<form:input path="city"/>
				</section>
				<section>
					<form:label path="state">State: </form:label>
					<form:errors path="state" class="text-danger"/>
					<form:select path="state">
						<form:option value="AL" label="AL"/>
						<form:option value="AK" label="AK"/>
						<form:option value="AZ" label="AZ"/>
						<form:option value="AR" label="AR"/>
						<form:option value="CA" label="CA"/>
						<form:option value="CO" label="CO"/>
						<form:option value="CT" label="CT"/>
						<form:option value="DE" label="DE"/>
						<form:option value="DC" label="DC"/>
						<form:option value="FL" label="FL"/>
						<form:option value="GA" label="GA"/>
						<form:option value="HI" label="HI"/>
						<form:option value="ID" label="ID"/>
						<form:option value="IL" label="IL"/>
						<form:option value="IN" label="IN"/>
						<form:option value="IA" label="IA"/>
						<form:option value="KS" label="KS"/>
						<form:option value="KY" label="KY"/>
						<form:option value="LA" label="LA"/>
						<form:option value="ME" label="ME"/>
						<form:option value="MD" label="MD"/>
						<form:option value="MI" label="MI"/>
						<form:option value="MN" label="MN"/>
						<form:option value="MS" label="MS"/>
						<form:option value="MO" label="MO"/>
						<form:option value="MT" label="MT"/>
						<form:option value="NE" label="NE"/>
						<form:option value="NV" label="NV"/>
						<form:option value="NH" label="NH"/>
						<form:option value="NJ" label="NJ"/>
						<form:option value="NM" label="NM"/>
						<form:option value="NY" label="NY"/>
						<form:option value="NC" label="NC"/>
						<form:option value="ND" label="ND"/>
						<form:option value="OH" label="OH"/>
						<form:option value="OK" label="OK"/>
						<form:option value="OR" label="OR"/>
						<form:option value="PA" label="PA"/>
						<form:option value="PR" label="PR"/>
						<form:option value="RI" label="RI"/>
						<form:option value="SC" label="SC"/>
						<form:option value="SD" label="SD"/>
						<form:option value="TN" label="TN"/>
						<form:option value="TX" label="TX"/>
						<form:option value="UT" label="UT"/>
						<form:option value="VT" label="VT"/>
						<form:option value="VA" label="VA"/>
						<form:option value="WV" label="WV"/>
						<form:option value="WI" label="WI"/>
						<form:option value="WY" label="WY"/>
					</form:select>
				</section>
				<section>
					<form:label path="dish">Dish: </form:label>
					<form:errors path="dish" class="text-danger"/>
					<form:input path="dish"/>
				</section>
				<section>
					<form:errors path="price" class="text-danger"/>
					<form:label path="price">Price: $</form:label>
					<form:input path="price"/>
				</section>
				<section>
					<form:label path="reviewX">Review: </form:label>
					<form:errors path="reviewX" class="text-danger"/>
					<form:textarea path="reviewX" cols="25" rows="5"/>
				</section>
				<section>
					<form:label path="dateVisited">Date Visited: </form:label>
					<form:errors path="dateVisited" class="text-danger"/>
					<form:input type="date" path="dateVisited"/>
				</section>
				<section>
					<form:errors path="rating" class="text-danger"/>
					<form:label path="rating">Rating: </form:label>

					<form:input path="rating" type="number"/>

				</section>
				<form:hidden path="user" value="${review.user.id}"/>
				<input type="submit" value="Submit"/>
				
			</form:form>
			<form action="/review/${review.id}" method="GET"><input type="submit" value="Cancel"/></form>
			<form action="/reviews/${review.id}/delete" method="POST"><input type="hidden" name="_method" value="Delete"	><input type="submit" value="Delete Review"/></form>
		</main>
	</div>
</body>
</html>
