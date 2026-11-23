# AgriVault Cold Chain — Farmer Merchant Integration (FMI)

A full-stack web application designed to digitize cold storage inventory, automate rental ledger calculations, and enable direct B2B crop trading between Farmers and verified Merchants under Master Admin supervision.

## Tech Stack
- **Frontend:** HTML5, CSS3, Bootstrap 5.3, Bootstrap Icons, JavaScript
- **Backend:** Java (JSP, Servlets, JDBC)
- **Database:** MySQL (`fmidb`)
- **Server:** Apache Tomcat 10.1

## Key Modules & Features
1. **Master Admin Control Center:**
   - Real-time KPI dashboard (Registered Farmers, Stored Packets, Revenue Collected, Pending Dues, Live Facility Capacity Bar).
   - Cold storage space allocation with live rent calculation.
   - Partial/Full rent collection and official Gate Pass generation.
   - Trade deal verification (ensuring storage rent clearance before approving Farmer-to-Merchant stock transfer).
   - Live news ticker management and customer enquiry handling.
2. **Farmer Portal (`farmerzone`):**
   - Self-registration with unique `AVC-` ID generation.
   - Live ledger tracking (Stored Packets, Total Rent, Paid Amount, Balance Due).
   - Printable official storage receipt and release Gate Pass.
   - Direct stock listing in the Merchant Marketplace.
3. **Merchant Portal (`merchantzone`):**
   - GST/Mandi license-based buyer registration (`MRC-` ID).
   - Browse live cold-stored crop lots and submit purchase offers.
   - Download official Delivery Gate Pass / Challan upon Admin approval.

## Database Schema (`fmidb`)
- `login` — Master Admin credentials
- `farmerinfo` — Farmer KYC and authentication records
- `booking` — Storage packet allocation, tariff, advance, and due balances
- `merchantinfo` — Registered buyer firms and GST details
- `marketplace` — Crop listings, merchant buy offers, and deal approval status
- `enquiry` & `news` — Public queries and live ticker announcements

## How to Run Locally
1. Import the SQL schema into MySQL (`fmidb`) and update credentials in `DbManager.java`.
2. Build the `.war` package and deploy to Apache Tomcat `webapps/`.
3. Access the portal at `http://localhost:8081/FarmerMerchantIntegration/index.jsp`.