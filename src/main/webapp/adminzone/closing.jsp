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
        <title>Collect Dues &amp; Account Closing - Admin</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container py-4">
            <div class="card card-modern p-4">
                <div class="row align-items-center mb-4 g-3">
                    <div class="col-md-7">
                        <h4 class="fw-bold mb-0"><i class="bi bi-cash-coin text-success me-2"></i>Payment Collection &amp; Account Closing</h4>
                        <p class="text-muted small mb-0">Collect pending storage dues and print official release gate passes</p>
                    </div>
                    <div class="col-md-5">
                        <div class="input-group">
                            <span class="input-group-text bg-light"><i class="bi bi-search"></i></span>
                            <input type="text" id="closingSearch" onkeyup="filterClosing()" class="form-control" placeholder="Search by Reg ID or Farmer Name..."/>
                        </div>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-hover align-middle table-modern mb-0" id="closingTable">
                        <thead>
                            <tr>
                                <th>Reg. ID</th>
                                <th>Farmer Name</th>
                                <th>Packets</th>
                                <th>Total Rent</th>
                                <th>Paid Amount</th>
                                <th>Balance Due</th>
                                <th>Status</th>
                                <th class="text-center">Collect Payment</th>
                                <th class="text-center">Gate Pass</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                DbManager dm = new DbManager();
                                ResultSet rs = dm.select("select * from booking");
                                boolean hasBooking = false;
                                while(rs != null && rs.next()) {
                                    hasBooking = true;
                                    int total = rs.getInt("totalamt");
                                    int rest = rs.getInt("restamt");
                                    int paid = total - rest;
                            %>
                            <tr>
                                <td><span class="badge bg-primary bg-opacity-10 text-primary fw-bold"><%=rs.getString("regid")%></span></td>
                                <td class="fw-semibold"><%=rs.getString("name")%></td>
                                <td><%=rs.getInt("noofpacket")%> Katte</td>
                                <td>&#8377; <%=total%></td>
                                <td class="text-success fw-bold">&#8377; <%=paid%></td>
                                <td class="text-danger fw-bold">&#8377; <%=rest%></td>
                                <td>
                                    <% if(rest == 0) { %>
                                        <span class="badge bg-success"><i class="bi bi-check-circle me-1"></i>PAID</span>
                                    <% } else { %>
                                        <span class="badge bg-warning text-dark"><i class="bi bi-clock-history me-1"></i>DUE</span>
                                    <% } %>
                                </td>
                                <td class="text-center">
                                    <% if(rest > 0) { %>
                                        <a href="payment.jsp?ano=<%=rs.getString("aadharno")%>" class="btn btn-success btn-sm px-3 fw-semibold">
                                            <i class="bi bi-currency-rupee"></i> Collect Due
                                        </a>
                                    <% } else { %>
                                        <span class="text-muted small fw-semibold"><i class="bi bi-check2-all text-success"></i> Cleared</span>
                                    <% } %>
                                </td>
                                <td class="text-center">
                                    <a href="../farmerzone/receipt.jsp?ano=<%=rs.getString("aadharno")%>" target="_blank" class="btn btn-outline-primary btn-sm">
                                        <i class="bi bi-printer me-1"></i> Print Bill
                                    </a>
                                </td>
                            </tr>
                            <% } if(!hasBooking) { %>
                            <tr><td colspan="9" class="text-center text-muted py-4">No active storage bookings found.</td></tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script>
            function filterClosing() {
                let input = document.getElementById("closingSearch").value.toLowerCase();
                let rows = document.querySelectorAll("#closingTable tbody tr");
                rows.forEach(row => {
                    row.style.display = row.innerText.toLowerCase().includes(input) ? "" : "none";
                });
            }
        </script>
    </body>
</html>
<% } %>