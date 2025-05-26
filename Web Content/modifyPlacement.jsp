<%@ page import="java.sql.*" %>
<%
        String adminId = (String) session.getAttribute("admin_id");
    if (adminId == null) {
        response.sendRedirect("loginAdmin.jsp?error=sessionExpired");
        return;
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
    max-width: 100%; /* Optional */
    width: calc(100% - 300px); /* Expanded width */
}

.container {
    margin-top: 20px;
    background: #ffffff;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    width: 100%; /* Full width */
    overflow-x: auto; /* Optional: makes the table scrollable on smaller screens */
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
            padding: 8px 12px;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            border: none;
        }

       
    .edit-button {
        background-color: #4CAF50;
        color: white;
        padding: 4px 10px;
        border: none;
        border-radius: 5px;
        text-decoration: none;
        margin-left: 5px;
    }


.delete-button {
            background-color: red;
            color: white;
            padding: 4px 10px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
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
        <h2>Admin Dashboard</h2>
        <ul>
             <li><a href="admin.jsp">Admin Dashboard</a></li>
            <li><a href="noticeboard.jsp">Notice Board</a></li>
            <li><a href="feedbackReply.jsp">Query Box</a></li>
            <li><a href="addStudent.jsp">List of Students</a></li>
            <li><a href="student_application_admin">Student Placement Status</a></li>
            <li><a href="#">List of Placements</a></li>
            <li><a href="addPlacementSchedule.jsp">Placement Schedule</a></li>
            <li><a href="addalumni.jsp">List of Alumni</a></li>
            <li><a href="loginAdmin.jsp">LogOut</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="container">
            <h1>Placement Management</h1>
            <h2>List of Placements</h2>
            <table>
    <tr>
        <th>ID</th>
        <th>Company ID</th>
        <th>Domain</th>
        <th>Drive Date</th>
        <th>No. of Openings</th>
        <th>Min CGPA</th>
        <th>Allowed Backlog</th>
        <th>Eligible Courses</th>
        <th>Eligible Branches</th>
        <th>Aptitude Test</th>
        <th>Coding Test</th>
        <th>Interview Rounds</th>
        <th>CTC</th>
        <th>Operations</th>
    </tr>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM placement");
    while(rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("placement_id") %></td>
        <td><%= rs.getInt("company_id") %></td>
        <td><%= rs.getString("domain") %></td>
        <td><%= rs.getDate("drive_Date") %></td>
        <td><%= rs.getInt("no_of_openiing") %></td>
        <td><%= rs.getDouble("min_cgpa") %></td>
        <td><%= rs.getInt("allowed_backlog") %></td>
        <td><%= rs.getString("eligible_courses") %></td>
        <td><%= rs.getString("eligible_branches") %></td>
        <td><%= rs.getInt("aptitude_test") %></td>
        <td><%= rs.getInt("coding_test") %></td>
        <td><%= rs.getInt("interview_Rounds") %></td>
        <td><%= rs.getDouble("ctc") %></td>
        <td>
    <div style="display: flex; flex-direction: column; gap: 8px; align-items: center;">
        <a class="delete-button" href="deletePlacement.jsp?placement_id=<%= rs.getInt("placement_id") %>" 
           onclick="return confirm('Are you sure you want to delete this placement?');">
           Delete
        </a>
        <a class="edit-button" href="editPlacement.jsp?placement_id=<%= rs.getInt("placement_id") %>">Edit</a>
    </div>
</td>
 </tr>
<%
    }
    con.close();
%>
</table>

            <a href="addCompany.jsp"><button class="add-btn">Add New Placement</button></a>

        </div>
    </div>
</body>
</html>
