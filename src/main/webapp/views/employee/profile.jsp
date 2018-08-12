<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<%@ include file="header.jsp" %>
<title>Profile</title>
</head>
<body>

<%@ include file="navbar.jsp" %>

<section class="engine"></section><section class="header5 cid-qZwUUosv6n mbr-fullscreen mbr-parallax-background" id="header5-l">

    

    <div class="mbr-overlay" style="opacity: 0.3; background-color: rgb(255, 255, 255);">
    </div>
    <div class="container">
        <div class="row justify-content-center">
            <div class="mbr-white col-md-10">
                <h1 class="mbr-section-title align-center pb-3 mbr-fonts-style display-1"><strong>
                    Hi,&nbsp;</strong></h1>
                <p class="mbr-text align-center display-5 pb-3 mbr-fonts-style">Corp Id : ${employee.aId}<br>Name : ${employee.eName}<br>Contact : ${employee.contact}</p>
                
            </div>
        </div>
    </div>

    
</section>

<%@ include file="footer.jsp" %>  
</body>
</html>