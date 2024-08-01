<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Get the session
    //HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    }

    // Retrieve username from the session
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
    <title>Task Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            color: #333;
            padding: 20px;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #0072ff;
            margin-bottom: 20px;
        }

        form {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"], 
        input[type="date"], 
        input[type="time"], 
        textarea, 
        select {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #0072ff;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #0072ff;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        a {
            color: #0072ff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Task Management for <%= username %></h2>
        <form action="TaskServlet" method="get">
            <input type="hidden" name="userId" value="<%= userId %>">
            <label for="project">Project:</label>
            <input type="text" id="project" name="project">
            
            <label for="date">Date:</label>
            <input type="date" id="date" name="date">
            
            <label for="startTime">Start Time:</label>
            <input type="time" id="startTime" name="startTime">
            
            <label for="endTime">End Time:</label>
            <input type="time" id="endTime" name="endTime">
            
            <label for="category">Category:</label>
            <input type="text" id="category" name="category">
            
            <label for="description">Description:</label>
            <textarea id="description" name="description"></textarea>
            
            <input type="submit" value="Add Task">
        </form>
        <h3>Your Tasks</h3>
        <table>
            <tr>
                <th>Project</th>
                <th>Date</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Category</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
            <%
                try {
                    Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM Tasks WHERE employee_id=?");
                    ps.setInt(1, userId);
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
                    <a href="EditTaskServlet?taskId=<%= rs.getInt("task_id") %>">Edit</a> |
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
        </table>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
