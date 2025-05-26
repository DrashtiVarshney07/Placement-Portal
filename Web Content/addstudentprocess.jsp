<%@ page import="java.sql.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.security.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String adminId = (String) session.getAttribute("admin_id");
    if (adminId == null) {
        response.sendRedirect("loginAdmin.jsp?error=sessionExpired");
        return;
    }

    String resumeUploadPath = application.getRealPath("/") + "uploads/resumes/";
    String imageUploadPath = application.getRealPath("/") + "uploads/images/";

    new File(resumeUploadPath).mkdirs(); 
    new File(imageUploadPath).mkdirs();

    String student_id = request.getParameter("student_id");
    student_id = (student_id != null) ? student_id.trim() : "";

    String name = request.getParameter("name");
    name = (name != null) ? name.trim() : "";

    String bnsmail = request.getParameter("bnsmail");
    bnsmail = (bnsmail != null) ? bnsmail.trim() : "";

    String password = request.getParameter("password");
    password = (password != null) ? password.trim() : "";

    String dob = request.getParameter("dob");
    dob = (dob != null) ? dob.trim() : "";

    String fathers_name = request.getParameter("fathers_name");
    fathers_name = (fathers_name != null) ? fathers_name.trim() : "";

    String mothers_name = request.getParameter("mothers_name");
    mothers_name = (mothers_name != null) ? mothers_name.trim() : "";

    String course_id = request.getParameter("course_id");
    course_id = (course_id != null) ? course_id.trim() : "";

    String sessionStr = request.getParameter("session");
    sessionStr = (sessionStr != null) ? sessionStr.trim() : "";

    String contact = request.getParameter("contact");
    contact = (contact != null) ? contact.trim() : "";

    if (student_id.length() != 10) {
        response.sendRedirect("addStudent.jsp?error=studentIdLength");
        return;
    }

    if (password.isEmpty()) {
        response.sendRedirect("addStudent.jsp?error=passwordMissing");
        return;
    }

    MessageDigest md = MessageDigest.getInstance("SHA-256");
    md.update(password.getBytes());
    byte[] hashedBytes = md.digest();
    StringBuilder sb = new StringBuilder();
    for (byte b : hashedBytes) {
        sb.append(String.format("%02x", b));
    }
    String hashedPassword = sb.toString();

    Part resumePart = request.getPart("resume");
    Part imagePart = request.getPart("image");

    if (resumePart == null || imagePart == null) {
        response.sendRedirect("addStudent.jsp?error=fileMissing");
        return;
    }

    String resumeFileName = student_id + "_resume.pdf";
    String imageFileName = student_id + "_image" + imagePart.getSubmittedFileName().substring(imagePart.getSubmittedFileName().lastIndexOf('.'));

    resumePart.write(resumeUploadPath + File.separator + resumeFileName);
    imagePart.write(imageUploadPath + File.separator + imageFileName);

    String resumePath = "uploads/resumes/" + resumeFileName;
    String imagePath = "uploads/images/" + imageFileName;

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");

        String sql = "INSERT INTO student (student_id, name, bnsmail, password, dob, fathers_name, mothers_name, course_id, session, contact, resume, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, student_id);
        pstmt.setString(2, name);
        pstmt.setString(3, bnsmail);
        pstmt.setString(4, hashedPassword);
        pstmt.setString(5, dob);
        pstmt.setString(6, fathers_name);
        pstmt.setString(7, mothers_name);
        pstmt.setString(8, course_id);
        pstmt.setString(9, sessionStr);
        pstmt.setString(10, contact);
        pstmt.setString(11, resumePath);
        pstmt.setString(12, imagePath);

        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            response.sendRedirect("addStudent.jsp?success=studentAdded");
        } else {
            response.sendRedirect("addStudent.jsp?error=insertionFailed");
        }

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("addStudent.jsp?error=exception");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (Exception ex) {}
        if (conn != null) try { conn.close(); } catch (Exception ex) {}
    }
%>
