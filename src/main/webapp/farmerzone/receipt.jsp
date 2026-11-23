<%@page import="java.sql.ResultSet"%>
<%@page import="dbpack.DbManager"%>
<%
    if(session.getAttribute("farmerid")==null && session.getAttribute("adminid")==null) {
        response.sendRedirect("../login.jsp");
    } else {
        String aadharno = (request.getParameter("ano") != null) ? request.getParameter("ano") : session.getAttribute("farmeraadhar").toString();
        DbManager dm = new DbManager();
        ResultSet rs = dm.select("select * from booking where aadharno='"+aadharno+"'");
        if(rs != null && rs.next()) {
            int total = rs.getInt("totalamt");
            int rest = rs.getInt("restamt");
            int paid = total - rest;
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Official Receipt - <%=rs.getString("regid")%></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <style>
            @media print { .no-print { display: none; } }
        </style>
    </head>
    <body class="p-4">
        <div class="container border border-2 border-dark p-4" style="max-width: 750px;">
            <div class="text-center border-bottom pb-3 mb-3">
                <h2 class="fw-bold text-primary mb-0">AGRIVAULT COLD CHAIN</h2>
                <p class="mb-0">Farmer Merchant Integration &amp; Cold Storage Automation</p>
                <span class="badge bg-dark mt-2">OFFICIAL STORAGE RECEIPT &amp; GATE PASS</span>
            </div>
            <table class="table table-bordered">
                <tr><th>Registration ID</th><td><%=rs.getString("regid")%></td><th>Booking Date</th><td><%=rs.getString("bookingdate")%></td></tr>
                <tr><th>Farmer Name</th><td><%=rs.getString("name")%></td><th>Contact No</th><td><%=rs.getString("contactno")%></td></tr>
                <tr><th>Aadhar No</th><td><%=rs.getString("aadharno")%></td><th>Address</th><td><%=rs.getString("village")%>, <%=rs.getString("district")%></td></tr>
            </table>
            <h5 class="mt-3">Storage &amp; Billing Breakdown</h5>
            <table class="table table-bordered">
                <tr class="table-light">
                    <th>Packets (Katte)</th>
                    <th>Duration (Months)</th>
                    <th>Rate / Packet / Mo</th>
                    <th>Total Amount</th>
                </tr>
                <tr>
                    <td><%=rs.getInt("noofpacket")%></td>
                    <td><%=rs.getInt("duration")%></td>
                    <td>&#8377; <%=rs.getInt("rate")%></td>
                    <td class="fw-bold">&#8377; <%=total%></td>
                </tr>
                <tr>
                    <th colspan="3" class="text-end">Total Paid Amount (Advance + Installments)</th>
                    <td class="text-success fw-bold">&#8377; <%=paid%></td>
                </tr>
                <tr>
                    <th colspan="3" class="text-end">Balance Due (Rest Amount)</th>
                    <td class="text-danger fw-bold">&#8377; <%=rest%></td>
                </tr>
                <tr>
                    <th colspan="3" class="text-end">Gate Pass Status</th>
                    <td>
                        <%= (rest == 0) ? "<span class='badge bg-success'>APPROVED FOR RELEASE</span>" : "<span class='badge bg-danger'>HOLD - DUES PENDING</span>" %>
                    </td>
                </tr>
            </table>
            <div class="d-flex justify-content-between mt-5 pt-3">
                <div>_______________________<br/>Farmer Signature</div>
                <div class="text-end">_______________________<br/>Authorized Cold Storage Manager</div>
            </div>
            <div class="text-center mt-4 no-print">
                <button onclick="window.print()" class="btn btn-primary px-4">Print / Save as PDF</button>
            </div>
        </div>
    </body>
</html>
<% } } %>