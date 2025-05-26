<%-- 
    Document   : sendReply
    Created on : Apr 8, 2025, 10:20:08 PM
    Author     : pragy
--%>

<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sending Reply...</title>
</head>
<body>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String reply = request.getParameter("reply");

    final String fromEmail = "varshneydrashti2000@gmail.com"; 
    final String password = "ezdc kyob rugd fjjt";     
    final String subject = "Reply to your Query - Placement Portal";

    Properties props = new Properties();
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");

    Session sessionStr = Session.getInstance(props, new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(fromEmail, password);
        }
    });

    try {
        Message messageStr = new MimeMessage(sessionStr);
        messageStr.setFrom(new InternetAddress(fromEmail));
        messageStr.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
        messageStr.setSubject(subject);

        String content = "Hello " + name + ",\n\n"
                       + "Thank you for reaching out to us. Here's our reply to your query:\n\n"
                       + reply + "\n\n"
                       + "Regards,\n"
                       + "Admin - Placement Cell";

        messageStr.setText(content);

        Transport.send(messageStr);
%>
        <h3 style="color:green;">Reply sent successfully to <%= email %>!</h3>
        <a href="feedbackReply.jsp">← Back to Feedback</a>
<%
    } catch (Exception e) {
%>
        <h3 style="color:red;">Failed to send reply: <%= e.getMessage() %></h3>
        <a href="feedbackReply.jsp">← Back to Feedback</a>
<%
        e.printStackTrace();
    }
%>
</body>
</html>
