<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Registration - University Placement Portal</title>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom, #a6dcef, #ffffff);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: #333;
        }
        .registration-container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 100%;
            max-width: 500px;
            text-align: center;
            margin-top: 80px;
        }
        .registration-container input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ddd;
            font-size: 16px;
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
        input[type="file"]::file-selector-button {
            background-color: #1565c0;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        body {
            overflow-y: auto;
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
        .registration-container input,
        .registration-container select {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ddd;
            font-size: 16px;
            color: #555;
        }

        .registration-container select option {
            color: #000;
        }

        .registration-container input[type="submit"] {
            background-color: #1565c0;
            color: #fff;
            border: none;
            font-size: 18px;
            cursor: pointer;
        }

        .registration-container input[type="submit"]:hover {
            background-color: #003c8f;
        }

        .g-recaptcha {
            margin: 20px 0;
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
            Admin Registration
        </h1>
        <p class="welcome">Welcome to the Banasthali Vidyapith Placement Portal. Please log in to access the admin panel.</p>

        <form method="POST" enctype="multipart/form-data" action="registerAdminProcess.jsp" onsubmit="enableDisabledFields();">
             
            <input type="text" id="name" name="name" placeholder="Enter Name" onblur="validateName()" required />
            <p class="error" id="name-error">Name must contain only letters.</p>

            <input type="text" id="adminId" name="adminId" placeholder="Enter Admin ID" onblur="validateAdminId()" disabled required />
            <p class="error" id="adminId-error">Admin ID must be alphanumeric.</p>

            <select id="department" name="department" onchange="validateDepartment()" required>
                <option value="" selected disabled>Select Department</option>
                <option value="CSE">Computer Science</option>
                <option value="ECE">Electronics & Communication</option>
                <option value="ME">Mechanical Engineering</option>
                <option value="CE">Civil Engineering</option>
                <option value="EE">Electrical Engineering</option>
            </select>
            <p class="error" id="department-error">Please select a department.</p>

            <input type="number" id="yearOfJoining" name="yearOfJoining" placeholder="Enter Year of Joining" min="1900" max="2099" onblur="validateYearOfJoining()" required />
            <p class="error" id="yearOfJoining-error">Year must be between 1900 and 2025.</p>

            <input type="text" id="contact" name="contact" placeholder="Enter Contact Number" onblur="validateContact()" disabled required />
            <p class="error" id="contact-error">Invalid contact number! Must be 10 digits.</p>

            <input type="email" id="email" name="email" placeholder="Enter Email" onblur="validateEmail()" disabled required />
            <p class="error" id="email-error">Invalid email format.</p>

            <input type="password" id="password" name="password" placeholder="Enter Password" onblur="validatePassword()" disabled required />
            <p class="error" id="password-error">Password must be at least 8 characters with uppercase, lowercase, number & symbol.</p>

            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" onblur="validateConfirmPassword()" disabled required />
            <p class="error" id="confirmPassword-error">Passwords do not match.</p>
            
            <label for="profilePic">Profile Picture:</label>
            <input type="file" name="profilePic" accept="image/*" required>

            <div class="g-recaptcha" data-sitekey="6LfLywMrAAAAAEgrmdxna2K0PkVvgE0gU5rQwjWU"></div>
            <p id="captcha-error" style="color:red; display:none;">Please verify the captcha.</p>

            <input type="submit" id="registerBtn" value="Register" disabled />
            <div class="footer">&copy; 2025 University Placement Portal | Admin Registration</div>
        </form>
    </div>

    <script>
        function validateName() {
            let name = document.getElementById("name");
            let nameError = document.getElementById("name-error");
            let pattern = /^[A-Za-z ]+$/;

            if (!pattern.test(name.value)) {
                nameError.style.display = "block";
                name.style.border = "2px solid red";
            } else {
                nameError.style.display = "none";
                name.style.border = "2px solid green";
                document.getElementById("adminId").disabled = false;
            }
        }

        function validateAdminId() {
            let adminId = document.getElementById("adminId");
            let adminIdError = document.getElementById("adminId-error");
            let pattern = /^[a-zA-Z0-9]+$/;

            if (!pattern.test(adminId.value)) {
                adminIdError.style.display = "block";
                adminId.style.border = "2px solid red";
            } else {
                adminIdError.style.display = "none";
                adminId.style.border = "2px solid green";
                document.getElementById("department").disabled = false;
            }
        }

        function validateDepartment() {
            let department = document.getElementById("department");
            let departmentError = document.getElementById("department-error");

            if (department.value === "") {
                departmentError.style.display = "block";
                department.style.border = "2px solid red";
            } else {
                departmentError.style.display = "none";
                department.style.border = "2px solid green";
                document.getElementById("yearOfJoining").disabled = false;
            }
        }

        function validateYearOfJoining() {
            let yearInput = document.getElementById("yearOfJoining");
            let yearError = document.getElementById("yearOfJoining-error");
            let year = parseInt(yearInput.value, 10);

            if (isNaN(year) || year < 1900 || year > 2025) {
                yearError.style.display = "block";
                yearInput.style.border = "2px solid red";
            } else {
                yearError.style.display = "none";
                yearInput.style.border = "2px solid green";
                document.getElementById("contact").disabled = false;
            }
        }

        function validateContact() {
            let contact = document.getElementById("contact");
            let contactError = document.getElementById("contact-error");
            let pattern = /^[0-9]{10}$/;

            if (!pattern.test(contact.value)) {
                contactError.style.display = "block";
                contact.style.border = "2px solid red";
            } else {
                contactError.style.display = "none";
                contact.style.border = "2px solid green";
                document.getElementById("email").disabled = false;
            }
        }

        function validateEmail() {
            let email = document.getElementById("email");
            let emailError = document.getElementById("email-error");
            let pattern = /^[a-zA-Z0-9._%+-]+@banasthali\.in$/;

            if (!pattern.test(email.value)) {
                emailError.style.display = "block";
                email.style.border = "2px solid red";
                document.getElementById("password").disabled = true;
            } else {
                emailError.style.display = "none";
                email.style.border = "2px solid green";
                document.getElementById("password").disabled = false;
            }
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
        }


        function validateConfirmPassword() {
            let password = document.getElementById("password").value;
            let confirmPassword = document.getElementById("confirmPassword");
            let confirmPasswordError = document.getElementById("confirmPassword-error");

            if (password !== confirmPassword.value) {
                confirmPasswordError.style.display = "block";
                confirmPassword.style.border = "2px solid red";
            } else {
                confirmPasswordError.style.display = "none";
                confirmPassword.style.border = "2px solid green";

                let allValid = document.querySelectorAll('input[type="text"], input[type="number"], input[type="email"], input[type="password"], select');
                let allFilledAndValid = true;

                allValid.forEach(input => {
                    if (input.value.trim() === "" || input.style.border === "2px solid red") {
                        allFilledAndValid = false;
                    }
                });

                if (allFilledAndValid) {
                    document.getElementById("registerBtn").disabled = false;
                }
            }
            document.getElementById("registerBtn").disabled = false;

        }

        function handleFocus(id, errorId) {
            let input = document.getElementById(id);
            let error = document.getElementById(errorId);
            error.style.display = "none";
            if (input.style.border === "2px solid red") {
                input.value = "";
            }
        }
        

        function enableDisabledFields() {
            document.querySelectorAll('input[disabled], select[disabled]').forEach(el => {
                el.removeAttribute('disabled');
            });
        }
        
        ["name", "adminId", "department", "yearOfJoining", "contact", "email", "password", "confirmPassword"].forEach(id => {
            document.getElementById(id).addEventListener("focus", function () {
                handleFocus(id, id + "-error");
            });
        });
    </script>
</body>
</html>