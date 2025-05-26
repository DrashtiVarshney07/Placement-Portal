<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Add Student - Banasthali Vidyapith</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
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
            max-width: 800px;
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

        .form-control {
            margin-bottom: 15px;
            height: 45px;
            font-size: 15px;
        }

        .btn-submit {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            background-color: #0d6efd;
            border: none;
            color: white;
            border-radius: 5px;
        }

        .btn-submit:hover {
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
    <h2>Admin Dashboard</h2>
    <ul>
         <li><a href="admin.jsp">Admin Dashboard</a></li>
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
    <div class="form-box">
        <h2>Add New Student</h2>
        <form action="addstudentprocess.jsp" method="post" enctype="multipart/form-data">

            <input type="text" name="student_id" class="form-control" placeholder="Student ID" required/>
            <input type="text" name="name" class="form-control" placeholder="Full Name" required/>
            <input type="email" name="bnsmail" class="form-control" placeholder="Banasthali Mail ID" required/>
            <input type="password" name="password" class="form-control" placeholder="Password" required/>
            <input type="date" name="dob" class="form-control" placeholder="Date of Birth" required/>
            <input type="text" name="fathers_name" class="form-control" placeholder="Father's Name" required/>
            <input type="text" name="mothers_name" class="form-control" placeholder="Mother's Name" required/>
            <input type="text" name="course_id" class="form-control" placeholder="Course ID" required/>
            <input type="text" name="session" class="form-control" placeholder="Session (e.g., 2022-26)" required/>
            <input type="text" name="contact" class="form-control" placeholder="Contact Number" required/>
            <label>Upload Resume:</label>
            <input type="file" name="resume" class="form-control" accept="application/pdf" placeholder="Upload Resume:" required/>
            <label>Upload Image:</label>
            <input type="file" name="image" class="form-control" accept="image/*" required>

            <input type="submit" class="btn btn-submit" value="Add Student">
        </form>
    </div>
</div>

</body>
</html>
