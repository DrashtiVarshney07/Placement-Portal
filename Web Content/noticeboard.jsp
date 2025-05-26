<%-- 
    Document   : adminDashboard
    Created on : Apr 5, 2025, 11:18:09 PM
    Author     : pragy
--%>

<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%
     
    String adminId = (String) session.getAttribute("admin_id");
    if (adminId == null) {
        response.sendRedirect("loginAdmin.jsp?error=sessionExpired");
        return;
    }
    String name = "", department = "";
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");
        PreparedStatement ps = con.prepareStatement("SELECT name, department FROM admin WHERE admin_id = ?");
        ps.setString(1, adminId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            name = rs.getString("name");
            department = rs.getString("department");
        }
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
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
            display: flex;
            justify-content: space-between;
        }

        .box {
            width: 48%;
            background: #ffffff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
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
            <li><a href="Placements.jsp">Placements</a></li>
        </ul>
    </div>

    <div class="sidebar">
        <h2>Welcome, <%= name %></h2>
        <p style="text-align:center;">Department: <%= department %></p>
        <ul>
            <li><a href="admin.jsp">Admin Dashboard</a></li>
            <li><a href="#">Notice Board</a></li>
            <li><a href="feedbackReply.jsp">Query Box</a></li>
            <li><a href="addStudent.jsp">List of Students</a></li>
            <li><a href="modifyPlacement.jsp">List of Placements</a></li>
            <li><a href="loginAdmin.jsp">LogOut</a></li>
            
        </ul>
    </div>

    <div class="main-content">
        <div class="container">
            <div class="box">
                <h2>Published Notices</h2>
                <table>
                    <tr>
                        <th>Title</th>
                        <th>Category</th>
                        <th>Date</th>
                    </tr>
                    <%-- You can fetch real notices from DB here --%>
                    <tr>
                        <td>Welcome Notice</td>
                        <td>General</td>
                        <td><%= new java.util.Date() %></td>
                    </tr>
                </table>
            </div>
            
            <div class="box">
                <h2>Post a New Notice</h2>
                <form action="postNotice.jsp" method="post">
                    <input type="text" name="title" placeholder="Enter Notice Title" required style="width: 100%; padding: 8px; margin-bottom: 10px;">
                    <select name="category" style="width: 100%; padding: 8px; margin-bottom: 10px;">
                        <option value="Job Listing">Job Listing</option>
                        <option value="General">General</option>
                    </select>
                    <textarea name="description" placeholder="Enter Notice Description" required style="width: 100%; padding: 8px; margin-bottom: 10px;"></textarea>
                    <button type="submit" style="width: 100%; padding: 10px; background-color: #1565c0; color: white; border: none; cursor: pointer;">Post Notice</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
