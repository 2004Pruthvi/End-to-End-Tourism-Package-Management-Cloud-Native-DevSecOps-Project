<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Package</title>
    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this package?");
        }
    </script>
</head>
<body>
    <form action="PackageAction" method="post" onsubmit="return confirmDelete();">
        <input type="hidden" name="action" value="delete">
        <input type="hidden" name="packageId" value="<%= request.getParameter("id") %>">
        <button type="submit">Confirm Delete</button>
    </form>
</body>
</html>
