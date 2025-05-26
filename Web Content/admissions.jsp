<%-- 
    Document   : admissions
    Created on : Apr 6, 2025, 12:11:12 AM
    Author     : pragy
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admissions | Banasthali Vidyapith</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        html, body {
    height: 100%;
}

body {
    background: linear-gradient(to bottom, #a6dcef, #ffffff);
    background-attachment: fixed;
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
        .admissions-container {
            background: #ffffff;
            width: 90%;
            max-width: 1000px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .admissions-container h1 {
            color: #1565c0;
            font-size: 32px;
            margin-bottom: 20px;
        }
        .admissions-container p {
            font-size: 18px;
            margin-bottom: 20px;
            line-height: 1.6;
        }
        .admissions-container ul {
            text-align: left;
            margin: 20px auto;
            padding-left: 20px;
            max-width: 700px;
        }
        .admissions-container ul li {
            font-size: 18px;
            margin-bottom: 10px;
        }
        .btn-apply {
            background-color: #1565c0;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            margin-top: 20px;
        }
        .btn-apply:hover {
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
            <li><a href="aboutUs.jsp">About Us</a></li>
            <li><a href="#" style="color: #ffeb3b;">Admissions</a></li>
            <li><a href="placement.jsp">Placements</a></li>
            <li><a href="contactUs.jsp">Contact Us</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="admissions-container">
            <h1>Admissions at Banasthali Vidyapith</h1>
            <p>
                Banasthali Vidyapith is more than just a university – it's a place where women are empowered to lead, innovate, and make an impact.
                We welcome students from all walks of life to join our mission in shaping a better tomorrow.
            </p>
            <h2>Benefits of Joining Banasthali:</h2>
            <ul>
                <li>Holistic education fostering leadership, creativity, and innovation</li>
                <li>Top-ranked university with NAAC 'A++' accreditation</li>
                <li>State-of-the-art infrastructure and research facilities</li>
                <li>Highly qualified faculty and industry-aligned curriculum</li>
                <li>Strong placement cell with top recruiters like TCS, Infosys, Accenture</li>
                <li>Beautiful, eco-friendly, and safe residential campus</li>
            </ul>
            <a class="btn-apply" href=" http://banasthali.org/banasthali/wcms/en/home/ " target="_blank">Apply Now</a>
        </div>
    </div>
</body>
</html>