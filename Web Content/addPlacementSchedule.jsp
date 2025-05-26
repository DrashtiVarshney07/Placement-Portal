<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Placement Schedule</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

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
            margin-top: 60px;
        }

        .form-box {
            width: 100%;
            max-width: 700px;
            background-color: white;
            padding: 35px;
            margin: 0 auto;
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(0,0,0,0.1);
        }

        .form-box h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #0d6efd;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            margin-top: 18px;
        }

        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        textarea {
            resize: vertical;
        }

        button {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            background-color: #0d6efd;
            border: none;
            color: white;
            border-radius: 5px;
            margin-top: 20px;
        }

        button:hover {
            background-color: #084dbf;
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
    <h2>Admin Portal</h2>
    <ul>
        <li><a href="admin.jsp">Admin Dashboard</a></li>
            <li><a href="noticeboard.jsp">Notice Board</a></li>
            <li><a href="feedbackReply.jsp">Query Box</a></li>
            <li><a href="addStudent.jsp">List of Students</a></li>
            <li><a href="student_application_admin.jsp">Student Placement Status</a></li>
            <li><a href="modifyPlacement.jsp">List of Placements</a></li>
            <li><a href="#">Placement Schedule</a></li>
            <li><a href="addalumni.jsp">List of Alumni</a></li>
            <li><a href="loginAdmin.jsp">LogOut</a></li>
    </ul>
</div>

<div class="main-content">
    <div class="form-box">
        <h2>Add Placement Schedule</h2>
        <form action="addPlacementScheduleProcess.jsp" method="post">
            <label for="placement_id">Placement Drive:</label>
            <select name="placement_id" required>
                <option value="">-- Select Placement --</option>
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT placement_id, domain FROM placement");
                        while(rs.next()) {
                %>
                            <option value="<%= rs.getInt("placement_id") %>">
                                <%= rs.getInt("placement_id") %> - <%= rs.getString("domain") %>
                            </option>
                <%
                        }
                        rs.close();
                        stmt.close();
                        con.close();
                    } catch(Exception e) {
                        out.println("Error: " + e.getMessage());
                    }
                %>
            </select>

            <label for="round_no">Round Number:</label>
            <input type="number" name="round_no" min="1" required>

            <label for="round_name">Round Name:</label>
            <input type="text" name="round_name" required>

            <label for="scheduled_date">Scheduled Date & Time:</label>
            <input type="datetime-local" name="scheduled_date" required>

            <label for="venue">Venue:</label>
            <input type="text" name="venue">

            <label for="remarks">Remarks:</label>
            <textarea name="remarks" rows="4"></textarea>

            <button type="submit">Add Schedule</button>
        </form>
    </div>
</div>
</body>
</html>
