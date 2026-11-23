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
        <title>Customer Enquiries - Admin</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container py-4">
            <div class="card card-modern p-4">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div>
                        <h4 class="fw-bold mb-0"><i class="bi bi-envelope-paper-fill text-primary me-2"></i>Customer &amp; Farmer Enquiries</h4>
                        <p class="text-muted small mb-0">Review incoming tariff queries and support requests</p>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover align-middle table-modern mb-0">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Sender Name</th>
                                <th>Contact Info</th>
                                <th>Address</th>
                                <th>Enquiry Message</th>
                                <th>Date</th>
                                <th class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                DbManager dm = new DbManager();
                                ResultSet rs = dm.select("select * from enquiry order by id desc");
                                boolean hasEnq = false;
                                while(rs != null && rs.next()) {
                                    hasEnq = true;
                            %>
                            <tr>
                                <td class="fw-bold text-muted">#<%=rs.getInt("id")%></td>
                                <td>
                                    <div class="fw-semibold"><%=rs.getString("name")%></div>
                                    <small class="text-muted"><%=rs.getString("gender")%></small>
                                </td>
                                <td>
                                    <div><i class="bi bi-telephone text-success me-1"></i><%=rs.getString("contactno")%></div>
                                    <small class="text-muted"><i class="bi bi-envelope me-1"></i><%=rs.getString("emailaddress")%></small>
                                </td>
                                <td><%=rs.getString("address")%></td>
                                <td style="max-width: 280px;"><%=rs.getString("enquirytext")%></td>
                                <td><span class="badge bg-light text-dark border"><%=rs.getString("enquirydate")%></span></td>
                                <td class="text-center">
                                    <a href="delenq.jsp?id=<%=rs.getInt("id")%>" onclick="return confirm('Mark as resolved and delete?')" class="btn btn-outline-danger btn-sm">
                                        <i class="bi bi-trash3 me-1"></i> Delete
                                    </a>
                                </td>
                            </tr>
                            <% } if(!hasEnq) { %>
                            <tr><td colspan="7" class="text-center text-muted py-4">No enquiries received yet.</td></tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
<% } %>