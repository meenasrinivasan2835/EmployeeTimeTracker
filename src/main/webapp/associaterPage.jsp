<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--  
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    } else if (!"Associate".equals(session.getAttribute("role"))) {
        response.sendRedirect("dashboard.jsp");
        return; // Redirect to dashboard if the user is not an associate
    }
-->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Associate Page</title>
    <style>
        /* Basic reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #00c6ff, #0072ff);
            color: #333;
            text-align: center;
            padding: 20px;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }

        h2 {
            color: #333;
            font-size: 2em;
            margin-bottom: 20px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin-bottom: 10px;
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            color: #ffffff;
            background-color: linear-gradient(to right, #ff7e5f, #feb47b);
            text-decoration: none;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        a:hover {
            background-color: linear-gradient(to right, #ff7e5f, #ff6f61);
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Associate Page</h2>
        <ul>
            <li><a href="viewMyCharts.jsp">View My Charts</a></li>
        </ul>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
