<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<%@ include file="header.jsp" %>
 <title>Home</title> 
</head>
<body>

<%@ include file="navbar.jsp" %>

<section class="engine"></section>
<%
	String errorMessage = (String) request.getAttribute("errorMessage");
	String shopStatus = (String) request.getAttribute("shopStatus");
	System.out.println(errorMessage);
	System.out.println(shopStatus);
	String errorAlert = " ";
	
	if(errorMessage != null){
		errorAlert = "alert(\""+ errorMessage + "\");";
		System.out.println(errorAlert);
	}
	
	String openComment = " ";
	String closeComment = " ";	
	if(shopStatus == null){
		openComment = "<!--  ";
		closeComment = "  -->";
	}
%>

<script type="text/javascript"><%=errorAlert %></script>

<section class="features3 cid-qZroE0hiro" id="features3-5">

    <div class="container">
        <div class="media-container-row">

            <div class="card p-3 col-12 col-md-6">
                <a href="/employee/menu?id=${id}&shopId=${shops.get(0).shopId}">
                <div class="card-wrapper">
                    <div class="card-img">
                        <img src="assets/images/mbr-1046x697.jpg" alt="SmarTuck Shop 1" title="">
                    </div>
                    <div class="card-box">
                        <h4 class="card-title mbr-fonts-style display-7">
                           	SMARTUCK SHOP 1</h4>
                        <p class="mbr-text mbr-fonts-style display-7">
                            Ground Floor, Fidelity International<br>Contact: +91 96437 96437</br>                                                       
                            </p>
                         <%=openComment %><font color="red"><h4><%=shopStatus %></h4></font><%=closeComment %>
                    </div>

					<div class="mbr-section-btn text-center">
					<span class="input-group-btn">
                            <button id="submitButton" type="submit" class="btn btn-secondary btn-form display-4" >ORDER HERE</button>
                        </span>                        
                </div>
                </div>
                </a>
            </div>

            <div class="card p-3 col-12 col-md-6">
                <a href="/employee/menu?id=${id}&shopId=${shops.get(1).shopId}">
                <div class="card-wrapper">
                    <div class="card-img">
                    <img src="assets/images/mbr-1-1046x697.jpg" alt="SmarTuck Shop 2" title="">
                    </div>
                    <div class="card-box">
                        <h4 class="card-title mbr-fonts-style display-7">
                            SMARTUCK SHOP 2</h4>
                        <p class="mbr-text mbr-fonts-style display-7">
                            Sixth Floor, Fidelity International&nbsp;&nbsp;&nbsp;<br>Contact: +91 96437 96437<br></p>
                           
                    </div>
                    
                    <div class="mbr-section-btn text-center">
                              <span class="input-group-btn">
                            <button id="submitButton" type="submit" class="btn btn-secondary btn-form display-4" >ORDER HERE</button>
                        </span>                        
                </div>
                
                </div>
                </a>
            </div>

        </div>

    </div>
</section>


<%@ include file="footer.jsp" %>  
  
</body>
</html>