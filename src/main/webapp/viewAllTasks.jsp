<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    }

    String username = (String) session.getAttribute("username");
    int userId = 0;
    String dbUrl = "jdbc:mysql://localhost:3306/EmployeeTaskTracker";
    String dbUser = "root";
    String dbPass = "12345@goat";

    // Query to get user_id from username
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
        PreparedStatement ps = con.prepareStatement("SELECT user_id FROM Users WHERE username=?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            userId = rs.getInt("user_id");
        }
        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Tasks</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            padding: 20px;
            text-align: center;
        }

        h2 {
            color: #007bff;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            display: inline-block;
            margin: 5px;
            padding: 8px 16px;
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
    <h2>All Tasks for <%= username %></h2>
    <table>
        <thead>
            <tr>
                <th>Project</th>
                <th>Date</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Category</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM Tasks");
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("project") %></td>
                <td><%= rs.getDate("date") %></td>
                <td><%= rs.getTime("start_time") %></td>
                <td><%= rs.getTime("end_time") %></td>
                <td><%= rs.getString("category") %></td>
                <td><%= rs.getString("description") %></td>
                <td>
                    <a href="EditTaskServlet?taskId=<%= rs.getInt("task_id") %>">Edit</a>
                    <a href="DeleteTaskServlet?taskId=<%= rs.getInt("task_id") %>">Delete</a>
                </td>
            </tr>
            <%
                    }
                    rs.close();
                    ps.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </tbody>
    </table>
    <a href="dashboard.jsp" class="back-link">Back to Dashboard</a>
</body>
</html>
