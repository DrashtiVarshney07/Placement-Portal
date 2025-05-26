<%@ page import="java.sql.*" %>
<%
    int placementId = Integer.parseInt(request.getParameter("placement_id"));
    int companyId = Integer.parseInt(request.getParameter("company_id"));
    String domain = request.getParameter("domain");
    String driveDate = request.getParameter("drive_Date");
    int openings = Integer.parseInt(request.getParameter("no_of_openiing"));
    double cgpa = Double.parseDouble(request.getParameter("min_cgpa"));
    int backlog = Integer.parseInt(request.getParameter("allowed_backlog"));
    String courses = request.getParameter("eligible_courses");
    String branches = request.getParameter("eligible_branches");
    boolean aptitude = request.getParameter("aptitude_test") != null;
    boolean coding = request.getParameter("coding_test") != null;
    int rounds = Integer.parseInt(request.getParameter("interview_Rounds"));
    double ctc = Double.parseDouble(request.getParameter("ctc"));

    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");

        String sql = "UPDATE placement SET company_id=?, domain=?, drive_Date=?, no_of_openiing=?, min_cgpa=?, allowed_backlog=?, eligible_courses=?, eligible_branches=?, aptitude_test=?, coding_test=?, interview_Rounds=?, ctc=? WHERE placement_id=?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, companyId);
        ps.setString(2, domain);
        ps.setString(3, driveDate);
        ps.setInt(4, openings);
        ps.setDouble(5, cgpa);
        ps.setInt(6, backlog);
        ps.setString(7, courses);
        ps.setString(8, branches);
        ps.setBoolean(9, aptitude);
        ps.setBoolean(10, coding);
        ps.setInt(11, rounds);
        ps.setDouble(12, ctc);
        ps.setInt(13, placementId);

        int rows = ps.executeUpdate();

        if(rows > 0) {
            response.sendRedirect("modifyPlacement.jsp");
        } else {
            out.println("Failed to update placement.");
        }
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if(ps != null) ps.close();
        if(con != null) con.close();
    }
%>
