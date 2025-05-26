<%@page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="org.json.*"%>

<%
    String selectedYear = request.getParameter("year");
    String selectedCourse = request.getParameter("course");

    int year = 2024;
    if (selectedYear != null) {
        try {
            year = Integer.parseInt(selectedYear);
        } catch (NumberFormatException e) {
            System.out.println("Invalid year format, using default 2024");
        }
    }

    if (selectedCourse == null || selectedCourse.trim().isEmpty()) {
        selectedCourse = "overall";
    }

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    JSONObject result = new JSONObject();
    JSONArray yearData = new JSONArray();
    JSONArray courseData = new JSONArray();
    JSONArray courses = new JSONArray();

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");

        String courseQuery = "SELECT course_name FROM course";
        ps = con.prepareStatement(courseQuery);
        rs = ps.executeQuery();
        while (rs.next()) {
            JSONObject courseObj = new JSONObject();
            courseObj.put("course_name", rs.getString("course_name"));
            courses.put(courseObj);
        }
        rs.close();
        ps.close();

        result.put("courses", courses);

        String yearWiseQuery;

        int yearBefore = year - 1;
        int yearAfter = year + 1;

        if ("overall".equalsIgnoreCase(selectedCourse)) {
            yearWiseQuery = "SELECT year, SUM(student_hired) AS total FROM statistics " +
                            "WHERE year BETWEEN ? AND ? GROUP BY year";
            ps = con.prepareStatement(yearWiseQuery);
            ps.setInt(1, yearBefore);
            ps.setInt(2, yearAfter);
        } else {
            yearWiseQuery = "SELECT s.year, SUM(s.student_hired) AS total " +
                            "FROM statistics s JOIN course c ON s.course_id = c.course_id " +
                            "WHERE c.course_name = ? AND s.year BETWEEN ? AND ? GROUP BY s.year";
            ps = con.prepareStatement(yearWiseQuery);
            ps.setString(1, selectedCourse);
            ps.setInt(2, yearBefore);
            ps.setInt(3, yearAfter);
        }


        rs = ps.executeQuery();
        while (rs.next()) {
            JSONObject yearObj = new JSONObject();
            yearObj.put("year", rs.getInt("year"));
            yearObj.put("total", rs.getInt("total"));
            yearData.put(yearObj);
        }
        rs.close();
        ps.close();

        String courseWiseQuery;
        if ("overall".equalsIgnoreCase(selectedCourse)) {
            courseWiseQuery = "SELECT c.course_name, SUM(s.student_hired) AS placed " +
                              "FROM statistics s JOIN course c ON s.course_id = c.course_id " +
                              "WHERE s.year = ? GROUP BY c.course_name";
            ps = con.prepareStatement(courseWiseQuery);
            ps.setInt(1, year);
        } else {
            courseWiseQuery = "SELECT c.course_name, s.student_hired AS placed " +
                              "FROM statistics s JOIN course c ON s.course_id = c.course_id " +
                              "WHERE s.year = ? AND c.course_name = ?";
            ps = con.prepareStatement(courseWiseQuery);
            ps.setInt(1, year);
            ps.setString(2, selectedCourse);
        }

        rs = ps.executeQuery();
        while (rs.next()) {
            JSONObject courseStat = new JSONObject();
            courseStat.put("course", rs.getString("course_name"));
            courseStat.put("placed", rs.getInt("placed"));
            courseData.put(courseStat);
        }

        result.put("yearData", yearData);
        result.put("courseData", courseData);
        result.put("courses", courses);

        out.print(result.toString());

    } catch (Exception e) {
        e.printStackTrace();
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        out.print("{\"error\": \"" + e.getMessage().replace("\"", "'") + "\"}");
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (ps != null) try { ps.close(); } catch (Exception e) {}
        if (con != null) try { con.close(); } catch (Exception e) {}
    }
%>
