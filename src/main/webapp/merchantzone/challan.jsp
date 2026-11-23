<%@page import="java.sql.ResultSet"%>
<%@page import="dbpack.DbManager"%>
<%
    if(session.getAttribute("merchantid") == null) {
        response.sendRedirect("../login.jsp");
    } else {
        String dealid = request.getParameter("dealid");
        DbManager dm = new DbManager();
        ResultSet rs = dm.select("select * from marketplace where dealid=" + dealid);
        if(rs != null && rs.next()) {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Merchant Delivery Gate Pass #<%=dealid%></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <style>
            @media print { .no-print { display: none; } }
            .challan-box { max-width: 750px; margin: 30px auto; border: 2px solid #0f5132; padding: 30px; background: #fff; }
        </style>
    </head>
    <body class="bg-light">
        <div class="challan-box shadow-sm">
            <div class="text-center border-bottom pb-3 mb-4">
                <h2 class="fw-bold text-success mb-0">AGRIVAULT COLD CHAIN</h2>
                <p class="text-muted mb-1">Merchant Stock Transfer &amp; Delivery Gate Pass</p>
                <span class="badge bg-success fs-6">OFFICIAL RELEASE AUTHORIZATION</span>
            </div>
            <table class="table table-bordered">
                <tr>
                    <th>Gate Pass / Deal ID</th><td><strong>#AVC-DEAL-<%=rs.getInt("dealid")%></strong></td>
                    <th>Date</th><td><%=rs.getString("created_date")%></td>
                </tr>
                <tr>
                    <th>Buyer Firm Name</th><td><strong><%=rs.getString("merchant_firm")%></strong></td>
                    <th>Merchant ID</th><td><%=rs.getString("merchant_id")%></td>
                </tr>
                <tr>
                    <th>Original Depositor (Farmer)</th><td><%=rs.getString("farmer_name")%></td>
                    <th>Farmer Reg ID</th><td><%=rs.getString("farmer_regid")%></td>
                </tr>
                <tr>
                    <th>Approved Quantity</th><td><strong><%=rs.getInt("packets")%> Packets (Katte)</strong></td>
                    <th>Agreed Rate</th><td>&#8377; <%=rs.getInt("price_per_packet")%> / packet</td>
                </tr>
                <tr class="table-success">
                    <th>Total Trade Settlement</th><td colspan="3"><strong class="fs-5">&#8377; <%=rs.getInt("total_deal_amt")%></strong> (Storage Rent Verified &amp; Cleared)</td>
                </tr>
            </table>
            <div class="row mt-5 pt-3 text-center">
                <div class="col-6"><p class="border-top pt-2 mx-4">Merchant Signature</p></div>
                <div class="col-6"><p class="border-top pt-2 mx-4">Cold Storage Manager Seal</p></div>
            </div>
            <div class="text-center mt-4 no-print">
                <button onclick="window.print()" class="btn btn-success px-4 fw-bold">Print Gate Pass</button>
                <a href="merchanthome.jsp" class="btn btn-secondary px-4 ms-2">Back</a>
            </div>
        </div>
    </body>
</html>
<% } } %>