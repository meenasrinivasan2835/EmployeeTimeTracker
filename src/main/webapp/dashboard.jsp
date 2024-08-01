<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page import="jakarta.servlet.http.HttpServletResponse"%>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    } else {
        String role = (String) session.getAttribute("role");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
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
            flex-direction: column;
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

        a {
            display: block;
            margin: 10px 0;
            padding: 10px 20px;
            color: #ffffff;
            background-color: linear-gradient(to right, #ff7e5f, #feb47b);
            text-decoration: none;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            font-size: 1.1em;
        }

        a:hover {
            background-color: linear-gradient(to right, #ff7e5f, #ff6f61);
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome, <%= session.getAttribute("username") %></h2>
        <%
            if ("Admin".equals(role)) {
        %>
        <a href="adminPage.jsp">Admin Page</a>
        <%
            } else {
        %>
        <a href="taskPage.jsp">Task Management</a>
        <a href="associaterPage.jsp">View Associates</a>
        <%
            }
        %>
        <a href="LogoutServlet">Logout</a>
    </div>
</body>
</html>
<%
    }
%>
