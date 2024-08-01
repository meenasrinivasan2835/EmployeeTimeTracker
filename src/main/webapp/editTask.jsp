<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    //HttpSession session = request.getSession(false);
    ResultSet task = (ResultSet) request.getAttribute("task");
    if (task != null) {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Task</title>
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
            text-align: left;
        }

        h2 {
            color: #333;
            font-size: 2em;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="date"],
        input[type="time"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        textarea {
            height: 100px;
        }

        input[type="submit"] {
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1em;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background: linear-gradient(to right, #ff7e5f, #ff6f61);
        }

        a {
            display: inline-block;
            margin-top: 20px;
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
        <h2>Edit Task</h2>
        <form action="EditTaskServlet" method="post">
            <input type="hidden" name="taskId" value="<%= task.getInt("task_id") %>">
            <label for="project">Project:</label>
            <input type="text" id="project" name="project" value="<%= task.getString("project") %>">
            
            <label for="date">Date:</label>
            <input type="date" id="date" name="date" value="<%= task.getDate("date") %>">
            
            <label for="startTime">Start Time:</label>
            <input type="time" id="startTime" name="startTime" value="<%= task.getTime("start_time") %>">
            
            <label for="endTime">End Time:</label>
            <input type="time" id="endTime" name="endTime" value="<%= task.getTime("end_time") %>">
            
            <label for="category">Category:</label>
            <input type="text" id="category" name="category" value="<%= task.getString("category") %>">
            
            <label for="description">Description:</label>
            <textarea id="description" name="description"><%= task.getString("description") %></textarea>
            
            <input type="submit" value="Update Task">
        </form>
        <a href="taskPage.jsp">Back to Task Management</a>
    </div>
</body>
</html>
<%
    }
%>
