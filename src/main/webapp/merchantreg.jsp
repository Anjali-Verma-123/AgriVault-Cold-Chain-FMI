<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Merchant Registration - AgriVault Cold Chain</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container my-5">
            <div class="card card-modern mx-auto" style="max-width: 750px;">
                <div class="card-header bg-primary text-white p-4 rounded-top-4">
                    <h4 class="mb-1 fw-bold"><i class="bi bi-shop me-2"></i>Merchant / Buyer Registration</h4>
                    <p class="mb-0 small opacity-75">Register your trading firm to buy verified cold-stored produce directly from farmers.</p>
                </div>
                <div class="card-body p-4 p-md-5">
                    <form method="post" action="controller.jsp">
                        <input type="hidden" name="page" value="merchantreg"/>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Merchant Full Name</label>
                                <input type="text" name="name" class="form-control" required/>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Trading Firm / Company Name</label>
                                <input type="text" name="firmname" class="form-control" placeholder="e.g., Sharma Agro Traders" required/>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Mobile Number (Used for ID)</label>
                                <input type="number" name="contactno" class="form-control" required/>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">GST / Mandi License No.</label>
                                <input type="text" name="gstno" class="form-control text-uppercase" required/>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">City / Mandi Location</label>
                                <input type="text" name="city" class="form-control" required/>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold text-primary">Create Portal Password</label>
                                <input type="password" name="password" class="form-control border-primary" required/>
                            </div>
                            <div class="col-12 mt-4 text-end">
                                <button type="submit" class="btn btn-primary px-5 fw-bold">
                                    <i class="bi bi-check-circle me-1"></i> Register as Merchant
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>