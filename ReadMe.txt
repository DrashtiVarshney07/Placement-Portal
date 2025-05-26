README.txt — PlacementPortal

 Project Title:
BNS Placement Portal 

---

 Project Structure:

- Web Pages/
  - Contains all JSP files used for frontend views.
  - Includes pages for:
    - Admin login, dashboard, placement and schedule management
    - Student login, dashboard, profile and application status
    - Public pages like front page, about us, contact us

- images/
  - Contains college logos and other static assets

- css/
  - Contains local stylesheets if used outside inline style

- WEB-INF/
  - web.xml (deployment descriptor)

---

 Technologies Used:

- Language: Java (JSP)
- IDE: NetBeans 8.0
- Server: GlassFish 4.0
- Database: MySQL (via WAMP server)
- Browser: Google Chrome or Edge
- Security: Google reCAPTCHA v2

---

 How It Works:

- Two types of logins:
  - Student login
  - Admin login

- Students can:
  - Register and log in
  - View schedules
  - Track application status, update profile

- Admins can:
  - Post placement notices and schedules
  - View student applications and send notifications
  - Add placement data

- Alumni section is also available

---

 Database:

- Database name: `placementportal`
- Tables used:
  - admin, student, placement, placement_schedule, application_status, company, feedback, etc.
- admin table stores plain-text passwords (for demo purpose)

---

 reCAPTCHA Integration:

- Enabled in both student and admin login pages
- Prevents bots from submitting login forms
- Verified via POST request to Google's siteverify API

---

 Steps to Run the Project:

1. Install Required Software:
   - NetBeans 8.0
   - GlassFish 4.0 (configured in NetBeans)
   - WAMP Server (for MySQL and phpMyAdmin)

2. Setup Database:
   - Open phpMyAdmin (via WAMP)
   - Create a database named: placementportal
   - Import the tables manually (based on the current working schema)

3. Open Project:
   - Open NetBeans
   - Go to File → Open Project
   - Select the PlacementPortal folder
   - Right-click the project and Run

4. Access Project in Browser:
   - http://localhost:8080/PlacementPortal

5. Login Credentials:
   - Admin: Register through login page
   - Student: Register through login page

---

 Key Pages:

- loginAdmin.jsp, loginStudent.jsp
- adminDashboard.jsp, studDash.jsp, studentInfo.jsp, applStatus.jsp
- addPlacement.jsp, addPlacementSchedule.jsp
- aboutUs.jsp, contactUs.jsp, frontpg.jsp
- forgotPassword.jsp, feedbackQuery.jsp, feedbackReply.jsp

---

 Important Notes:

- reCAPTCHA will not work if you're offline
- If `g-recaptcha-response` is empty or not validated server-side, login will fail
- Ensure `localhost` is registered in your Google reCAPTCHA dashboard

---

 Developed By:
[Aditi Sharma, Drashti Varshney, Garima Sharma, Tanshi Sharma / M18]
Banasthali Vidyapith
Project — 2024–2025
