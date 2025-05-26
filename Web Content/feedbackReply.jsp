<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin - Feedback & Queries</title>
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
            margin-left: 280px;
            padding: 30px;
            margin-top: 80px;
        }
                .main-content h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .feedback-list {
            max-width: 800px;
            margin: 0 auto;
        }

        .feedback-item {
            background-color: #ffffff;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
        }

        .reply-box {
            margin-top: 10px;
            display: flex;
            gap: 10px;
            flex-direction: column;
        }

        .reply-box textarea {
            width: 100%;
            height: 60px;
            padding: 10px;
            font-size: 14px;
            border-radius: 5px;
            border: 1px solid #ccc;
            resize: vertical;
        }

        .reply-box button {
            align-self: flex-end;
            padding: 8px 16px;
            background-color: #1565c0;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .reply-box button:hover {
            background-color: #0d47a1;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo">
            <img src="images/bv.jpeg" alt="College Logo" />
            <span>Admin Panel - Feedback & Queries</span>
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
            <li><a href="#">Query Box</a></li>
            <li><a href="addStudent.jsp">List of Students</a></li>
            <li><a href="modifyPlacement.jsp">List of Placements</a></li>
            <li><a href="addPlacementSchedule.jsp">Placement Schedule</a></li>
            <li><a href="addalumni.jsp">List of Alumni</a></li>
            <li><a href="loginAdmin.jsp">LogOut</a></li>
        </ul>
    </div>

    <div class="main-content">
        <h2>Received Queries & Feedback</h2>
        <div class="feedback-list">
            <%
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");
                    String sql = "SELECT * FROM feedback ORDER BY submitted_at DESC";
                    ps = conn.prepareStatement(sql);
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        String name = rs.getString("name");
                        String email = rs.getString("email");
                        String query = rs.getString("query");
                        Timestamp submittedAt = rs.getTimestamp("submitted_at");
            %>
                <div class="feedback-item">
                    <strong>Name:</strong> <%= name %><br>
                    <strong>Email:</strong> <%= email %><br>
                    <strong>Message:</strong> <%= query %><br>
                    <small><em>Submitted on: <%= submittedAt %></em></small>

                    <form class="reply-box" method="post" action="sendReply.jsp">
                        <textarea name="reply" placeholder="Write a reply..." required></textarea>
                        <input type="hidden" name="email" value="<%= email %>" />
                        <input type="hidden" name="name" value="<%= name %>" />
                        <button type="submit">Send Reply</button>
                    </form>
                </div>
            <%
                    }
                } catch (Exception e) {
                    out.println("<p style='color:red;'>Error fetching feedback: " + e.getMessage() + "</p>");
                    e.printStackTrace();
                } finally {
                    try { if (rs != null) rs.close(); } catch (Exception e) {}
                    try { if (ps != null) ps.close(); } catch (Exception e) {}
                    try { if (conn != null) conn.close(); } catch (Exception e) {}
                }
            %>
        </div>
    </div>
</body>
</html>
