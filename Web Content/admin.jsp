<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%
    String adminId = (String) session.getAttribute("admin_id");
    if (adminId == null) {
        response.sendRedirect("loginAdmin.jsp?error=sessionExpired");
        return;
    }
    String name = "", email = "", department = "", contact = "", yearOfJoining = "", imagePath = "";
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");
        PreparedStatement ps = con.prepareStatement("SELECT name, email, department, contact, year_of_joining, image FROM admin WHERE admin_id = ?");
        ps.setString(1, adminId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            name = rs.getString("name");
            email = rs.getString("email");
            department = rs.getString("department");
            contact = rs.getString("contact");
            yearOfJoining = rs.getString("year_of_joining");
            imagePath = rs.getString("image");
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
    <title>Admin Details - Placement Management</title>
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
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 80%;
            margin: 0 auto;
        }

        .container h2 {
            color: #1565c0;
            margin-bottom: 20px;
        }

        .admin-info {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .admin-info img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
        }

        .admin-info p {
            font-size: 18px;
            color: #333;
            margin-bottom: 10px;
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
        <p style="text-align:center;">Dept: <%= department %></p>
        <ul>
            <li><a href="#">Admin Dashboard</a></li>
            <li><a href="noticeboard.jsp">Notice Board</a></li>
            <li><a href="feedbackReply.jsp">Query Box</a></li>
            <li><a href="addStudent.jsp">List of Students</a></li>
            <li><a href="modifyPlacement.jsp">List of Placements</a></li>
            <li><a href="addPlacementSchedule.jsp">Placement Schedule</a></li>
            <li><a href="addalumni.jsp">List of Alumni</a></li>
            <li><a href="loginAdmin.jsp">LogOut</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="container">
            <h2>Admin Details</h2>
            <div class="admin-info">
                <img src="<%= imagePath %>" alt="Admin Image" />
                <p><strong>Name:</strong> <%= name %></p>
                <p><strong>Email:</strong> <%= email %></p>
                <p><strong>Department:</strong> <%= department %></p>
                <p><strong>Contact:</strong> <%= contact %></p>
                <p><strong>Year of Joining:</strong> <%= yearOfJoining %></p>
            </div>
        </div>
    </div>
</body>
</html>
