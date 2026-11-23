<%@page import="java.sql.ResultSet"%>
<%@page import="dbpack.DbManager"%>
<%
    if(session.getAttribute("farmerid")==null) {
        response.sendRedirect("../login.jsp");
    } else {
        String regid = session.getAttribute("farmerid").toString();
        String fname = session.getAttribute("farmername").toString();
        String aadharno = session.getAttribute("farmeraadhar").toString();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Farmer Dashboard - AgriVault</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body style="background-color: #f4f7f6;">
        <nav class="navbar navbar-expand-lg navbar-dark bg-success">
            <div class="container">
                <a class="navbar-brand fw-bold" href="farmerhome.jsp">Farmer Portal | <%=fname%> (<%=regid%>)</a>
                <div class="d-flex">
                    <a href="logout.jsp" class="btn btn-light btn-sm fw-bold text-danger">Logout</a>
                </div>
            </div>
        </nav>

        <div class="container mt-4 mb-5">
            <h3 class="text-success mb-3">My Cold Storage Account &amp; Payment Status</h3>
            <%
                DbManager dm = new DbManager();
                ResultSet rs = dm.select("select * from booking where aadharno='"+aadharno+"'");
                if(rs != null && rs.next()) {
                    int total = rs.getInt("totalamt");
                    int rest = rs.getInt("restamt");
                    int paid = total - rest;
            %>
            <!-- Summary Cards -->
            <div class="row mb-4">
                <div class="col-md-3">
                    <div class="card text-white bg-primary shadow-sm">
                        <div class="card-body">
                            <h6>Stored Packets</h6>
                            <h3><%=rs.getInt("noofpacket")%> Katte</h3>
                            <small>Duration: <%=rs.getInt("duration")%> Months</small>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-white bg-dark shadow-sm">
                        <div class="card-body">
                            <h6>Total Rent</h6>
                            <h3>&#8377; <%=total%></h3>
                            <small>Rate: &#8377;<%=rs.getInt("rate")%>/packet/mo</small>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-white bg-success shadow-sm">
                        <div class="card-body">
                            <h6>Total Paid Amount</h6>
                            <h3>&#8377; <%=paid%></h3>
                            <small>Verified by Admin</small>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-white <%= (rest == 0) ? "bg-success" : "bg-danger" %> shadow-sm">
                        <div class="card-body">
                            <h6>Pending Due (Rest)</h6>
                            <h3>&#8377; <%=rest%></h3>
                            <small><%= (rest == 0) ? "NO DUES - CLEARED" : "PAYMENT PENDING" %></small>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Detailed Status & Receipt -->
            <div class="card shadow-sm">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Booking &amp; Gate Pass Status</h5>
                    <a href="receipt.jsp" target="_blank" class="btn btn-primary btn-sm">Print Official Receipt / Gate Pass</a>
                </div>
                <div class="card-body">
                    <table class="table table-bordered">
                        <tr>
                            <th>Registration ID</th><td><%=rs.getString("regid")%></td>
                            <th>Booking Date</th><td><%=rs.getString("bookingdate")%></td>
                        </tr>
                        <tr>
                            <th>Address</th><td><%=rs.getString("village")%>, <%=rs.getString("district")%> (<%=rs.getString("state")%>)</td>
                            <th>Contact No</th><td><%=rs.getString("contactno")%></td>
                        </tr>
                        <tr>
                            <th>Payment Status</th>
                            <td colspan="3">
                                <% if(rest == 0) { %>
                                    <span class="badge bg-success fs-6">FULLY PAID - Gate Pass Approved for Stock Release</span>
                                <% } else { %>
                                    <span class="badge bg-warning text-dark fs-6">PARTIAL PAID - Please pay &#8377;<%=rest%> at Cold Storage Counter to release stock</span>
                                <% } %>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <!-- Sell Produce to Merchants Card -->
            <div class="card shadow-sm mt-4 border-success">
                <div class="card-header bg-success text-white">
                    <h5 class="mb-0"><i class="bi bi-shop me-2"></i>Sell Stored Produce to Verified Merchants</h5>
                </div>
                <div class="card-body">
                    <form method="post" action="../controller.jsp" class="row g-3 align-items-end">
                        <input type="hidden" name="page" value="listcrop"/>
                        <div class="col-md-4">
                            <label class="form-label fw-semibold">Packets to Sell (Max: <%=rs.getInt("noofpacket")%>)</label>
                            <input type="number" name="packets" max="<%=rs.getInt("noofpacket")%>" min="1" value="<%=rs.getInt("noofpacket")%>" class="form-control" required/>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label fw-semibold">Expected Selling Price / Packet (&#8377;)</label>
                            <input type="number" name="price_per_packet" min="50" placeholder="e.g. 650" class="form-control" required/>
                        </div>
                        <div class="col-md-4">
                            <button type="submit" class="btn btn-warning fw-bold w-100 text-dark">
                                <i class="bi bi-tag-fill me-1"></i> List Stock in Marketplace
                            </button>
                        </div>
                    </form>

                    <!-- Farmer's Active Marketplace Listings -->
                    <div class="mt-4">
                        <h6 class="fw-bold text-muted">My Marketplace Listings &amp; Merchant Deals</h6>
                        <table class="table table-sm table-bordered mt-2 mb-0">
                            <tr class="table-light">
                                <th>Deal ID</th>
                                <th>Packets</th>
                                <th>Rate/Packet</th>
                                <th>Total Value</th>
                                <th>Buyer Firm</th>
                                <th>Deal Status</th>
                            </tr>
                            <%
                                ResultSet rsMkt = dm.select("select * from marketplace where farmer_regid='"+regid+"'");
                                while(rsMkt != null && rsMkt.next()) {
                            %>
                            <tr>
                                <td>#<%=rsMkt.getInt("dealid")%></td>
                                <td><%=rsMkt.getInt("packets")%> Katte</td>
                                <td>&#8377;<%=rsMkt.getInt("price_per_packet")%></td>
                                <td class="fw-bold text-success">&#8377;<%=rsMkt.getInt("total_deal_amt")%></td>
                                <td><%=rsMkt.getString("merchant_firm")%></td>
                                <td><span class="badge bg-info text-dark"><%=rsMkt.getString("status")%></span></td>
                            </tr>
                            <% } %>
                        </table>
                    </div>
                </div>
            </div>
            <% } else { %>
                <div class="alert alert-info shadow-sm">
                    <h5>No Cold Storage Booking Found Yet!</h5>
                    <p class="mb-0">Your registration (<b><%=regid%></b>) is active. Once you deposit your packets at the cold storage counter and the admin creates your booking, your live rent and payment status will appear here.</p>
                </div>
            <% } %>
        </div>
    </body>
</html>
<% } %>