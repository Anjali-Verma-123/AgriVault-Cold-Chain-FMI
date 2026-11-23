<%@page import="java.sql.ResultSet"%>
<%@page import="dbpack.DbManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DbManager dmHome = new DbManager();
    int activeFarmers = 0;
    int storedBags = 0;
    ResultSet rsF = dmHome.select("select count(*) from farmerinfo");
    if(rsF != null && rsF.next()) activeFarmers = rsF.getInt(1);

    ResultSet rsB = dmHome.select("select coalesce(sum(noofpacket),0) from booking");
    if(rsB != null && rsB.next()) storedBags = rsB.getInt(1);
%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>AgriVault Cold Chain | Farmer Merchant Integration</title>
  </head>
  <body>
    <jsp:include page="header.jsp" />

    <div class="container">
      <!-- 1. Hero Section -->
      <div class="hero-section text-center text-lg-start">
        <div class="row align-items-center">
          <div class="col-lg-8">
            <span
              class="badge bg-warning text-dark px-3 py-2 rounded-pill fw-semibold mb-3"
            >
              <i class="bi bi-shield-check me-1"></i> ISO 9001:2015 Certified
              Cold Chain Facility
            </span>
            <h1 class="display-5 fw-bold mb-3">
              Preserving Harvests, Empowering Farmers with Transparency.
            </h1>
            <p class="lead opacity-90 mb-4">
              Register online, store your agricultural produce in
              multi-temperature chambers, track real-time rent &amp; dues, and
              download instant digital gate passes.
            </p>
            <div
              class="d-flex flex-wrap gap-3 justify-content-center justify-content-lg-start"
            >
              <a
                href="registration.jsp"
                class="btn btn-warning btn-lg fw-bold px-4 rounded-pill text-dark shadow"
              >
                <i class="bi bi-person-plus-fill me-2"></i>Register as Farmer
              </a>
              <a
                href="login.jsp"
                class="btn btn-outline-light btn-lg px-4 rounded-pill"
              >
                <i class="bi bi-speedometer2 me-2"></i>Check Booking &amp; Dues
              </a>
            </div>
          </div>
        </div>
      </div>

      <!-- 2. Live Facility Metrics Strip -->
      <div class="row g-3 mt-3">
        <div class="col-6 col-md-3">
          <div
            class="card card-modern p-3 text-center border-bottom border-4 border-success"
          >
            <h2 class="fw-bold text-success mb-0">50,000+</h2>
            <small class="text-muted fw-semibold">Total Packet Capacity</small>
          </div>
        </div>
        <div class="col-6 col-md-3">
          <div
            class="card card-modern p-3 text-center border-bottom border-4 border-primary"
          >
            <h2 class="fw-bold text-primary mb-0"><%=activeFarmers%>+</h2>
            <small class="text-muted fw-semibold">Registered Farmers</small>
          </div>
        </div>
        <div class="col-6 col-md-3">
          <div
            class="card card-modern p-3 text-center border-bottom border-4 border-warning"
          >
            <h2 class="fw-bold text-dark mb-0"><%=storedBags%></h2>
            <small class="text-muted fw-semibold"
              >Packets Currently Stored</small
            >
          </div>
        </div>
        <div class="col-6 col-md-3">
          <div
            class="card card-modern p-3 text-center border-bottom border-4 border-danger"
          >
            <h2 class="fw-bold text-danger mb-0">24x7</h2>
            <small class="text-muted fw-semibold"
              >Automated Temp. Control</small
            >
          </div>
        </div>
      </div>

      <!-- 3. Core Platform Features -->
      <div class="row g-4 mt-4">
        <div class="col-md-4">
          <div class="card card-modern p-4 h-100">
            <div class="d-flex align-items-center mb-3">
              <div
                class="bg-success bg-opacity-10 text-success p-3 rounded-3 me-3"
              >
                <i class="bi bi-thermometer-snow fs-3"></i>
              </div>
              <h5 class="fw-bold mb-0">Multi-Chamber Storage</h5>
            </div>
            <p class="text-muted mb-0">
              Scientific temperature and humidity control for potatoes, onions,
              fruits, and seasonal crops to prevent post-harvest loss.
            </p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card card-modern p-4 h-100">
            <div class="d-flex align-items-center mb-3">
              <div
                class="bg-primary bg-opacity-10 text-primary p-3 rounded-3 me-3"
              >
                <i class="bi bi-receipt-cutoff fs-3"></i>
              </div>
              <h5 class="fw-bold mb-0">100% Transparent Ledger</h5>
            </div>
            <p class="text-muted mb-0">
              Farmers can log in anytime using their Registration ID to verify
              stored packets, advance paid, and pending balance.
            </p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card card-modern p-4 h-100">
            <div class="d-flex align-items-center mb-3">
              <div
                class="bg-warning bg-opacity-25 text-dark p-3 rounded-3 me-3"
              >
                <i class="bi bi-qr-code-scan fs-3"></i>
              </div>
              <h5 class="fw-bold mb-0">Instant Gate Pass</h5>
            </div>
            <p class="text-muted mb-0">
              Zero paperwork delays during stock release—generate and print
              official storage receipts &amp; clearance gate passes in one
              click.
            </p>
          </div>
        </div>
      </div>

      <!-- 4. Storage Chambers & Tariff Guide -->
      <div class="mt-5">
        <div class="text-center mb-4">
          <span
            class="badge bg-success bg-opacity-10 text-success px-3 py-2 rounded-pill fw-semibold"
            >STORAGE ZONES &amp; TARIFFS</span
          >
          <h3 class="fw-bold mt-2">Specialized Cold Storage Chambers</h3>
          <p class="text-muted">
            Tailored cooling environments designed to preserve freshness for up
            to 12 months
          </p>
        </div>
        <div class="row g-4">
          <div class="col-md-3">
            <div class="card card-modern h-100 p-4 text-center">
              <div
                class="bg-warning bg-opacity-10 text-warning rounded-circle mx-auto d-flex align-items-center justify-content-center mb-3"
                style="width: 65px; height: 65px"
              >
                <i class="bi bi-box2-heart-fill fs-2"></i>
              </div>
              <h5 class="fw-bold">Chamber A: Potatoes</h5>
              <span class="badge bg-light text-dark border mb-2"
                >Temp: 2°C to 4°C</span
              >
              <p class="small text-muted">
                High-humidity airflow chambers preventing sprouting and weight
                shrinkage.
              </p>
              <div class="mt-auto pt-2 border-top">
                <span class="fw-bold text-success fs-5">&#8377; 20</span>
                <small class="text-muted">/ packet / month</small>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card card-modern h-100 p-4 text-center">
              <div
                class="bg-danger bg-opacity-10 text-danger rounded-circle mx-auto d-flex align-items-center justify-content-center mb-3"
                style="width: 65px; height: 65px"
              >
                <i class="bi bi-apple fs-2"></i>
              </div>
              <h5 class="fw-bold">Chamber B: Fresh Fruits</h5>
              <span class="badge bg-light text-dark border mb-2"
                >Temp: 0°C to 2°C</span
              >
              <p class="small text-muted">
                Ethylene-controlled storage for apples, pomegranates, and
                seasonal orchards.
              </p>
              <div class="mt-auto pt-2 border-top">
                <span class="fw-bold text-success fs-5">&#8377; 35</span>
                <small class="text-muted">/ crate / month</small>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card card-modern h-100 p-4 text-center">
              <div
                class="bg-primary bg-opacity-10 text-primary rounded-circle mx-auto d-flex align-items-center justify-content-center mb-3"
                style="width: 65px; height: 65px"
              >
                <i class="bi bi-moisture fs-2"></i>
              </div>
              <h5 class="fw-bold">Chamber C: Onion &amp; Garlic</h5>
              <span class="badge bg-light text-dark border mb-2"
                >Temp: 25°C (Dry Air)</span
              >
              <p class="small text-muted">
                Ventilated low-moisture racks to prevent fungal rot and extend
                shelf life.
              </p>
              <div class="mt-auto pt-2 border-top">
                <span class="fw-bold text-success fs-5">&#8377; 18</span>
                <small class="text-muted">/ packet / month</small>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card card-modern h-100 p-4 text-center">
              <div
                class="bg-success bg-opacity-10 text-success rounded-circle mx-auto d-flex align-items-center justify-content-center mb-3"
                style="width: 65px; height: 65px"
              >
                <i class="bi bi-flower1 fs-2"></i>
              </div>
              <h5 class="fw-bold">Chamber D: Seeds &amp; Spices</h5>
              <span class="badge bg-light text-dark border mb-2"
                >Temp: 8°C to 10°C</span
              >
              <p class="small text-muted">
                Preserves germination quality of certified seeds, dry chillies,
                and pulses.
              </p>
              <div class="mt-auto pt-2 border-top">
                <span class="fw-bold text-success fs-5">&#8377; 25</span>
                <small class="text-muted">/ packet / month</small>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 5. Infrastructure & Why Choose Us Split Section -->
      <div class="card card-modern p-4 p-md-5 mt-5">
        <div class="row align-items-center g-4">
          <div class="col-lg-6">
            <img
              src="https://images.unsplash.com/photo-1595841696677-6489ff3f8cd1?auto=format&fit=crop&w=900&q=80"
              alt="Modern Agricultural Storage"
              class="img-fluid rounded-4 shadow-sm w-100"
              style="max-height: 360px; object-fit: cover"
            />
          </div>
          <div class="col-lg-6">
            <span
              class="badge bg-primary bg-opacity-10 text-primary px-3 py-2 rounded-pill fw-semibold mb-2"
              >WORLD-CLASS INFRASTRUCTURE</span
            >
            <h3 class="fw-bold mb-3">
              Why Thousands of Farmers Trust AgriVault Cold Chain
            </h3>
            <p class="text-muted">
              We combine modern refrigeration engineering with a completely
              digital ledger so farmers never worry about hidden charges or
              stock misplacement.
            </p>
            <ul class="list-unstyled mt-3">
              <li class="mb-2">
                <i class="bi bi-check-circle-fill text-success me-2"></i
                ><strong>Electronic Weighbridge:</strong> Accurate digital
                packet weighing at entry &amp; exit.
              </li>
              <li class="mb-2">
                <i class="bi bi-check-circle-fill text-success me-2"></i
                ><strong>Dual DG Power Backup:</strong> Zero temperature
                fluctuations even during grid outages.
              </li>
              <li class="mb-2">
                <i class="bi bi-check-circle-fill text-success me-2"></i
                ><strong>SMS &amp; Portal Alerts:</strong> Instant notifications
                for booking, payments, and gate pass approval.
              </li>
              <li class="mb-0">
                <i class="bi bi-check-circle-fill text-success me-2"></i
                ><strong>24x7 CCTV &amp; Fire Safety:</strong> Complete security
                and insurance coverage for stored harvest.
              </li>
            </ul>
          </div>
        </div>
      </div>

      <!-- 6. How It Works Step-by-Step -->
      <div class="card card-modern p-4 p-md-5 mt-5 bg-white">
        <h3 class="fw-bold text-center text-success mb-4">
          How Farmer Portal Works
        </h3>
        <div class="row text-center g-4">
          <div class="col-md-3">
            <span class="badge bg-success rounded-circle p-3 fs-5 mb-2">1</span>
            <h6 class="fw-bold">Online Registration</h6>
            <p class="small text-muted">
              Fill farmer KYC details and get an instant unique Registration ID
              (AVC-ID).
            </p>
          </div>
          <div class="col-md-3">
            <span class="badge bg-success rounded-circle p-3 fs-5 mb-2">2</span>
            <h6 class="fw-bold">Deposit Packets</h6>
            <p class="small text-muted">
              Bring produce to the cold storage; admin records packet count,
              rate, and advance.
            </p>
          </div>
          <div class="col-md-3">
            <span class="badge bg-success rounded-circle p-3 fs-5 mb-2">3</span>
            <h6 class="fw-bold">Track Live Status</h6>
            <p class="small text-muted">
              Log in to your Farmer Dashboard anytime to check paid &amp; due
              amounts.
            </p>
          </div>
          <div class="col-md-3">
            <span class="badge bg-success rounded-circle p-3 fs-5 mb-2">4</span>
            <h6 class="fw-bold">Clear Dues &amp; Release</h6>
            <p class="small text-muted">
              Settle remaining rent at the counter and print your approved Gate
              Pass.
            </p>
          </div>
        </div>
      </div>

      <!-- 7. Farmer FAQ Accordion -->
      <div class="mt-5">
        <h3 class="fw-bold text-center mb-4">
          Frequently Asked Questions (FAQs)
        </h3>
        <div
          class="accordion shadow-sm rounded-4 overflow-hidden"
          id="faqAccordion"
        >
          <div class="accordion-item">
            <h2 class="accordion-header">
              <button
                class="accordion-button fw-semibold"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#faq1"
              >
                How do I get my Farmer Registration ID to log in?
              </button>
            </h2>
            <div
              id="faq1"
              class="accordion-collapse collapse show"
              data-bs-parent="#faqAccordion"
            >
              <div class="accordion-body text-muted">
                Click on <strong>Farmer Registration</strong> in the top menu,
                enter your details along with your Aadhar number, and set a
                password. As soon as you submit, the system generates your
                unique ID (e.g., <code>AVC-XXXXXXXXXXXX</code>).
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header">
              <button
                class="accordion-button collapsed fw-semibold"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#faq2"
              >
                How can I check if my payment has been updated by the Admin?
              </button>
            </h2>
            <div
              id="faq2"
              class="accordion-collapse collapse"
              data-bs-parent="#faqAccordion"
            >
              <div class="accordion-body text-muted">
                Log in via <strong>Portal Login</strong> selecting the
                <strong>Farmer Account</strong> option. Your dashboard displays
                live cards for Total Rent, Total Paid Amount, and Pending Due,
                along with a printable receipt.
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header">
              <button
                class="accordion-button collapsed fw-semibold"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#faq3"
              >
                When is the Gate Pass approved for taking back my produce?
              </button>
            </h2>
            <div
              id="faq3"
              class="accordion-collapse collapse"
              data-bs-parent="#faqAccordion"
            >
              <div class="accordion-body text-muted">
                Once your remaining balance (<code>Rest Amount</code>) becomes
                <strong>&#8377;0</strong>, your receipt status automatically
                switches to
                <span class="badge bg-success">APPROVED FOR RELEASE</span>.
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 8. Bottom Call-To-Action Banner -->
      <div
        class="card border-0 rounded-4 text-white p-4 p-md-5 mt-5 text-center shadow"
        style="background: linear-gradient(135deg, #0b3d24 0%, #198754 100%)"
      >
        <h2 class="fw-bold mb-2">Ready to Store Your Harvest Safely?</h2>
        <p class="opacity-75 mb-4">
          Join hundreds of farmers using our digital cold storage platform
          today.
        </p>
        <div class="d-flex justify-content-center gap-3 flex-wrap">
          <a
            href="registration.jsp"
            class="btn btn-warning btn-lg fw-bold px-4 rounded-pill text-dark"
            >Register Now</a
          >
          <a
            href="contactus.jsp"
            class="btn btn-outline-light btn-lg px-4 rounded-pill"
            >Have a Question? Contact Us</a
          >
        </div>
      </div>
    </div>

    <jsp:include page="footer.jsp" />
  </body>
</html>
