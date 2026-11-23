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
        <title>Manage News &amp; Ticker - Admin</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container py-4">
            <div class="row g-4">
                <!-- Add News Card -->
                <div class="col-lg-5">
                    <div class="card card-modern p-4">
                        <div class="d-flex align-items-center mb-3">
                            <div class="bg-warning bg-opacity-25 text-dark p-3 rounded-3 me-3">
                                <i class="bi bi-megaphone-fill fs-4"></i>
                            </div>
                            <div>
                                <h5 class="fw-bold mb-0">Publish Announcement</h5>
                                <small class="text-muted">Appears immediately on the public live ticker</small>
                            </div>
                        </div>
                        <form method="post" action="admincontroller.jsp">
                            <input type="hidden" name="page" value="news"/>
                            <div class="mb-3">
                                <label class="form-label fw-semibold">Announcement Text</label>
                                <textarea name="newstext" rows="4" class="form-control" placeholder="e.g., Potato storage booking open for Season 2026 at Rs. 20/packet..." required></textarea>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-success fw-bold">
                                    <i class="bi bi-send-check me-1"></i> Publish to Ticker
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- News List Table -->
                <div class="col-lg-7">
                    <div class="card card-modern p-4">
                        <h5 class="fw-bold mb-3"><i class="bi bi-list-ul text-success me-2"></i>Active Ticker Announcements</h5>
                        <div class="table-responsive">
                            <table class="table table-hover align-middle table-modern mb-0">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Announcement</th>
                                        <th>Posted Date</th>
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        DbManager dm = new DbManager();
                                        ResultSet rs = dm.select("select * from news order by id desc");
                                        boolean hasNews = false;
                                        while(rs != null && rs.next()) {
                                            hasNews = true;
                                    %>
                                    <tr>
                                        <td class="fw-bold text-muted">#<%=rs.getInt("id")%></td>
                                        <td><%=rs.getString("newstext")%></td>
                                        <td><span class="badge bg-light text-dark border"><%=rs.getString("posteddate")%></span></td>
                                        <td class="text-center">
                                            <a href="deletenews.jsp?id=<%=rs.getInt("id")%>" onclick="return confirm('Delete this announcement?')" class="btn btn-outline-danger btn-sm">
                                                <i class="bi bi-trash3"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <% } if(!hasNews) { %>
                                    <tr><td colspan="4" class="text-center text-muted py-4">No active announcements found.</td></tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<% } %>