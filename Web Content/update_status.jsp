<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<%
    String studentId = request.getParameter("student_id");
    String companyId = request.getParameter("company_id");
    String newStatus = request.getParameter("new_status");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");

        ps = con.prepareStatement("SELECT interview_rounds FROM placement WHERE company_id = ?");
        ps.setString(1, companyId);
        rs = ps.executeQuery();
        
        int totalRounds = 0;
        if (rs.next()) {
            totalRounds = rs.getInt("interview_rounds");
        }

        ps = con.prepareStatement("SELECT round_no FROM application_status WHERE student_id = ? AND placement_id = ?");
        ps.setString(1, studentId);
        ps.setString(2, companyId);
        rs = ps.executeQuery();

        int currentRound = 0;
        if (rs.next()) {
            currentRound = rs.getInt("round_no");
        }

        if (currentRound < totalRounds) {
            ps = con.prepareStatement("UPDATE application_status SET current_status = ?, round_no = round_no + 1 WHERE student_id = ? AND placement_id = ?");
            ps.setString(1, newStatus);
            ps.setString(2, studentId);
            ps.setString(3, companyId);
            ps.executeUpdate();
        } else {
            ps = con.prepareStatement("UPDATE application_status SET current_status = ? WHERE student_id = ? AND placement_id = ?");
            ps.setString(1, newStatus);
            ps.setString(2, studentId);
            ps.setString(3, companyId);
            ps.executeUpdate();
        }

        response.sendRedirect("student_application_admin.jsp?course_id=" + request.getParameter("course_id") + "&session=" + request.getParameter("session") + "&company_id=" + companyId);
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
