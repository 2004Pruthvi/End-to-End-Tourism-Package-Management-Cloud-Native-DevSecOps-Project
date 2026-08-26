<%@ page import="com.wild_tour.dao.SafariDAO, com.wild_tour.dao.SafariDAOImpl, com.wild_tour.dto.Safari" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    SafariDAO dao = new SafariDAOImpl();
    Safari safari = dao.getSafari(id);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Safari</title>
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

<h2 style="text-align:center;">Update Safari</h2>

<form action="SafariAction" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="safariId" value="<%= safari.getSafari_id() %>">

    <label>Name:</label>
    <input type="text" name="name" value="<%= safari.getName() %>" required>

    <label>Image URL:</label>
    <input type="text" name="image_url" value="<%= safari.getImage_url() %>" required>

    <label>Price per Seat:</label>
    <input type="text" name="price_per_seat" value="<%= safari.getPrice_per_seat() %>" required>

    <label>Description:</label>
    <textarea name="description" rows="4" required><%= safari.getDescription() %></textarea>

    <button type="submit">Update Safari</button>
      <a href="viewSafari.jsp" class="btn btn-primary">Back</a>
    
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
