<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Profile Form</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, sans-serif; }
        body {
            background: linear-gradient(to bottom, #a6dcef, #ffffff);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: #333;
        }
        .navbar {
            width: 100%; background-color: #1565c0; display: flex;
            justify-content: space-between; align-items: center;
            padding: 15px 20px; position: fixed; top: 0; left: 0; z-index: 1000;
        }
        .navbar .logo img { width: 50px; height: 50px; margin-right: 10px; border-radius: 50%; }
        .navbar .logo span { font-size: 20px; font-weight: bold; color: #fff; }
        .navbar .links { list-style: none; display: flex; gap: 20px; }
        .navbar .links a { color: #fff; text-decoration: none; font-size: 16px; }
        .navbar .links a:hover { color: #ffeb3b; }
        .container {
            background-color: #fff; border-radius: 10px; padding: 40px;
            max-width: 600px; width: 100%; box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            margin-top: 100px;
        }
        h2 {
            color: #1565c0; margin-bottom: 20px; display: flex; align-items: center; justify-content: center;
        }
        h2 img { width: 40px; height: 40px; margin-right: 10px; border-radius: 50%; }
        label { display: block; margin-top: 10px; text-align: left; font-weight: bold; }
        input, select {
            width: 100%; padding: 10px; margin-top: 5px; border: 1px solid #ccc; border-radius: 5px;
        }
        button {
            margin-top: 20px; padding: 12px; width: 100%;
            background-color: #1565c0; color: white; font-size: 16px;
            border: none; border-radius: 5px; cursor: pointer;
        }
        button:hover { background-color: #003c8f; }
        .error { color: red; font-size: 14px; }
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

<div class="container">
    <h2><img src="<%= request.getContextPath() %>/images/bv.jpeg" alt="Logo" /> ADD STUDENT INFORMATION</h2>
    <form action="registerStudentProcess.jsp" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
        <label>Full Name:</label>
        <input type="text" name="fullname" id="fullname" required>
        <div id="fullnameError" class="error"></div>

        <label>Date of Birth:</label>
        <input type="date" name="dob" id="dob" required>

        <label>Student ID:</label>
        <input type="text" name="studentid" id="studentid" required>

        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT course_id, course_name FROM course");
        %>

        <label for="course">Select Course:</label>
        <select name="course" id="course" required>
            <option value="">-- Select Course --</option>
            <%
                while(rs.next()) {
                    String courseId = rs.getString("course_id");
                    String courseName = rs.getString("course_name");
            %>
            <option value="<%= courseId %>"><%= courseName %></option>
            <%
                }
                con.close();
            %>
        </select>

        <label>Contact Number:</label>
        <input type="text" name="contact" id="contact" required>
        <div id="contactError" class="error"></div>

        <label>Banasthali Email:</label>
        <input type="email" name="bvemail" id="bvemail" required>
        <div id="bvemailError" class="error"></div>

        <label>Father's Name:</label>
        <input type="text" name="father_name" id="father_name" required>
        <div id="father_nameError" class="error"></div>

        <label>Mother's Name:</label>
        <input type="text" name="mother_name" id="mother_name" required>
        <div id="mother_nameError" class="error"></div>

        <label>Session:</label>
        <input type="text" name="session" id="session" required>

        <label for="photo">Upload Photo:</label>
        <input type="file" name="photo" accept=".jpeg,.jpg" required>

        <label for="pdfFile">Upload Resume (PDF):</label>
        <input type="file" name="pdfFile" accept="application/pdf" required>

        <button type="submit">SUBMIT</button>
    </form>
</div>

<script>
    function showError(inputName, message) {
        document.getElementById(inputName + "Error").textContent = message;
    }

    function clearError(inputName) {
        document.getElementById(inputName + "Error").textContent = "";
    }

    function validateEmail(email) {
        return /^[a-zA-Z0-9._%+-]+@banasthali\.in$/.test(email);
    }

    function validateContact(contact) {
        return /^\d{10}$/.test(contact);
    }

    function validateName(name) {
        return /^[a-zA-Z\s]+$/.test(name);
    }

    function validateForm() {
        let valid = true;
        const form = document.forms[0];

        const name = form["fullname"].value.trim();
        const father = form["father_name"].value.trim();
        const mother = form["mother_name"].value.trim();
        const contact = form["contact"].value.trim();
        const email = form["bvemail"].value.trim();

        if (!validateName(name)) {
            showError("fullname", "Full Name should contain only letters and spaces.");
            valid = false;
        } else clearError("fullname");

        if (!validateName(father)) {
            showError("father_name", "Father's Name should contain only letters and spaces.");
            valid = false;
        } else clearError("father_name");

        if (!validateName(mother)) {
            showError("mother_name", "Mother's Name should contain only letters and spaces.");
            valid = false;
        } else clearError("mother_name");

        if (!validateContact(contact)) {
            showError("contact", "Contact must be exactly 10 digits.");
            valid = false;
        } else clearError("contact");

        if (!validateEmail(email)) {
            showError("bvemail", "Email must end with @banasthali.in");
            valid = false;
        } else clearError("bvemail");

        return valid;
    }

    document.addEventListener("DOMContentLoaded", () => {
        const fields = ["fullname", "father_name", "mother_name", "contact", "bvemail"];
        fields.forEach((field) => {
            const input = document.querySelector(`input[name="${field}"]`);
            input.addEventListener("input", validateForm);
        });
    });
</script>

</body>
</html>
