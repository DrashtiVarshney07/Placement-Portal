<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Processing Placement Schedule</title>
    <script>
        function showSuccessMessage() {
            alert("Placement Schedule successfully added!");
            window.location.href = "addPlacementSchedule.jsp"; // Redirect back to form
        }
    </script>
</head>
<body>
<%
    String placementId = request.getParameter("placement_id");
    String roundNo = request.getParameter("round_no");
    String roundName = request.getParameter("round_name");
    String scheduledDate = request.getParameter("scheduled_date");
    String venue = request.getParameter("venue");
    String remarks = request.getParameter("remarks");

    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");

        String sql = "INSERT INTO placement_schedule (placement_id, round_no, round_name, scheduled_date, venue, remarks) VALUES (?, ?, ?, ?, ?, ?)";
        ps = con.prepareStatement(sql);
        ps.setInt(1, Integer.parseInt(placementId));
        ps.setInt(2, Integer.parseInt(roundNo));
        ps.setString(3, roundName);
        ps.setString(4, scheduledDate);
        ps.setString(5, venue);
        ps.setString(6, remarks);

        int result = ps.executeUpdate();
        if (result > 0) {
%>
            <script>
                showSuccessMessage();
            </script>
<%
        } else {
            out.println("<h3>Failed to add schedule. Please try again.</h3>");
        }

    } catch(Exception e) {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    } finally {
        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch(Exception e) {
            out.println("<h3>Error closing connection: " + e.getMessage() + "</h3>");
        }
    }
%>
</body>
</html>
