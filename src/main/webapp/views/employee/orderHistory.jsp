<%@page import="com.fil.SmarTuck.models.Order"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<%@ include file="header.jsp" %>
<title>Order History</title>
</head>
<body>
<%@ include file="navbar.jsp" %>

<%
	String errorMessage = (String) request.getAttribute("cancelStatus");
	
	if(errorMessage != null){
	errorMessage = "alert(\""+ errorMessage + "\");";
	System.out.println(errorMessage);
}
%>
<script type="text/javascript"><%=errorMessage %></script>

<section class="engine"></section><section class="mbr-section info1 cid-qZUbxKm2Ys" id="info1-21">

    <div class="container">
        <div class="row justify-content-center content-row">
            <div class="media-container-column title col-12 col-lg-7 col-md-6">
                
                <h2 class="align-left mbr-bold mbr-fonts-style display-2">
                    ORDER HISTORY</h2>
            </div>
            <div class="media-container-column col-12 col-lg-3 col-md-4">
                
            </div>
        </div>
    </div>
</section>

<section class="timeline1 cid-qZCFYk2g2r" id="timeline1-1n">

    <div class="container align-center">
        
        <div class="container timelines-container" mbri-timelines="">
<% int orderNum=1; 
	List<Integer> orderAmounts = (List<Integer>) request.getAttribute("orderAmounts");
	//System.out.println(orderAmounts);
	int counter=0;
	List<List<Order>> employeeOrders = (List<List<Order>>) request.getAttribute("orderHistory");
	int i=0;
%>
<c:forEach var = "orderList" items="${orderHistory}">
    			
    			<%
    					String status = employeeOrders.get(i).get(0).getStatus();
    					String rateUrl;
    					String cancelUrl;
    					String hideRate;
    					String hideCancel;
    					String remarks = employeeOrders.get(i).get(0).getRemarks();
    					String hideRating;

    					if(employeeOrders.get(i).get(0).getRating() != 0){
    						hideRating = " ";
    					}else{
    						hideRating = "hidden";
    					}
    					if((status.equalsIgnoreCase("Delivered"))&&(employeeOrders.get(i).get(0).getRating()==0)){
    						rateUrl = "href=\""+"/employee/orderInformation?id=" + request.getAttribute("id") + "&orderId=" + employeeOrders.get(i).get(0).getOrderId()+"\"";
    						hideRate = " ";
    						//System.out.println(url);
    					}else{
    						rateUrl = " ";
    						hideRate = "hidden";
    					}
    					
    					if((status.equalsIgnoreCase("Pending"))||(status.equalsIgnoreCase("Accepted"))){
    						cancelUrl = "href=\""+"/employee/cancelOrder?id=" + request.getAttribute("id") + "&orderId=" + employeeOrders.get(i).get(0).getOrderId()+"\"";
    						hideCancel = " ";
    						//System.out.println(url);
    					}else{
    						cancelUrl = " ";
    						hideCancel = "hidden";
    					}
    			
    					i++;
    			%>
    			
                <div class="row timeline-element  separline">
                        
                        <div class="col-xs-12 col-md-12 align-left ">
                            <div class="timeline-text-content">
                                <h4 class="mbr-timeline-title pb-3 mbr-fonts-style display-5">
                                    Order Id : ${orderList.get(0).getOrderId()}
                                </h4>
                                
                                <div class="container container-table">
      
      
                       <div class="table-wrapper">
                                          
                         <div class="container scroll">
                           <table class="table" cellspacing="0">
                             <thead>
                                 <tr class="table-heads ">                  
                                          <th class="head-item mbr-fonts-style display-7" style="width:40%">ORDER DATE:  &nbsp;<span style="font-weight:normal;">${orderList.get(0).getOrderDate()}</span></th> 
                                           <th class="head-item mbr-fonts-style display-7" style="width:1%" <%=hideRating %>></th>
                                         <th class="head-item mbr-fonts-style display-7" style="width:34%">STATUS:  &nbsp;<span style="font-weight:normal;">${orderList.get(0).getStatus()}</span></th>
                                          <th class="head-item mbr-fonts-style display-7" style="width:25%">AMOUNT:  &nbsp;<span style="font-weight:normal;"><%=orderAmounts.get(counter++) %></span></th> 
                                 </tr>
                             </thead>
                 				
                                         <tbody>
                                                                  
                   
                   <tr>                
                   <td class="body-item mbr-fonts-style display-7"><div class="mbr-section-btn align-left">
                   		<a class="btn btn-secondary display-4" <%=cancelUrl %>" <%=hideCancel %>>CANCEL</a>
                   	</div></td>
                   <td class="body-item mbr-fonts-style display-7"><div class="mbr-section-btn align-left">
                   		<a class="btn btn-primary display-4" href="/employee/orderSummary?id=${id}&orderId=${orderList.get(0).getOrderId()}&shopId=${orderList.get(0).iNo.getShop().getShopId()}" type="hidden">REORDER</a>
                   </div></td>
                   <td class="body-item mbr-fonts-style display-7"><div class="mbr-section-btn align-left">
                   		<a class="btn btn-warning display-4" <%=rateUrl %> <%=hideRate %>>RATE</a></div></td>
                   </tr>
                   
                   <tr>
         			<td class="body-item mbr-fonts-style display-7"><strong>ITEM NAME</strong></td>
         			<td class="body-item mbr-fonts-style display-7" <%=hideRating %>><strong>RATING</strong></td>
                     <td class="body-item mbr-fonts-style display-7"><strong>CATEGORY</strong></td>
                     <td class="body-item mbr-fonts-style display-7"><strong>QUANTITY</strong></td>
         			</tr>
         			
                   <c:forEach var = "order" items = "${orderList}">
                   <tr>                
                   <td class="body-item mbr-fonts-style display-7">${order.iNo.itemName}</td>
                   <td class="body-item mbr-fonts-style display-7" <%=hideRating %>>${order.rating}</td>
                   <td class="body-item mbr-fonts-style display-7">${order.iNo.category}</td>
                   <td class="body-item mbr-fonts-style display-7">${order.qty}</td>
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

<%@ include file="footer.jsp" %>
</body>
</html>