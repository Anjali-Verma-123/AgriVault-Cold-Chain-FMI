<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Enquiry &amp; Support - AgriVault Cold Chain</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container my-5">
            <div class="row g-4 align-items-stretch">
                <div class="col-lg-5">
                    <div class="card card-modern bg-success text-white p-4 p-md-5 h-100">
                        <h3 class="fw-bold mb-3">Get in Touch</h3>
                        <p class="opacity-75 mb-4">Have questions about storage tariffs, chamber availability, or seasonal booking slots? Send us an enquiry and get an instant SMS confirmation.</p>
                        <div class="d-flex align-items-start mb-3">
                            <i class="bi bi-geo-alt-fill fs-4 me-3 text-warning"></i>
                            <div>
                                <h6 class="fw-bold mb-0">Cold Storage Facility</h6>
                                <small class="opacity-75">Plot 42, Agro Industrial Zone, NH-24, UP</small>
                            </div>
                        </div>
                        <div class="d-flex align-items-start mb-3">
                            <i class="bi bi-telephone-fill fs-4 me-3 text-warning"></i>
                            <div>
                                <h6 class="fw-bold mb-0">Helpline Desk</h6>
                                <small class="opacity-75">+91 98765 43210 (Mon - Sat, 8 AM - 8 PM)</small>
                            </div>
                        </div>
                        <div class="d-flex align-items-start">
                            <i class="bi bi-envelope-fill fs-4 me-3 text-warning"></i>
                            <div>
                                <h6 class="fw-bold mb-0">Email Support</h6>
                                <small class="opacity-75">support@agrivaultcoldchain.in</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="card card-modern p-4 p-md-5 h-100">
                        <h4 class="fw-bold text-success mb-4">Send Us an Enquiry</h4>
                        <form method="post" action="controller.jsp">
                            <input type="hidden" name="page" value="contactus"/>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold">Your Name</label>
                                    <input type="text" name="name" class="form-control" required/>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold d-block">Gender</label>
                                    <div class="mt-2">
                                        <input type="radio" name="gender" value="Male" class="form-check-input" required/> Male
                                        <input type="radio" name="gender" value="Female" class="form-check-input ms-3"/> Female
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold">Contact Number</label>
                                    <input type="number" name="contactno" class="form-control" required/>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold">Email Address</label>
                                    <input type="email" name="emailaddress" class="form-control" required/>
                                </div>
                                <div class="col-12">
                                    <label class="form-label fw-semibold">Village / City Address</label>
                                    <input type="text" name="address" class="form-control" required/>
                                </div>
                                <div class="col-12">
                                    <label class="form-label fw-semibold">Your Message / Tariff Query</label>
                                    <textarea name="enquirytext" rows="3" class="form-control" required></textarea>
                                </div>
                                <div class="col-12 text-end">
                                    <button type="submit" class="btn btn-success px-4 fw-bold">
                                        <i class="bi bi-send-fill me-1"></i> Submit Enquiry
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>