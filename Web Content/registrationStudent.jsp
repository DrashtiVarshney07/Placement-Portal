<!DOCTYPE html>
<%@ page import="java.io.*, java.net.*, java.security.*, javax.servlet.*, javax.servlet.http.*, org.apache.commons.codec.binary.Hex" %>
<%
    String error = "";

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String bnsmail = request.getParameter("bnsmail");
        String password = request.getParameter("password");
        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");

        boolean captchaVerified = false;

        try {
            String secretKey = "6LfLywMrAAAAALxcoC20JRikgpjuj686wlcIjRoS";
            String url = "https://www.google.com/recaptcha/api/siteverify";
            String postData = "secret=" + URLEncoder.encode(secretKey, "UTF-8") +
                              "&response=" + URLEncoder.encode(gRecaptchaResponse, "UTF-8");

            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("POST");
            con.setDoOutput(true);

            OutputStream os = con.getOutputStream();
            os.write(postData.getBytes("UTF-8"));
            os.flush();
            os.close();

            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuilder responseStr = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                responseStr.append(inputLine);
            }
            in.close();

            if (responseStr.toString().contains("\"success\": true")) {
                captchaVerified = true;
            } else {
                error = "Captcha verification failed. Please try again.";
            }

        } catch (Exception e) {
            error = "Error verifying captcha: " + e.getMessage();
        }

        if (captchaVerified) {
            try {
                MessageDigest md = MessageDigest.getInstance("SHA-256");
                byte[] hash = md.digest(password.getBytes("UTF-8"));
                String hashedPassword = Hex.encodeHexString(hash);

                session.setAttribute("bnsmail", bnsmail);
                session.setAttribute("password", hashedPassword);

                response.sendRedirect("studentInfo.jsp");
                return;

            } catch (Exception e) {
                error = "Password hashing failed: " + e.getMessage();
            }
        }
    }
%>

<% if (!error.isEmpty()) { %>
    <p style="color: red; text-align:center;"><%= error %></p>
<% } %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Student Registration - University Placement Portal</title>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom, #a6dcef, #ffffff);
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
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
        }
        .navbar .links a:hover {
            color: #ffeb3b;
        }
        .registration-container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 100%;
            max-width: 500px;
            text-align: center;
            margin-top: 130px;
        }
        .registration-container h1 {
            color: #1565c0;
            margin-bottom: 20px;
            font-size: 28px;
        }
        .registration-container h1 img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            vertical-align: middle;
            margin-right: 10px;
        }
        .welcome {
            color: #777;
            font-size: 14px;
            margin-bottom: 30px;
        }
        .registration-container input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ddd;
            font-size: 16px;
        }
        input[type="submit"] {
            background-color: #1565c0;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            margin-top: 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #0d47a1;
        }
        .error {
            color: red;
            font-size: 12px;
            display: none;
            text-align: left;
            margin-top: -10px;
        }
        input:disabled {
            background-color: #f0f0f0;
            cursor: not-allowed;
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

    <div class="registration-container">
        <h1>
            <img src="<%= request.getContextPath() %>/images/bv.jpeg" alt="College Logo" />
            Student Registration
        </h1>
        <p class="welcome">Welcome to the Banasthali Vidyapith Placement Portal. Please log in to access the admin panel.</p>
        <form method="POST" action="registrationStudent.jsp" onsubmit="return validateCaptcha()">
            <input type="text" id="email" name="bnsmail" placeholder="BNS Email" onblur="validateEmail()" required />
            <p class="error" id="email-error">Invalid email! Must be in @banasthali.in format.</p>

            <input type="password" id="password" name="password" placeholder="Enter Password" onblur="validatePassword()" disabled required />
            <p class="error" id="password-error">Password must be at least 8 characters with uppercase, lowercase, number & symbol.</p>

            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" onblur="validateConfirmPassword()" disabled required />
            <p class="error" id="confirmPassword-error">Passwords do not match.</p>

            <div class="g-recaptcha" data-sitekey="6LfLywMrAAAAAEgrmdxna2K0PkVvgE0gU5rQwjWU" data-callback="captchaVerified" data-expired-callback="captchaExpired"></div>
            <p id="captcha-error" style="color:red; display:none;">Please verify the captcha.</p>

            <input type="submit" id="registerBtn" value="Register" disabled />
            <div class="footer">&copy; 2025 University Placement Portal | Student Registration</div>
        </form>
    </div>

    <script>
        let emailValid = false, passwordValid = false, confirmValid = false, captchaValid = false;

        function validateEmail() {
            let email = document.getElementById("email");
            let emailError = document.getElementById("email-error");
            let pattern = /^[a-zA-Z0-9._%+-]+@banasthali\.in$/;

            if (!pattern.test(email.value)) {
                emailError.style.display = "block";
                email.style.border = "2px solid red";
                document.getElementById("password").disabled = true;
                emailValid = false;
            } else {
                emailError.style.display = "none";
                email.style.border = "2px solid green";
                document.getElementById("password").disabled = false;
                emailValid = true;
            }
            enableRegister();
        }

        function validatePassword() {
            let password = document.getElementById("password");
            let passwordError = document.getElementById("password-error");
            let pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%?&])[A-Za-z\d@$!%?&]{8,}$/;

            if (!pattern.test(password.value)) {
                passwordError.style.display = "block";
                password.style.border = "2px solid red";
                document.getElementById("confirmPassword").disabled = true;
            } else {
                passwordError.style.display = "none";
                password.style.border = "2px solid green";
                document.getElementById("confirmPassword").disabled = false;
            }
            enableRegister();
        }

        function validateConfirmPassword() {
            let password = document.getElementById("password").value;
            let confirmPassword = document.getElementById("confirmPassword");
            let confirmPasswordError = document.getElementById("confirmPassword-error");

            if (password !== confirmPassword.value || confirmPassword.value === "") {
                confirmPasswordError.style.display = "block";
                confirmPassword.style.border = "2px solid red";
                confirmValid = false;
            } else {
                confirmPasswordError.style.display = "none";
                confirmPassword.style.border = "2px solid green";
                confirmValid = true;
                passwordValid = true; 
            }
            enableRegister();
        }

        function enableRegister() {
            document.getElementById("registerBtn").disabled = !(emailValid && passwordValid && confirmValid && captchaValid);
        }

        function captchaVerified() {
            captchaValid = true;
            document.getElementById("captcha-error").style.display = "none";
            enableRegister();
        }

        function captchaExpired() {
            captchaValid = false;
            enableRegister();
        }

        function validateCaptcha() {
            if (!captchaValid) {
                document.getElementById("captcha-error").style.display = "block";
                return false;
            }
            return true;
        }

        function handleFocus(id, errorId) {
            let input = document.getElementById(id);
            let error = document.getElementById(errorId);
            error.style.display = "none";
            if (input.style.border === "2px solid red") {
                input.value = "";
            }
        }

        document.getElementById("email").addEventListener("focus", () => handleFocus("email", "email-error"));
        document.getElementById("password").addEventListener("focus", () => handleFocus("password", "password-error"));
        document.getElementById("confirmPassword").addEventListener("focus", () => handleFocus("confirmPassword", "confirmPassword-error"));
    </script>
</body>
</html>