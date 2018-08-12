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

<section class="engine"></section>

<section class="mbr-section info1 cid-qZxKzmeOnx" id="info1-v">

    <div class="container">
        <div class="row justify-content-center content-row">
            <div class="media-container-column title col-12 col-lg-7 col-md-6">
                </br></br>
                <h2 class="align-center mbr-bold mbr-fonts-style display-2">
                    ORDER SUMMARY</h2>
            </div>
            
        </div>
    </div>
</section>

<section class="section-table cid-qZxQvfJFwn" id="table1-w">

  <div class="container container-table">
    <div class="table-wrapper">
        <div class="container">
        </div>
        <div class="container scroll">
          <table class="table" cellspacing="0">
            <thead>
              <tr class="table-heads ">  
                    <th class="head-item mbr-fonts-style display-7" style="width:10%">SNO</th>
                    <th class="head-item mbr-fonts-style display-7" style="width:50%">ITEM NAME</th>
                    <th class="head-item mbr-fonts-style display-7" style="width:15%">QUANTITY</th>
                    <th class="head-item mbr-fonts-style display-7" style="width:15%">RATE</th>
                    <th class="head-item mbr-fonts-style display-7" style="width:10%">PRICE</th>
                </tr>
            </thead>

            <tbody>
            
      <!--   APPLY FOR EACH LOOP HERE    -->  
      		<% int sno=1; %>
      		
            <c:forEach var = "o" items="${order}">
            <tr> 
                    <td class="body-item mbr-fonts-style display-7"><%= sno++ %></td>
                    <td class="body-item mbr-fonts-style display-7">${o.iNo.itemName}</td>
                    <td class="body-item mbr-fonts-style display-7">${o.qty}</td>
                    <td class="body-item mbr-fonts-style display-7">${o.iNo.price}</td>
                    <td class="body-item mbr-fonts-style display-7">${o.iNo.price*o.qty}</td>
            </tr>

			</c:forEach>
			<tr> 
                    <td class="body-item mbr-fonts-style display-7"></td>
                    <td class="body-item mbr-fonts-style display-7"></td>
                    <td class="body-item mbr-fonts-style display-7"></td>
                    <td class="body-item mbr-fonts-style display-7">TOTAL</td>
                    <td class="body-item mbr-fonts-style display-7">${totalAmount}</td>
            </tr>

				</tbody>
             </table>
        </div>
        <div class="container table-info-container">
          
        </div>
      </div>
    </div>
</section>

<section class="mbr-section form1 cid-qZxSAJ4Gv0" id="form1-x">

    <div class="container">
        <div class="row justify-content-center">
            
                    <form class="mbr-form" action="/employee/orderConfirmation?id=${id}&shopId=${shopId}" method="post" data-form-title="Order Form">
                        <!-- <input type="hidden" name="email" data-form-email="true" value="OpIWvsWII7l+PWK6GH+RbVCxsCgKvUsiC+w3iIHiXNroPShGzgKoxf+qYXLy3V4+duXXZrtQ5frFs8VwO1gnVtmqls6/8lmAZrOSjdSVjL6hwJWhhDK/NSoPF+MpCVbq" data-form-field="Email"> -->
                        <div class="form-group" data-for="message">
                            <label class="form-control-label mbr-fonts-style display-7" for="message-form1-x">Special Remarks</label>
                            <textarea type="text" class="form-control" name="remarks" rows="3" data-form-field="Message" id="message-form1-x"></textarea>
                        </div>
                        <c:forEach var = "o" items="${order}">
                        	<input type="hidden" name="${o.iNo.iNo}" value="${o.qty}"/>
                        </c:forEach>
                        
                        <span class="input-group-btn">
                            <button href="" type="submit" class="btn btn-form btn-secondary display-4">CONFIRM ORDER</button>
                        </span>
                    </form>
            
        </div>
    </div>
</section>



<%@ include file="footer.jsp" %>
</body>
</html>