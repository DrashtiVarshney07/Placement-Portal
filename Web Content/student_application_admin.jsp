<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Application Admin Panel</title>
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
            top: 0; left: 0;
            z-index: 1000;
            color: white;
        }
        .navbar .logo {
            display: flex;
            align-items: center;
        }
        .navbar .logo img {
            width: 50px; height: 50px; margin-right: 10px;
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
        h2 { text-align: center; color: #0d6efd; margin-bottom: 25px; }
        label {
            display: block;
            margin-top: 18px;
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button, input[type="submit"] {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            background-color: #0d6efd;
            border: none;
            color: white;
            border-radius: 5px;
        }
        button:hover, input[type="submit"]:hover {
            background-color: #084dbf;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ccc;
        }
        th {
            background-color: #1565c0;
            color: white;
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
            <li><a href="#">Student Placement Status</a></li>
            <li><a href="modifyPlacement.jsp">List of Placements</a></li>
            <li><a href="addPlacementSchedule.jsp">Placement Schedule</a></li>
            <li><a href="addalumni.jsp">List of Alumni</a></li>
            <li><a href="loginAdmin.jsp">LogOut</a></li>
    </ul>
</div>

<div class="main-content">
    <div class="form-box">
        <h2>Manage Student Applications</h2>

        <form method="get" action="student_application_admin.jsp">
            <label>Course:</label>
            <select name="course_id" required>
                <option value="">--Select--</option>
                <%
                    Connection conCourse = null;
                    PreparedStatement psCourse = null;
                    ResultSet rsCourse = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conCourse = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");
                        psCourse = conCourse.prepareStatement("SELECT course_id, course_name FROM course");
                        rsCourse = psCourse.executeQuery();

                        while (rsCourse.next()) {
                            String id = rsCourse.getString("course_id");
                            String name = rsCourse.getString("course_name");
                %>
                            <option value="<%= id %>"><%= name %> (<%= id %>)</option>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<option>Error loading courses</option>");
                    } finally {
                        if (rsCourse != null) rsCourse.close();
                        if (psCourse != null) psCourse.close();
                        if (conCourse != null) conCourse.close();
                    }
                %>
            </select>

            <label>Session:</label>
            <select name="session" required>
                <option value="">--Select--</option>
                <%
                    Connection conSession = null;
                    PreparedStatement psSession = null;
                    ResultSet rsSession = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conSession = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");
                        psSession = conSession.prepareStatement("SELECT DISTINCT session FROM student");
                        rsSession = psSession.executeQuery();

                        while (rsSession.next()) {
                            String sessionFromDb = rsSession.getString("session");
                %>
                            <option value="<%= sessionFromDb %>"><%= sessionFromDb %></option>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<option>Error loading sessions</option>");
                    } finally {
                        if (rsSession != null) rsSession.close();
                        if (psSession != null) psSession.close();
                        if (conSession != null) conSession.close();
                    }
                %>
            </select>

            <label>Company:</label>
            <select name="company_id" required>
                <option value="">--Select--</option>
                <%
                    Connection conCompany = null;
                    PreparedStatement psCompany = null;
                    ResultSet rsCompany = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conCompany = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");
                        psCompany = conCompany.prepareStatement("SELECT company_id, c_name FROM company");
                        rsCompany = psCompany.executeQuery();

                        while (rsCompany.next()) {
                            String id = rsCompany.getString("company_id");
                            String name = rsCompany.getString("c_name");
                %>
                            <option value="<%= id %>"><%= name %> (<%= id %>)</option>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<option>Error loading companies</option>");
                    } finally {
                        if (rsCompany != null) rsCompany.close();
                        if (psCompany != null) psCompany.close();
                        if (conCompany != null) conCompany.close();
                    }
                %>
            </select>

            <input type="submit" value="Next">
        </form>

        <%
    String courseId = request.getParameter("course_id");
    String sessionFromDb = request.getParameter("session");
    String companyId = request.getParameter("company_id");

    if (courseId != null && sessionFromDb != null && !courseId.isEmpty() && !sessionFromDb.isEmpty() && companyId != null && !companyId.isEmpty()) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");
            String sql = "SELECT student_id, name FROM student WHERE course_id = ? AND session = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, courseId);
            ps.setString(2, sessionFromDb);
            rs = ps.executeQuery();
%>
<h3>Applications for Company ID: <%= companyId %></h3>
<table>
    <tr>
        <th>Student ID</th>
        <th>Name</th>
        <th>Company</th>
        <th>Status</th>
        <th>Round</th>
        <th>Update Status</th>
    </tr>
<%
            while (rs.next()) {
                String studentId = rs.getString("student_id");
                PreparedStatement psApp = con.prepareStatement(
                    "SELECT a.application_id, c.c_name, a.current_status, a.round_no " +
                    "FROM application_status a JOIN company c ON a.placement_id = c.company_id " +
                    "WHERE a.student_id = ? AND c.company_id = ?");
                psApp.setString(1, studentId);
                psApp.setString(2, companyId);
                ResultSet rsApps = psApp.executeQuery();

                while (rsApps.next()) {
                    String status = rsApps.getString("current_status");

                    if (status.equals("0")) {
                        status = "Accepted";
                    } else if (status.equals("1")) {
                        status = "Rejected";
                    } else {
                        status = "Processing";
                    }
%>
<tr>
    <td><%= rs.getString("student_id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rsApps.getString("c_name") %></td>
    <td><%= status %></td>
    <td><%= rsApps.getInt("round_no") %></td>
    <td>
        <form action="update_status.jsp" method="get">
            <input type="hidden" name="student_id" value="<%= rs.getString("student_id") %>">
            <input type="hidden" name="company_id" value="<%= companyId %>">
            <select name="new_status" required>
                <option value="0" <%= status.equals("Accepted") ? "selected" : "" %>>Accepted</option>
                <option value="1" <%= status.equals("Rejected") ? "selected" : "" %>>Rejected</option>
                <option value="2" <%= status.equals("Processing") ? "selected" : "" %>>Processing</option>
            </select>
            <button type="submit">Update Status</button>
        </form>
    </td>
</tr>
<%
                }
            }
        %>
</table>
<%
        } catch(Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    }
%>

    </div>
</div>
</body>
</html>
