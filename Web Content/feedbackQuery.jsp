<%-- 
    Document   : feedbackQuery
    Created on : Mar 22, 2025, 11:51:10 PM
    Author     : pragy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");

    if (name != null && email != null && message != null) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", ""); // Change password if needed

            String sql = "INSERT INTO feedback (name, email, query) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, message);

            int rows = pstmt.executeUpdate();
            if (rows > 0) {
%>
<script>alert("Your query/feedback has been submitted successfully!");</script>
<%
            } else {
%>
<script>alert("Failed to submit feedback. Please try again.");</script>
<%
            }
        } catch (Exception e) {
%>
<script>alert("Error: <%= e.getMessage() %>");</script>
<%
            e.printStackTrace();
        } finally {
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Query & Feedback - University Placement Portal</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Arial', sans-serif;
                background: linear-gradient(to bottom, #a6dcef, #ffffff);
                background-repeat: no-repeat;
                background-size: cover;
                height: 100vh;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                color: #fff;
            }

            .navbar {
                width: 100%;
                background-color: #1565c0;
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 15px 20px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
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
                margin: 0;
                padding: 0;
            }

            .navbar .links li {
                display: inline;
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

            .content {
                display: flex;
                justify-content: space-between;
                width: 80%;
                margin-top: 100px;
            }

            .form-container, .faq-container {
                background-color: #ffffff;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                padding: 40px;
                width: 48%;
            }

            .form-container h1, .faq-container h2 {
                color: #1565c0;
                margin-bottom: 20px;
                font-size: 28px;
                text-align: center;
            }

            .faq {
                text-align: left;
                margin-bottom: 15px;
            }

            .faq strong {
                color: #1565c0;
            }
            
            .faq p {
                color: #333; 
                margin-top: 5px;
                display: block;
            }


            .form-container input[type="text"],
            .form-container input[type="email"],
            .form-container textarea {
                width: 100%;
                padding: 15px;
                margin: 10px 0;
                border-radius: 5px;
                border: 1px solid #ddd;
                font-size: 16px;
                color: #555;
                transition: border-color 0.3s;
            }

            .form-container input[type="submit"] {
                width: 100%;
                padding: 15px;
                background-color: #1565c0;
                color: #fff;
                border: none;
                font-size: 18px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .form-container input[type="submit"]:hover {
                background-color: #003c8f;
            }

            .footer {
                margin-top: 20px;
                color: #888;
                font-size: 12px;
                text-align: center;
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

        <div class="content">
            <div class="form-container">
                <h1>Query & Feedback</h1>
                <p class="welcome">We value your feedback. Please leave your query or suggestion below.</p>
                <form method="POST" action="">
                    <input type="text" name="name" placeholder="Your Name" required />
                    <input type="email" name="email" placeholder="Your Email" required />
                    <textarea name="message" placeholder="Enter your query or feedback here..." rows="5" required></textarea>
                    <input type="submit" value="Submit" />
                </form>
            </div>

            <div class="faq-container">
                <h2>Frequently Asked Questions</h2>
                <div class="faq">
                    <strong>Q: How can I apply for campus placements?</strong>
                    <p>A: You can apply through the Placement Portal under the 'Placements' section.</p>
                </div>
                <div class="faq">
                    <strong>Q: What documents are required for placement registration?</strong>
                    <p>A: You need a resume, college ID, and academic transcripts.</p>
                </div>
                <div class="faq">
                    <strong>Q: Whom should I contact for placement-related queries?</strong>
                    <p>A: You can reach out to the placement cell via the 'Contact' page.</p>
                </div>
            </div>
        </div>

        <div class="footer">&copy; 2025 University Placement Portal | Query & Feedback</div>
    </body>
</html>

