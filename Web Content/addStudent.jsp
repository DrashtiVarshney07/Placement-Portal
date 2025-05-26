<%-- 
    Document   : addStudent
    Created on : Apr 5, 2025, 11:22:52 PM
    Author     : pragy
--%>

<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*,javax.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*" %>
<%
        String adminId = (String) session.getAttribute("admin_id");
    if (adminId == null) {
        response.sendRedirect("loginAdmin.jsp?error=sessionExpired");
        return;
    }
    %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Placement Management - Banasthali Vidyapith</title>
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
            margin-left: 270px;
            padding: 20px;
        }

        .container {
            margin-top: 20px;
            background: #ffffff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            overflow-x: auto;
        }

        h1 {
            text-align: center;
            font-size: 28px;
            color: #333;
        }

        h2 {
            text-align: center;
            font-size: 22px;
            color: #444;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #f1f1f1;
            color: #333;
        }

        td {
            color: #555;
        }

        .btn {
            padding: 8px 14px;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            border: none;
            margin: 2px; 
            min-width: 75px; 
        }

        .edit-btn {
            background-color: #ffca28;
            color: #fff;
        }

        .delete-btn {
            background-color: #f44336;
            color: #fff;
        }

        .add-btn {
            margin-top: 20px;
            background-color: #0097a7;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        .add-btn:hover {
            background-color: #00796b;
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
        <h2>AdminPortal</h2>
        <ul>
            <li><a href="#">Admin Dashboard</a></li>
            <li><a href="noticeboard.jsp">Notice Board</a></li>
            <li><a href="feedbackReply.jsp">Query Box</a></li>
            <li><a href="#">List of Students</a></li>
            <li><a href="modifyPlacement.jsp">List of Placements</a></li>
            <li><a href="addPlacementSchedule.jsp">Placement Schedule</a></li>
            <li><a href="addalumni.jsp">List of Alumni</a></li>
            <li><a href="loginAdmin.jsp">LogOut</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="container">
            <h1>Placement Management</h1>
            <h2>List of Students</h2>
            <table>
            <tr>
                <th>Student ID</th>
                <th>Name</th>
                <th>Email (BNS Mail)</th>
                <th>Date of Birth</th>
                <th>Father's Name</th>
                <th>Mother's Name</th>
                <th>Course ID</th>
                <th>Session</th>
                <th>Contact</th>
                <th>Resume</th>
                <th>Image</th>
                <th>Operations</th>
            </tr>
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", ""); 
                    stmt = conn.createStatement();
                    String sql = "SELECT * FROM student";
                    rs = stmt.executeQuery(sql);

                    while (rs.next()) {
                        String studentId = rs.getString("student_id");
                        String name = rs.getString("name");
                        String bnsmail = rs.getString("bnsmail");
                        String dob = rs.getString("dob");
                        String father = rs.getString("fathers_name");
                        String mother = rs.getString("mothers_name");
                        String courseId = rs.getString("course_id");
                        String sessionStr = rs.getString("session");
                        String contact = rs.getString("contact");
                        String resume = rs.getString("resume");
                        String image = rs.getString("image");
            %>
            <tr>
                <td><%= studentId %></td>
                <td><%= name %></td>
                <td><%= bnsmail %></td>
                <td><%= dob %></td>
                <td><%= father %></td>
                <td><%= mother %></td>
                <td><%= courseId %></td>
                <td><%= sessionStr %></td>
                <td><%= contact %></td>
                <td>
                    <% if (resume != null && !resume.isEmpty()) { %>
                        <a href="resumes/<%= resume %>" target="_blank">View</a>
                    <% } else { %>
                        N/A
                    <% } %>
                </td>
                <td>
                    <% if (image != null && !image.isEmpty()) { %>
                        <img src="uploads/<%= image %>" alt="Profile" width="50" height="50" />
                    <% } else { %>
                        N/A
                    <% } %>
                </td>
                <td>
                    <button class="btn edit-btn">Edit</button>
                    <button class="btn delete-btn">Delete</button>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='12'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            %>
            </table>
            <button class="add-btn" onclick="location.href='addstudentform.jsp'">Add New Student</button>

        </div>
    </div>
</body>
</html>             
