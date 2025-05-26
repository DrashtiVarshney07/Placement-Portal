<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    String c_name = request.getParameter("c_name");
    String address = request.getParameter("address");
    String industry_type = request.getParameter("industry_type");

    if (c_name == null || address == null || industry_type == null ||
        c_name.trim().equals("") || address.trim().equals("") || industry_type.equals("Select")) {
        response.sendRedirect("addCompany.jsp?error=Please+fill+all+fields+correctly");
        return;
    }

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.jdbc.Driver"); 
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal?useSSL=false&serverTimezone=UTC", "root", "");

        String sql = "INSERT INTO company (c_name, address, industry_type) VALUES (?, ?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1, c_name.trim());
        ps.setString(2, address.trim());
        ps.setString(3, industry_type);

        int rows = ps.executeUpdate();

        if (rows > 0) {
            response.sendRedirect("addPlacement.jsp");
        } else {
            response.sendRedirect("addCompany.jsp?error=Could+not+add+company");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        return;
    } finally {
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>
