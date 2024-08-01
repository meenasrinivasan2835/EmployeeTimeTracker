<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Weekly Tasks/Hours Bar Chart</title>
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
        <h2>Weekly Tasks/Hours Bar Chart</h2>
        <canvas id="AllWeeklyChart" width="400" height="400"></canvas>
        <script>
            fetch('AllWeeklyChartServlet')
            .then(response => response.json())
            .then(data => {
                const ctx = document.getElementById('AllWeeklyChart').getContext('2d');

                const labels = [];
                const datasetMap = {};

                data.datasets.forEach(item => {
                    if (!labels.includes(item.day)) {
                        labels.push(item.day);
                    }
                    if (!datasetMap[item.username]) {
                        datasetMap[item.username] = [];
                    }
                    datasetMap[item.username].push({
                        x: item.day,
                        y: item.duration
                    });
                });

                const datasets = Object.keys(datasetMap).map(username => ({
                    label: username,
                    data: datasetMap[username],
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }));

                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labels,
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
                                text: "Weekly Tasks/Hours Distribution"
                            }
                        }
                    }
                });
            })
            .catch(error => {
                console.error("Error fetching data:", error);
            });
        </script>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
