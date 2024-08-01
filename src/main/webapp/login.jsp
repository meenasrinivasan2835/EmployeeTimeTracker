<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #00c6ff, #0072ff);
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        h2 {
            margin-bottom: 1rem;
            color: #333;
        }

        label {
            display: block;
            margin: 0.5rem 0;
            color: #555;
        }

        input[type="text"], input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 0.5rem 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            color: white;
            font-size: 1rem;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background: linear-gradient(to right, #ff7e5f, #ff6f61);
        }
    </style>
</head>
<body>
    <div class="container">
    	<h1>Employee Time Tracker</h1>
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username"><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password"><br>
            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>
