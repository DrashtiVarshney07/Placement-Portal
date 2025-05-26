

<%@page import="java.net.*, java.io.*, java.nio.charset.StandardCharsets, org.json.JSONObject"%>
<%
    String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
    boolean captchaSuccess = false;

    if (gRecaptchaResponse != null && !gRecaptchaResponse.isEmpty()) {
        String secretKey = ""; // Your secret key
        String verificationUrl = "https://www.google.com/recaptcha/api/siteverify";

        try {
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
            captchaSuccess = jsonResponse.getBoolean("success");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    out.print(captchaSuccess); 
%>
