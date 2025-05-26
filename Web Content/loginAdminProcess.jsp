<%-- 
    Document   : loginAdminProcess
    Created on : Apr 8, 2025, 1:22:22 AM
    Author     : pragy
--%>

<%@ page import="java.net.*, java.io.*, java.nio.charset.StandardCharsets, org.json.JSONObject" %>
<%@ page import="java.sql.*" %>

<%
    String adminId = request.getParameter("txtuid");
    String password = request.getParameter("txtpwd");
    String gRecaptchaResponse = request.getParameter("g-recaptcha-response");

    if (gRecaptchaResponse == null || gRecaptchaResponse.isEmpty()) {
    request.setAttribute("error", "Captcha verification failed! Please try again.");
    request.getRequestDispatcher("loginAdmin.jsp").forward(request, response);
    return;
    }
    boolean captchaVerified = false;

    System.out.println("Captcha Response Token: " + gRecaptchaResponse);

    if (gRecaptchaResponse != null && !gRecaptchaResponse.trim().isEmpty()) {
        try {
            String secretKey = "6LfLywMrAAAAALxcoC20JRikgpjuj686wlcIjRoS"; 
            String verifyUrl = "https://www.google.com/recaptcha/api/siteverify";
            String postParams = "secret=" + URLEncoder.encode(secretKey, "UTF-8") +
                                "&response=" + URLEncoder.encode(gRecaptchaResponse, "UTF-8");

            URL obj = new URL(verifyUrl);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("POST");
            con.setDoOutput(true);

            OutputStream outStream = con.getOutputStream();
            outStream.write(postParams.getBytes(StandardCharsets.UTF_8));
            outStream.flush();
            outStream.close();

            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), StandardCharsets.UTF_8));
            String inputLine;
            StringBuilder responseStr = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                responseStr.append(inputLine);
            }
            in.close();

            System.out.println("reCAPTCHA response from Google: " + responseStr.toString());

            JSONObject json = new JSONObject(responseStr.toString());
            captchaVerified = json.getBoolean("success");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    if (!captchaVerified) {
        System.out.println("Captcha verification failed.");
        response.sendRedirect("loginAdmin.jsp?error=captcha");
        return;
    }

    boolean loginSuccess = false;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE admin_id = ? AND password = ?");
        ps.setString(1, adminId);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            loginSuccess = true;
            session.setAttribute("adminId", adminId);
        }
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    if (loginSuccess) {
        response.sendRedirect("admin.jsp");
    } else {
        response.sendRedirect("loginAdmin.jsp?error=invalid");
    }
%>
