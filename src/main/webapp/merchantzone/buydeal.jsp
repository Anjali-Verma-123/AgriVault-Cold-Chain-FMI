<%@page import="dbpack.DbManager"%>
<%
    if(session.getAttribute("merchantid") != null) {
        String dealid = request.getParameter("dealid");
        String mid = session.getAttribute("merchantid").toString();
        String mfirm = session.getAttribute("merchantfirm").toString();
        DbManager dm = new DbManager();
        String query = "update marketplace set merchant_id='"+mid+"', merchant_firm='"+mfirm+"', status='REQUESTED BY MERCHANT' where dealid="+dealid;
        if(dm.insertUpdateDelete(query)) {
            out.print("<script>alert('Purchase Offer Sent! Admin & Farmer have been notified.');window.location.href='merchanthome.jsp';</script>");
        }
    } else {
        response.sendRedirect("../login.jsp");
    }
%>