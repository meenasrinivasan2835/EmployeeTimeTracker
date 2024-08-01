<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View My Charts</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            padding: 20px;
            text-align: center;
        }

        h2 {
            color: #007bff;
            margin-bottom: 20px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin: 10px 0;
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            color: #fff;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 4px;
        }

        a:hover {
            background-color: #0056b3;
        }

        .back-link {
            margin-top: 20px;
            padding: 10px 20px;
            color: #007bff;
            background-color: #fff;
            border: 1px solid #007bff;
            border-radius: 4px;
            text-decoration: none;
        }

        .back-link:hover {
            background-color: #007bff;
            color: #fff;
        }
    </style>
</head>
<body>
    <h2>My Charts</h2>
    <ul>
        <li><a href="dailyChart.jsp">View Daily Chart</a></li>
        <li><a href="weeklyChart.jsp">View Weekly Chart</a></li>
        <li><a href="monthlyChart.jsp">View Monthly Chart</a></li>
    </ul>
    <a href="dashboard.jsp" class="back-link">Back to Dashboard</a>
</body>
</html>
