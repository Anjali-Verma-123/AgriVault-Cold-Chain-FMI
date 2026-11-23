<%@page import="java.sql.ResultSet"%>
<%@page import="dbpack.DbManager"%>
<%
    if(session.getAttribute("adminid")==null) {
        response.sendRedirect("../login.jsp");
    } else {
        String ano = request.getParameter("ano");
        DbManager dm = new DbManager();
        ResultSet rs = dm.select("select * from booking where aadharno='"+ano+"'");
        if(rs != null && rs.next()) {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Collect Due Payment - Admin</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container py-5">
            <div class="card card-modern mx-auto" style="max-width: 550px;">
                <div class="card-header bg-success text-white p-4 rounded-top-4 d-flex justify-content-between align-items-center">
                    <h4 class="fw-bold mb-0"><i class="bi bi-wallet2 me-2"></i>Collect Due Payment</h4>
                    <a href="closing.jsp" class="btn btn-light btn-sm fw-bold text-dark">&larr; Back</a>
                </div>
                <div class="card-body p-4 p-md-5">
                    <form method="post" action="admincontroller.jsp">
                        <input type="hidden" name="page" value="payment"/>
                        <input type="hidden" name="aadharno" value="<%=rs.getString("aadharno")%>"/>

                        <div class="mb-3">
                            <label class="form-label small text-muted mb-0">Registration ID</label>
                            <input type="text" name="regid" value="<%=rs.getString("regid")%>" class="form-control bg-light fw-bold" readonly/>
                        </div>
                        <div class="mb-3">
                            <label class="form-label small text-muted mb-0">Farmer Name</label>
                            <input type="text" name="name" value="<%=rs.getString("name")%>" class="form-control bg-light" readonly/>
                        </div>
                        <div class="row g-3 mb-3">
                            <div class="col-6">
                                <label class="form-label small text-muted mb-0">Total Rent</label>
                                <input type="text" name="totalamt" value="<%=rs.getString("totalamt")%>" class="form-control bg-light" readonly/>
                            </div>
                            <div class="col-6">
                                <label class="form-label small text-danger fw-bold mb-0">Pending Balance (Due)</label>
                                <input type="text" name="restamt" value="<%=rs.getString("restamt")%>" class="form-control bg-light text-danger fw-bold" readonly/>
                            </div>
                        </div>
                        <div class="mb-4">
                            <label class="form-label fw-bold text-success">Enter Amount Received Now (&#8377;)</label>
                            <input type="number" name="payamt" max="<%=rs.getInt("restamt")%>" min="1" value="<%=rs.getInt("restamt")%>" class="form-control form-control-lg border-success fw-bold" required/>
                            <small class="text-muted">Pre-filled with full remaining due amount for quick settlement.</small>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-success btn-lg fw-bold">
                                <i class="bi bi-check-circle-fill me-2"></i> Confirm &amp; Record Payment
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
<% } } %>