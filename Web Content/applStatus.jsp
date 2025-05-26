<%@ page import="java.sql.*" %>
<%
    String studentId = (String) session.getAttribute("student_id");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Application Status - Banasthali Vidyapith</title>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        <%-- Same CSS as profileStudent.jsp --%>
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #333;
            padding: 10px;
            text-align: center;
            background-color: #f9f9f9;
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
        <h2>Student Portal</h2>
        <ul>
            <li><a href="studdash.jsp">Dashboard</a></li>
            <li><a href="profileStudent.jsp">Student Profile</a></li>
            <li><a href="#">Company Application Status</a></li>
            <li><a href="stats.jsp">Previous Year Stats</a></li>
            <li><a href="alumniPortal.jsp">Alumni Contact</a></li>
            <li><a href="login.jsp">Logout</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="heading">COMPANY APPLICATION STATUS</div>
        <table>
            <tr>
                <th>Student Name</th>
                <th>Company Name</th>
                <th>Round</th>
                <th>Status</th>
            </tr>
            <%
                if (studentId != null) {
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");
                        String sql = "SELECT s.name AS student_name, c.c_name AS company_name, a.round_no, a.current_status " +
                                     "FROM application_status a " +
                                     "JOIN student s ON a.student_id = s.student_id " +
                                     "JOIN placement p ON a.placement_id = p.placement_id " +
                                     "JOIN company c ON p.company_id = c.company_id " +
                                     "WHERE a.student_id = ?";
                        PreparedStatement ps = con.prepareStatement(sql);
                        ps.setString(1, studentId);
                        ResultSet rs = ps.executeQuery();

                        while (rs.next()) {
                            String sname = rs.getString("student_name");
                            String cname = rs.getString("company_name");
                            int round = rs.getInt("round_no");
                            String status = rs.getString("current_status");
            %>
            <tr>
                <td><%= sname %></td>
                <td><%= cname %></td>
                <td>Round <%= round %></td>
                <td><%= status %></td>
            </tr>
            <%
                        }

                        rs.close();
                        ps.close();
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            %>
        </table>
    </div>
</body>
</html>
