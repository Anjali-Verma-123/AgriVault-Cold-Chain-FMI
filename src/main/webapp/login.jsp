<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Portal Login - AgriVault Cold Chain</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container my-5">
            <div class="card card-modern mx-auto" style="max-width: 460px;">
                <div class="card-body p-4 p-md-5">
                    <div class="text-center mb-4">
                        <div class="bg-success bg-opacity-10 text-success d-inline-flex p-3 rounded-circle mb-2">
                            <i class="bi bi-shield-lock-fill fs-2"></i>
                        </div>
                        <h3 class="fw-bold">Welcome Back</h3>
                        <p class="text-muted small">Sign in to access your Farmer or Admin dashboard</p>
                    </div>
                    <form method="post" action="controller.jsp">
                        <input type="hidden" name="page" value="login"/>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Select Account Type</label>
                            <select name="role" class="form-select" required>
                                <option value="farmer">Farmer Account (View Bookings &amp; Dues)</option>
                                <option value="merchant">Merchant Account (Buy Cold Storage Stock)</option>
                                <option value="admin">Master Admin (Cold Storage Operations)</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Registration ID / User ID</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-person"></i></span>
                                <input type="text" name="userid" class="form-control" placeholder="AVC-XXXXXXXXXXXX or admin or merchant" required/>
                            </div>
                        </div>
                        <div class="mb-4">
                            <label class="form-label fw-semibold">Password</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-key"></i></span>
                                <input type="password" name="password" class="form-control" placeholder="Enter your password" required/>
                            </div>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-success btn-lg fw-bold">
                                Sign In <i class="bi bi-arrow-right ms-1"></i>
                            </button>
                        </div>
                    </form>
                    <div class="text-center mt-4 pt-3 border-top">
                        <span class="small text-muted">New Farmer? </span>
                        <a href="registration.jsp" class="small fw-bold text-success text-decoration-none">Register Here</a>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>