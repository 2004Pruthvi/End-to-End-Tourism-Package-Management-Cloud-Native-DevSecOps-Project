<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Package</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f4f8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        .form-container {
            background: #ffffff;
            padding: 30px;
            margin-top: 50px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
            color: #34495e;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            margin-top: 20px;
            background-color: #8e44ad;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #732d91;
        }
         .btn{
        margin-top: 10px;
        padding: 10px 153px;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Add Package</h2>
    <form action="PackageAction" method="post">
        <input type="hidden" name="action" value="add">
    
        <label for="name">Package Name</label>
        <input type="text" name="name" id="name" required>

        <label for="image_url">Image URL</label>
        <input type="text" name="image_url" id="image_url">

        <label for="price">Price</label>
        <input type="number" step="0.01" name="price" id="price" required>

        <label for="description">Description</label>
        <textarea name="description" id="description" rows="5" placeholder="Enter package details here..."></textarea>

        <input type="submit" value="Add">
                <a href="adminDashboard.jsp" class="btn btn-primary">Back</a>
        
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
    