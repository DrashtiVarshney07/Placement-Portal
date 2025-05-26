<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Alumni</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #e0f7ff;
        }

        .header {
            background-color: #1169c1;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
        }

        .container {
            display: flex;
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
            left: 0;
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
            flex-grow: 1;
            padding: 40px;
            background: linear-gradient(to bottom, #dff2fb, #ffffff);
        }

        .form-container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .form-container h2 {
            text-align: center;
            color: #1169c1;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            background-color: #1169c1;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0b4d99;
        }

        .message {
            text-align: center;
            font-weight: bold;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }
    </style>
</head>
<body>

<div class="header">
    Banasthali Vidyapith Placement Portal
</div>

<div class="navbar">
        <div class="logo">
            <img src="images/bv.jpeg" alt="College Logo" />
            <span>Banasthali Vidyapith Placement Portal</span>
        </div>
        <ul class="links">
            <li><a href="frontpg.jsp">Home</a></li>
            <li><a href="aboutUs.jsp">About</a></li>
            <li><a href="contactUs.jsp">Contact</a></li>
            <li><a href="Placements.jsp">Placements</a></li>
        </ul>
    </div>
    
<div class="sidebar">
    <h2>Admin Portal</h2>
    <ul>
        <li><a href="admin.jsp">Admin Dashboard</a></li>
            <li><a href="noticeboard.jsp">Notice Board</a></li>
            <li><a href="feedbackReply.jsp">Query Box</a></li>
            <li><a href="addStudent.jsp">List of Students</a></li>
            <li><a href="student_application_admin.jsp">Student Placement Status</a></li>
            <li><a href="modifyPlacement.jsp">List of Placements</a></li>
            <li><a href="addPlacementSchedule.jsp">Placement Schedule</a></li>
            <li><a href="#">List of Alumni</a></li>
            <li><a href="loginAdmin.jsp">LogOut</a></li>
    </ul>
</div>


    <div class="main-content">
        <div class="form-container">
            <h2>Add Alumni Details</h2>

            <form method="post">
                <label>Select Student ID:</label>
                <select name="student_id">
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT student_id FROM student");
                        while (rs.next()) {
                            out.println("<option value='" + rs.getString("student_id") + "'>" + rs.getString("student_id") + "</option>");
                        }
                        rs.close();
                        stmt.close();
                    %>
                </select><br>

                <label>Select Company ID:</label>
                <select name="company_id">
                    <%
                        stmt = con.createStatement();
                        rs = stmt.executeQuery("SELECT company_id FROM company");
                        while (rs.next()) {
                            out.println("<option value='" + rs.getInt("company_id") + "'>" + rs.getInt("company_id") + "</option>");
                        }
                        rs.close();
                        stmt.close();
                    %>
                </select><br>

                <label>Year of Join:</label>
                <input type="number" name="year_of_join" placeholder="e.g. 2022"><br>

                <label>Domain:</label>
                <input type="text" name="domain" placeholder="e.g. Software Development"><br>

                <label>Session:</label>
                <input type="text" name="session" placeholder="e.g. 2019-2023"><br>

                <input type="submit" value="Add Alumni">
            </form>

            <%
                String studentId = request.getParameter("student_id");
                String companyId = request.getParameter("company_id");
                String yearOfJoin = request.getParameter("year_of_join");
                String domain = request.getParameter("domain");
                String studentSession = request.getParameter("session");


                if (studentId != null && companyId != null && yearOfJoin != null && domain != null && session != null) {
                    try {
                        String insertQuery = "INSERT INTO alumni (student_id, company_id, year_of_join, domain, session) VALUES (?, ?, ?, ?, ?)";
                        PreparedStatement ps = con.prepareStatement(insertQuery);
                        ps.setString(1, studentId);
                        ps.setInt(2, Integer.parseInt(companyId));
                        ps.setString(3, yearOfJoin);
                        ps.setString(4, domain);
                        ps.setString(5, studentSession);

                        int rows = ps.executeUpdate();
                        if (rows > 0) {
                            out.println("<p class='message success'>Alumni details successfully added!</p>");
                        } else {
                            out.println("<p class='message error'>Failed to insert alumni data.</p>");
                        }

                        ps.close();
                        con.close();
                    } catch (Exception e) {
                        out.println("<p class='message error'>Error: " + e.getMessage() + "</p>");
                    }
                }
            %>

        </div>
    </div>
</div>

</body>
</html>
