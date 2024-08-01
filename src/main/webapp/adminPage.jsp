<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #00c6ff, #0072ff);
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        .container {
            background: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            text-align: center;
        }

        h2 {
            margin-bottom: 1rem;
            color: #333;
        }

        ul {
            list-style-type: none;
            padding: 0;
            margin: 1rem 0;
        }

        li {
            margin: 0.5rem 0;
        }

        a {
            text-decoration: none;
            color: #0072ff;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        .back-button {
            display: inline-block;
            margin-top: 1rem;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            color: white;
            font-size: 1rem;
            cursor: pointer;
            text-decoration: none;
        }

        .back-button:hover {
            background: linear-gradient(to right, #ff7e5f, #ff6f61);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Admin Page</h2>
        <ul>
            <li><a href="viewAllTasks.jsp">View All Tasks</a></li>
            <li><a href="viewAllCharts.jsp">View All Charts</a></li>
        </ul>
        <a href="dashboard.jsp" class="back-button">Back to Dashboard</a>
    </div>
</body>
</html>
