<%@ page import="java.io.*, java.util.*, java.sql.*, java.nio.charset.StandardCharsets" %>
<%@ page import="org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.net.*" %>

<%
    if (!ServletFileUpload.isMultipartContent(request)) {
        out.println("Form must have enctype=multipart/form-data.");
        return;
    }

    DiskFileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);
    List<FileItem> formItems = upload.parseRequest(request);

    String fullname = "", dob = "", studentid = "", course="", contact = "", bvemail = "", father_name = "", mother_name = "", sessionStr = "";
    FileItem photoItem = null;
    FileItem pdfItem = null;

    for (FileItem item : formItems) {
        if (item.isFormField()) {
            String fieldName = item.getFieldName();
            String fieldValue = item.getString("UTF-8");

            if ("fullname".equals(fieldName)) {
                fullname = fieldValue;
            } else if ("dob".equals(fieldName)) {
                dob = fieldValue;
            } else if ("studentid".equals(fieldName)) {
                studentid = fieldValue;
            } else if ("course".equals(fieldName)) {
            course = fieldValue;
            }
            else if ("contact".equals(fieldName)) {
                contact = fieldValue;
            } else if ("bvemail".equals(fieldName)) {
                bvemail = fieldValue;
            } else if ("father_name".equals(fieldName)) {
                father_name = fieldValue;
            } else if ("mother_name".equals(fieldName)) {
                mother_name = fieldValue;
            } else if ("session".equals(fieldName)) {
                sessionStr = fieldValue;
            } 

        } else {
            if (item.getFieldName().equals("photo")) {
                photoItem = item;
            } else if (item.getFieldName().equals("pdfFile")) {
                pdfItem = item;
            }
        }
    }

    String resumePath = "resumes/" + pdfItem.getName();
    String imagePath = "images/" + photoItem.getName();

    File resumeFile = new File(application.getRealPath("/") + resumePath);
    File imageFile = new File(application.getRealPath("/") + imagePath);
    pdfItem.write(resumeFile);
    photoItem.write(imageFile);

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");

        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO student (student_id, name, bnsmail, password, dob, fathers_name, course_id, session, contact, resume, mothers_name, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
        );
        String password = (String) session.getAttribute("password");

        ps.setString(1, studentid);
        ps.setString(2, fullname);
        ps.setString(3, bvemail);
        ps.setString(4, password); 
        ps.setString(5, dob);
        ps.setString(6, father_name);
        ps.setString(7, course); 
        ps.setString(8, sessionStr);
        ps.setString(9, contact);
        ps.setString(10, resumePath);
        ps.setString(11, mother_name);
        ps.setString(12, imagePath);

        int result = ps.executeUpdate();
        if (result > 0) {
            response.sendRedirect("loginStudent.jsp");
            
        } else {
            out.println("Student registration failed.");
        }

        con.close();
    } catch (Exception e) {
        out.println("Database Error: " + e.getMessage());
    }
%>
