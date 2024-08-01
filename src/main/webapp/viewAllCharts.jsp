<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Charts</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            color: #333;
            padding: 20px;
            text-align: center;
        }

        h2 {
            color: #0072ff;
            margin-bottom: 20px;
        }

        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        li {
            margin: 10px 0;
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            color: #fff;
            background-color: #0072ff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 1em;
        }

        a:hover {
            background-color: #0056b3;
            color: #fff;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            color: #0072ff;
            background-color: #fff;
            border: 1px solid #0072ff;
            border-radius: 5px;
            text-decoration: none;
        }

        .back-link:hover {
            background-color: #0072ff;
            color: #fff;
        }
    </style>
</head>
<body>
    <h2>Charts Overview</h2>
    <ul>
        <li><a href="AllDailyChart.jsp">View Daily Chart</a></li>
        <li><a href="AllWeeklyChart.jsp">View Weekly Chart</a></li>
        <li><a href="AllMonthlyChart.jsp">View Monthly Chart</a></li>
    </ul>
    <a href="dashboard.jsp" class="back-link">Back to Dashboard</a>
</body>
</html>
