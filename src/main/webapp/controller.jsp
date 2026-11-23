<%@page import="Connect.SmsSender"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbpack.DbManager"%>
<%
    if(request.getParameter("page").equals("contactus"))
    {
        String name=request.getParameter("name");
        String gender=request.getParameter("gender");
        String address=request.getParameter("address");
        String contactno=request.getParameter("contactno");
        String emailaddress=request.getParameter("emailaddress");
        String enquirytext=request.getParameter("enquirytext");
        DbManager dm=new DbManager();
        String query="insert into enquiry(name, gender, address, contactno, emailaddress, enquirytext, enquirydate) values('"+name+"','"+gender+"','"+address+"','"+contactno+"','"+emailaddress+"','"+enquirytext+"',curdate())";
        if(dm.insertUpdateDelete(query))
        {
            SmsSender ss=new SmsSender();
            ss.sendSms(contactno);
            out.print("<script>alert('Enquiry is submitted');window.location.href='contactus.jsp';</script>");
        }
        else
        {
            out.print("<script>alert('Enquiry is not submitted');window.location.href='contactus.jsp';</script>");
        }
    }
    else if(request.getParameter("page").equals("registration"))
    {
        String name=request.getParameter("name");
        String fname=request.getParameter("fname");
        String mname=request.getParameter("mname");
        String gender=request.getParameter("gender");
        String village=request.getParameter("village");
        String post=request.getParameter("post");
        String district=request.getParameter("district");
        String state=request.getParameter("state");
        String pincode=request.getParameter("pincode");
        String contactno=request.getParameter("contactno");
        String aadharno=request.getParameter("aadharno");
        String panno=request.getParameter("panno");
        String password=request.getParameter("password");
        String regid="AVC-"+aadharno;
        DbManager dm=new DbManager();
        String query="insert into farmerinfo(regid,name,fname,mname,gender,village,post,district,state,pincode,contactno,aadharno,panno,regdate,password) values('"+regid+"','"+name+"','"+fname+"','"+mname+"','"+gender+"','"+village+"','"+post+"','"+district+"','"+state+"','"+pincode+"','"+contactno+"','"+aadharno+"','"+panno+"',curdate(),'"+password+"')";
        if(dm.insertUpdateDelete(query))
        {
            out.print("<script>alert('Registration Successful! Your Farmer Login ID is: "+regid+"');window.location.href='login.jsp';</script>");
        }
        else
        {
            out.print("<script>alert('Error: Aadhar number already registered');window.location.href='registration.jsp';</script>");
        }
    }
    else if(request.getParameter("page").equals("login"))
    {
        String role=request.getParameter("role");
        String userid=request.getParameter("userid");
        String password=request.getParameter("password");
        DbManager dm=new DbManager();
        if(role.equals("admin"))
        {
            if(userid.equals("admin"))
            {
                String query="select * from login where userid='"+userid+"' and password='"+password+"'";
                ResultSet rs=dm.select(query);
                if(rs != null && rs.next())
                {
                    session.setAttribute("adminid", userid);
                    response.sendRedirect("adminzone/adminhome.jsp");
                }
                else
                {
                    out.print("<script>alert('Invalid Admin Password');window.location.href='login.jsp';</script>");
                }
            }
            else
            {
                out.print("<script>alert('Access Denied! Only Master Admin can login as Admin.');window.location.href='login.jsp';</script>");
            }
        }
        else if(role.equals("farmer"))
        {
            String query="select * from farmerinfo where regid='"+userid+"' and password='"+password+"'";
            ResultSet rs=dm.select(query);
            if(rs != null && rs.next())
            {
                session.setAttribute("farmerid", userid);
                session.setAttribute("farmername", rs.getString("name"));
                session.setAttribute("farmeraadhar", rs.getString("aadharno"));
                response.sendRedirect("farmerzone/farmerhome.jsp");
            }
            else
            {
                out.print("<script>alert('Invalid Farmer Reg ID or Password');window.location.href='login.jsp';</script>");
            }
        }
        else if(role.equals("merchant"))
        {
            String query="select * from merchantinfo where merchantid='"+userid+"' and password='"+password+"'";
            ResultSet rs=dm.select(query);
            if(rs != null && rs.next())
            {
                session.setAttribute("merchantid", userid);
                session.setAttribute("merchantname", rs.getString("name"));
                session.setAttribute("merchantfirm", rs.getString("firmname"));
                response.sendRedirect("merchantzone/merchanthome.jsp");
            }
            else
            {
                out.print("<script>alert('Invalid Merchant ID or Password');window.location.href='login.jsp';</script>");
            }
        }
    }
    else if(request.getParameter("page").equals("merchantreg"))
    {
        String name=request.getParameter("name");
        String firmname=request.getParameter("firmname");
        String contactno=request.getParameter("contactno");
        String gstno=request.getParameter("gstno");
        String city=request.getParameter("city");
        String password=request.getParameter("password");
        String merchantid="MRC-"+contactno;
        DbManager dm=new DbManager();
        String query="insert into merchantinfo values('"+merchantid+"','"+name+"','"+firmname+"','"+contactno+"','"+gstno+"','"+city+"','"+password+"',curdate())";
        if(dm.insertUpdateDelete(query))
        {
            out.print("<script>alert('Merchant Registration Successful! Your Login ID is: "+merchantid+"');window.location.href='login.jsp';</script>");
        }
        else
        {
            out.print("<script>alert('Error: Mobile number already registered');window.location.href='merchantreg.jsp';</script>");
        }
    }
    else if(request.getParameter("page").equals("listcrop"))
    {
        String regid = session.getAttribute("farmerid").toString();
        String fname = session.getAttribute("farmername").toString();
        String aadharno = session.getAttribute("farmeraadhar").toString();
        int packets = Integer.parseInt(request.getParameter("packets"));
        int rate = Integer.parseInt(request.getParameter("price_per_packet"));
        int total = packets * rate;
        DbManager dm = new DbManager();
        String query = "insert into marketplace(farmer_regid, farmer_name, aadharno, packets, price_per_packet, total_deal_amt, created_date) values('"+regid+"','"+fname+"','"+aadharno+"',"+packets+","+rate+","+total+",curdate())";
        if(dm.insertUpdateDelete(query))
        {
            out.print("<script>alert('Your stock is now LIVE in Merchant Marketplace!');window.location.href='farmerzone/farmerhome.jsp';</script>");
        }
        else
        {
            out.print("<script>alert('Failed to list stock');window.location.href='farmerzone/farmerhome.jsp';</script>");
        }
    }
%>