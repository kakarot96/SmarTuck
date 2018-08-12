<%@page import="com.fil.SmarTuck.services.OrderServiceImplementation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="header.jsp" %>
  	<title>Update Item</title>
</head>
<body>
	<%@ include file="navbar.jsp" %>
	
	<section class="engine"></section><section class="mbr-section content4 cid-qZU3LPhZEc" id="content4-s">

    

    <div class="container">
        <div class="media-container-row">
            <div class="title col-12 col-md-8">
                <h2 class="align-center pb-3 mbr-fonts-style display-2"><strong>UPDATE ITEM</strong></h2>
                
                
            </div>
        </div>
    </div>
</section>

<section class="features4 cid-qZU3MEJkzo" id="features4-t">
    
    <div class="container">
        <div class="media-container-row">
            <div class="card p-3 col-12 col-md-6">
                <div class="card-wrapper media-container-row media-container-row">
                    <div class="card-box">
                            <form class="mbr-form" action="/shop/updateItemToDB" method="post" data-form-title="Update Form">
                                <div data-for="category">
                                        <div class="form-group">
                                        <label class="form-control-label mbr-fonts-style display-7" for="category">Category</label>
                                            <input type="text" class="form-control px-3" name="category" data-form-field="Category" placeholder="${item.category}" value="${item.category}" id="name-header15-q" disabled>
                                        </div>
                                    </div>
                                    
                                <input type="hidden" name="id" value="${id}">
                                <input type="hidden" name="iNo" value="${item.iNo}">
                                
                                <div data-for="item name">
                                    <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="item name">Item Name</label>
                                        <input type="text" class="form-control px-3" name="itemName" data-form-field="Name" placeholder="Item Name" value="${item.itemName}" id="name-header15-q" style="text-transform:uppercase" required>
                                    </div>
                                </div>
                                <div data-for="preparation time">
                                        <div class="form-group">
                                        <label class="form-control-label mbr-fonts-style display-7" for="preparation time">Preparation time</label>
                                            <input type="number" class="form-control px-3" name="preparationTime" data-form-field="time" value="${item.preparationTime}" placeholder="Preparation Time" id="name-header15-q" min=0 required>
                                        </div>
                                    </div>
                                <div data-for="price">
                                    <div class="form-group">
                                    <label class="form-control-label mbr-fonts-style display-7" for="price">Price</label>
                                        <input type="number" class="form-control px-3" name="price" data-form-field="price" value="${item.price}" placeholder="Price" id="phone-header15-q" min=0 required>
                                    </div>
                                </div>
                                
                                <span class="input-group-btn"><button href="" type="submit" class="btn btn-secondary btn-form display-4">UPDATE ITEM</button></span>
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