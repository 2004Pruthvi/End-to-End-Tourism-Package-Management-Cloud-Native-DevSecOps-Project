<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wildlife Dashboard</title>

    <!-- Bootstrap CSS (Manually Linked) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('https://constructive-voices.com/wp-content/uploads/2024/02/South-Sudan-wildlife-tourism-1170x669.jpg') center/cover no-repeat;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        .hero {
            height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #f5f5dc; /* Adjusted to match background */
        }
        .hero h1 {
            font-size: 3rem;
            font-weight: normal;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.6);
            color: #f5f5dc; /* Adjusted to match background */
        }
        .hero p {
            font-size: 1.2rem;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
            color: #f5f5dc; /* Adjusted to match background */
        }
    </style>
</head>
<body>
    
    <%@ include file="header.jsp" %>

    <!-- Hero Section -->
    <div class="hero">
        <div>
            <h1>Welcome to Your Wildlife Adventure</h1>
            <p>Experience the wild like never before</p>
        </div>
    </div>

    <!-- Bootstrap JS (Manually Linked) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>