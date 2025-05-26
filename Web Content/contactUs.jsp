<%-- 
    Document   : contactUs
    Created on : Apr 5, 2025, 11:25:14 PM
    Author     : pragy
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Us - Banasthali Vidyapith Placement Portal</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to bottom, #a6dcef, #ffffff);
            color: #333;
            padding-top: 80px;
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
        
        .container {
            margin-left: 280px;
            margin-top: 30px;
            max-width: 900px;
            padding: 20px;
        }

        .contact-info {
            display: flex;
            justify-content: space-between;
          width:1050px;
            background-color: #fff;
           margin-left: 170px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            margin-bottom: 40px;
        }

        .contact-info div {
            flex: 1;
            margin: 0 10px;
            text-align: center;
        }

        .contact-info h3 {
            color: #1565c0;
            margin-bottom: 10px;
        }

        .contact-info p {
            color: #333;
            font-size: 20px;
        }

        form {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            width: 1050px;
            margin: 0 auto;
            margin-left: 170px;
        }

        form h2 {
            margin-bottom: 20px;
            color: #1565c0;
            font-size: 22px;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        textarea {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
            color: #333;
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            background-color: #1565c0;
            color: white;
            font-size: 16px;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #003c8f;
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
            <li><a href="Home.jsp">Home</a></li>
            <li><a href="About.jsp">About</a></li>
            <li><a href="Contact.jsp">Contact</a></li>
            <li><a href="Placements.jsp">Placements</a></li>
        </ul>
    </div>

    <div class="sidebar">
        <h2>Contact Us</h2>
    </div>

    <div class="container">
        <div class="contact-info">
            <div>
                <h3>Chat with us</h3>
                <p>Our friendly team is here to help.<br>Email: info@studyhub.com</p>
            </div>
            <div>
                <h3>Visit us</h3>
                <p>Akshya Nagar 1st Block 1st Cross,<br>Ramamurthy Nagar, Bangalore-560016</p>
            </div>
            <div>
                <h3>Call us</h3>
                <p>Mon - Fri, 8am to 5pm<br>+123 456 7869</p>
            </div>
        </div>

        <form action="submitForm.jsp" method="post" class ="form">
            <h2>CONTACT US</h2>
            <input type="text" name="firstName" placeholder="Enter First Name" required>
            <input type="text" name="lastName" placeholder="Enter Last Name" required>
            <input type="email" name="email" placeholder="Enter Email Address" required>
            <input type="tel" name="phone" placeholder="+123 456 7890" required>
            <textarea name="message" rows="5" placeholder="Enter your message here" required></textarea>
            <input type="submit" value="Send Message">
        </form>
    </div>
</body>
</html>