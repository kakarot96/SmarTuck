<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<%@ include file="header.jsp" %>
<title>Order Summary</title>
</head>
<body>
<%@ include file="navbar.jsp" %>


<section class="engine"></section><section class="cid-qZCE50BUW5 mbr-fullscreen mbr-parallax-background" id="header2-1i">

    <div class="mbr-overlay" style="opacity: 0.6; background-color: rgb(35, 35, 35);"></div>

    <div class="container align-center">
        <div class="row justify-content-md-center">
            <div class="mbr-white col-md-10">
                <h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-1">Your Order has been placed successfully!!</h1>
                
     <!-- SUPPLY THE GENERATED ORDER ID HERE and then REDIRECT TO HOME PAGE/ORDER HISTORY PAGE -->
                <h3 class="mbr-section-subtitle align-center mbr-light pb-3 mbr-fonts-style display-2">Order ID: ${orderId}</h3>
                
                
                <p class="mbr-text pb-3 mbr-fonts-style display-5">We will notify you when your order is ready. 
<br>You can view your order progress in Orders Section.</p>
                
            </div>
        </div>
    </div>
    
</section>


<%@ include file="footer.jsp" %>
</body>
</html>