<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SignUp</title>
    <style>
        body {
            background: url('https://wallpapercave.com/wp/XXtlPMH.jpg') no-repeat center center/cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .signup-container {
            background: rgba(0, 0, 0, 0.6);
            padding: 20px 35px 20px 20px;
            border-radius: 10px;
            text-align: center;
            color: white;
            width: 300px;
            margin:0px 1000px 50px 0px;
        }
        .signup-container h2 {
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
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            margin-left:10px;
        }
        .btn:hover {
            background: #45a049;
        }
        .p {
            padding: 10px;
        }
        a{
        color:yellow;
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <h2>SignUp</h2>
        <%String smsg=(String)request.getAttribute("success");
        if(smsg!=null){%>
        	<%=smsg %>
        <% }%>
        <%String emsg=(String)request.getAttribute("error");
        if(emsg!=null){%>
        	<%=emsg %>
        <% }%>
        
        <form action="signup" method="post">
        <div class="input-group">
            <input type="text" name="name" placeholder="Full Name" required>
        </div>
        <div class="input-group">
            <input type="email" name="email" placeholder="Email" required>
        </div>
        <div class="input-group">
            <input type="tel" name="phone" placeholder="Phone" required>
        </div>
        <div class="input-group">
            <input type="text" name="address" placeholder="Address" required>
        </div>
        <div class="input-group">
            <input type="password" name="pass" placeholder="Password" required>
        </div>
        <div class="input-group">
            <input type="password" name="cpass" placeholder="Confirm Password" required>
        </div>
         <button type="submit" class="btn">Signup</button>
        <div class="p">
            Already have an account? <a href="login.jsp">Login</a>
        </div>
        </form>
    </div>
</body>
</html>
