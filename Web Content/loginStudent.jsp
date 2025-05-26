<%@page import="java.net.*, java.io.*, java.nio.charset.StandardCharsets, java.sql.*, org.json.JSONObject"%>
<%@page import="java.net.*, java.io.*, java.nio.charset.StandardCharsets, java.sql.*"%>
<%@page import="org.apache.commons.codec.binary.Hex" %>

<%
    String msg = null;
%>
<%! 
        public String hashPassword(String password) throws Exception {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes(java.nio.charset.StandardCharsets.UTF_8));
            return Hex.encodeHexString(hash); 
        }

%>
<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String rollnoOrEmail = request.getParameter("rollnoOrEmail");
        String password = request.getParameter("password");
        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
        String redirectUrl = request.getParameter("redirectUrl");

        boolean captchaVerified = false;

        try {
            String secretKey = "";
            String verifyUrl = "https://www.google.com/recaptcha/api/siteverify";
            String postParams = "secret=" + secretKey + "&response=" + gRecaptchaResponse;

            URL obj = new URL(verifyUrl);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("POST");
            con.setDoOutput(true);
            con.getOutputStream().write(postParams.getBytes(StandardCharsets.UTF_8));

            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), StandardCharsets.UTF_8));
            String inputLine;
            StringBuilder responseStr = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                responseStr.append(inputLine);
            }
            in.close();

            JSONObject json = new JSONObject(responseStr.toString());
            captchaVerified = json.getBoolean("success");
        } catch (Exception e) {
            e.printStackTrace();
            msg = "Captcha verification failed.";
        }


        if (captchaVerified) {
            String dbURL = "jdbc:mysql://localhost:3306/placementportal";
            String dbUser = "root";
            String dbPass = "";

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                String hashedPassword = hashPassword(password);

                String sql = "SELECT * FROM student WHERE (student_id = ? OR bnsmail = ?) AND password = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, rollnoOrEmail);
                stmt.setString(2, rollnoOrEmail);
                stmt.setString(3, hashedPassword);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    session.setAttribute("student_id", rs.getString("student_id"));
                    session.setAttribute("studentName", rs.getString("name"));
                    response.sendRedirect(redirectUrl != null ? redirectUrl : "studDash.jsp");
                    return;
                } else {
                    msg = "Invalid roll number/email or password.";
                }

                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
                msg = "Database error occurred.";
            }
        } else {
            msg = "Captcha verification failed.";
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Login - University Placement Portal</title>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Arial', sans-serif;
                background: linear-gradient(to bottom, #a6dcef, #ffffff);
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

            .login-container {
                background-color: #ffffff;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                padding: 40px;
                width: 100%;
                max-width: 500px;
                text-align: center;
                margin-top: 100px;
            }

            .login-container h1 {
                color: #1565c0;
                margin-bottom: 20px;
                font-size: 28px;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 10px;
            }

            .login-container h1 img {
                width: 40px;
                height: 40px;
                border-radius: 50%;
            }

            .welcome {
                color: #777;
                font-size: 14px;
                margin-bottom: 30px;
            }
            
            .error-message {
                color: red;
                font-size: 14px;
                margin-bottom: 10px;
            }

            .login-container input[type="text"],
            .login-container input[type="password"] {
                width: 100%;
                padding: 15px;
                margin: 10px 0;
                border-radius: 5px;
                border: 1px solid #ddd;
                font-size: 16px;
                color: #555;
                transition: border-color 0.3s;
            }

            .g-recaptcha {
                margin-bottom: 20px;
            }

            .login-container input[type="submit"] {
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

            .login-container input[type="submit"]:hover {
                background-color: #003c8f;
            }

            .forgot-password {
                margin-top: 20px;
            }

            .footer {
                margin-top: 20px;
                color: #888;
                font-size: 12px;
            }
        </style>
    </head>
    <body>
        <div class="navbar">
            <div class="logo">
                <img src="<%= request.getContextPath() %>/images/bv.jpeg" alt="College Logo" />
                <span>Banasthali Vidyapith Placement Portal</span>
            </div>
            <ul class="links">
                <li><a href="frontpg.jsp">Home</a></li>
                <li><a href="aboutUs.jsp">About</a></li>
                <li><a href="contactUs.jsp">Contact</a></li>
                <li><a href="placement.jsp">Placements</a></li>
            </ul>
        </div>

        <div class="login-container">
            <h1>
                <img src="<%= request.getContextPath() %>/images/bv.jpeg" alt="College Logo" />
                Student Login
            </h1>
            <p class="welcome">Welcome to the Banasthali Vidyapith Placement Portal. Please log in to access your account.</p>
            <% if (msg != null) { %>
                <p class="error-message"><%= msg %></p>
            <% } %>

            <form method="POST" onsubmit="return validateCaptcha()">
                <input type="text" name="rollnoOrEmail" placeholder="Enter Roll No or Email" required />
                <input type="password" name="password" placeholder="Enter Password" required />
                <div id="captcha-container" class="g-recaptcha" 
                     data-sitekey="" 
                     data-callback="onCaptchaSuccess">
                </div>
                <input type="hidden" name="redirectUrl" value="studDash.jsp"> 
                <p id="captcha-error" style="color:red; display:none;">Please verify the captcha.</p>
                <input type="submit" value="Sign In" name="btn_signIn" />
            </form>
            <p class="forgot-password"><a href="ForgotPassword.jsp">Forgot Password?</a></p>
            <div class="footer">&copy; 2025 University Placement Portal | Student Login</div>
        </div>
            <a href="modifyPlacement.jsp"></a>
        
        <script>
        function validateCaptcha() {
                let response = grecaptcha.getResponse();
                let errorMessage = document.getElementById("captcha-error");

                if (response.length === 0) {
                    errorMessage.style.display = "block";
                    return false;
                } else {
                    errorMessage.style.display = "none"; 
                    return true;
                }
            }

            function onCaptchaSuccess() {
                document.getElementById("captcha-error").style.display = "none";
            }

            window.onload = function () {
                grecaptcha.render('captcha-container', {
                    'sitekey': '',
                    'callback': onCaptchaSuccess
                });
            };
        </script>
    </body>
</html>