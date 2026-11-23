<%@page import="java.sql.ResultSet"%>
<%@page import="dbpack.DbManager"%>
<%
    if(session.getAttribute("adminid")==null) {
        response.sendRedirect("../login.jsp");
    } else {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>New Storage Booking - Admin</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container py-4">
            <div class="card card-modern p-4">
                <div class="row align-items-center mb-4 g-3">
                    <div class="col-md-7">
                        <h4 class="fw-bold mb-0"><i class="bi bi-box-seam-fill text-success me-2"></i>Allocate Cold Storage Space</h4>
                        <p class="text-muted small mb-0">Select a registered farmer to assign packets, duration, and tariff</p>
                    </div>
                    <div class="col-md-5">
                        <div class="input-group">
                            <span class="input-group-text bg-light"><i class="bi bi-search"></i></span>
                            <input type="text" id="farmerSearch" onkeyup="filterFarmers()" class="form-control" placeholder="Search by Name, Reg ID, Village, or Mobile..."/>
                        </div>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-hover align-middle table-modern mb-0" id="farmerTable">
                        <thead>
                            <tr>
                                <th>Reg. ID</th>
                                <th>Farmer Name</th>
                                <th>Father's Name</th>
                                <th>Village &amp; District</th>
                                <th>Contact No</th>
                                <th>Reg. Date</th>
                                <th class="text-center">Booking Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                DbManager dm = new DbManager();
                                ResultSet rs = dm.select("select * from farmerinfo");
                                boolean hasFarmer = false;
                                while(rs != null && rs.next()) {
                                    hasFarmer = true;
                            %>
                            <tr>
                                <td><span class="badge bg-primary bg-opacity-10 text-primary fw-bold px-2 py-1"><%=rs.getString("regid")%></span></td>
                                <td class="fw-semibold"><%=rs.getString("name")%></td>
                                <td><%=rs.getString("fname")%></td>
                                <td><%=rs.getString("village")%>, <%=rs.getString("district")%></td>
                                <td><i class="bi bi-telephone text-muted me-1"></i><%=rs.getString("contactno")%></td>
                                <td><%=rs.getString("regdate")%></td>
                                <td class="text-center">
                                    <a href="book.jsp?ano=<%=rs.getString("aadharno")%>" class="btn btn-success btn-sm px-3 fw-semibold">
                                        <i class="bi bi-plus-circle me-1"></i> Book Space
                                    </a>
                                </td>
                            </tr>
                            <% } if(!hasFarmer) { %>
                            <tr><td colspan="7" class="text-center text-muted py-4">No registered farmers found.</td></tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script>
            function filterFarmers() {
                let input = document.getElementById("farmerSearch").value.toLowerCase();
                let rows = document.querySelectorAll("#farmerTable tbody tr");
                rows.forEach(row => {
                    row.style.display = row.innerText.toLowerCase().includes(input) ? "" : "none";
                });
            }
        </script>
    </body>
</html>
<% } %>