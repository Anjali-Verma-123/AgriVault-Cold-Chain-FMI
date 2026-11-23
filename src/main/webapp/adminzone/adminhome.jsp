<%@page import="java.sql.ResultSet"%>
<%@page import="dbpack.DbManager"%>
<%
    if(session.getAttribute("adminid")==null) {
        response.sendRedirect("../login.jsp");
    } else {
        DbManager dm = new DbManager();
        int totalFarmers = 0, totalPackets = 0, totalRevenue = 0, pendingDues = 0, totalEnquiries = 0;

        ResultSet rs1 = dm.select("select count(*) from farmerinfo");
        if(rs1 != null && rs1.next()) totalFarmers = rs1.getInt(1);

        ResultSet rs2 = dm.select("select coalesce(sum(noofpacket),0), coalesce(sum(totalamt - restamt),0), coalesce(sum(restamt),0) from booking");
        if(rs2 != null && rs2.next()) {
            totalPackets = rs2.getInt(1);
            totalRevenue = rs2.getInt(2);
            pendingDues = rs2.getInt(3);
        }

        ResultSet rs3 = dm.select("select count(*) from enquiry");
        if(rs3 != null && rs3.next()) totalEnquiries = rs3.getInt(1);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard - AgriVault Cold Chain</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container py-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h2 class="fw-bold mb-0">Cold Storage Overview</h2>
                    <p class="text-muted mb-0">Real-time operational metrics and quick actions</p>
                </div>
                <span class="badge bg-success fs-6 px-3 py-2"><i class="bi bi-circle-fill me-2 small"></i>System Online</span>
            </div>

            <!-- Live Analytics KPI Cards -->
            <div class="row g-4 mb-5">
                <div class="col-md-3">
                    <div class="stat-card" style="background: linear-gradient(135deg, #0d6efd, #0a58ca);">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <p class="mb-1 opacity-75 small text-uppercase fw-bold">Registered Farmers</p>
                                <h2 class="fw-bold mb-0"><%=totalFarmers%></h2>
                            </div>
                            <i class="bi bi-people-fill fs-1 opacity-50"></i>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stat-card" style="background: linear-gradient(135deg, #198754, #146c43);">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <p class="mb-1 opacity-75 small text-uppercase fw-bold">Stored Packets</p>
                                <h2 class="fw-bold mb-0"><%=totalPackets%> <small class="fs-6 fw-normal">Katte</small></h2>
                            </div>
                            <i class="bi bi-boxes fs-1 opacity-50"></i>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stat-card" style="background: linear-gradient(135deg, #0f766e, #115e59);">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <p class="mb-1 opacity-75 small text-uppercase fw-bold">Revenue Collected</p>
                                <h2 class="fw-bold mb-0">&#8377; <%=totalRevenue%></h2>
                            </div>
                            <i class="bi bi-wallet2 fs-1 opacity-50"></i>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stat-card" style="background: linear-gradient(135deg, #dc3545, #b02a37);">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <p class="mb-1 opacity-75 small text-uppercase fw-bold">Pending Dues</p>
                                <h2 class="fw-bold mb-0">&#8377; <%=pendingDues%></h2>
                            </div>
                            <i class="bi bi-exclamation-circle-fill fs-1 opacity-50"></i>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Live Cold Storage Capacity Bar -->
            <%
                int maxCapacity = 50000;
                int availableSpace = Math.max(0, maxCapacity - totalPackets);
                int occupancyPercent = Math.min(100, (int)Math.round((totalPackets * 100.0) / maxCapacity));
            %>
            <div class="card card-modern p-4 mb-5">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <h5 class="fw-bold mb-0"><i class="bi bi-building-check text-success me-2"></i>Live Cold Storage Facility Capacity</h5>
                    <span class="badge bg-primary fs-6"><%=occupancyPercent%>% Occupied</span>
                </div>
                <p class="text-muted small mb-3">Total Capacity: <strong>50,000 Packets</strong> | Currently Stored: <strong><%=totalPackets%> Packets</strong> | Available Space: <strong class="text-success"><%=availableSpace%> Packets</strong></p>
                <div class="progress" style="height: 22px; border-radius: 10px;">
                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-success fw-bold" role="progressbar" style="width: <%=Math.max(5, occupancyPercent)%>%;">
                        <%=totalPackets%> / 50,000 Katte
                    </div>
                </div>
            </div>
            <!-- Quick Action Cards -->
            <h5 class="fw-bold mb-3">Quick Operations</h5>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card card-modern p-4">
                        <h5 class="fw-bold text-primary"><i class="bi bi-box-seam me-2"></i>Allocate Cold Storage</h5>
                        <p class="text-muted small">Assign packets, monthly tariff, and advance payment for registered farmers.</p>
                        <a href="booking.jsp" class="btn btn-outline-primary btn-sm fw-bold">Go to Bookings &rarr;</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card card-modern p-4">
                        <h5 class="fw-bold text-success"><i class="bi bi-cash-stack me-2"></i>Payment &amp; Gate Pass</h5>
                        <p class="text-muted small">Collect pending rent dues from farmers and generate printable release receipts.</p>
                        <a href="closing.jsp" class="btn btn-outline-success btn-sm fw-bold">Collect Dues &rarr;</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card card-modern p-4">
                        <h5 class="fw-bold text-dark"><i class="bi bi-chat-left-text me-2"></i>Customer Enquiries (<%=totalEnquiries%>)</h5>
                        <p class="text-muted small">Review incoming farmer/merchant tariff queries and publish live ticker news.</p>
                        <a href="enquiry.jsp" class="btn btn-outline-dark btn-sm fw-bold">View Enquiries &rarr;</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<% } %>