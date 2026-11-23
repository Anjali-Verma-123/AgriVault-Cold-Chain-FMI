<%@page import="java.sql.ResultSet"%>
<%@page import="dbpack.DbManager"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet"/>
<link href="css/style.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Live Announcement Ticker -->
<div class="news-ticker">
    <div class="container d-flex align-items-center">
        <span class="badge bg-danger me-3"><i class="bi bi-megaphone-fill me-1"></i> LIVE UPDATES</span>
        <marquee onmouseover="this.stop();" onmouseout="this.start();" class="fw-medium">
            <%
                DbManager dmHead = new DbManager();
                ResultSet rsNews = dmHead.select("select * from news order by id desc");
                boolean hasNews = false;
                while(rsNews != null && rsNews.next()) {
                    hasNews = true;
            %>
                <span class="me-5"><i class="bi bi-dot"></i> <%=rsNews.getString("newstext")%> <small class="text-muted">(<%=rsNews.getString("posteddate")%>)</small></span>
            <% } if(!hasNews) { %>
                <span>Welcome to AgriVault Cold Chain &amp; Farmer Merchant Integration Portal — 24x7 Automated Cold Chain Facility.</span>
            <% } %>
        </marquee>
    </div>
</div>

<!-- Main Corporate Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom sticky-top">
    <div class="container">
        <a class="navbar-brand fw-bold fs-4 d-flex align-items-center" href="index.jsp">
            <i class="bi bi-snow2 text-warning me-2 fs-3"></i>
            <span>AgriVault Cold Chain <small class="fs-6 fw-normal text-light opacity-75 d-none d-md-inline">| FMI Portal</small></span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mainNav">
            <ul class="navbar-nav ms-auto align-items-lg-center gap-2">
                <li class="nav-item"><a class="nav-link px-3" href="index.jsp"><i class="bi bi-house-door me-1"></i> Home</a></li>
                <li class="nav-item"><a class="nav-link px-3" href="registration.jsp"><i class="bi bi-person-plus me-1"></i> Farmer Registration</a></li>
                <li class="nav-item"><a class="nav-link px-3" href="merchantreg.jsp"><i class="bi bi-shop me-1"></i> Merchant Registration</a></li>
                <li class="nav-item"><a class="nav-link px-3" href="contactus.jsp"><i class="bi bi-chat-dots me-1"></i> Enquiry</a></li>
                <li class="nav-item ms-lg-2">
                    <a class="btn btn-warning fw-semibold px-4 rounded-pill text-dark shadow-sm" href="login.jsp">
                        <i class="bi bi-box-arrow-in-right me-1"></i> Portal Login
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>