<%@page import="java.sql.ResultSet"%>
<%@page import="dbpack.DbManager"%>
<%
    if(session.getAttribute("adminid")==null) {
        response.sendRedirect("../login.jsp");
    } else {
        String ano = request.getParameter("ano");
        DbManager dm = new DbManager();
        ResultSet rs = dm.select("select * from farmerinfo where aadharno='"+ano+"'");
        if(rs != null && rs.next()) {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Confirm Storage Booking - Admin</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container py-4">
            <div class="card card-modern mx-auto" style="max-width: 850px;">
                <div class="card-header bg-success text-white p-4 rounded-top-4 d-flex justify-content-between align-items-center">
                    <div>
                        <h4 class="fw-bold mb-0"><i class="bi bi-box-seam me-2"></i>New Cold Storage Booking</h4>
                        <small class="opacity-75">Farmer Reg ID: <strong><%=rs.getString("regid")%></strong></small>
                    </div>
                    <a href="booking.jsp" class="btn btn-light btn-sm fw-bold text-dark">&larr; Back</a>
                </div>
                <div class="card-body p-4 p-md-5">
                    <form method="post" action="admincontroller.jsp">
                        <input type="hidden" name="page" value="book"/>
                        <input type="hidden" name="regid" value="<%=rs.getString("regid")%>"/>
                        <input type="hidden" name="aadharno" value="<%=rs.getString("aadharno")%>"/>

                        <h6 class="text-uppercase text-muted fw-bold mb-3">1. Verified Farmer Details</h6>
                        <div class="row g-3 mb-4 bg-light p-3 rounded-3 border">
                            <div class="col-md-4">
                                <label class="form-label small text-muted mb-0">Farmer Name</label>
                                <input type="text" name="name" value="<%=rs.getString("name")%>" class="form-control bg-white" readonly/>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label small text-muted mb-0">Contact Number</label>
                                <input type="text" name="contactno" value="<%=rs.getString("contactno")%>" class="form-control bg-white" readonly/>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label small text-muted mb-0">Village / Post</label>
                                <input type="text" value="<%=rs.getString("village")%>, <%=rs.getString("post")%>" class="form-control bg-white" readonly/>
                                <input type="hidden" name="village" value="<%=rs.getString("village")%>"/>
                                <input type="hidden" name="post" value="<%=rs.getString("post")%>"/>
                                <input type="hidden" name="district" value="<%=rs.getString("district")%>"/>
                                <input type="hidden" name="state" value="<%=rs.getString("state")%>"/>
                                <input type="hidden" name="pincode" value="<%=rs.getString("pincode")%>"/>
                            </div>
                        </div>

                        <h6 class="text-uppercase text-muted fw-bold mb-3">2. Storage &amp; Tariff Calculation</h6>
                        <div class="row g-3">
                            <div class="col-md-3">
                                <label class="form-label fw-semibold">No. of Packets</label>
                                <input type="number" id="packets" name="noofpacket" oninput="calcRent()" class="form-control" min="1" required/>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label fw-semibold">Duration (Months)</label>
                                <input type="number" id="duration" name="duration" oninput="calcRent()" class="form-control" min="1" required/>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label fw-semibold">Rate / Packet (&#8377;)</label>
                                <input type="number" id="rate" name="rate" oninput="calcRent()" class="form-control" value="20" min="1" required/>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label fw-semibold text-success">Advance Paid (&#8377;)</label>
                                <input type="number" id="advance" name="advanceamt" oninput="calcRent()" class="form-control border-success" value="0" min="0" required/>
                            </div>
                        </div>

                        <!-- Live Calculation Preview Box -->
                        <div class="alert alert-success mt-4 d-flex justify-content-around align-items-center text-center">
                            <div>
                                <small class="text-uppercase fw-bold d-block">Estimated Total Rent</small>
                                <span class="fs-4 fw-bold" id="totalPreview">&#8377; 0</span>
                            </div>
                            <div class="vr"></div>
                            <div>
                                <small class="text-uppercase fw-bold d-block text-danger">Remaining Due Balance</small>
                                <span class="fs-4 fw-bold text-danger" id="restPreview">&#8377; 0</span>
                            </div>
                        </div>

                        <div class="text-end mt-4">
                            <button type="submit" class="btn btn-success btn-lg px-5 fw-bold">
                                <i class="bi bi-check2-circle me-1"></i> Confirm Storage Booking
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            function calcRent() {
                let p = parseInt(document.getElementById("packets").value) || 0;
                let d = parseInt(document.getElementById("duration").value) || 0;
                let r = parseInt(document.getElementById("rate").value) || 0;
                let adv = parseInt(document.getElementById("advance").value) || 0;
                let total = p * d * r;
                let rest = Math.max(0, total - adv);
                document.getElementById("totalPreview").innerHTML = "&#8377; " + total;
                document.getElementById("restPreview").innerHTML = "&#8377; " + rest;
            }
        </script>
    </body>
</html>
<% } } %>