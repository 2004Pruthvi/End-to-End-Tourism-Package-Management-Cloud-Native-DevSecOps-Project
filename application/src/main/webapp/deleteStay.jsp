<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Stay</title>
    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this stay?");
        }
    </script>
</head>
<body>
    <form action="StayAction" method="post" onsubmit="return confirmDelete();">
        <input type="hidden" name="action" value="delete">
        <input type="hidden" name="stayId" value="<%= request.getParameter("id") %>">
        <button type="submit">Confirm Delete</button>
    </form>
</body>
</html>
