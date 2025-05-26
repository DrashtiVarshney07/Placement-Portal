<%-- 
    Document   : placement
    Created on : Apr 6, 2025, 1:00:46 AM
    Author     : pragy
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Placements | Banasthali Vidyapith</title>
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
        .placements-container {
            background: #ffffff;
            width: 90%;
            max-width: 1000px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .placements-container h1 {
            color: #1565c0;
            font-size: 32px;
            margin-bottom: 20px;
        }
        .placements-container p {
            font-size: 18px;
            line-height: 1.6;
            margin-bottom: 20px;
            text-align: left;
        }
        .companies-list {
            list-style-type: square;
            padding-left: 40px;
            margin-top: 10px;
            margin-bottom: 20px;
            text-align: left;
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
            <span>Banasthali Vidyapith Placement Portal</span>
        </div>
        <ul class="links">
            <li><a href="frontpg.jsp">Home</a></li>
            <li><a href="aboutUs.jsp">About Us</a></li>
            <li><a href="admissions.jsp">Admissions</a></li>
            <li><a href="departments.jsp">Departments</a></li>
            <li><a href="#" style="color: #ffeb3b;">Placements</a></li>
            <li><a href="contactUs.jsp">Contact</a></li>
        </ul>
    </div>

<div class="main-content">
    <div class="placements-container">
        <h1 style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-size: 36px; color: #2c3e50;">
             Placement Highlights at Banasthali Vidyapith
        </h1>
 <p style="font-family: 'Georgia', serif; font-size: 18px; color: #34495e;">
                At <strong>Banasthali Vidyapith</strong>, we believe that true education culminates in real-world impact. 
                Our consistent placement record is a testament to the industry-ready skills, resilience, and brilliance of our students.
            </p>
 <p style="font-family: 'Georgia', serif; font-size: 18px; color: #34495e;">
                <strong> Last Year’s Placement Overview:</strong>
        <div style="animation: floatLeftToRight 5s ease-in-out infinite alternate;">
           
            
              <ul style="list-style-type: none; margin-left: 30px; font-family: 'Georgia', serif; padding-left: 0;">
    <li style="margin-bottom: 8px;"><strong>200+ Companies</strong> visited our campus</li>
    <li style="margin-bottom: 8px;"><strong>85%+</strong> placement rate across disciplines</li>
    <li style="margin-bottom: 8px;"><strong>₹10 LPA</strong> highest package offered</li>
    <li style="margin-bottom: 8px;"><strong>₹4.5 LPA</strong> average package across roles</li>
</ul>

            </p>
        </div>

        <p style="font-family: 'Georgia', serif; font-size: 18px; color: #34495e;">
            <strong> Our Esteemed Recruiters:</strong>
        </p>
        <div style="display: flex; flex-wrap: wrap; gap: 12px; font-family: 'Verdana', sans-serif; font-size: 16px; margin-left: 30px;">
            <span style="background: #f0f0f0; padding: 6px 12px; border-radius: 5px;">Tata Consultancy Services (TCS)</span>
            <span style="background: #f0f0f0; padding: 6px 12px; border-radius: 5px;">Wipro Technologies</span>
            <span style="background: #f0f0f0; padding: 6px 12px; border-radius: 5px;">Infosys</span>
            <span style="background: #f0f0f0; padding: 6px 12px; border-radius: 5px;">Accenture</span>
            <span style="background: #f0f0f0; padding: 6px 12px; border-radius: 5px;">Deloitte</span>
            <span style="background: #f0f0f0; padding: 6px 12px; border-radius: 5px;">Cognizant</span>
            <span style="background: #f0f0f0; padding: 6px 12px; border-radius: 5px;">IBM</span>
            <span style="background: #f0f0f0; padding: 6px 12px; border-radius: 5px;">ICICI Bank</span>
            <span style="background: #f0f0f0; padding: 6px 12px; border-radius: 5px;">HDFC Life</span>
            <span style="background: #f0f0f0; padding: 6px 12px; border-radius: 5px;">ZS Associates</span>
        </div>

        <p style="font-family: 'Georgia', serif; font-size: 18px; color: #34495e;">
            Our dedicated <strong>Training and Placement Cell</strong> offers rigorous training programs including:
            <em>mock interviews, resume crafting, aptitude prep, and soft skills workshops</em>, ensuring every student is well-prepared to shine.
        </p>

        <p style="font-family: 'Georgia', serif; font-size: 18px; color: #34495e;">
            Students from a variety of domains like <strong>Engineering, Management, Sciences, Arts</strong> and more have 
            launched successful careers in top-tier firms both in India and abroad.
        </p>

        <a class="btn-visit" href="http://banasthali.org/banasthali/wcms/en/home/" target="_blank" 
           style="display: inline-block; margin-top: 20px; padding: 10px 20px; background-color:#1565c0 ; color: #fff; text-decoration: none; font-weight: bold; border-radius: 5px;">
             Visit Banasthali Vidyapith
        </a>
    </div>
</div>

<style>
@keyframes floatLeftToRight {
  0% { transform: translateX(0); }
  100% { transform: translateX(20px); }
}
</style>

    
</body>
</html>
