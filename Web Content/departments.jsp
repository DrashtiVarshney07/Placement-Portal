<%-- 
    Document   : departments
    Created on : Apr 6, 2025, 12:24:14 AM
    Author     : pragy
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Departments | Banasthali Vidyapith  </title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        body {
            background: linear-gradient(to bottom, #a6dcef, #ffffff);
            color: #333;
        }
        .navbar {
            width: 100vw;
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
        .main-content {
            margin-top: 110px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .departments-container {
            background: #ffffff;
            width: 90%;
            max-width: 1000px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .departments-container h1 {
            color: #1565c0;
            font-size: 32px;
            margin-bottom: 20px;
        }
        .departments-container .dept {
            margin-bottom: 20px;
            text-align: left;
        }
        .departments-container .dept h3 {
            color: #0d47a1;
            font-size: 22px;
            margin-bottom: 5px;
        }
        .departments-container .dept p {
            font-size: 17px;
            line-height: 1.6;
        }
        .btn-visit {
            background-color: #1565c0;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            margin-top: 20px;
            display: inline-block;
        }
        .btn-visit:hover {
            background-color: #0d47a1;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo">
            <img src="images/bv.jpeg" alt="College Logo" />
            <span>Banasthali Vidyapith Placement Portal </span>
        </div>
        <ul class="links">
            <li><a href="frontpg.jsp">Home</a></li>
            <li><a href="aboutUs.jsp">About Us</a></li>
            <li><a href="admissions.jsp">Admissions</a></li>
            <li><a href="#" style="color: #ffeb3b;">Departments</a></li>
            <li><a href="placement.jsp">Placements</a></li>
            <li><a href="contactUs.jsp">Contact</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="departments-container">
            <h1>Departments at Banasthali Vidyapith</h1>
<div class="dept">
                <h3>1. Computer Science</h3>
                <p>Offers modern courses in software engineering, data science, AI, and more. Equipped with high-end labs and coding environments. Faculty engage in cutting-edge research to keep students industry-ready.</p>
            </div>

            <div class="dept">
                <h3>2. Chemical Engineering</h3>
                <p>Focuses on chemical process industries, environmental engineering, and research-based learning with pilot plant models. Real-time industrial exposure is provided through internships and training. Emphasis on sustainable technologies and green engineering.</p>
            </div>

            <div class="dept">
                <h3>3. Journalism and Mass Communication</h3>
                <p>Builds practical skills in media production, digital journalism, PR, and content creation through hands-on studio sessions. Students gain real-time newsroom experience. Strong focus on ethics and global media trends.</p>
            </div>

            <div class="dept">
                <h3>4. Pharmacy</h3>
                <p>Prepares students in pharmaceutical sciences, drug discovery, and healthcare research with cutting-edge facilities. Training includes industry visits and regulatory practices. High-quality lab infrastructure aids experiential learning.</p>
            </div>

            <div class="dept">
                <h3>5. Education</h3>
                <p>Provides advanced training for future educators with modern pedagogical tools and in-classroom experience. Encourages innovation in teaching techniques. Offers both theoretical and practical understanding of child psychology.</p>
            </div>

            <div class="dept">
                <h3>6. Performing Arts</h3>
                <p>Celebrates cultural heritage with specializations in music, dance, and theater arts under experienced faculty. Students participate in national-level performances. The department blends classical forms with contemporary styles.</p>
            </div>

            <div class="dept">
                <h3>7. Economics</h3>
                <p>Imparts analytical thinking, policy understanding, and economic research through practical and theoretical training. Prepares students for civil services and think tanks. Offers real-world case studies and data interpretation skills.</p>
            </div>

            <div class="dept">
                <h3>8. Mathematics and Statistics</h3>
                <p>Known for mathematical modeling, data analytics, and problem-solving research in both pure and applied fields. Equips students for roles in research, analytics, and finance. Emphasizes logic building and algorithmic thinking.</p>
            </div>

            <div class="dept">
                <h3>9. Bioscience & Biotechnology</h3>
                <p>Combines biology and technology to explore molecular biology, genetics, and biotechnology with extensive lab work. Students contribute to real research publications. Focus on innovations in agriculture and healthcare.</p>
            </div>

            <div class="dept">
                <h3>10. Visual Arts</h3>
                <p>Focuses on artistic expression through painting, sculpture, and design with regular exhibitions and competitions. Encourages creativity using traditional and digital tools. Faculty includes renowned artists and designers.</p>
            </div>

           
            <a class="btn-visit" href="http://banasthali.org/banasthali/wcms/en/home/" target="_blank">Visit Banasthali Official Site</a>
        </div>
    </div>
</body>
</html>