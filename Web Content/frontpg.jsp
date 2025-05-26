<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>University Website - Home</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f5fbff;
            }
            header {
                background-color: #4169E1;
                color: white;
                padding: 20px;
                text-align: center;
                font-size: 32px;
                font-weight: bold;
                position: relative;
            }
            header img {
                position: absolute;
                top: 10px;
                left: 10px;
                height: 60px;
            }
            .login-dropdown {
                position: absolute;
                top: 20px;
                right: 20px;
                display: inline-block;
            }
            .login-dropdown button {
                background-color: #ffde59;
                border: none;
                padding: 8px 12px;
                cursor: pointer;
                font-size: 14px;
                border-radius: 5px;
                font-weight: bold;
            }
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: white;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 8px;
                right: 0;
                width: 180px;
                border-radius: 5px;
                font-size: 14px;
            }
            .dropdown-content a {
                display: block;
                padding: 8px;
                text-decoration: none;
                color: #4169E1;
                font-weight: normal;
                transition: background 0.3s ease;
            }
            .dropdown-content a:hover {
                background-color: #ffde59;
            }
            .login-dropdown:hover .dropdown-content {
                display: block;
            }
            nav {
                background-color: #ffde59;
                display: flex;
                justify-content: center;
                padding: 15px 0;
            }
            nav a {
                color: #4169E1;
                text-decoration: none;
                font-size: 18px;
                padding: 10px 20px;
                margin: 0 10px;
                transition: background-color 0.3s, color 0.3s;
            }
            nav a:hover {
                background-color: #4169E1;
                color: white;
                border-radius: 5px;
            }
            .stats {
                display: flex;
                justify-content: space-around;
                padding: 30px;
                background-color: #fdf2d0;
            }
            .stats div {
                text-align: center;
                font-size: 20px;
                font-weight: bold;
            }
            .gallery {
                display: flex;
                justify-content: center;
                padding: 20px;
                gap: 10px;
            }
            .gallery img {
                width: 300px;
                height: 220px;
                border-radius: 10px;
            }
            .testimonials {
                padding: 20px;
                text-align: center;
                background-color: #e3f2fd;
            }
            .testimonials h3 {
                color: #5a9bd5;
            }
            .testimonials p {
                font-style: italic;
            }
            footer {
                background-color: #4169E1;
                color: white;
                text-align: center;
                padding: 15px 0;
                margin-top: 30px;
            }
        </style>
    </head>
    <body>
        <header>
            <img src="<%= request.getContextPath() %>/images/bv.jpeg" alt="College Logo" />
            Welcome to Banasthali Vidyapith
            <div class="login-dropdown">
                <button>Login</button>
                <div class="dropdown-content">
                    <strong>User</strong>
                    <a href="loginStudent.jsp">Student Login</a>
                    <a href="registrationStudent.jsp">Student Registration</a>
                    <hr>
                    <strong>Admin</strong>
                    <a href="loginAdmin.jsp">Admin Login</a>
                    <a href="registrationAdmin.jsp">Admin Registration</a>
                </div>
            </div>
        </header>
        <nav>
            <a href="#">Home</a>
            <a href="aboutUs.jsp">About Us</a>
            <a href="admissions.jsp">Admissions</a>
            <a href="departments.jsp">Departments</a>
            <a href="placement.jsp">Placements</a>
            <a href="contactUs.jsp">Contact Us</a>
            <a href="feedbackQuery.jsp">Feedback & Queries</a>
        </nav>
        <section class="stats">
            <div>85+ Years of Excellence</div>
            <div>10,000+ Students</div>
            <div>100+ Courses</div>
            <div>Top 50 Ranked University</div>
        </section>
        <section class="gallery">
            <img src="<%= request.getContextPath() %>/images/bvp.jpg" alt="College" class="colllege" />
            <img src="<%= request.getContextPath() %>/images/bvp1.jpg" alt="College" class="college" />
            <img src="<%= request.getContextPath() %>/images/bvp2.jpg" alt="College" class="college" />
            <img src="<%= request.getContextPath() %>/images/bvp3.jpg" alt="College" class="college" />
            <img src="<%= request.getContextPath() %>/images/bvp4.jpg" alt="College" class="college" />
        </section>
        <section class="testimonials">
            <h3>What Our Students Say</h3>
            <p>"Banasthali Vidyapith has transformed my life with its excellent education and vibrant campus life." - Student A</p>
            <p>"The faculty and resources available here are world-class!" - Student B</p>
        </section>
        <footer>
            &copy; 2025 Banasthali Vidyapith. All rights reserved.
        </footer>
    </body>
</html>
