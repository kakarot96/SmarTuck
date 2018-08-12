<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<%@ include file="header.jsp" %>
<title>Menu</title>
</head>
<body>
<%
	String errorAlert = null;
	try{
		List<String> error = (List<String>) request.getAttribute("unavailableItems");
		if(error != null) errorAlert = "Following items are not available: ";
		for(String s : error){
			errorAlert += s;
	}	
	}catch(Exception e){
		e.printStackTrace();
	}
	
		if(errorAlert != null){
			errorAlert = "alert(\""+ errorAlert + "\");";
			//System.out.println(errorAlert);
		}

%>

<%@ include file="navbar.jsp" %>

<script type="text/javascript"><%=errorAlert %></script>

<section class="engine"></section><section class="mbr-section content4 cid-qZx5AFLv1d" id="content4-q">

<div class="container">
    <div class="media-container-row">
        <div class="title col-12 col-md-12">
            <h2 class="align-center pb-3 mbr-fonts-style display-2"><strong>SMARTUCK SHOP </strong></h2>
            <h3 class="mbr-section-subtitle align-center mbr-light mbr-fonts-style display-5">
                Ground Floor, Fidelity International<br>Contact - +91 95623 95623</h3>
            
        </div>
    </div>
</div>
</section>

<form class="mbr-form" action="/employee/orderSummary?id=${id}&shopId=${shopId}" method="post" data-form-title="Order Form" name="orderform" id="orderform">

<section class="toggle1 cid-qZxk9U3rxJ" id="toggle1-s">

    <div class="container">
        <div class="media-container-row">
            <div class="col-12 col-md-12">
                <div class="section-head text-center space30">
                    <h2 class="mbr-section-title pb-5 mbr-fonts-style display-2">
                        ITEM MENU</h2>
                </div>
                <div class="clearfix"></div>
                <div id="bootstrap-toggle" class="toggle-panel accordionStyles tab-content">
                    <div class="card">
                        <div class="card-header" role="tab" id="headingOne">
                            <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse1_24" aria-expanded="false" aria-controls="collapse1">
                                <h4 class="mbr-fonts-style display-5">
                                    <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>Hot Beverages</h4>
                            </a>
                        </div>

                        <div id="collapse1_24" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body p-4">

                                    <div class="container container-table">
    
                                            <div class="table-wrapper">
                                            <div class="container">
                                                
                                            </div>
                                        
                                            <div class="container scroll">
                                                <table class="table" cellspacing="0">
                                                <thead>
                                                    <tr class="table-heads ">
                                                            <th class="head-item mbr-fonts-style display-7" style="width:40%">ITEM NAME</th>
                                                            <th class="head-item mbr-fonts-style display-7" style="width:20%">RATING</th>
                                                            <th class="head-item mbr-fonts-style display-7" style="width:20%">PRICE</th>
                                                            <th class="head-item mbr-fonts-style display-7" style="width:20%">QUANTITY</th>
                                                    </tr>
                                                </thead>
                                        
                                                <tbody>
                                                    
                                                    <c:forEach var = "i" items="${items.get(0)}"> 
                                                    <tr> 
                                                            <td class="body-item mbr-fonts-style display-7">${i.itemName}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.rating}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.price}</td>
                                                            <td class="body-item mbr-fonts-style display-7">
                                                                    <input type="number" class="form-control" name="${i.iNo}" id="" min="1">
                                                            </td>
                                                    </tr>
                                                    
                                                    </c:forEach>
                                                    
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="container table-info-container">
                                                
                                            </div>
                                            </div>
                                        </div>
                            </div>
                        </div>
                    </div>


                    <div class="card">
                        <div class="card-header" role="tab" id="headingTwo">
                            <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse2_24" aria-expanded="false" aria-controls="collapse2">
                                <h4 class="mbr-fonts-style display-5">
                                    <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>Smoothies</h4>
                            </a>

                        </div>
                        <div id="collapse2_24" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body p-4">
                                    <div class="container container-table">
    
                                            <div class="table-wrapper">
                                            <div class="container">
                                                
                                            </div>
                                        
                                            <div class="container scroll">
                                                <table class="table" cellspacing="0">
                                                <thead>
                                                        <tr class="table-heads ">
                                                                <th class="head-item mbr-fonts-style display-7" style="width:40%">ITEM NAME</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">RATING</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">PRICE</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">QUANTITY</th>
                                                        </tr>
                                                </thead>
                                        
                                                <tbody>
                                                    <c:forEach var = "i" items="${items.get(1)}"> 
                                                    <tr> 
                                                            <td class="body-item mbr-fonts-style display-7">${i.itemName}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.rating}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.price}</td>
                                                            <td class="body-item mbr-fonts-style display-7">
                                                                    <input type="number" class="form-control" name="${i.iNo}" id="" min="1">
                                                            </td>
                                                    </tr>
                                                    
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="container table-info-container">
                                                
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" role="tab" id="headingThree">
                            <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse3_24" aria-expanded="false" aria-controls="collapse3">
                                <h4 class="mbr-fonts-style display-5">
                                    <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>Chillers</h4>
                            </a>
                        </div>
                        <div id="collapse3_24" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body p-4">
                                    <div class="container container-table">
    
                                            <div class="table-wrapper">
                                            <div class="container">
                                                
                                            </div>
                                        
                                            <div class="container scroll">
                                                <table class="table" cellspacing="0">
                                                <thead>
                                                        <tr class="table-heads ">
                                                                <th class="head-item mbr-fonts-style display-7" style="width:40%">ITEM NAME</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">RATING</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">PRICE</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">QUANTITY</th>
                                                        </tr>
                                                </thead>
                                        
                                                <tbody>
                                                    <c:forEach var = "i" items="${items.get(2)}"> 
                                                    <tr> 
                                                            <td class="body-item mbr-fonts-style display-7">${i.itemName}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.rating}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.price}</td>
                                                            <td class="body-item mbr-fonts-style display-7">
                                                                    <input type="number" class="form-control" name="${i.iNo}" id="" min="1">
                                                            </td>
                                                    </tr>
                                                    
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="container table-info-container">
                                                
                                            </div>
                                            </div>
                                        </div>
                            </div>
                    </div>
                    <div class="card">
                        <div class="card-header" role="tab" id="headingThree">
                            <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse4_24" aria-expanded="false" aria-controls="collapse4">
                                <h4 class="mbr-fonts-style display-5">
                                    <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>Mojito</h4>
                            </a>
                        </div>
                        <div id="collapse4_24" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body p-4">
                                    <div class="container container-table">
    
                                            <div class="table-wrapper">
                                            <div class="container">
                                                
                                            </div>
                                        
                                            <div class="container scroll">
                                                <table class="table" cellspacing="0">
                                                <thead>
                                                        <tr class="table-heads ">
                                                                <th class="head-item mbr-fonts-style display-7" style="width:40%">ITEM NAME</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">RATING</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">PRICE</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">QUANTITY</th>
                                                        </tr>
                                                </thead>
                                        
                                                <tbody>
                                                    <c:forEach var = "i" items="${items.get(3)}"> 
                                                    <tr> 
                                                            <td class="body-item mbr-fonts-style display-7">${i.itemName}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.rating}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.price}</td>
                                                            <td class="body-item mbr-fonts-style display-7">
                                                                    <input type="number" class="form-control" name="${i.iNo}" id="" min="1">
                                                            </td>
                                                    </tr>
                                                    
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="container table-info-container">
                                                
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" role="tab" id="headingThree">
                            <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse5_24" aria-expanded="false" aria-controls="collapse5">
                                <h4 class="mbr-fonts-style display-5">
                                    <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>Sandwich</h4>
                            </a>
                        </div>
                        <div id="collapse5_24" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body p-4">
                                    <div class="container container-table">
    
                                            <div class="table-wrapper">
                                            <div class="container">
                                                
                                            </div>
                                        
                                            <div class="container scroll">
                                                <table class="table" cellspacing="0">
                                                <thead>
                                                        <tr class="table-heads ">
                                                                <th class="head-item mbr-fonts-style display-7" style="width:40%">ITEM NAME</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">RATING</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">PRICE</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">QUANTITY</th>
                                                        </tr>
                                                </thead>
                                        
                                                <tbody>
                                                    <c:forEach var = "i" items="${items.get(4)}"> 
                                                    <tr> 
                                                            <td class="body-item mbr-fonts-style display-7">${i.itemName}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.rating}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.price}</td>
                                                            <td class="body-item mbr-fonts-style display-7">
                                                                    <input type="number" class="form-control" name="${i.iNo}" id="" min="1">
                                                            </td>
                                                    </tr>
                                                    
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="container table-info-container">
                                                
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" role="tab" id="headingThree">
                            <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse6_24" aria-expanded="false" aria-controls="collapse6">
                                <h4 class="mbr-fonts-style display-5">
                                    <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>Burger</h4>
                            </a>
                        </div>
                        <div id="collapse6_24" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body p-4">
                                    <div class="container container-table">
    
                                            <div class="table-wrapper">
                                            <div class="container">
                                                
                                            </div>
                                        
                                            <div class="container scroll">
                                                <table class="table" cellspacing="0">
                                                <thead>
                                                        <tr class="table-heads ">
                                                                <th class="head-item mbr-fonts-style display-7" style="width:40%">ITEM NAME</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">RATING</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">PRICE</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">QUANTITY</th>
                                                        </tr>
                                                </thead>
                                        
                                                <tbody>
                                                    <c:forEach var = "i" items="${items.get(5)}"> 
                                                    <tr> 
                                                            <td class="body-item mbr-fonts-style display-7">${i.itemName}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.rating}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.price}</td>
                                                            <td class="body-item mbr-fonts-style display-7">
                                                                    <input type="number" class="form-control" name="${i.iNo}" id="" min="1">
                                                            </td>
                                                    </tr>
                                                    
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="container table-info-container">
                                                
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="toggle1 cid-qZyyGJFmKq" id="toggle1-10">

    <div class="container">
        <div class="media-container-row">
            <div class="col-12 col-md-12">
                <div class="section-head text-center space30">
                    
                </div>
                <div class="clearfix"></div>
                <div id="bootstrap-toggle" class="toggle-panel accordionStyles tab-content">
                    <div class="card">
                        <div class="card-header" role="tab" id="headingOne">
                            <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse1_32" aria-expanded="false" aria-controls="collapse1">
                                <h4 class="mbr-fonts-style display-5">
                                    <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>Subs</h4>
                            </a>
                        </div>
                        <div id="collapse1_32" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body p-4">
                                    <div class="container container-table">
    
                                            <div class="table-wrapper">
                                            <div class="container">
                                                
                                            </div>
                                        
                                            <div class="container scroll">
                                                <table class="table" cellspacing="0">
                                                <thead>
                                                        <tr class="table-heads ">
                                                                <th class="head-item mbr-fonts-style display-7" style="width:40%">ITEM NAME</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">RATING</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">PRICE</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">QUANTITY</th>
                                                        </tr>
                                                </thead>
                                        
                                                <tbody>
                                                    <c:forEach var = "i" items="${items.get(6)}"> 
                                                    <tr> 
                                                            <td class="body-item mbr-fonts-style display-7">${i.itemName}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.rating}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.price}</td>
                                                            <td class="body-item mbr-fonts-style display-7">
                                                                    <input type="number" class="form-control" name="${i.iNo}" id="" min="1">
                                                            </td>
                                                    </tr>
                                                    
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="container table-info-container">
                                                
                                            </div>
                                            </div>
                                        </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" role="tab" id="headingTwo">
                            <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse2_32" aria-expanded="false" aria-controls="collapse2">
                                <h4 class="mbr-fonts-style display-5">
                                    <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>Pasta</h4>
                            </a>

                        </div>
                        <div id="collapse2_32" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body p-4">
                                    <div class="container container-table">
    
                                            <div class="table-wrapper">
                                            <div class="container">
                                                
                                            </div>
                                        
                                            <div class="container scroll">
                                                <table class="table" cellspacing="0">
                                                <thead>
                                                        <tr class="table-heads ">
                                                                <th class="head-item mbr-fonts-style display-7" style="width:40%">ITEM NAME</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">RATING</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">PRICE</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">QUANTITY</th>
                                                        </tr>
                                                </thead>
                                        
                                                <tbody>
                                                    <c:forEach var = "i" items="${items.get(7)}"> 
                                                    <tr> 
                                                            <td class="body-item mbr-fonts-style display-7">${i.itemName}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.rating}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.price}</td>
                                                            <td class="body-item mbr-fonts-style display-7">
                                                                    <input type="number" class="form-control" name="${i.iNo}" id="" min="1">
                                                            </td>
                                                    </tr>
                                                    
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="container table-info-container">
                                                
                                            </div>
                                            </div>
                                        </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" role="tab" id="headingThree">
                            <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse3_32" aria-expanded="false" aria-controls="collapse3">
                                <h4 class="mbr-fonts-style display-5">
                                    <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>Salad</h4>
                            </a>
                        </div>
                        <div id="collapse3_32" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body p-4">
                                    <div class="container container-table">
    
                                            <div class="table-wrapper">
                                            <div class="container">
                                                
                                            </div>
                                        
                                            <div class="container scroll">
                                                <table class="table" cellspacing="0">
                                                <thead>
                                                        <tr class="table-heads ">
                                                                <th class="head-item mbr-fonts-style display-7" style="width:40%">ITEM NAME</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">RATING</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">PRICE</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">QUANTITY</th>
                                                        </tr>
                                                </thead>
                                        
                                                <tbody>
                                                    <c:forEach var = "i" items="${items.get(8)}"> 
                                                    <tr> 
                                                            <td class="body-item mbr-fonts-style display-7">${i.itemName}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.rating}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.price}</td>
                                                            <td class="body-item mbr-fonts-style display-7">
                                                                    <input type="number" class="form-control" name="${i.iNo}" id="" min="1">
                                                            </td>
                                                    </tr>
                                                    
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="container table-info-container">
                                                
                                            </div>
                                            </div>
                                        </div>       
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" role="tab" id="headingThree">
                            <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse4_32" aria-expanded="false" aria-controls="collapse4">
                                <h4 class="mbr-fonts-style display-5">
                                    <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>Jiffy Snacks</h4>
                            </a>
                        </div>
                        <div id="collapse4_32" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body p-4">
                                    <div class="container container-table">
    
                                            <div class="table-wrapper">
                                            <div class="container">
                                                
                                            </div>
                                        
                                            <div class="container scroll">
                                                <table class="table" cellspacing="0">
                                                <thead>
                                                        <tr class="table-heads ">
                                                                <th class="head-item mbr-fonts-style display-7" style="width:40%">ITEM NAME</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">RATING</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">PRICE</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">QUANTITY</th>
                                                        </tr>
                                                </thead>
                                        
                                                <tbody>
                                                    <c:forEach var = "i" items="${items.get(9)}"> 
                                                    <tr> 
                                                            <td class="body-item mbr-fonts-style display-7">${i.itemName}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.rating}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.price}</td>
                                                            <td class="body-item mbr-fonts-style display-7">
                                                                    <input type="number" class="form-control" name="${i.iNo}" id="" min="1">
                                                            </td>
                                                    </tr>
                                                    
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="container table-info-container">
                                                
                                            </div>
                                            </div>
                                        </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" role="tab" id="headingThree">
                            <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse5_32" aria-expanded="false" aria-controls="collapse5">
                                <h4 class="mbr-fonts-style display-5">
                                    <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>Pizza</h4>
                            </a>
                        </div>
                        <div id="collapse5_32" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body p-4">
                                    <div class="container container-table">
    
                                            <div class="table-wrapper">
                                            <div class="container">
                                                
                                            </div>
                                        
                                            <div class="container scroll">
                                                <table class="table" cellspacing="0">
                                                <thead>
                                                        <tr class="table-heads ">
                                                                <th class="head-item mbr-fonts-style display-7" style="width:40%">ITEM NAME</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">RATING</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">PRICE</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">QUANTITY</th>
                                                        </tr>
                                                </thead>
                                        
                                                <tbody>
                                                    <c:forEach var = "i" items="${items.get(10)}"> 
                                                    <tr> 
                                                            <td class="body-item mbr-fonts-style display-7">${i.itemName}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.rating}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.price}</td>
                                                            <td class="body-item mbr-fonts-style display-7">
                                                                    <input type="number" class="form-control" name="${i.iNo}" id="" min="1">
                                                            </td>
                                                    </tr>
                                                    
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="container table-info-container">
                                                
                                            </div>
                                            </div>
                                        </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" role="tab" id="headingThree">
                            <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse6_32" aria-expanded="false" aria-controls="collapse6">
                                <h4 class="mbr-fonts-style display-5">
                                    <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>Juices</h4>
                            </a>
                        </div>
                        <div id="collapse6_32" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body p-4">
                                    <div class="container container-table">
    
                                            <div class="table-wrapper">
                                            <div class="container">
                                                
                                            </div>
                                        
                                            <div class="container scroll">
                                                <table class="table" cellspacing="0">
                                                <thead>
                                                        <tr class="table-heads ">
                                                                <th class="head-item mbr-fonts-style display-7" style="width:40%">ITEM NAME</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">RATING</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">PRICE</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">QUANTITY</th>
                                                        </tr>
                                                </thead>
                                        
                                                <tbody>
                                                    <c:forEach var = "i" items="${items.get(11)}"> 
                                                    <tr> 
                                                            <td class="body-item mbr-fonts-style display-7">${i.itemName}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.rating}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.price}</td>
                                                            <td class="body-item mbr-fonts-style display-7">
                                                                    <input type="number" class="form-control" name="${i.iNo}" id="" min="1">
                                                            </td>
                                                    </tr>
                                                    
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="container table-info-container">
                                                
                                            </div>
                                            </div>
                                        </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="toggle1 cid-qZyz2zFJku" id="toggle1-11">


    <div class="container">
        <div class="media-container-row">
            <div class="col-12 col-md-12">
                <div class="section-head text-center space30">
                    
                </div>
                <div class="clearfix"></div>
                <div id="bootstrap-toggle" class="toggle-panel accordionStyles tab-content">
                    <div class="card">
                        <div class="card-header" role="tab" id="headingOne">
                            <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse1_33" aria-expanded="false" aria-controls="collapse1">
                                <h4 class="mbr-fonts-style display-5">
                                    <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>Deserts</h4>
                            </a>
                        </div>
                        <div id="collapse1_33" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body p-4">
                                    <div class="container container-table">
    
                                            <div class="table-wrapper">
                                            <div class="container">
                                                
                                            </div>
                                        
                                            <div class="container scroll">
                                                <table class="table" cellspacing="0">
                                                <thead>
                                                        <tr class="table-heads ">
                                                                <th class="head-item mbr-fonts-style display-7" style="width:40%">ITEM NAME</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">RATING</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">PRICE</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">QUANTITY</th>
                                                        </tr>
                                                </thead>
                                        
                                                <tbody>
                                                    <c:forEach var = "i" items="${items.get(12)}"> 
                                                    <tr> 
                                                            <td class="body-item mbr-fonts-style display-7">${i.itemName}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.rating}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.price}</td>
                                                            <td class="body-item mbr-fonts-style display-7">
                                                                    <input type="number" class="form-control" name="${i.iNo}" id="" min="1">
                                                            </td>
                                                    </tr>
                                                    
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="container table-info-container">
                                                
                                            </div>
                                            </div>
                                        </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" role="tab" id="headingTwo">
                            <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse2_33" aria-expanded="false" aria-controls="collapse2">
                                <h4 class="mbr-fonts-style display-5">
                                    <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>Milk Shakes</h4>
                            </a>

                        </div>
                        <div id="collapse2_33" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body p-4">
                                    <div class="container container-table">
    
                                            <div class="table-wrapper">
                                            <div class="container">
                                                
                                            </div>
                                        
                                            <div class="container scroll">
                                                <table class="table" cellspacing="0">
                                                <thead>
                                                        <tr class="table-heads ">
                                                                <th class="head-item mbr-fonts-style display-7" style="width:40%">ITEM NAME</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">RATING</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">PRICE</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width:20%">QUANTITY</th>
                                                        </tr>
                                                </thead>
                                        
                                                <tbody>
                                                    <c:forEach var = "i" items="${items.get(13)}"> 
                                                    <tr> 
                                                            <td class="body-item mbr-fonts-style display-7">${i.itemName}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.rating}</td>
                                                            <td class="body-item mbr-fonts-style display-7">${i.price}</td>
                                                            <td class="body-item mbr-fonts-style display-7">
                                                                    <input type="number" class="form-control" name="${i.iNo}" id="" min="1">
                                                            </td>
                                                    </tr>
                                                    
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="container table-info-container">
                                                
                                            </div>
                                            </div>
                                        </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    
                </div>
            </div>
        </div>
    </div>
</section>


<section class="mbr-section info1 cid-qZS1QnGlas" id="info1-1p">
   
    <div class="container">
        <div class="row justify-content-center content-row">
            <div class="media-container-column col-12 col-lg-3 col-md-4">
                <div class="mbr-section-btn align-right py-4"> <span class="input-group-btn">
                        <button href="" type="submit" class="btn btn-secondary btn-form display-4">PLACE ORDER</button>
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