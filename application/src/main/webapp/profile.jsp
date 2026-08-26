<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.wild_tour.dto.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" rel="stylesheet">

    <style>
          body {
            background: linear-gradient(to right, #dbe6e4, #f0f4ec);
            font-family: 'Segoe UI', sans-serif;
            padding: 40px 0;
        }

        .profile-card {
            max-width: 600px;
            margin: auto;
            background: #ffffff;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            animation: slideUp 0.5s ease;
        }

        @keyframes slideUp {
            from { transform: translateY(40px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .profile-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .profile-header h2 {
            font-weight: bold;
            color: #2e7d32;
        }
        .icon-container {
    display: flex;
    justify-content: center;
}

.icon-container i {
    font-size: 60px;
    
}
        

        .profile-detail {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }

        .profile-detail label {
            font-weight: 600;
            color: #333;
        }

        .password-group {
            position: relative;
        }

        .password-group i {
            position: absolute;
            right: 0;
            top: 0;
            padding: 5px 10px;
            cursor: pointer;
            color: #999;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }

        .btn-custom {
            border-radius: 25px;
            padding: 8px 20px;
            font-weight: 500;
        }

        .btn-edit {
            background-color: #2e7d32;
            color: white;
        }

        .btn-password {
            background-color: #ffa726;
            color: white;
        }

        .btn-back {
            background-color: #90a4ae;
            color: white;
        }

        .btn-custom:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>

    
<div class="profile-card">

    <div class="profile-header">
    
        <h2>My Profile</h2>
    </div>
    <div class="icon-container mb-3">
    <i class="fa-solid fa-user-circle"></i>
</div>
    

 <% String emsg = (String) request.getAttribute("fail");
        if (emsg != null) { %>
            <%= emsg %>
        <% } %>
          <% String smsg = (String) request.getAttribute("success");
        if (smsg != null) { %>
            <%= smsg %>
        <% } %>

    <div class="profile-detail">
        <label>ID</label>
        <span><%= user.getUserId() %></span>
    </div>
    <div class="profile-detail">
        <label>Name</label>
        <span><%= user.getUser_name() %></span>
    </div>
    <div class="profile-detail">
        <label>Email</label>
        <span><%= user.getEmail() %></span>
    </div>
    <div class="profile-detail">
        <label>Phone</label>
        <span><%= user.getPhone() %></span>
    </div>
    <div class="profile-detail password-group">
        <label>Password</label>
        <span>
            <input type="password" id="passwordField" class="form-control-plaintext d-inline-block" value="<%= user.getPassword() %>" readonly style="border: none; background: transparent; width: auto;">
            <i class="fas fa-eye" id="togglePassword"></i>
        </span>
    </div>

    <div class="btn-group">
        <a href="update.jsp" class="btn btn-custom btn-edit">Edit Profile</a>
        <a href="dashboard.jsp" class="btn btn-custom btn-back">Back</a>
    </div>
</div>

<script>
    const toggle = document.getElementById('togglePassword');
    const pwdField = document.getElementById('passwordField');

    toggle.addEventListener('click', function () {
        const type = pwdField.getAttribute('type') === 'password' ? 'text' : 'password';
        pwdField.setAttribute('type', type);
        this.classList.toggle('fa-eye');
        this.classList.toggle('fa-eye-slash');
    });
</script>

</body>
</html>
