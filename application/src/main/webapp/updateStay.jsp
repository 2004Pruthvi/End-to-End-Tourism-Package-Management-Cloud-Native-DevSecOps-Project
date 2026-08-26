<%@ page import="com.wild_tour.dao.StayDAO, com.wild_tour.dao.StayDAOImpl, com.wild_tour.dto.Stay" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    StayDAO dao = new StayDAOImpl();
    Stay stay = dao.getStay(id);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Stay</title>
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #e8f5e9;
            padding: 40px;
        }
        form {
            max-width: 500px;
            margin: auto;
            background: #f9f9f9;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
        input, textarea {
            width: 100%;
            margin-bottom: 12px;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 15px;
        }
        button {
            padding: 10px 18px;
            background: #388e3c;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background: #2e7d32;
        }
        h2 {
            text-align: center;
            color: #1b5e20;
        }
        
    </style>
</head>
<body>

<h2>Update Stay</h2>

<form action="StayAction" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="stayId" value="<%= stay.getStay_id() %>">

    <label>Name:</label>
    <input type="text" name="name" value="<%= stay.getName() %>" required>

    <label>Image URL:</label>
    <input type="text" name="image_url" value="<%= stay.getImage_url() %>" required>

    <label>Price per Night:</label>
    <input type="text" name="price_per_night" value="<%= stay.getPrice_per_night() %>" required>

    <label>Description:</label>
    <textarea name="description" rows="4" required><%= stay.getDescription() %></textarea>

    <button type="submit">Update Stay</button>

        <a href="viewStay.jsp" class="btn btn-primary">Back</a>
    
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
 
</body>
</html>
