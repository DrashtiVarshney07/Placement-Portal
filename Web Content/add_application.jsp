<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.cj.jdbc.Driver" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String studentId = request.getParameter("student_id");
%>

<form method="post" action="add_application_process.jsp">
    <input type="hidden" name="student_id" value="<%= studentId %>">

    <label>Select Company:</label>
    <select name="placement_id">
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT company_id, c_name FROM company");

                while (rs.next()) {
        %>
                    <option value="<%= rs.getInt("company_id") %>"><%= rs.getString("c_name") %></option>
        <%
                }

                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                out.println("Database error: " + e.getMessage());
            }
        %>
    </select><br>

    <label>Status:</label>
    <input type="text" name="status" value="Pending"><br><br>

    <input type="submit" value="Submit Application">
</form>
