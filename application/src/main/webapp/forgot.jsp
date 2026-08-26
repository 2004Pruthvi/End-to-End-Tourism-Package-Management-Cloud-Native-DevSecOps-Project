<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <style>
        body {
            background: url('https://www.francisjtaylor.co.uk/wp-content/uploads/2022/04/Q7A5185-768x512.jpg') no-repeat center center/cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .forgot-password-container {
            background: rgba(0, 0, 0, 0.6);
            padding: 20px 35px 20px 20px;
            border-radius: 10px;
            text-align: center;
            color: white;
            width: 300px;
            margin:0px 0px 0px 300px; 
        }
        .forgot-password-container h2 {
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
        }
        .btn:hover {
            background: #45a049;
        }
        .p {
            padding: 10px;
        }
    </style>
</head>
<body>
<form action="forgot" method="post">
    <div class="forgot-password-container">
        <h2>Forgot Password</h2>
        <%String successMessage=(String)request.getAttribute("success"); 
        if(successMessage!=null){%>
        <%=successMessage %>
        <%}%>
        <%String errorMessage=(String)request.getAttribute("error"); 
        if(errorMessage!=null){%>
        <%=errorMessage %>
        <%}%>
        
        <div class="input-group">
            <input type="tel" placeholder="Phone Number" name="phone" required>
        </div>
        <div class="input-group">
            <input type="email" placeholder="Email"  name="email" required>
        </div>
        <div class="input-group">
            <input type="password" placeholder="New Password" name="password" required>
        </div>
        <div class="input-group">
            <input type="password" placeholder="Confirm New Password" name="cpassword" required>
        </div>
        <input type="submit" value="Rest Password" class="btn"/>
        <div class="p">
         <a href="login.jsp">Back</a>
        </div>
    </div>
    </form>
</body>
</html>
