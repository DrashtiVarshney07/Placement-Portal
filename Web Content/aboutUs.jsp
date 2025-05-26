<%-- 
    Document   : aboutUs
    Created on : Apr 5, 2025, 11:21:19 PM
    Author     : pragy
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us | Banasthali Vidyapith</title>
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
        .about-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 90%;
            max-width: 1200px;
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            flex-wrap: wrap;
        }
        .about-text {
            flex: 1;
            padding-right: 30px;
        }
        .about-text h1 {
            color: #1565c0;
            font-size: 30px;
            margin-bottom: 15px;
        }
        .about-text p, .about-text li {
            font-size: 18px;
            line-height: 1.6;
            margin-bottom: 10px;
        }
        .about-text ul {
            margin-top: 10px;
            padding-left: 20px;
        }
        .slideshow-container {
            flex: 1;
            width: 320px;
            height: 220px;
            position: relative;
            overflow: hidden;
        }
        .slide {
            width: 100%;
            height: 100%;
            position: absolute;
            opacity: 0;
            transition: opacity 1s ease-in-out;
            cursor: pointer;
        }
        .slide img {
            width: 100%;
            height: 100%;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }
        .active {
            opacity: 1;
        }
        .alumni-container {
            width: 90%;
            max-width: 1200px;
            margin-top: 40px;
            text-align: center;
        }
        .alumni-container h2 {
            color: #1565c0;
            font-size: 28px;
        }
        .alumni-grid {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 20px;
        }
        .alumni-card {
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            width: 200px;
            text-align: center;
        }
        .alumni-card img {
            width: 100%;
            height: auto;
            border-radius: 8px;
            margin-bottom: 10px;
        }
        .alumni-card h3 {
            color: #1565c0;
            margin-bottom: 5px;
            font-size: 18px;
        }
        .alumni-card p {
            font-size: 14px;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo">
            <img src="images/bv.jpeg" alt="College Logo" />
            <span>Banasthali Vidyapith</span>
        </div>
        <ul class="links">
            <li><a href="frontpg.jsp">Home</a></li>
            <li><a href="placement.jsp">Placements</a></li>
            <li><a href="#" style="color: #ffeb3b;">About</a></li>
            <li><a href="contactUs.jsp">Contact</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="about-container">
            <div class="about-text">
                <h1>About Banasthali Vidyapith</h1>
                <p>
                    Established in 1935, Banasthali Vidyapith is one of India’s premier institutions dedicated to the education and empowerment of women. Offering a holistic approach to learning, the university fosters excellence in academics, research, and leadership, shaping students into global change-makers.
                </p>
                <h2>Why Choose Banasthali?</h2>
                <ul>
                    <li>Globally recognized women’s university.</li>
                    <li>Excellent academic and research programs.</li>
                    <li>Strong alumni network in leadership roles.</li>
                    <li>Focus on innovation and skill development.</li>
                </ul>
            </div>
            <div class="slideshow-container">
                <div class="slide active"><img src="images/campus1.jpg" alt="Campus View"></div>
                <div class="slide"><img src="images/career_fair.jpg" alt="Career Fair"></div>
                <div class="slide"><img src="images/alumni_meet.jpg" alt="Alumni Meet"></div>
            </div>
        </div>

        <div class="alumni-container">
            <h2>Our Famous Alumni</h2>
            <div class="alumni-grid">
                <div class="alumni-card">
                    <img src="images/alumni1.jpg" alt="Dr. Kiran Bedi">
                    <h3>Dr. Kiran Bedi</h3>
                    <p>Former Lieutenant Governor of Puducherry</p>
                </div>
                <div class="alumni-card">
                    <img src="images/alumni2.jpg" alt="Renu Khator">
                    <h3>Renu Khator</h3>
                    <p>Chancellor, University of Houston</p>
                </div>
            </div>
        </div>
    </div>

    <script>
        let slides = document.querySelectorAll('.slide');
        let currentIndex = 0;

        function showSlide(index) {
            slides.forEach((slide, i) => {
                slide.classList.remove('active');
                if (i === index) slide.classList.add('active');
            });
        }

        function nextSlide() {
            currentIndex = (currentIndex + 1) % slides.length;
            showSlide(currentIndex);
        }

        slides.forEach((slide, i) => {
            slide.addEventListener("click", function () {
                showSlide(i);
                currentIndex = i;
            });
        });

        setInterval(nextSlide, 5000);
    </script>
</body>
</html>