<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Alumni Portal</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        html, body {
            height: 100%;
        }

        body {
            background: linear-gradient(to bottom, #a6dcef, #ffffff);
            background-attachment: fixed;
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
            margin: 0;
            padding: 0;
        }

        .navbar .links li {
            display: inline;
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
            padding: 20px;
        }

        .filters {
            background: white;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            width: 80%;
        }

        select {
            padding: 8px;
            margin: 0 10px;
            border-radius: 4px;
            border: 1px solid #aaa;
        }

        .alumni-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            width: 80%;
        }

        .alumni-card {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            width: 260px;
            padding: 20px;
            transition: transform 0.2s;
        }

        .alumni-card:hover {
            transform: scale(1.02);
        }

        .alumni-card h3 {
            margin-top: 0;
            color: #1565c0;
        }

        .alumni-card p {
            margin: 6px 0;
            color: #333;
        }
    </style>
</head>
<body>

<div class="navbar">
    <div class="logo">
        <img src="images/bv.jpeg" alt="College Logo" />
        <span>Student Panel - Alumni Portal</span>
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
        <li><a href="studDash.jsp">Dashboard</a></li>
        <li><a href="profileStudent.jsp">Student Profile</a></li>
        <li><a href="applStatus.jsp">Company Application Status</a></li>
        <li><a href="stats.jsp">Previous Year Stats</a></li>
        <li><a href="#">Alumni Contact</a></li>
        <li><a href="login.jsp">Logout</a></li>
    </ul>
</div>

<div class="main-content">
    <div class="filters">
    <form method="get">
        <label>Course:</label>
        <select name="course_id">
            <option value="">All</option>
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT DISTINCT course_id FROM student");
                while (rs.next()) {
                    String c = rs.getString("course_id");
                    String selected = (c.equals(request.getParameter("course_id")) ? "selected" : "");
                    out.println("<option value='" + c + "' " + selected + ">" + c + "</option>");
                }
                rs.close();
                stmt.close();
            %>
        </select>

        <label>Year:</label>
       
        <select name="year">
            <option value="">All</option>
            <%
                for (int year = 2000; year <= 2025; year++) {
                    String selected = (String.valueOf(year).equals(request.getParameter("year")) ? "selected" : "");
                    out.println("<option value='" + year + "' " + selected + ">" + year + "</option>");
                }
            %>
        </select>


        <input type="submit" value="Filter">
    </form>
    </div>

    <div class="alumni-grid">
        <%
            String courseFilter = request.getParameter("course_id");
            String yearFilter = request.getParameter("year");

            String query = "SELECT a.*, s.name AS student_name, s.course_id, s.contact, c.C_name AS company_name " +
               "FROM alumni a " +
               "JOIN student s ON a.student_id = s.student_id " +
               "LEFT JOIN company c ON a.company_id = c.company_id WHERE 1=1";


            if (courseFilter != null && !courseFilter.isEmpty()) {
                query += " AND s.course_id = ?";
            }
            if (yearFilter != null && !yearFilter.isEmpty()) {
                query += " AND a.year_of_join = ?";
            }

            PreparedStatement ps = con.prepareStatement(query);
            int idx = 1;
            if (courseFilter != null && !courseFilter.isEmpty()) {
                ps.setString(idx++, courseFilter);
            }
            if (yearFilter != null && !yearFilter.isEmpty()) {
                ps.setString(idx++, yearFilter);
            }

            rs = ps.executeQuery();
            boolean found = false;
            while (rs.next()) {
                found = true;
        %>
        <div class="alumni-card">
            <h3><%= rs.getString("student_name") %></h3>
            <p><strong>Course ID:</strong> <%= rs.getString("course_id") %></p>
            <p><strong>Year Joined:</strong> <%= rs.getString("year_of_join") %></p>
            <p><strong>Session:</strong> <%= rs.getString("session") %></p>
            <p><strong>Domain:</strong> <%= rs.getString("domain") %></p>
            <p><strong>Company:</strong> <%= rs.getString("company_name") %></p>
            <p><strong>Contact:</strong> <%= rs.getString("contact") %></p>
        </div>
        <%
            }
            if (!found) {
                out.println("<p>No alumni found for the selected filters.</p>");
            }

            rs.close();
            ps.close();
            con.close();
        %>
    </div>
</div>

</body>
</html>
