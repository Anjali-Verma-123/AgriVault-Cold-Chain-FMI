<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Farmer Registration - AgriVault Cold Chain</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container my-5">
            <div class="card card-modern mx-auto" style="max-width: 850px;">
                <div class="card-header bg-success text-white p-4 rounded-top-4">
                    <h4 class="mb-1 fw-bold"><i class="bi bi-person-vcard me-2"></i>New Farmer Registration</h4>
                    <p class="mb-0 small opacity-75">Create your digital cold storage account to book space and track payments.</p>
                </div>
                <div class="card-body p-4 p-md-5">
                    <form method="post" action="controller.jsp">
                        <input type="hidden" name="page" value="registration"/>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Full Name</label>
                                <input type="text" name="name" class="form-control" placeholder="Enter farmer's full name" required/>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Father's Name</label>
                                <input type="text" name="fname" class="form-control" required/>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Mother's Name</label>
                                <input type="text" name="mname" class="form-control" required/>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold d-block">Gender</label>
                                <div class="mt-2">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" value="Male" required>
                                        <label class="form-check-label">Male</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" value="Female">
                                        <label class="form-check-label">Female</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label fw-semibold">Village</label>
                                <input type="text" name="village" class="form-control" required/>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label fw-semibold">Post Office</label>
                                <input type="text" name="post" class="form-control" required/>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label fw-semibold">District</label>
                                <input type="text" name="district" class="form-control" required/>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label fw-semibold">State</label>
                                <input type="text" name="state" class="form-control" required/>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label fw-semibold">PIN Code</label>
                                <input type="number" name="pincode" class="form-control" required/>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label fw-semibold">Mobile Number</label>
                                <input type="number" name="contactno" class="form-control" required/>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label fw-semibold">Aadhar Number (12 Digits)</label>
                                <input type="number" name="aadharno" class="form-control" required/>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label fw-semibold">PAN Number</label>
                                <input type="text" name="panno" class="form-control text-uppercase" required/>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label fw-semibold text-success">Create Login Password</label>
                                <input type="password" name="password" class="form-control border-success" placeholder="Min 5 characters" required/>
                            </div>
                            <div class="col-12 mt-4 text-end">
                                <button type="reset" class="btn btn-light px-4 me-2">Clear Form</button>
                                <button type="submit" class="btn btn-success px-5 fw-bold">
                                    <i class="bi bi-check-circle me-1"></i> Complete Registration
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