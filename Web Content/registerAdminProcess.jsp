

<%@ page import="java.io.*, java.util.*, java.sql.*, java.nio.charset.StandardCharsets" %>
<%@ page import="org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.net.*" %>
<%
out.println("Request method: " + request.getMethod());
out.println("Content type: " + request.getContentType());
%>

<%
    if (!ServletFileUpload.isMultipartContent(request)) {
        out.println("Form must have enctype=multipart/form-data.");
        return;
    }

    DiskFileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);
    List<FileItem> formItems = upload.parseRequest(request);

    String adminId = "", name = "", email = "", password = "", department = "", contact = "", yearOfJoining = "", captchaToken = "";
    FileItem imageItem = null;

    for (FileItem item : formItems) {
        if (item.isFormField()) {
            String fieldName = item.getFieldName();
            String fieldValue = item.getString("UTF-8");

                if ("adminId".equals(fieldName)) {
                    adminId = fieldValue;
                } else if ("name".equals(fieldName)) {
                    name = fieldValue;
                } else if ("email".equals(fieldName)) {
                    email = fieldValue;
                } else if ("password".equals(fieldName)) {
                    password = fieldValue;
                } else if ("department".equals(fieldName)) {
                    department = fieldValue;
                } else if ("contact".equals(fieldName)) {
                    contact = fieldValue;
                } else if ("yearOfJoining".equals(fieldName)) {
                    yearOfJoining = fieldValue;
                } else if ("g-recaptcha-response".equals(fieldName)) {
                    captchaToken = fieldValue;
                }

        } else {
            if (item.getFieldName().equals("profilePic")) {
                imageItem = item;
            }
        }
    }

    boolean captchaSuccess = false;
    String Captcharesponse = "";
    try {
        String secret = "";
        String url = "https://www.google.com/recaptcha/api/siteverify";
        String postData = "secret=" + secret + "&response=" + captchaToken;

        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("POST");
        con.setDoOutput(true);
        OutputStream os = con.getOutputStream();
        os.write(postData.getBytes(StandardCharsets.UTF_8));
        os.flush(); os.close();

        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        while ((inputLine = in.readLine()) != null) {
            Captcharesponse += inputLine;
        }
        in.close();
        out.println("Captcha raw response: " + Captcharesponse + "<br>");

        JSONObject json = new JSONObject(Captcharesponse);
        captchaSuccess = json.getBoolean("success");
    } catch (Exception e) {
        out.println("Captcha error: " + e);
    }

    if (!captchaSuccess) {
        out.println("Captcha verification failed. Please try again.<br>");
        out.println("Captcha response was: " + Captcharesponse);
        return;
    }
    String imagePath = "images/" + imageItem.getName();
    File uploadedFile = new File(application.getRealPath("/") + imagePath);
    imageItem.write(uploadedFile);
    boolean dbInsertSuccess = false; 

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");
        PreparedStatement ps = con.prepareStatement("INSERT INTO admin (admin_id, name, email, password, department, contact, year_of_joining, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        ps.setString(1, adminId);
        ps.setString(2, name);
        ps.setString(3, email);
        ps.setString(4, password); 
        ps.setString(5, department);
        ps.setString(6, contact);
        ps.setString(7, yearOfJoining);
        ps.setString(8, imagePath);
        int result = ps.executeUpdate();

        if (result > 0) {
            dbInsertSuccess = true;
            out.println("Admin registered successfully!");
        } else {
            out.println("Failed to register admin.");
        }

        con.close();
        if (captchaSuccess && dbInsertSuccess) {
            response.sendRedirect("loginAdmin.jsp");
            return;
        }

    } catch (Exception e) {
        out.println("DB Error: " + e);
    }
%>
