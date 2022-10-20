<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/css/register.css"/>
<link href="https://fonts.googleapis.com/css2?family=Cabin:wght@500&family=Playfair+Display&display=swap" rel="stylesheet">
</head>
<body>
	<header>
        <h4>Menu Critic</h4>
    </header>
    <div class="container">
        <div class="register-form">
            <form:form action="/register" method="post" modelAttribute="newUser">
                <p class="pre-form">Sign up to hear what everyone <br>
                    is saying about your local restaurants <br>
                    and share your own experience.</p>
                <div class="form-group">
                    <form:label path="userName" class="placeholder-sub"></form:label>
                    <form:input path="userName" placeholder="Username" class="input-box"/>
                    <form:errors path="userName" class="text-danger"/>
                </div>
                <div class="form-group">
                    <form:label path="email" class="placeholder-sub"></form:label>
                    <form:input path="email" type="email" placeholder="Email" class="input-box"/>
                    <form:errors path="email" class="text-danger"/>
                </div>
                <div class="form-group">
                    <form:label path="password" class="placeholder-sub"></form:label>
                    <form:password path="password" name="password" placeholder="Password" class="input-box"/>
                    <form:errors path="password" class="text-danger"/>
                </div>
                <div class="form-group">
                    <form:label path="confirm" class="placeholder-sub"></form:label>
                    <form:password path="confirm" name="password" placeholder="Confirm Password" class="input-box"/>
                    <form:errors path="confirm" class="text-danger"/>
                </div>
                <button class="my-3 btn btn-primary" style="width:250px">Sign Up</button>
            </form:form>
            <div class="footer">
                <p>Already a member?</p><a href="/">Login</a>
            </div>
        </div>
        <div class="right-img">
            <img src="/img/bar-scene.jpg" alt="Bar">
        </div>
    </div>
</body>
</html>