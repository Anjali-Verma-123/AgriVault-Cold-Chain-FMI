<%@page import="java.sql.ResultSet"%>
<%@page import="dbpack.DbManager"%>
<link rel="icon" type="image/svg+xml" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 64 64'%3E%3Cpath d='M32 4L10 13V30C10 44.5 19.4 57.6 32 61C44.6 57.6 54 44.5 54 30V13L32 4Z' fill='%23198754'/%3E%3Cpath d='M32 8V56.5C42.2 53.4 49.5 42.3 49.5 30V15.8L32 8Z' fill='%230d6efd'/%3E%3C/svg%3E"/>
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
        <a class="navbar-brand d-flex align-items-center fw-bold" href="index.jsp">
            <svg width="42" height="42" viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg" class="me-2 flex-shrink-0">
                <!-- Outer Vault Shield -->
                <path d="M32 4L10 13V30C10 44.5 19.4 57.6 32 61C44.6 57.6 54 44.5 54 30V13L32 4Z" fill="#198754" stroke="#ffffff" stroke-width="2.5"/>
                <!-- Inner Cold Chain Split -->
                <path d="M32 8V56.5C42.2 53.4 49.5 42.3 49.5 30V15.8L32 8Z" fill="#0d6efd"/>
                <!-- Wheat Leaf (Left - Agri) -->
                <path d="M25 42C20 38 18 31 21 24C25 27 27 33 25 42Z" fill="#ffc107"/>
                <path d="M26 35C22 31 21 25 24 19C27 22 28 28 26 35Z" fill="#ffe082"/>
                <!-- Snowflake Crystal (Right - Cold Chain) -->
                <path d="M39 21V41M31 26L47 36M47 26L31 36" stroke="#ffffff" stroke-width="2.5" stroke-linecap="round"/>
            </svg>
            <div class="lh-1">
                <span class="d-block fs-4 text-white">AgriVault <span class="text-warning">Cold Chain</span></span>
                <small class="text-light opacity-75 fw-semibold" style="font-size: 0.68rem; letter-spacing: 1.4px;">FARMER MERCHANT INTEGRATION</small>
            </div>
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