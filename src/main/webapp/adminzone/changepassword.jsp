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
        <title>Security &amp; Change Password - Admin</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container py-5">
            <div class="card card-modern mx-auto" style="max-width: 480px;">
                <div class="card-body p-4 p-md-5">
                    <div class="text-center mb-4">
                        <div class="bg-warning bg-opacity-25 text-dark d-inline-flex p-3 rounded-circle mb-2">
                            <i class="bi bi-shield-lock fs-2"></i>
                        </div>
                        <h4 class="fw-bold">Change Admin Password</h4>
                        <p class="text-muted small">Update your Master Admin login credentials securely</p>
                    </div>
                    <form method="post" action="admincontroller.jsp">
                        <input type="hidden" name="page" value="changepassword"/>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Current Password</label>
                            <input type="password" name="oldpassword" class="form-control" required/>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">New Password</label>
                            <input type="password" name="newpassword" class="form-control" required/>
                        </div>
                        <div class="mb-4">
                            <label class="form-label fw-semibold">Confirm New Password</label>
                            <input type="password" name="confirmpassword" class="form-control" required/>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-dark btn-lg fw-bold">
                                <i class="bi bi-key-fill me-1"></i> Update Password
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
<% } %>