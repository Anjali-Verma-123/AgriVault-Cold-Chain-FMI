<%@page import="dbpack.DbManager"%>
<%
    if(session.getAttribute("adminid") != null) {
        String dealid = request.getParameter("dealid");
        String action = request.getParameter("action");
        DbManager dm = new DbManager();
        String query = "";
        if("approve".equals(action)) {
            query = "update marketplace set status='APPROVED & SOLD' where dealid=" + dealid;
        } else {
            query = "update marketplace set merchant_id='NONE', merchant_firm='NONE', status='AVAILABLE' where dealid=" + dealid;
        }
        if(dm.insertUpdateDelete(query)) {
            out.print("<script>alert('Trade Deal Status Updated Successfully!');window.location.href='deals.jsp';</script>");
        }
    } else {
        response.sendRedirect("../login.jsp");
    }
%>