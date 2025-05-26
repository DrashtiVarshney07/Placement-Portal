<%-- 
    Document   : stats
    Created on : Mar 25, 2025, 12:03:10 AM
    Author     : pragy
--%>
<%@ page isELIgnored="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Placement Statistics</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Arial', sans-serif;
                background: linear-gradient(to bottom, #a6dcef, #ffffff);
                height: 100vh;
                display: flex;
                flex-direction: row;
                color: #333;
            }

            .navbar {
                width: 100%;
                background-color: #1565c0;
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 15px 20px;
                position: fixed;
                top: 0;
                left: 0;
                z-index: 1000;
                color: white;
            }

            .navbar .logo {
                display: flex;
                align-items: center;
            }

            .navbar .logo img {
                width: 50px;
                height: 50px;
                margin-right: 10px;
                border-radius: 50%;
            }

            .navbar .logo span {
                font-size: 20px;
                font-weight: bold;
                color: #fff;
            }

            .navbar .links {
                list-style: none;
                display: flex;
                gap: 20px;
            }

            .navbar .links a {
                color: #fff;
                text-decoration: none;
                font-size: 16px;
                transition: color 0.3s;
            }

            .navbar .links a:hover {
                color: #ffeb3b;
            }

            .sidebar {
                width: 250px;
                background-color: #1565c0;
                color: white;
                padding: 20px;
                position: fixed;
                height: 100vh;
                top: 60px;
            }

            .sidebar h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            .sidebar ul {
                list-style: none;
                padding: 0;
            }

            .sidebar ul li {
                padding: 10px;
            }

            .sidebar ul li a {
                color: white;
                text-decoration: none;
                font-size: 16px;
                display: block;
            }

            .sidebar ul li a:hover {
                background: #003c8f;
                padding: 10px;
                border-radius: 5px;
            }

            .main-content {
                margin-left: 270px;
                width: calc(100% - 270px);
                display: flex;
                flex-direction: column;
                align-items: center;
                margin-top: 100px;
            }

            .container {
                margin-top: 80px;
                width: 80%;
                background: #ffffff;
                border-radius: 10px;
                padding: 60px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }

            .filters {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 20px;
                margin-bottom: 20px;
            }

            .filters label {
                font-weight: bold;
                font-size: 16px;
            }

            select, button {
                padding: 10px;
                font-size: 16px;
                border-radius: 5px;
                border: 1px solid #ddd;
                cursor: pointer;
            }

            button {
                background-color: #1565c0;
                color: white;
                border: none;
                transition: background 0.3s;
            }

            button:hover {
                background-color: #003c8f;
            }

            .charts {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .charts canvas {
                max-width: 350px;
                max-height: 250px;
            }
        </style>
    </head>
    <body>
        <div class="navbar">
            <div class="logo">
                <img src="images/bv.jpeg" alt="College Logo" />
                <span>Placement Statistics</span>
            </div>
            <ul class="links">
                <li><a href="frontpg.jsp">Home</a></li>
                <li><a href="aboutUs.jsp">About</a></li>
                <li><a href="contactUs.jsp">Contact</a></li>
                <li><a href="placement.jsp">Placements</a></li>
            </ul>
        </div>

        <div class="sidebar">
            <h2>Student Portal</h2>
            <ul>
                <li><a href="studDash">Dashboard</a></li>
                <li><a href="profileStudent.jsp">Student Profile</a></li>
                <li><a href="applStatus.jsp">Company Application Status</a></li>
                <li><a href="#">Previous Year Stats</a></li>
                <li><a href="alumniPortal.jsp">Alumni Contact</a></li>
                <li><a href="login.jsp">Logout</a></li>
            </ul>
        </div>

        <div class="main-content">
            <div class="container">
                <h2 style="text-align:center;">Placement Statistics</h2>
                <div class="filters">
                    <label for="yearSelect">Year:</label>
                    <select id="yearSelect">
                        <option value="2024">2024</option>
                        <option value="2023">2023</option>
                        <option value="2022">2022</option>
                        <option value="2021">2021</option>
                        <option value="2020">2020</option>
                    </select>
                        <label for="courseSelect">Course:</label>
                        <select id="courseSelect">
                        </select>
                        <button onclick="updateCharts()">Show Statistics</button>
                </div>
                <div class="charts">
                    <canvas id="yearWiseChart"></canvas>
                    <canvas id="courseWiseChart"></canvas>
                </div>
            </div>
        </div>
        <script>
            const yearWiseCtx = document.getElementById('yearWiseChart').getContext('2d');
            const yearWiseChart = new Chart(yearWiseCtx, {
                type: 'bar',
                data: {
                    labels: [],
                    datasets: [{
                        label: 'Students Placed',
                        data: [],
                        backgroundColor: 'rgba(21, 101, 192, 0.7)',
                        borderColor: 'rgba(21, 101, 192, 1)',
                        borderWidth: 1
                    }]
                },
                options: { responsive: true }
            });

            const courseWiseCtx = document.getElementById('courseWiseChart').getContext('2d');
            const courseWiseChart = new Chart(courseWiseCtx, {
                type: 'pie',
                data: {
                    labels: [],
                    datasets: [{
                        data: [],
                        backgroundColor: ['#1e88e5', '#43a047', '#fb8c00', '#d81b60', '#8e24aa']
                    }]
                },
                options: { responsive: true }
            });

            function fetchStatistics() {
                fetch('<%=request.getContextPath()%>/getStatistics.jsp?year=2024&course=overall')
                .then(response => response.json())
                .then(data => {
                    console.log("Fetched data: ", data); 
                      
                        const courseSelect = document.getElementById('courseSelect');
                        courseSelect.innerHTML = '<option value="overall">Overall</option>'; 
                        if (data.courses && Array.isArray(data.courses)) {
                            data.courses.forEach(course => {
                                const option = document.createElement('option');
                                option.value = course.course_name;
                                option.text = course.course_name;
                                courseSelect.appendChild(option);
                            });
                        } else {
                            console.warn("No courses found in response.");
                        }

                    })
                    .catch(error => {
                        console.error('Error fetching statistics:', error);
                    });
            }

            function updateCharts() {
                const year = document.getElementById("yearSelect").value;
                const course = document.getElementById("courseSelect").value;

                fetch(`getStatistics.jsp?year=${year}&course=${encodeURIComponent(course)}`)
                    .then(response => response.json())
                    .then(data => {
                        yearWiseChart.data.labels = data.yearData.map(entry => entry.year);
                        yearWiseChart.data.datasets[0].data = data.yearData.map(entry => entry.total);
                        yearWiseChart.update();

                        courseWiseChart.data.labels = data.courseData.map(entry => entry.course);
                        courseWiseChart.data.datasets[0].data = data.courseData.map(entry => entry.placed);
                        courseWiseChart.update();
                    })
                    .catch(error => {
                        console.error("Error fetching statistics:", error);
                    });
            }

            fetchStatistics();   
        </script>
    </body>
</html>