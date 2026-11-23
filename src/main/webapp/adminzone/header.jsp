<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet"/>
<link href="../css/style.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm sticky-top">
    <div class="container-fluid px-4">
        <a class="navbar-brand fw-bold text-warning" href="adminhome.jsp">
            <i class="bi bi-shield-check me-2"></i>Admin Control Center
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="adminNav">
            <ul class="navbar-nav me-auto gap-1">
                <li class="nav-item"><a class="nav-link" href="adminhome.jsp"><i class="bi bi-speedometer2 me-1"></i> Dashboard</a></li>
                <li class="nav-item"><a class="nav-link" href="news.jsp"><i class="bi bi-megaphone me-1"></i> News</a></li>
                <li class="nav-item"><a class="nav-link" href="enquiry.jsp"><i class="bi bi-envelope-paper me-1"></i> Enquiries</a></li>
                <li class="nav-item"><a class="nav-link" href="booking.jsp"><i class="bi bi-box-seam me-1"></i> New Booking</a></li>
                <li class="nav-item"><a class="nav-link" href="closing.jsp"><i class="bi bi-cash-coin me-1"></i> Collect Dues &amp; Closing</a></li>
                <li class="nav-item"><a class="nav-link" href="deals.jsp"><i class="bi bi-bag-check me-1"></i> Merchant Deals</a></li>
                <li class="nav-item"><a class="nav-link" href="changepassword.jsp"><i class="bi bi-key me-1"></i> Password</a></li>
            </ul>
            <a href="logout.jsp" class="btn btn-outline-danger btn-sm fw-bold">
                <i class="bi bi-box-arrow-right me-1"></i> Logout
            </a>
        </div>
    </div>
</nav>