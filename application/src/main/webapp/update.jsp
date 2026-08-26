<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.wild_tour.dto.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Account</title>
    <style>
        body {
            background: url('https://karnatakatourism.org/wp-content/uploads/2020/05/Kabini-Spotted-Deer.jpg') no-repeat center center/cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .update-container {
            background: rgba(0, 0, 0, 0.6);
            padding: 20px 35px 20px 20px;
            border-radius: 10px;
            text-align: center;
            color: white;
            width: 300px;
            margin: 0px 1000px 50px 0px;
        }
        .update-container h2 {
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
        a {
            color: yellow;
        }
    </style>
</head>
<body>
    <div class="update-container">
        <h1>Update Account</h1>
        <%User u=(User)session.getAttribute("user") ;
        if(u!=null){%>
        
       
        
        <form action="update" method="post">
        <div class="input-group">
            <input type="text" name="name" placeholder="Full Name" value="<%=u.getUser_name()%>">
        </div>
        <div class="input-group">
            <input type="email" name="email" placeholder="Email" value="<%=u.getEmail()%>">
        </div>
        <div class="input-group">
            <input type="tel" name="phone" placeholder="Phone" value="<%=u.getPhone()%>">
        </div>
        <div class="input-group">
            <input type="text" name="address" placeholder="Address" value="<%=u.getAddress()%>">
        </div>
        <div class="input-group">
            <input type="password" name="password" placeholder="password" >
        </div>
        <div class="input-group">
            <input type="password" name="cpassword" placeholder="confirm password" >
        </div>
         <button type="submit" class="btn">Update</button>
        <div class="p">
            Want to go back? <a href="dashboard.jsp">Dashboard</a>
        </div>
        </form>
        <%}
        else{
        request.setAttribute("error", "session expired");
        RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
        rd.forward(request,response);
        }%>
    </div>
   
</body>
</html>
    