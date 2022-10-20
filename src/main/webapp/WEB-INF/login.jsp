<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Menu Critic</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/css/login.css"/>
<link href="https://fonts.googleapis.com/css2?family=Cabin:wght@500&family=Playfair+Display&display=swap" rel="stylesheet">
</head>
<body>
	<div class="hero">
        <div class="container">
            <div class="title">
                <h1 class="title-text">Menu Critic</h1>
                <p>Had a good restaurant experience? Had a bad one?<br>
                    Leave a review and see reviews of other restaurant goers</p>
            </div>
            <div class="form-body">
                <form:form action="/login" method="post" modelAttribute="newLogin">
                    <div class="form-group">
                        <form:label path="email" class="placeholder-sub"></form:label>
                        <form:input path="email" type="email" name="email" placeholder="Email" class="input-box"/>
                        <form:errors path="email" class="text-danger"/>
                    </div>
                    <div class="form-group">
                        <form:label path="password" class="placeholder-sub"></form:label>
                        <form:password path="password" name="password" placeholder="Password" class="input-box"/>
                        <form:errors path="password" class="text-danger"/>
                    </div>
                    <button class="my-3 btn btn-primary" style="width:250px">Login</button>
                </form:form>
                <div class="footer">
                    <p>Haven't registered?</p><a href="/register">Sign Up</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>