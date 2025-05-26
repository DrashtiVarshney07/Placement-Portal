<%-- 
    Document   : profileStudent
    Created on : Apr 5, 2025, 11:15:00 PM
    Author     : pragy
--%>

<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%
    String studentId = (String) session.getAttribute("student_id");
    String fullname = "", email = "", contact = "", dob = "", father = "", mother = "", course = "", sessionStr = "", imagePath = "";

    if (studentId != null) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");
            String sql = "SELECT * FROM student WHERE student_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, studentId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                fullname = rs.getString("name");
                email = rs.getString("bnsmail");
                contact = rs.getString("contact");
                dob = rs.getString("dob");
                father = rs.getString("fathers_name");
                mother = rs.getString("mothers_name");
                course = rs.getString("course_id");
                sessionStr = rs.getString("session");
                imagePath = rs.getString("image");
            }

            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Student Information - Banasthali Vidyapith</title>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom, #a6dcef, #ffffff);
            min-height: 100vh;
            padding-top: 80px;
            color: #333;
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
            margin-right: 100px;
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
            margin-left: 270px;
            padding: 20px;
            width: calc(100% - 270px);
        }

        .heading {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #1565c0;
        }

        .form-container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: auto;
        }

        .form-section {
            background: linear-gradient(to bottom, #a6dcef, #ffffff);
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 10px;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .form-section .info {
            flex: 1;
        }

        .form-section .info p {
            font-size: 18px;
            margin-bottom: 10px;
            color: #333;
            line-height: 1.5;
        }

        .form-section .info strong {
            display: inline-block;
            width: 180px;
            color: #0d47a1;
        }

        .form-section .profile-img {
            margin-left: 20px;
        }

        .profile-img img {
            width: 160px;
            height: 160px;
            object-fit: cover;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .table-container {
            margin-top: 15px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #333;
        }

        th, td {
            padding: 8px;
            text-align: center;
            background: #f8f8f8;
        }

    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo">
            <img src="images/bv.jpeg" alt="College Logo" />
            <span>Banasthali Vidyapith Placement Portal</span>
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
            <li><a href="studdash.jsp">Dashboard</a></li>
            <li><a href="#">Student Profile</a></li>
            <li><a href="applStatus.jsp">Company Application Status</a></li>
            <li><a href="stats.jsp">Previous Year Stats</a></li>
             <li><a href="alumniPortal.jsp">Alumni Contact</a></li>
            <li><a href="login.jsp">Logout</a></li>
        </ul>
    </div>
    <div class="main-content">
        <div class="heading">STUDENT PROFILE</div>
        <div class="form-container">
            <div class="form-section">
                <div class="info">
                    <p><strong>Full Name:</strong> <%= fullname %></p>
                    <p><strong>Banasthali Email:</strong> <%= email %></p>
                    <p><strong>Contact Number:</strong> <%= contact %></p>
                    <p><strong>Date of Birth:</strong> <%= dob %></p>
                    <p><strong>Father's Name:</strong> <%= father %></p>
                    <p><strong>Mother's Name:</strong> <%= mother %></p>
                    <p><strong>Course:</strong> <%= course %></p>
                    <p><strong>Session:</strong> <%= sessionStr %></p>
                </div>
                <div class="profile-img">
                    <img src="<%= imagePath %>" alt="Profile Image" />
                </div>
            </div>
        </div>
    </div>
</body>
</html>