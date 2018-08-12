<%@page import="com.fil.SmarTuck.services.OrderServiceImplementation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="header.jsp" %>
  	<title>Add Item</title>
</head>
<body>
	<%@ include file="navbar.jsp" %>
	
	<section class="engine"></section><section class="mbr-section content4 cid-qZU1BnWpyj" id="content4-o">

    

    <div class="container">
        <div class="media-container-row">
            <div class="title col-12 col-md-8">
                <h2 class="align-center pb-3 mbr-fonts-style display-2"><strong>
                    ADD ITEM</strong></h2>
                
                
            </div>
        </div>
    </div>
</section>

<section class="features4 cid-qZU2TvuGcy" id="features4-r">
    
    <div class="container">
        <div class="media-container-row">
            <div class="card p-3 col-12 col-md-6">
                <div class="card-wrapper media-container-row media-container-row">
                    <div class="card-box">

           <form class="mbr-form" action="/shop/addItemToDB" method="post" data-form-title="Add Form">
                   <!-- <input type="hidden" name="email" data-form-email="true" value="VC8w6Yp3G8SEiuWZgY/D9MbHmH3hNG1RR2eMop0F0E+GgZxN1rcRHZ8K1omQlz8NMNTjh9yB3vKTiR19D4Mu+IIDal27mZVL8gCx5dh0TXf3zI6hfNTz56ej4v+OrmUE" data-form-field="Email"> -->
                   
                   <div data-for="select">
                           <div class="form-group">
                           <label class="form-control-label mbr-fonts-style display-7" for="select">Select Category</label>
                               <select class="form-control" name="category" id="select" required>
                                   <!-- <option disabled>Login As</option> -->
                                   <option value="">Select Category</option>
                                   <option value="Hot Beverages">Hot Beverages</option>
                                   <option value="Smoothies">Smoothies</option>
                                   <option value="Chiller">Chillers</option>
                                   <option value="Mojito">Mojito</option>
                                   <option value="Sandwich">Sandwich</option>
                                   <option value="Burger">Burger</option>
                                   <option value="Subs">Subs</option>
                                   <option value="Pasta">Pasta</option>
                                   <option value="Salad">Salad</option>
                                   <option value="Jiffy Snacks">Jiffy Snacks</option>
                                   <option value="Pizza">Pizza</option>
                                   <option value="Juices">Juices</option>
                                   <option value="Desserts">Desserts</option>
                                   <option value="Milk Shakes">Milk Shakes</option>
                               </select>
                         </div>
                       </div>
                       
                   <div data-for="item name">
                       <div class="form-group">
                       		<label class="form-control-label mbr-fonts-style display-7" for="item name">Item Name</label>
                           <input type="text" class="form-control px-3" name="itemName" data-form-field="Name" placeholder="Item Name" id="name-header15-q" style="text-transform:uppercase" required>
                       </div>
                   </div>
                   <div data-for="preparation time">
                           <div class="form-group">
                           <label class="form-control-label mbr-fonts-style display-7" for="preparation time">Preparation Time</label>
                               <input type="number" class="form-control px-3" name="preparationTime" data-form-field="time" placeholder="Preparation Time" id="name-header15-q" min=0 required>
                           </div>
                       </div>
                   <div data-for="quantity">
                       <div class="form-group">
                       <label class="form-control-label mbr-fonts-style display-7" for="quantity">Quantity</label>
                           <input type="number" class="form-control px-3" name="quantity" data-form-field="Name" placeholder="Quantity" id="name-header15-q" min=0 required>
                       </div>
                   </div>
                   <div data-for="price">
                       <div class="form-group">
                       <label class="form-control-label mbr-fonts-style display-7" for="price">Price</label>
                           <input type="number" class="form-control px-3" name="price" data-form-field="price" placeholder="Price" id="phone-header15-q" min=0 required>
                       </div>
                   </div>
                   <input type="hidden" name="id" value="${id}">
                   <span class="input-group-btn"><button href="" type="submit" class="btn btn-secondary btn-form display-4">ADD ITEM</button></span>
               </form>
  
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
	
	
	
	
	<%@ include file="footer.jsp" %>
</body>
</html>