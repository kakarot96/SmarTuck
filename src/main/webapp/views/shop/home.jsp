<%@page import="org.springframework.web.bind.annotation.RequestAttribute"%>
<%@page import="com.fil.SmarTuck.models.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.fil.SmarTuck.services.OrderServiceImplementation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="header.jsp" %>
  	<title>Home</title>
</head>
<body>
	<%@ include file="navbar.jsp" %>


<section class="engine"></section>
<%
	
	int shopStatus = (int) request.getAttribute("shopStatus");
    String classValue;
    String openClose;
	if(shopStatus==1){
		classValue = "class=\"btn btn-warning display-4\"";
		openClose = "OPEN";
	}else{
		classValue = "class=\"btn btn-secondary display-4\"";
		openClose = "CLOSED";
	}
	List<List<Order>> shopOrders = (List<List<Order>>) request.getAttribute("pendingOrders");
	String openComment = " ";
	String closeComment = " ";	
	if(shopOrders.isEmpty() == false){
		openComment = "<!--  ";
		closeComment = "  -->";
	}

%>

<section class="mbr-section content4 cid-qZUixdVQyO" id="content4-28">

    <div class="container">
        <div class="media-container-row">
            <div class="title col-12 col-md-12">
                <div class="mbr-section-btn align-left">
                <a <%=classValue %> href="/shop/toggleStatus?id=${id}" ><%=openClose %></a></div>
            </div>
        </div>
    </div>
</section>



<section class="mbr-section info1 cid-qZUhnI8dNV" id="info1-21">  
    <div class="container">
        <div class="row justify-content-center content-row">
            <div class="media-container-column title col-12 col-lg-7 col-md-6">
                
                <h2 class="align-left mbr-bold mbr-fonts-style display-2">
                    PENDING ORDERS</h2>
            </div>
            <div class="media-container-column col-12 col-lg-3 col-md-4">
                <div class="mbr-section-btn align-right py-4"><a class="btn btn-danger display-4" href="/shop/currentOrders?id=${id}">Current Orders</a></div>
            </div>
        </div>
    </div>
</section>


 <%=openComment %><section class="mbr-section content4 cid-qZUiqF2uux" id="content4-27">
  <div class="container">
        <div class="media-container-row">
            <div class="title col-12 col-md-8">
            <h3>No Pending Orders</h3>
           </div>
        </div>
    </div>
</section> <%=closeComment %>

<section class="timeline1 cid-qZUhqbvhG3" id="timeline1-25">
    <div class="container align-center">
        
        

        <div class="container timelines-container" mbri-timelines="">
<% int orderNum=1; 
	List<Integer> orderAmounts = (List<Integer>) request.getAttribute("orderAmounts");
	//System.out.println(orderAmounts);
	int counter=0;
	int i=0;
	
%>
	<!-- START NESTED LOOP HERE -->
<c:forEach var="listValue" items="${pendingOrders}">
			<%
    					
						String status = shopOrders.get(i).get(0).getStatus();
    					String acceptUrl;
    					String declineUrl;
    					String itkUrl;
    					String hideItk;
    					String hideAccept;
    					String remarks = shopOrders.get(i).get(0).getRemarks();
    					
    					if(status.equalsIgnoreCase("Pending")){
    						declineUrl = "href=\""+"/shop/declineOrder?id=" + request.getAttribute("id") + "&orderId=" + shopOrders.get(i).get(0).getOrderId()+"\"";
    						acceptUrl = "href=\""+"/shop/acceptOrder?id=" + request.getAttribute("id") + "&orderId=" + shopOrders.get(i).get(0).getOrderId()+"\"";
    						hideAccept = " ";
    						//System.out.println(url);
    					}else{
    						declineUrl = " ";
    						acceptUrl = " ";
    						hideAccept = "hidden";    						
    					}
    					
    					if(status.equalsIgnoreCase("Accepted")){
    						itkUrl = "href=\""+"/shop/itkOrder?id=" + request.getAttribute("id") + "&orderId=" + shopOrders.get(i).get(0).getOrderId()+"\"";
    						hideItk = " ";
    						//System.out.println(url);
    					}else{
    						itkUrl = " ";
    						hideItk = "hidden";
    					}
    			
    					i++;
    			%>
            <div class="row timeline-element reverse separline">      
                 
            <div class="col-xs-12 col-md-12 align-left">
                <div class="timeline-text-content">
                    <h4 class="mbr-timeline-title pb-3 mbr-fonts-style display-5">
                        ORDER <%=orderNum++ %>
                    </h4>
                    <div class="container container-table">
      
      
                            <div class="table-wrapper">
                              <!-- <div class="container">
                                
                              </div> -->
                      
                              <div class="container scroll">
                                <table class="table" cellspacing="0">
                                  <thead>
                                      <tr class="table-heads ">                  
                                              <th class="head-item mbr-fonts-style display-7" style="width:40%">ORDER ID: &nbsp;<span style="font-weight:normal;">${listValue.get(0).getOrderId()}</span></th>
                                              <th class="head-item mbr-fonts-style display-7" style="width:30%">STATUS: &nbsp;<span style="font-weight:normal;">${listValue.get(0).getStatus()}</span></th>
                                              <th class="head-item mbr-fonts-style display-7" style="width:30%">AMOUNT: &nbsp;<span style="font-weight:normal;"><%=orderAmounts.get(counter++) %></span></th>
                                              <!-- <th class="head-item mbr-fonts-style display-7">QUANTITY</th> -->
                                      </tr>
                                  </thead>
                      
             <tbody>
                  
                     <tr>                
                     <td class="body-item mbr-fonts-style display-7"><div class="mbr-section-btn align-left"><a class="btn btn-secondary display-4" <%=declineUrl %> <%=hideAccept %>>DECLINE</a></div></td>                                                      
                     <td class="body-item mbr-fonts-style display-7"><div class="mbr-section-btn align-left"><a class="btn btn-warning display-4" <%=acceptUrl %> <%=hideAccept %>>ACCEPT</a></div></td> 
                     <td class="body-item mbr-fonts-style display-7"> <div class="mbr-section-btn align-left"><a class="btn btn-primary display-4" <%=itkUrl %> <%=hideItk %>>IN KITCHEN</a></div></td>
                     <!-- <td class="body-item mbr-fonts-style display-7">Caren Rials</td> -->
                     </tr>
         			
         			<tr>
         			<td class="body-item mbr-fonts-style display-7"><strong>ITEM NAME</strong></td>
                     <td class="body-item mbr-fonts-style display-7"><strong>CATEGORY</strong></td>
                     <td class="body-item mbr-fonts-style display-7"><strong>QUANTITY</strong></td>
         			</tr>
         			
         <!-- USE INNER LOOP HERE -->
          <c:forEach var="l" items="${listValue}"> 
                    <tr>                 
                                                      <td class="body-item mbr-fonts-style display-7">${l.getiNo().getItemName()}</td>
                                                      <td class="body-item mbr-fonts-style display-7">${l.getiNo().getCategory()}</td>
                                                      <td class="body-item mbr-fonts-style display-7">${l.getQty()}</td>
                                                      <!-- <td class="body-item mbr-fonts-style display-7">Leon Rogol</td> -->
                                                      </tr>
         </c:forEach>
         
             </tbody>
             
                                </table>
                              </div>
                              
                              
                            </div>
                          </div>
                          <hr>
                          <p>
                          	<strong>REMARKS: </strong>&nbsp;&nbsp;<%=remarks %>
                          </p>
                          
                     </div>
                 </div>
            </div>
</c:forEach>
        </div>
    </div>
</section>



 
<!--   <form action="/shop/currentOrders">
<input type="submit" text="Submit">

<input name="id" value="S111111">


</form>     -->


	
	<%@ include file="footer.jsp" %>

</body>
</html>