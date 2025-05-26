<%-- 
    Document   : studDash
    Created on : Mar 25, 2025, 6:21:34 PM
    Author     : pragy
--%>
<%@ page import="java.sql.*, java.util.*, java.text.SimpleDateFormat" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*, java.text.SimpleDateFormat" %>
<%
    String studentId = (String) session.getAttribute("student_id");
    if (studentId == null) {
        response.sendRedirect("loginStudent.jsp?error=sessionExpired");
        return;
    }
    Connection con = null;
    PreparedStatement pst1 = null, pst2 = null;
    ResultSet rs1 = null, rs2 = null;

    List<Map<String, String>> notices = new ArrayList<Map<String, String>>();
    List<Map<String, String>> events = new ArrayList<Map<String, String>>();

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementportal", "root", "");

        String noticeQuery = "SELECT message FROM notifications WHERE expires_at > CURDATE()";
        pst1 = con.prepareStatement(noticeQuery);
        rs1 = pst1.executeQuery();
        while (rs1.next()) {
            Map<String, String> row = new HashMap<String, String>();  
            row.put("message", rs1.getString("message"));
            notices.add(row);
        }

        String scheduleQuery = "SELECT ps.round_name, ps.scheduled_date, ps.venue, ps.remarks AS placement_remarks, c.c_name AS company_name " +
               "FROM application_status a " +
               "JOIN placement_schedule ps ON a.placement_id = ps.placement_id AND a.round_no = ps.round_no " +
               "JOIN track t ON a.application_id = t.application_id " +
               "JOIN placement p ON a.placement_id = p.placement_id " +
               "JOIN company c ON p.company_id = c.company_id " +
               "WHERE a.student_id = ? " +
               "AND a.current_status != 'Rejected' " +
               "AND ps.scheduled_date > NOW() " +
               "ORDER BY ps.scheduled_date ASC";

        pst2 = con.prepareStatement(scheduleQuery);
        pst2.setString(1, studentId);
        rs2 = pst2.executeQuery();
        while (rs2.next()) {
            Map<String, String> event = new HashMap<String, String>(); 
            event.put("title", rs2.getString("company_name") + " - " + rs2.getString("round_name"));
            event.put("start", rs2.getString("scheduled_date"));
            event.put("location", rs2.getString("venue"));
            event.put("remarks", rs2.getString("placement_remarks"));
            events.add(event);
        }


    } catch (Exception e) {
        e.printStackTrace();  
    } finally {
        if (rs1 != null) rs1.close();
        if (rs2 != null) rs2.close();
        if (pst1 != null) pst1.close();
        if (pst2 != null) pst2.close();
        if (con != null) con.close();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Dashboard</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Arial', sans-serif;
                background: linear-gradient(to bottom, #a6dcef, #ffffff);
                background-repeat: no-repeat;
                background-size: cover;
                height: 100vh;
                display: flex;
                flex-direction: row;
                color: #333;
            }

            .navbar {
                width: 100%;
                background-color: #1565c0;
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 15px 20px;
                position: fixed;
                top: 0;
                left: 0;
                z-index: 1000;
                color: white;
            }

            .navbar .logo {
                display: flex;
                align-items: center;
            }

            .navbar .logo img {
                width: 50px;
                height: 50px;
                margin-right: 10px;
                border-radius: 50%;
            }

            .navbar .links {
                list-style: none;
                display: flex;
                gap: 20px;
            }

            .navbar .links a {
                color: #fff;
                text-decoration: none;
                font-size: 16px;
                transition: color 0.3s;
            }
            
            .navbar .links a:hover {
                color: #ffeb3b;
            }

            .sidebar {
                width: 250px;
                background-color: #1565c0;
                color: white;
                padding: 20px;
                position: fixed;
                height: 100vh;
                top: 60px;
            }

            .sidebar h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            .sidebar ul {
                list-style: none;
                padding: 0;
            }

            .sidebar ul li {
                padding: 10px;
            }

            .sidebar ul li a {
                color: white;
                text-decoration: none;
                font-size: 16px;
                display: block;
            }

            .sidebar ul li a:hover {
                background: #003c8f;
                padding: 10px;
                border-radius: 5px;
            }

            .main-content {
                margin-left: 270px;
                width: calc(100% - 270px);
                padding: 20px;
                margin-top: 100px;
            }

            .dashboard-container {
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
                justify-content: center;
            }

            .card {
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                width: 45%;
                text-align: center;
            }
            
            .notifications {
                text-align: left;
                padding: 15px;
            }

            .notifications ul li {
                background: #f1f1f1;
                padding: 10px;
                margin: 5px 0;
                border-radius: 5px;
            }
            
            .notifications ul li a {
                color: black;
                text-decoration: none; 
                font-weight: bold;
            }

            .notifications ul li a:hover {
                color: blue;
                text-decoration: underline; 
            }

            .notifications ul {
                list-style: none;
                padding: 0;
                margin-top: 15px;
            }

            .notifications h2 {
                text-align: center;
            }
            
            #calendar {
                max-width: 90%;
                margin: auto;
                margin-top: 15px;
            }

            @media (max-width: 768px) {
                .main-content {
                    margin-left: 0;
                    width: 100%;
                }
                .card {
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <div class="navbar">
            <div class="logo">
                <img src="images/bv.jpeg" alt="College Logo" />
                <span>Student Dashboard</span>
            </div>
            <ul class="links">
                <li><a href="frontpg.jsp">Home</a></li>
                <li><a href="aboutUs.jsp">About</a></li>
                <li><a href="contactUs.jsp">Contact</a></li>
                <li><a href="placement.jsp">Placements</a></li>
            </ul>
        </div>

        <div class="sidebar">
            <h2>Student Portal</h2>
            <ul>
                <li><a href="#">Dashboard</a></li>
                <li><a href="profileStudent.jsp">Student Profile</a></li>
                <li><a href="applStatus.jsp">Company Application Status</a></li>
                <li><a href="stats.jsp">Previous Year Stats</a></li>
                <li><a href="alumniPortal.jsp">Alumni Contact</a></li>
                <li><a href="login.jsp">Logout</a></li>
            </ul>
        </div>

        <div class="main-content">
            <div class="dashboard-container">
                <div class="card notifications">
                    <h2>Notifications</h2>
                    <ul>
                      <% 
                             if (notices.size() == 0) {
                                out.println("<li>No active notices.</li>");
                                        }
                            for (Map<String, String> notice : notices) { 
                                    %>
                                    <li><a><%= notice.get("message") %></a></li>
                                    <% } %>
                    </ul>
                </div>
                <div class="card">
                    <h2>Placement Calendar</h2>
                    <div id='calendar'></div>
                </div>
            </div>
        </div>
 <%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");

    try {
        while (rs2 != null && rs2.next()) {
            Map<String, String> event = new HashMap<String, String>();  

            String round = rs2.getString("round_name");
            String company = rs2.getString("company_name");
            String title = (company != null ? company : "Company") + " - " + (round != null ? round : "Round");

            String start = (rs2.getTimestamp("scheduled_date") != null)
                           ? sdf.format(rs2.getTimestamp("scheduled_date"))
                           : "";

            String venue = rs2.getString("venue");
            String remarks = rs2.getString("placement_remarks"); 

            if (title == null) title = "No title";
            if (start == null || start.isEmpty()) start = "Not scheduled";
            if (venue == null) venue = "Not specified";
            if (remarks == null) remarks = "No remarks";

            event.put("title", title);
            event.put("start", start);
            event.put("location", venue);
            event.put("remarks", remarks);

            events.add(event);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>


<script>
    document.addEventListener('DOMContentLoaded', function () {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            events: [
                <% for (int i = 0; i < events.size(); i++) {
                    Map<String, String> event = events.get(i);
                    String title = event.get("title") != null ? event.get("title").replace("\"", "\\\"") : "Untitled";
                    String start = event.get("start") != null ? event.get("start") : "";
                    String venue = event.get("location") != null ? event.get("location").replace("\"", "\\\"") : "N/A";
                    String remarks = event.get("remarks") != null ? event.get("remarks").replace("\"", "\\\"") : "N/A";
                %>
                {
                    title: "<%= title %>",
                    start: "<%= start %>",
                    extendedProps: {
                        venue: "<%= venue %>",
                        remarks: "<%= remarks %>"
                    }
                }<%= (i < events.size() - 1) ? "," : "" %>
                <% } %>
            ],
            eventClick: function (info) {
                var content =
                    "<strong>Round:</strong> " + (info.event.title || 'N/A') + "<br>" +
                    "<strong>Date:</strong> " + (info.event.start ? info.event.start.toLocaleString() : 'N/A') + "<br>" +
                    "<strong>Venue:</strong> " + (info.event.extendedProps.venue || 'N/A') + "<br>" +
                    "<strong>Remarks:</strong> " + (info.event.extendedProps.remarks || 'N/A');
                
                document.getElementById("modalBodyContent").innerHTML = content;
                $('#eventModal').modal('show');
            }
        });

        calendar.render();
    });
</script>

<div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="eventModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="eventModalLabel">Event Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modalBodyContent">
      </div>
    </div>
  </div>
</div>


</body>
</html>