<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>

<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Monthly Tasks/Hours Bar Chart</title>
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
            max-width: 800px;
        }

        h2 {
            color: #333;
            font-size: 2em;
            margin-bottom: 20px;
        }

        canvas {
            background: rgba(255, 255, 255, 0.8); /* Slightly opaque background for better chart visibility */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin: 0 auto;
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
        }

        a:hover {
            background-color: linear-gradient(to right, #ff7e5f, #ff6f61);
            color: #333;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="container">
        <h2>Monthly Tasks/Hours Bar Chart</h2>
        <canvas id="ALLMonthlyChart" width="400" height="400"></canvas>
        <script>
            fetch('AllMonthlyChartServlet')
            .then(response => response.json())
            .then(data => {
                console.log("Data received from servlet:", data); // Debugging log

                const ctx = document.getElementById('ALLMonthlyChart').getContext('2d');

                const labels = new Set();
                const datasetMap = {};

                // Process userTasks to get labels and datasetMap
                for (const [username, userData] of Object.entries(data.userTasks)) {
                    datasetMap[username] = [];
                    userData.labels.forEach((day, index) => {
                        labels.add(day);
                        datasetMap[username].push({
                            x: day,
                            y: userData.data[index]
                        });
                    });
                }

                // Convert labels Set to an array and sort it
                const sortedLabels = Array.from(labels).sort();

                // Prepare datasets
                const datasets = Object.keys(datasetMap).map(username => ({
                    label: username,
                    data: sortedLabels.map(day => {
                        const point = datasetMap[username].find(p => p.x === day);
                        return point ? point.y : 0;
                    }),
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }));

                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: sortedLabels,
                        datasets: datasets
                    },
                    options: {
                        responsive: true,
                        scales: {
                            x: {
                                type: 'category'
                            },
                            y: {
                                beginAtZero: true
                            }
                        },
                        plugins: {
                            legend: {
                                position: 'top',
                            },
                            title: {
                                display: true,
                                text: "Monthly Tasks/Hours Distribution"
                            }
                        }
                    }
                });
            })
            .catch(error => {
                console.error("Error fetching data:", error); // Debugging log
            });
        </script>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
