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
        <title>Merchant Trade Deals - Admin</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container py-4">
            <div class="card card-modern p-4">
                <div class="mb-4">
                    <h4 class="fw-bold mb-0"><i class="bi bi-handshake text-primary me-2"></i>Merchant-Farmer Trade Approvals</h4>
                    <p class="text-muted small mb-0">Verify cold storage rent clearance before approving stock transfer to merchants</p>
                </div>

                <div class="table-responsive">
                    <table class="table table-hover align-middle table-modern mb-0">
                        <thead>
                            <tr>
                                <th>Deal ID</th>
                                <th>Seller (Farmer)</th>
                                <th>Buyer (Merchant Firm)</th>
                                <th>Quantity &amp; Deal Value</th>
                                <th>Storage Rent Due</th>
                                <th>Status</th>
                                <th class="text-center">Admin Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                DbManager dm = new DbManager();
                                String q = "SELECT m.*, COALESCE(b.restamt, 0) AS storage_due FROM marketplace m LEFT JOIN booking b ON m.aadharno = b.aadharno ORDER BY m.dealid DESC";
                                ResultSet rs = dm.select(q);
                                boolean hasDeals = false;
                                while(rs != null && rs.next()) {
                                    hasDeals = true;
                                    int dealid = rs.getInt("dealid");
                                    int storageDue = rs.getInt("storage_due");
                                    String status = rs.getString("status");
                            %>
                            <tr>
                                <td class="fw-bold">#<%=dealid%></td>
                                <td>
                                    <div class="fw-semibold"><%=rs.getString("farmer_name")%></div>
                                    <small class="text-muted"><%=rs.getString("farmer_regid")%></small>
                                </td>
                                <td>
                                    <div class="fw-semibold text-primary"><%=rs.getString("merchant_firm")%></div>
                                    <small class="text-muted">ID: <%=rs.getString("merchant_id")%></small>
                                </td>
                                <td>
                                    <div><%=rs.getInt("packets")%> Katte @ &#8377;<%=rs.getInt("price_per_packet")%></div>
                                    <strong class="text-success">Total: &#8377;<%=rs.getInt("total_deal_amt")%></strong>
                                </td>
                                <td>
                                    <% if(storageDue == 0) { %>
                                        <span class="badge bg-success"><i class="bi bi-check-circle me-1"></i>Rent Cleared (&#8377;0)</span>
                                    <% } else { %>
                                        <span class="badge bg-danger"><i class="bi bi-exclamation-triangle me-1"></i>Due: &#8377;<%=storageDue%></span>
                                    <% } %>
                                </td>
                                <td>
                                    <% if(status.equals("APPROVED & SOLD")) { %>
                                        <span class="badge bg-success"><%=status%></span>
                                    <% } else if(status.equals("REQUESTED BY MERCHANT")) { %>
                                        <span class="badge bg-warning text-dark">PENDING APPROVAL</span>
                                    <% } else { %>
                                        <span class="badge bg-secondary"><%=status%></span>
                                    <% } %>
                                </td>
                                <td class="text-center">
                                    <% if(status.equals("REQUESTED BY MERCHANT")) { %>
                                        <% if(storageDue == 0) { %>
                                            <a href="approvedeal.jsp?dealid=<%=dealid%>&action=approve" class="btn btn-success btn-sm fw-semibold me-1">
                                                <i class="bi bi-check2-circle"></i> Approve
                                            </a>
                                        <% } else { %>
                                            <a href="closing.jsp" class="btn btn-outline-danger btn-sm fw-semibold me-1" title="Clear farmer storage rent first">
                                                Clear Rent First
                                            </a>
                                        <% } %>
                                        <a href="approvedeal.jsp?dealid=<%=dealid%>&action=reject" class="btn btn-outline-secondary btn-sm">
                                            Reject
                                        </a>
                                    <% } else if(status.equals("APPROVED & SOLD")) { %>
                                        <span class="text-success small fw-bold"><i class="bi bi-patch-check-fill"></i> Transferred</span>
                                    <% } else { %>
                                        <span class="text-muted small">Waiting for Buyer</span>
                                    <% } %>
                                </td>
                            </tr>
                            <% } if(!hasDeals) { %>
                            <tr><td colspan="7" class="text-center text-muted py-4">No marketplace listings or merchant deals found.</td></tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
<% } %>