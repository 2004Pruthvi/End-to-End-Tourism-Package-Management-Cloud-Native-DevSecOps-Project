<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Login</title>
    <style>
        body {
            background: url('https://images.unsplash.com/photo-1575550959106-5a7defe28b56?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2lsZGxpZmV8ZW58MHx8MHx8fDA%3D') no-repeat center center/cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .login-container {
            background: rgba(0, 0, 0, 0.6);
            padding: 20px 35px 20px 20px;
            border-radius: 10px;
            text-align: center;
            color: white;
            width: 300px;
            margin:0px 1000px 350px 0px;
        }
        .login-container h2 {
            margin-bottom: 20px;
        }
        .input-group {
            margin-bottom: 15px;
        }
        .input-group input {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
        }
        .btn {
            background: #4CAF50;
            color: white;
            padding: 10px;
            margin-bottom: 10px;
            margin-left:10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        .btn:hover {
            background: #45a049;
        }
        .p{
            padding: 10px;
        }
        a{
        color:yellow;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        
         
        <%String successMessage=(String)request.getAttribute("success"); 
        if(successMessage!=null){%>
        <%=successMessage %>
        <%}%>
        <%String eMessage=(String)request.getAttribute("fail"); 
        if(eMessage!=null){%>
        <%=eMessage %>
        <%}%>
        
        <form action="login" method="post">
        <div class="input-group">
            <input type="text" name="mail" placeholder="mail id" required>
        </div>
        <div class="input-group">
            <input type="password" name="pass" placeholder="Password" required>
        </div>
        <button class="btn">Login</button>Don't have an account?<a href="signup.jsp">SignUp</a>
        
            <div class=p>
            Forgot Password? <a href="forgot.jsp">Forgot Password</a>
        </div>
    </div>
</body>
</html>
    