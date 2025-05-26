<%@ page import="java.sql.*" %>
<%
    try {
        int company_id = Integer.parseInt(request.getParameter("company_id"));
        String domain = request.getParameter("domain");
        String drive_Date = request.getParameter("drive_Date");
        int no_of_openiing = Integer.parseInt(request.getParameter("no_of_openiing"));
        double min_cgpa = Double.parseDouble(request.getParameter("min_cgpa"));
        int allowed_backlog = Integer.parseInt(request.getParameter("allowed_backlog"));
        String eligible_courses = request.getParameter("eligible_courses");
        String eligible_branches = request.getParameter("eligible_branches");
        int aptitude_test = Integer.parseInt(request.getParameter("aptitude_test"));
        int coding_test = Integer.parseInt(request.getParameter("coding_test"));
        int interview_Rounds = Integer.parseInt(request.getParameter("interview_Rounds"));
        double ctc = Double.parseDouble(request.getParameter("ctc"));

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");

        String query = "INSERT INTO placement(company_id, domain, drive_Date, no_of_openiing, min_cgpa, allowed_backlog, eligible_courses, eligible_branches, aptitude_test, coding_test, interview_Rounds, ctc) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, company_id);
        ps.setString(2, domain);
        ps.setString(3, drive_Date);
        ps.setInt(4, no_of_openiing);
        ps.setDouble(5, min_cgpa);
        ps.setInt(6, allowed_backlog);
        ps.setString(7, eligible_courses);
        ps.setString(8, eligible_branches);
        ps.setInt(9, aptitude_test);
        ps.setInt(10, coding_test);
        ps.setInt(11, interview_Rounds);
        ps.setDouble(12, ctc);

        ps.executeUpdate();
        con.close();
        response.sendRedirect("modifyPlacement.jsp");
    } catch(Exception e){
        out.println("Error: " + e.getMessage());
    }
%>                         
