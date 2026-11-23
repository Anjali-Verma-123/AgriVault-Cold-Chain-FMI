<%@page import="java.sql.ResultSet"%>
<%@page import="dbpack.DbManager"%>
<%
    if(session.getAttribute("merchantid")==null) {
        response.sendRedirect("../login.jsp");
    } else {
        String mid = session.getAttribute("merchantid").toString();
        String mname = session.getAttribute("merchantname").toString();
        String mfirm = session.getAttribute("merchantfirm").toString();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Merchant Marketplace - AgriVault</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet"/>
        <link href="../css/style.css" rel="stylesheet"/>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
            <div class="container">
                <a class="navbar-brand fw-bold" href="merchanthome.jsp">
                    <i class="bi bi-shop me-2"></i><%=mfirm%> <small class="fw-normal opacity-75">(<%=mid%>)</small>
                </a>
                <a href="logout.jsp" class="btn btn-light btn-sm fw-bold text-danger">Logout</a>
            </div>
        </nav>

        <div class="container py-4">
            <!-- Available Cold Storage Lots -->
            <div class="card card-modern p-4 mb-4">
                <h4 class="fw-bold text-primary mb-1"><i class="bi bi-basket2-fill me-2"></i>Live Cold Storage Marketplace</h4>
                <p class="text-muted small mb-3">Purchase quality-verified produce directly from registered farmers</p>
                <div class="table-responsive">
                    <table class="table table-hover align-middle table-modern mb-0">
                        <thead>
                            <tr>
                                <th>Lot ID</th>
                                <th>Farmer Name</th>
                                <th>Farmer Reg ID</th>
                                <th>Quantity</th>
                                <th>Asking Rate</th>
                                <th>Total Deal Value</th>
                                <th>Listed Date</th>
                                <th class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                DbManager dm = new DbManager();
                                ResultSet rs = dm.select("select * from marketplace where status='AVAILABLE'");
                                boolean hasStock = false;
                                while(rs != null && rs.next()) {
                                    hasStock = true;
                            %>
                            <tr>
                                <td class="fw-bold">#<%=rs.getInt("dealid")%></td>
                                <td class="fw-semibold"><%=rs.getString("farmer_name")%></td>
                                <td><span class="badge bg-light text-dark border"><%=rs.getString("farmer_regid")%></span></td>
                                <td><%=rs.getInt("packets")%> Katte</td>
                                <td>&#8377; <%=rs.getInt("price_per_packet")%> / packet</td>
                                <td class="fw-bold text-success fs-6">&#8377; <%=rs.getInt("total_deal_amt")%></td>
                                <td><%=rs.getString("created_date")%></td>
                                <td class="text-center">
                                    <a href="buydeal.jsp?dealid=<%=rs.getInt("dealid")%>" onclick="return confirm('Confirm purchase request for this lot?')" class="btn btn-success btn-sm px-3 fw-bold">
                                        <i class="bi bi-bag-check me-1"></i> Send Buy Offer
                                    </a>
                                </td>
                            </tr>
                            <% } if(!hasStock) { %>
                            <tr><td colspan="8" class="text-center text-muted py-4">No new lots currently listed by farmers.</td></tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Merchant's Own Purchase History -->
            <div class="card card-modern p-4">
                <h5 class="fw-bold mb-3"><i class="bi bi-receipt text-success me-2"></i>My Purchase Deals &amp; Orders</h5>
                <div class="table-responsive">
                    <table class="table table-bordered align-middle mb-0">
                        <tr class="table-light">
                            <th>Deal ID</th>
                            <th>Farmer Name</th>
                            <th>Packets</th>
                            <th>Total Deal Amount</th>
                            <th>Status</th>
                        </tr>
                        <%
                            ResultSet rsMy = dm.select("select * from marketplace where merchant_id='"+mid+"'");
                            while(rsMy != null && rsMy.next()) {
                        %>
                        <tr>
                            <td>#<%=rsMy.getInt("dealid")%></td>
                            <td><%=rsMy.getString("farmer_name")%> (<%=rsMy.getString("farmer_regid")%>)</td>
                            <td><%=rsMy.getInt("packets")%> Katte</td>
                            <td class="fw-bold">&#8377; <%=rsMy.getInt("total_deal_amt")%></td>
                            <td>
    <% if("APPROVED & SOLD".equals(rsMy.getString("status"))) { %>
        <span class="badge bg-success me-2">APPROVED &amp; SOLD</span>
        <a href="challan.jsp?dealid=<%=rsMy.getInt("dealid")%>" target="_blank" class="btn btn-outline-primary btn-sm">Print Gate Pass</a>
    <% } else { %>
        <span class="badge bg-warning text-dark"><%=rsMy.getString("status")%></span>
    <% } %>
</td>
                        </tr>
                        <% } %>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
<% } %>