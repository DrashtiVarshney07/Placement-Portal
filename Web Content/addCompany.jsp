<%-- 
    Document   : addCompany
    Created on : Apr 15, 2025, 4:40:57 PM
    Author     : pragy
--%>

<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%--<%@ page session="true" %>--%>
<%
   String adminId = (String) session.getAttribute("admin_id");
    if(adminId == null){
       response.sendRedirect("loginAdmin.jsp");
         return;
   }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Company</title>
    <link rel="stylesheet" href="css/style.css">
    <script>
        function validateForm() {
            var name = document.forms["companyForm"]["c_name"].value.trim();
            var address = document.forms["companyForm"]["address"].value.trim();
            var industry = document.forms["companyForm"]["industry_type"].value;

            if (name === "" || address === "" || industry === "") {
                alert("Please fill all the fields properly.");
                return false;
            }
            return true;
        }
    </script>
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
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background: #f4f4f4;
            border-radius: 10px;
        }
        .form-container h2 {
            text-align: center;
        }
        .form-container input, .form-container select, .form-container textarea {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .form-container button {
            width: 200px; 
            padding: 10px;
            background: #4285f4;
            color: white;
            border: none;
            border-radius: 5px;
            display: block;
            margin: 0 auto; 
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

    <div class="form-container">
        <h2>Add Company Details</h2><br>
        <form name="companyForm" action="addCompanyProcess.jsp" method="post" onsubmit="return validateForm();">
            <label>Company Name:</label>
            <input type="text" name="c_name" placeholder="Enter company name" required="">

            <label>Company Address:</label>
            <textarea name="address" rows="4" placeholder="Enter full address" required=""></textarea>

            <label>Industry Type:</label>
            <select name="industry_type" required="">
                <option value="">Select</option>
                <option>IT</option>
                <option>Finance</option>
                <option>Healthcare</option>
                <option>Manufacturing</option>
                <option>Consulting</option>
                <option>Others</option>
            </select>

            <button type="submit">Add Company</button>
        </form>
    </div>
</body>
</html>
