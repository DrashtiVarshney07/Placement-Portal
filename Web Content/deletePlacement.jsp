<%@ page import="java.sql.*" %>
<%
    int placementId = Integer.parseInt(request.getParameter("placement_id"));

    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");

        String sql = "DELETE FROM placement WHERE placement_id=?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, placementId);
        int rows = ps.executeUpdate();

        if(rows > 0){
            response.sendRedirect("modifyPlacement.jsp");
        } else {
            out.println("Failed to delete placement.");
        }
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if(ps != null) ps.close();
        if(con != null) con.close();
    }
%>
