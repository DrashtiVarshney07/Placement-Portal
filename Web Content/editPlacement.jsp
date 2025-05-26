<%@ page import="java.sql.*" %>
<%
    int placementId = Integer.parseInt(request.getParameter("placement_id"));
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String domain = "", driveDate = "", eligibleCourses = "", eligibleBranches = "";
    int companyId = 0, openings = 0, backlog = 0, rounds = 0;
    double cgpa = 0.0, ctc = 0.0;
    boolean aptitude = false, coding = false;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");

        ps = con.prepareStatement("SELECT * FROM placement WHERE placement_id=?");
        ps.setInt(1, placementId);
        rs = ps.executeQuery();

        if(rs.next()) {
            companyId = rs.getInt("company_id");
            domain = rs.getString("domain");
            driveDate = rs.getString("drive_Date");
            openings = rs.getInt("no_of_openiing");
            cgpa = rs.getDouble("min_cgpa");
            backlog = rs.getInt("allowed_backlog");
            eligibleCourses = rs.getString("eligible_courses");
            eligibleBranches = rs.getString("eligible_branches");
            aptitude = rs.getBoolean("aptitude_test");
            coding = rs.getBoolean("coding_test");
            rounds = rs.getInt("interview_Rounds");
            ctc = rs.getDouble("ctc");
        }
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Placement - Banasthali Vidyapith</title>
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
            width: calc(100% - 300px);
        }

        .container {
            background: #ffffff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            font-size: 28px;
            margin-bottom: 20px;
            color: #333;
        }

        form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        form input[type="text"],
        form input[type="number"],
        form input[type="date"] {
            width: 100%;
            padding: 8px 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        form label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        .full-width {
            grid-column: 1 / -1;
        }

        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        input[type="submit"] {
            background-color: #1565c0;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            grid-column: 1 / -1;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #0d47a1;
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
            <li><a href="modifyPlacement.jsp">List of Placements</a></li>
            <li><a href="addPlacementSchedule.jsp">Placement Schedule</a></li>
            <li><a href="addalumni.jsp">List of Alumni</a></li>
            <li><a href="loginAdmin.jsp">LogOut</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="container">
            <h1>Edit Placement Details</h1>
            <form action="updatePlacement.jsp" method="post">
                <input type="hidden" name="placement_id" value="<%= placementId %>" />

                <div>
                    <label>Company ID:</label>
                    <input type="number" name="company_id" value="<%= companyId %>" required />
                </div>

                <div>
                    <label>Domain:</label>
                    <input type="text" name="domain" value="<%= domain %>" required />
                </div>

                <div>
                    <label>Drive Date:</label>
                    <input type="date" name="drive_Date" value="<%= driveDate %>" required />
                </div>

                <div>
                    <label>Openings:</label>
                    <input type="number" name="no_of_openiing" value="<%= openings %>" required />
                </div>

                <div>
                    <label>Min CGPA:</label>
                    <input type="number" step="0.01" name="min_cgpa" value="<%= cgpa %>" required />
                </div>

                <div>
                    <label>Allowed Backlogs:</label>
                    <input type="number" name="allowed_backlog" value="<%= backlog %>" required />
                </div>

                <div>
                    <label>Eligible Courses:</label>
                    <input type="text" name="eligible_courses" value="<%= eligibleCourses %>" required />
                </div>

                <div>
                    <label>Eligible Branches:</label>
                    <input type="text" name="eligible_branches" value="<%= eligibleBranches %>" required />
                </div>

                <div class="checkbox-group">
                    <label>Aptitude Test:</label>
                    <input type="checkbox" name="aptitude_test" <%= aptitude ? "checked" : "" %> />
                </div>

                <div class="checkbox-group">
                    <label>Coding Test:</label>
                    <input type="checkbox" name="coding_test" <%= coding ? "checked" : "" %> />
                </div>

                <div>
                    <label>Interview Rounds:</label>
                    <input type="number" name="interview_Rounds" value="<%= rounds %>" required />
                </div>

                <div>
                    <label>CTC:</label>
                    <input type="number" step="0.01" name="ctc" value="<%= ctc %>" required />
                </div>

                <input type="submit" value="Update Placement" />
            </form>
        </div>
    </div>
</body>
</html>
