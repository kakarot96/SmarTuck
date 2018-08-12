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

<section class="engine"></section><section class="mbr-section info1 cid-qZUa721piu" id="info1-1y">

    <div class="container">
        <div class="row justify-content-center content-row">
            <div class="media-container-column title col-12 col-lg-7 col-md-6">
                
                <h2 class="align-left mbr-bold mbr-fonts-style display-2">
                    ORDER INFORMATION</h2>
            </div>
            <div class="media-container-column col-12 col-lg-3 col-md-4">
                
            </div>
        </div>
    </div>
</section>

<section class="mbr-section content4 cid-qZUaqRADIM" id="content4-20">

    

    <div class="container">
        <div class="media-container-row">
            <div class="title col-12 col-md-8">

    <!-- DISPLAY DETAILS FROM ORDER HERE -->
                <h2 class="align-center pb-3 mbr-fonts-style display-5">
                    ORDER ID:&nbsp; ${orderInformation.get(0).getOrderId()}</h2>
                <h3 class="mbr-section-subtitle align-center mbr-light mbr-fonts-style display-7">
                    DATE:&nbsp; ${orderInformation.get(0).getOrderDate()} </h3>
                
            </div>
        </div>
    </div>
</section>


<form class="mbr-form" action="/employee/rateOrder?id=${id}&orderId=${orderInformation.get(0).getOrderId()}" method="post" data-form-title="Rate Form" name="rateform" id="rateform">

<section class="section-table cid-qZU8ZwPCcR" id="table1-1r">

        <div class="container container-table">
                <div class="table-wrapper">
                    <div class="container">
                    </div>
                    <div class="container scroll">
                      <table class="table" cellspacing="0">
                        <thead>
                          <tr class="table-heads ">  
                                <th class="head-item mbr-fonts-style display-7" style="width:20%">SNO</th>
                                <th class="head-item mbr-fonts-style display-7" style="width:50%">ITEM NAME</th>
                                <th class="head-item mbr-fonts-style display-7" style="width:30%">RATING</th>
                            </tr>
                        </thead>
            
                        <tbody>

        <!-- APPLY THE FOR EACH LOOP HERE -->
        				<% int sno=1; %>
        				<c:forEach var = "item" items = "${orderInformation}">
                        <tr>    <td class="body-item mbr-fonts-style display-7"><%=sno++ %></td>                            
                                <td class="body-item mbr-fonts-style display-7">${item.iNo.itemName}</td>
                                <td class="body-item mbr-fonts-style display-7">
                                            <select class="form-control" name="${item.iNo.iNo}" required>
                                                <!-- <option disabled>Login As</option> -->
                                                <option value="">Select Rating</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                            </select>
                 
                                </td>
                        </tr>
                        </c:forEach>
                                   
                         </table>
                    </div>
                    <div class="container table-info-container">
                      
                    </div>
                  </div>
                </div>
</section>

<section class="mbr-section info1 cid-qZS1QnGlas" id="info1-1p">
   
    <div class="container">
        <div class="row justify-content-center content-row">
            <div class="media-container-column col-12 col-lg-3 col-md-4">
                <div class="mbr-section-btn align-right py-4"> 
                	<span class="input-group-btn">
                        <button href="" type="submit" class="btn btn-secondary btn-form display-4" style="border-radius: 100px;">RATE ORDER</button>
                    </span>
                </div>
            </div>
        </div>
    </div>

</section>

</form>


<%@ include file="footer.jsp" %>
</body>
</html>