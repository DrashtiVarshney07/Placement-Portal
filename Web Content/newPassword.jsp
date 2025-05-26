<%-- 
    Document   : newPassword
    Created on : Apr 5, 2025, 11:55:34 PM
    Author     : pragy
--%>

<%@ page import="java.sql.*, java.security.MessageDigest, java.nio.charset.StandardCharsets, java.net.*, java.io.*, org.json.JSONObject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    boolean passwordUpdated = false;
    boolean captchaPassed = false;
    String errorMessage = "";

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String newPassword = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");

        if (newPassword != null && confirmPassword != null && newPassword.equals(confirmPassword)) {
            try {
                String secretKey = "6LfLywMrAAAAALxcoC20JRikgpjuj686wlcIjRoS"; // Your secret key
                String verificationUrl = "https://www.google.com/recaptcha/api/siteverify";
                String postParams = "secret=" + secretKey + "&response=" + gRecaptchaResponse;

                URL url = new URL(verificationUrl);
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("POST");
                conn.setDoOutput(true);
                conn.getOutputStream().write(postParams.getBytes(StandardCharsets.UTF_8));

                BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
                StringBuilder responseStr = new StringBuilder();
                String inputLine;
                while ((inputLine = in.readLine()) != null) {
                    responseStr.append(inputLine);
                }
                in.close();

                JSONObject jsonResponse = new JSONObject(responseStr.toString());
                captchaPassed = jsonResponse.getBoolean("success");

                if (captchaPassed) {
                    String email = (String) session.getAttribute("email");
                    if (email != null) {
                        // Hash password
                        MessageDigest digest = MessageDigest.getInstance("SHA-256");
                        byte[] hash = digest.digest(newPassword.getBytes(StandardCharsets.UTF_8));
                        StringBuilder hexString = new StringBuilder();
                        for (byte b : hash) {
                            String hex = Integer.toHexString(0xff & b);
                            if (hex.length() == 1) hexString.append('0');
                            hexString.append(hex);
                        }
                        String hashedPassword = hexString.toString();

                        // Update in DB
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placement", "root", "root");
                        PreparedStatement ps = con.prepareStatement("UPDATE student SET password = ? WHERE bnsmail = ?");
                        ps.setString(1, hashedPassword);
                        ps.setString(2, email);

                        int rows = ps.executeUpdate();
                        if (rows > 0) {
                            passwordUpdated = true;
                            session.removeAttribute("email");
                            response.sendRedirect("loginStudent.jsp");
                            return;
                        } else {
                            errorMessage = "Password update failed. Try again.";
                        }
                        con.close();
                    } else {
                        errorMessage = "Session expired. Please login again.";
                    }
                } else {
                    errorMessage = "reCAPTCHA verification failed.";
                }
            } catch (Exception e) {
                e.printStackTrace();
                errorMessage = "Something went wrong.";
            }
        } else {
            errorMessage = "Passwords do not match.";
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Set New Password</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { 
            font-family: Arial, sans-serif; 
            background: linear-gradient(to bottom, #a6dcef, #ffffff); 
            min-height: 100vh; 
            color: #333; 
            display: flex; 
            flex-direction: column; 
            align-items: center; 
            justify-content: center;
            text-align: center;
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

        .main-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 600px;
            width: 2000px;
            margin-top: 80px;
        }

        .heading { 
            font-size: 30px; 
            font-weight: bold; 
            margin-bottom: 20px; 
            color: #1565c0;
        }

        .form-container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
            text-align: center;
            margin: 15px auto;
            font-size: 25px;
        }

        .form-container input { 
            width: 100%; 
            padding: 10px; 
            margin: 10px 0; 
            border: 1px solid #ccc; 
            border-radius: 5px; 
            font-size:20px;
        }

        .form-container button { 
            width: 100%; 
            padding: 10px; 
            background-color: #1565c0; 
            color: white; 
            border: none; 
            border-radius: 5px; 
            cursor: pointer; 
            font-size: 20px; 
        }

        .form-container button:hover { background-color: #003c8f; }

        .error { 
            color: red; 
            margin-top: 10px; 
            display: none; 
        }

        #password-error {
            display: none;
            color: red;
            font-size: 14px;
        }
    </style>
    <script>
        function validatePassword() {
            let password = document.getElementById("password");
            let confirmPassword = document.getElementById("confirmPassword");
            let passwordError = document.getElementById("password-error");

            let pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%?&])[A-Za-z\d@$!%?&]{8,}$/;

            if (!pattern.test(password.value)) {
                passwordError.style.display = "block";
                password.style.border = "2px solid red";
                confirmPassword.disabled = true;
            } else {
                passwordError.style.display = "none";
                password.style.border = "2px solid green";
                confirmPassword.disabled = false;
            }
        }

        function checkConfirmPassword() {
            let password = document.getElementById("password").value;
            let confirmPassword = document.getElementById("confirmPassword").value;
            let matchError = document.getElementById("match-error");

            if (password !== confirmPassword) {
                matchError.style.display = "block";
            } else {
                matchError.style.display = "none";
            }
        }
    </script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
<body>
<div class="navbar">
    <div class="logo">
        <img src="logo.png" alt="Logo">
        <span>Placement Portal</span>
    </div>
    <div class="links">
        <a href="index.jsp">Home</a>
        <a href="about.jsp">About</a>
    </div>
</div>

<div class="main-content">
    <div class="form-container">
        <div class="heading">Set New Password</div>
        <form method="post">
            <input type="password" name="password" id="password" placeholder="New Password" onkeyup="validatePassword()" required />
            <div id="password-error">Password must contain at least 8 characters, including uppercase, lowercase, number, and special character.</div>

            <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password" onkeyup="checkConfirmPassword()" required />
            <div id="match-error" class="error">Passwords do not match.</div>

            <div class="g-recaptcha" data-sitekey="6LfLywMrAAAAAEgrmdxna2K0PkVvgE0gU5rQwjWU"></div><br>

            <button type="submit">Update Password</button>
        </form>
        <% if (!errorMessage.isEmpty()) { %>
            <div class="error" style="display:block;"><%= errorMessage %></div>
        <% } %>
    </div>
</div>
</body>
</html>
