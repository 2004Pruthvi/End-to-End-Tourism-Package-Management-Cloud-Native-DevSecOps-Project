<%@ page import="com.wild_tour.dao.PackagesDAO, com.wild_tour.dao.PackagesDAOImpl, com.wild_tour.dto.Packages" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    PackagesDAO dao = new PackagesDAOImpl();
    Packages pack = dao.getTourPackage(id);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Package</title>
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
            background: #007BFF;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<h2 style="text-align:center;">Update Package</h2>

<form action="PackageAction" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="packageId" value="<%= pack.getPackage_id() %>">

    <label>Name:</label>
    <input type="text" name="name" value="<%= pack.getName() %>" required>

    <label>Image URL:</label>
    <input type="text" name="image_url" value="<%= pack.getImage_url() %>" required>

    <label>Price:</label>
    <input type="text" name="price" value="<%= pack.getPrice() %>" required>

    <label>Description:</label>
    <textarea name="description" rows="4"><%= pack.getDescription() %></textarea>

    <button type="submit">Update Package</button>
          <a href="viewPackage.jsp" class="btn btn-primary">Back</a>
    
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
