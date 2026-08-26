<%@ page import="com.wild_tour.dao.GuideDAO, com.wild_tour.dao.GuideDAOImpl, com.wild_tour.dto.Guide" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    GuideDAO dao = new GuideDAOImpl();
    Guide guide = dao.getGuide(id);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Guide</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    
    <style>
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
            margin-bottom: 10px;
            padding: 8px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        button {
            padding: 10px 15px;
            background: #4CAF50;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        
    </style>
</head>
<body>

<h2 style="text-align:center;">Update Guide</h2>

<form action="GuideAction" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="guideId" value="<%= guide.getId() %>">

    <label>Name:</label>
    <input type="text" name="name" value="<%= guide.getName() %>" required>

    <label>Image URL:</label>
    <input type="text" name="image" value="<%= guide.getImage() %>" required>

    <label>Bio:</label>
    <input type="text" name="bio" value="<%= guide.getBio() %>" required>

    <label>Price:</label>
    <input type="text" name="price" value="<%= guide.getPrice() %>" required>

    <button type="submit">Update Guide</button>
     
        <a href="viewGuide.jsp" class="btn btn-primary">Back</a>
    
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
