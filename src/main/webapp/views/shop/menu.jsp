<%@page import="com.fil.SmarTuck.services.OrderServiceImplementation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="header.jsp" %>
  	<title>Manage Menu</title>
</head>
<body>
	<%@ include file="navbar.jsp" %>
	
	
	
	<section class="engine"></section>
<section class="mbr-section info1 cid-qZU460fHtm" id="info1-w">
    
    <div class="container">
        <div class="row justify-content-center content-row">
            <div class="media-container-column title col-12 col-lg-7 col-md-6">
                
                <h2 class="align-left mbr-bold mbr-fonts-style display-2">
                    ITEM CATALOG</h2>
            </div>
            <div class="media-container-column col-12 col-lg-3 col-md-4">
                <div class="mbr-section-btn align-right py-4"><a class="btn btn-primary display-4" href="/shop/addItem?id=${id}">ADD ITEM</a></div>
            </div>
        </div>
    </div>
</section>


<section class="toggle1 cid-qZU5ACLEEP" id="toggle1-y">

        <div class="container">
            <div class="media-container-row">
                <div class="col-12 col-md-12">
                    <div class="section-head text-center space30">
                       
                    </div>
                    <div class="clearfix"></div>
                    <div id="bootstrap-toggle" class="toggle-panel accordionStyles tab-content">
                       
                        <div class="card">
                            <div class="card-header" role="tab" id="headingOne">
                                <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse1_9" aria-expanded="false" aria-controls="collapse1">
                                    <h4 class="mbr-fonts-style display-5">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>&nbsp;Hot Beverages</h4>
                                </a>
                            </div>
                            <div id="collapse1_9" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingOne">
                                <div class="panel-body p-4">
                            
                            <div class="container container-table">
      
                                <div class="table-wrapper">
                                    <div class="container">
                                    
                                    </div>

                                    <div class="container scroll">
                                    <table class="table" cellspacing="0">
                                        <thead>
                                        <tr class="table-heads ">                                            
                                        <th class="head-item mbr-fonts-style display-7" style="width: 40%">ITEM NAME</th>
                                        <th class="head-item mbr-fonts-style display-7" style="width: 20%">PRICE</th>
                                        <th class="head-item mbr-fonts-style display-7" style="width: 20%">DELETE</th>
                                        <th class="head-item mbr-fonts-style display-7" style="width: 20%">UPDATE</th></tr>
                                        </thead>

                                        <tbody> 
                                        <c:forEach var = "item" items = "${items.get(0)}">
                                        <tr> 
                                        		
                                                <td class="body-item mbr-fonts-style display-7">${item.itemName}</td>
                                                <td class="body-item mbr-fonts-style display-7">${item.price}</td>
                                                <td class="body-item mbr-fonts-style display-7">
                                                    <div class="mbr-section-btn align-left">
                                                        <a class="btn btn-secondary display-4" href="/shop/deleteItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">DELETE</a>
                                                    </div>
                                                </td>
                                                <td class="body-item mbr-fonts-style display-7">
                                                        <div class="mbr-section-btn align-left">
                                                            <a class="btn btn-warning display-4" href="/shop/updateItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">UPDATE</a>
                                                        </div>
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
                                <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse2_9" aria-expanded="false" aria-controls="collapse2">
                                    <h4 class="mbr-fonts-style display-5">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>&nbsp;Smoothies</h4>
                                </a>

                            </div>
                            <div id="collapse2_9" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingTwo">
                                <div class="panel-body p-4">
                                        <div class="container container-table">
      
      
                            <div class="table-wrapper">
                                <div class="container">
                                
                                </div>

                                <div class="container scroll">
                                    <table class="table" cellspacing="0">
                                            <thead>
                                            <tr class="table-heads ">                                            
                                            <th class="head-item mbr-fonts-style display-7" style="width: 40%">ITEM NAME</th>
                                            <th class="head-item mbr-fonts-style display-7" style="width: 20%">PRICE</th>
                                            <th class="head-item mbr-fonts-style display-7" style="width: 20%">DELETE</th>
                                            <th class="head-item mbr-fonts-style display-7" style="width: 20%">UPDATE</th></tr>
                                            </thead>

                                            <tbody> 
                                            <c:forEach var = "item" items = "${items.get(1)}">
                                            <tr> 
                                                    <td class="body-item mbr-fonts-style display-7">${item.itemName}</td>
                                                    <td class="body-item mbr-fonts-style display-7">${item.price}</td>
                                                    <td class="body-item mbr-fonts-style display-7">
                                                        <div class="mbr-section-btn align-left">
                                                            <a class="btn btn-secondary display-4" href="/shop/deleteItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">DELETE</a>
                                                        </div>
                                                    </td>
                                                    <td class="body-item mbr-fonts-style display-7">
                                                            <div class="mbr-section-btn align-left">
                                                                <a class="btn btn-warning display-4" href="/shop/updateItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">UPDATE</a>
                                                            </div>
                                                    </td>
                                            </tr>
                                            </c:forEach>
                                            </tbody>
                                            
                                        </table>
                                                  </div>
                                                  <div class="container table-info-container">
                                                    
                                                  </div>
                                                </div>
                                              </div></div>
                            </div>
                        </div>
                        
                        <div class="card">
                            <div class="card-header" role="tab" id="headingThree">
                                <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse3_9" aria-expanded="false" aria-controls="collapse3">
                                    <h4 class="mbr-fonts-style display-5">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>&nbsp;Chillers</h4>
                                </a>
                            </div>
                            <div id="collapse3_9" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingThree">
                                <div class="panel-body p-4">
                                        <div class="container container-table">
      
      
                                                <div class="table-wrapper">
                                                  <div class="container">
                                                    
                                                  </div>
                                          
                                                  <div class="container scroll">
                                                        <table class="table" cellspacing="0">
                                                                <thead>
                                                                <tr class="table-heads ">                                            
                                                                <th class="head-item mbr-fonts-style display-7" style="width: 40%">ITEM NAME</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">PRICE</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">DELETE</th>
                                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">UPDATE</th></tr>
                                                                </thead>
                        
                                                                <tbody> 
                                                                <c:forEach var = "item" items = "${items.get(2)}">
                                                                <tr> 
                                                                        <td class="body-item mbr-fonts-style display-7">${item.itemName}</td>
                                                                        <td class="body-item mbr-fonts-style display-7">${item.price}</td>
                                                                        <td class="body-item mbr-fonts-style display-7">
                                                                            <div class="mbr-section-btn align-left">
                                                                                <a class="btn btn-secondary display-4" href="/shop/deleteItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">DELETE</a>
                                                                            </div>
                                                                        </td>
                                                                        <td class="body-item mbr-fonts-style display-7">
                                                                                <div class="mbr-section-btn align-left">
                                                                                    <a class="btn btn-warning display-4" href="/shop/updateItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">UPDATE</a>
                                                                                </div>
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
                                <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse4_9" aria-expanded="false" aria-controls="collapse4">
                                    <h4 class="mbr-fonts-style display-5">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>&nbsp;Mojito</h4>
                                </a>
                            </div>
                            <div id="collapse4_9" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingThree">
                                <div class="panel-body p-4">
                                            <div class="container container-table">
      
      
                                                    <div class="table-wrapper">
                                                      <div class="container">
                                                        
                                                      </div>
                                              
                                                      <div class="container scroll">
                                                            <table class="table" cellspacing="0">
                                                                    <thead>
                                                                    <tr class="table-heads ">                                            
                                                                    <th class="head-item mbr-fonts-style display-7" style="width: 40%">ITEM NAME</th>
                                                                    <th class="head-item mbr-fonts-style display-7" style="width: 20%">PRICE</th>
                                                                    <th class="head-item mbr-fonts-style display-7" style="width: 20%">DELETE</th>
                                                                    <th class="head-item mbr-fonts-style display-7" style="width: 20%">UPDATE</th></tr>
                                                                    </thead>
                            
                                                                    <tbody>
                                                                    <c:forEach var = "item" items = "${items.get(3)}"> 
                                                                    <tr> 
                                                                            <td class="body-item mbr-fonts-style display-7">${item.itemName}</td>
                                                                            <td class="body-item mbr-fonts-style display-7">${item.price}</td>
                                                                            <td class="body-item mbr-fonts-style display-7">
                                                                                <div class="mbr-section-btn align-left">
                                                                                    <a class="btn btn-secondary display-4" href="/shop/deleteItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">DELETE</a>
                                                                                </div>
                                                                            </td>
                                                                            <td class="body-item mbr-fonts-style display-7">
                                                                                    <div class="mbr-section-btn align-left">
                                                                                        <a class="btn btn-warning display-4" href="/shop/updateItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">UPDATE</a>
                                                                                    </div>
                                                                            </td>
                                                                    </tr>
                                                                    </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                      </div>
                                                      <div class="container table-info-container">
                                                        
                                                      </div>
                                                    </div>
                                                  </div></div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-header" role="tab" id="headingThree">
                                <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse5_9" aria-expanded="false" aria-controls="collapse5">
                                    <h4 class="mbr-fonts-style display-5">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>&nbsp;Sandwich</h4>
                                </a>
                            </div>
                            <div id="collapse5_9" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingThree">
                                <div class="panel-body p-4">
                                            <div class="container container-table">
      
      
                                                    <div class="table-wrapper">
                                                      <div class="container">
                                                        
                                                      </div>
                                              
                                                      <div class="container scroll">
                                                            <table class="table" cellspacing="0">
                                                                    <thead>
                                                                    <tr class="table-heads ">                                            
                                                                    <th class="head-item mbr-fonts-style display-7" style="width: 40%">ITEM NAME</th>
                                                                    <th class="head-item mbr-fonts-style display-7" style="width: 20%">PRICE</th>
                                                                    <th class="head-item mbr-fonts-style display-7" style="width: 20%">DELETE</th>
                                                                    <th class="head-item mbr-fonts-style display-7" style="width: 20%">UPDATE</th></tr>
                                                                    </thead>
                            
                                                                    <tbody> 
                                                                    <c:forEach var = "item" items = "${items.get(4)}">
                                                                    <tr> 
                                                                            <td class="body-item mbr-fonts-style display-7">${item.itemName}</td>
                                                                            <td class="body-item mbr-fonts-style display-7">${item.price}</td>
                                                                            <td class="body-item mbr-fonts-style display-7">
                                                                                <div class="mbr-section-btn align-left">
                                                                                    <a class="btn btn-secondary display-4" href="/shop/deleteItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">DELETE</a>
                                                                                </div>
                                                                            </td>
                                                                            <td class="body-item mbr-fonts-style display-7">
                                                                                    <div class="mbr-section-btn align-left">
                                                                                        <a class="btn btn-warning display-4" href="/shop/updateItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">UPDATE</a>
                                                                                    </div>
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
                                <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse6_9" aria-expanded="false" aria-controls="collapse6">
                                    <h4 class="mbr-fonts-style display-5">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>&nbsp;Burger</h4>
                                </a>
                            </div>
                            <div id="collapse6_9" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingThree">
                                <div class="panel-body p-4">
                                        <table class="table" cellspacing="0">
                                                <thead>
                                                <tr class="table-heads ">                                            
                                                <th class="head-item mbr-fonts-style display-7" style="width: 40%">ITEM NAME</th>
                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">PRICE</th>
                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">DELETE</th>
                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">UPDATE</th></tr>
                                                </thead>
        
                                                <tbody>
                                                <c:forEach var = "item" items = "${items.get(5)}"> 
                                                <tr> 
                                                        <td class="body-item mbr-fonts-style display-7">${item.itemName}</td>
                                                        <td class="body-item mbr-fonts-style display-7">${item.price}</td>
                                                        <td class="body-item mbr-fonts-style display-7">
                                                            <div class="mbr-section-btn align-left">
                                                                <a class="btn btn-secondary display-4" href="/shop/deleteItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">DELETE</a>
                                                            </div>
                                                        </td>
                                                        <td class="body-item mbr-fonts-style display-7">
                                                                <div class="mbr-section-btn align-left">
                                                                    <a class="btn btn-warning display-4" href="/shop/updateItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">UPDATE</a>
                                                                </div>
                                                        </td>
                                                </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                                      </div>
                                                      <div class="container table-info-container">
                                                        
                                                      </div>
                                                    </div>
                                                  </div></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>

<section class="toggle1 cid-qZU5BPb9Gx" id="toggle1-z">

        <div class="container">
            <div class="media-container-row">
                <div class="col-12 col-md-12">
                    <div class="section-head text-center space30">
                       
                    </div>
                    <div class="clearfix"></div>
                    <div id="bootstrap-toggle" class="toggle-panel accordionStyles tab-content">
                        
                        <div class="card">
                            <div class="card-header" role="tab" id="headingOne">
                                <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse1_10" aria-expanded="false" aria-controls="collapse1">
                                    <h4 class="mbr-fonts-style display-5">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>&nbsp;Subs</h4>
                                </a>
                            </div>
                            <div id="collapse1_10" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingOne">
                                <div class="panel-body p-4">
                                    
                        <div class="container container-table">


                                <div class="table-wrapper">
                                    <div class="container">
                                    
                                    </div>
                            
                                    <div class="container scroll">
                                        <table class="table" cellspacing="0">
                                                <thead>
                                                <tr class="table-heads ">                                            
                                                <th class="head-item mbr-fonts-style display-7" style="width: 40%">ITEM NAME</th>
                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">PRICE</th>
                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">DELETE</th>
                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">UPDATE</th></tr>
                                                </thead>

                                                <tbody> 
                                                <c:forEach var = "item" items = "${items.get(6)}">
                                                <tr> 
                                                        <td class="body-item mbr-fonts-style display-7">${item.itemName}</td>
                                                        <td class="body-item mbr-fonts-style display-7">${item.price}</td>
                                                        <td class="body-item mbr-fonts-style display-7">
                                                            <div class="mbr-section-btn align-left">
                                                                <a class="btn btn-secondary display-4" href="/shop/deleteItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">DELETE</a>
                                                            </div>
                                                        </td>
                                                        <td class="body-item mbr-fonts-style display-7">
                                                                <div class="mbr-section-btn align-left">
                                                                    <a class="btn btn-warning display-4" href="/shop/updateItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">UPDATE</a>
                                                                </div>
                                                        </td>
                                                </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                    </div>
                                    <div class="container table-info-container">
                                    
                                    </div>
                                </div>
                                </div></div>
                            </div>
                        </div>
                        
                        <div class="card">
                            <div class="card-header" role="tab" id="headingTwo">
                                <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse2_10" aria-expanded="false" aria-controls="collapse2">
                                    <h4 class="mbr-fonts-style display-5">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>&nbsp;Pasta</h4>
                                </a>

                            </div>
                            <div id="collapse2_10" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingTwo">
                                <div class="panel-body p-4">
                                            <div class="container container-table">


                                <div class="table-wrapper">
                                    <div class="container">
                                    
                                    </div>
                            
                                    <div class="container scroll">
                                        <table class="table" cellspacing="0">
                                                <thead>
                                                <tr class="table-heads ">                                            
                                                <th class="head-item mbr-fonts-style display-7" style="width: 40%">ITEM NAME</th>
                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">PRICE</th>
                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">DELETE</th>
                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">UPDATE</th></tr>
                                                </thead>

                                                <tbody> 
                                                <c:forEach var = "item" items = "${items.get(7)}">
                                                <tr> 
                                                        <td class="body-item mbr-fonts-style display-7">${item.itemName}</td>
                                                        <td class="body-item mbr-fonts-style display-7">${item.price}</td>
                                                        <td class="body-item mbr-fonts-style display-7">
                                                            <div class="mbr-section-btn align-left">
                                                                <a class="btn btn-secondary display-4" href="/shop/deleteItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">DELETE</a>
                                                            </div>
                                                        </td>
                                                        <td class="body-item mbr-fonts-style display-7">
                                                                <div class="mbr-section-btn align-left">
                                                                    <a class="btn btn-warning display-4" href="/shop/updateItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">UPDATE</a>
                                                                </div>
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
                                <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse3_10" aria-expanded="false" aria-controls="collapse3">
                                    <h4 class="mbr-fonts-style display-5">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>&nbsp;Salad</h4>
                                </a>
                            </div>
                            <div id="collapse3_10" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingThree">
                                <div class="panel-body p-4">
                                        <div class="container container-table">


                                <div class="table-wrapper">
                                    <div class="container">
                                    
                                    </div>
                            
                                    <div class="container scroll">
                                        <table class="table" cellspacing="0">
                                                <thead>
                                                <tr class="table-heads ">                                            
                                                <th class="head-item mbr-fonts-style display-7" style="width: 40%">ITEM NAME</th>
                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">PRICE</th>
                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">DELETE</th>
                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">UPDATE</th></tr>
                                                </thead>

                                                <tbody> 
                                                <c:forEach var = "item" items = "${items.get(8)}">
                                                <tr> 
                                                        <td class="body-item mbr-fonts-style display-7">${item.itemName}</td>
                                                        <td class="body-item mbr-fonts-style display-7">${item.price}</td>
                                                        <td class="body-item mbr-fonts-style display-7">
                                                            <div class="mbr-section-btn align-left">
                                                                <a class="btn btn-secondary display-4" href="/shop/deleteItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">DELETE</a>
                                                            </div>
                                                        </td>
                                                        <td class="body-item mbr-fonts-style display-7">
                                                                <div class="mbr-section-btn align-left">
                                                                    <a class="btn btn-warning display-4" href="/shop/updateItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">UPDATE</a>
                                                                </div>
                                                        </td>
                                                </tr>
                                                </c:forEach>
                                                </tbody>
                                                
                                            </table>
                                    </div>
                                    <div class="container table-info-container">
                                    
                                    </div>
                                </div>
                                </div></div>
                            </div>
                        </div>
                       
                        <div class="card">
                            <div class="card-header" role="tab" id="headingThree">
                                <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse4_10" aria-expanded="false" aria-controls="collapse4">
                                    <h4 class="mbr-fonts-style display-5">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>&nbsp;Jiffy Snacks</h4>
                                </a>
                            </div>
                            <div id="collapse4_10" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingThree">
                                <div class="panel-body p-4">
                                        <div class="container container-table">


                                <div class="table-wrapper">
                                    <div class="container">
                                    
                                    </div>
                            
                                    <div class="container scroll">
                                        <table class="table" cellspacing="0">
                                                <thead>
                                                <tr class="table-heads ">                                            
                                                <th class="head-item mbr-fonts-style display-7" style="width: 40%">ITEM NAME</th>
                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">PRICE</th>
                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">DELETE</th>
                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">UPDATE</th></tr>
                                                </thead>
        
                                                <tbody> 
                                                <c:forEach var = "item" items = "${items.get(9)}">
                                                <tr> 
                                                        <td class="body-item mbr-fonts-style display-7">${item.itemName}</td>
                                                        <td class="body-item mbr-fonts-style display-7">${item.price}</td>
                                                        <td class="body-item mbr-fonts-style display-7">
                                                            <div class="mbr-section-btn align-left">
                                                                <a class="btn btn-secondary display-4" href="/shop/deleteItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">DELETE</a>
                                                            </div>
                                                        </td>
                                                        <td class="body-item mbr-fonts-style display-7">
                                                                <div class="mbr-section-btn align-left">
                                                                    <a class="btn btn-warning display-4" href="/shop/updateItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">UPDATE</a>
                                                                </div>
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
                                <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse5_10" aria-expanded="false" aria-controls="collapse5">
                                    <h4 class="mbr-fonts-style display-5">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>&nbsp;Pizza</h4>
                                </a>
                            </div>
                            <div id="collapse5_10" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingThree">
                                <div class="panel-body p-4">
                                        <div class="container container-table">


                                <div class="table-wrapper">
                                    <div class="container">
                                    
                                    </div>
                            
                                    <div class="container scroll">
                                        <table class="table" cellspacing="0">
                                                <thead>
                                                <tr class="table-heads ">                                            
                                                <th class="head-item mbr-fonts-style display-7" style="width: 40%">ITEM NAME</th>
                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">PRICE</th>
                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">DELETE</th>
                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">UPDATE</th></tr>
                                                </thead>
        
                                                <tbody> 
                                                <c:forEach var = "item" items = "${items.get(10)}">
                                                <tr> 
                                                        <td class="body-item mbr-fonts-style display-7">${item.itemName}</td>
                                                        <td class="body-item mbr-fonts-style display-7">${item.price}</td>
                                                        <td class="body-item mbr-fonts-style display-7">
                                                            <div class="mbr-section-btn align-left">
                                                                <a class="btn btn-secondary display-4" href="/shop/deleteItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">DELETE</a>
                                                            </div>
                                                        </td>
                                                        <td class="body-item mbr-fonts-style display-7">
                                                                <div class="mbr-section-btn align-left">
                                                                    <a class="btn btn-warning display-4" href="/shop/updateItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">UPDATE</a>
                                                                </div>
                                                        </td>
                                                </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                    </div>
                                    <div class="container table-info-container">
                                    
                                    </div>
                                </div>
                                </div></div>
                            </div>
                        </div>
                       
                        <div class="card">
                            <div class="card-header" role="tab" id="headingThree">
                                <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse6_10" aria-expanded="false" aria-controls="collapse6">
                                    <h4 class="mbr-fonts-style display-5">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>&nbsp;Juices</h4>
                                </a>
                            </div>
                            <div id="collapse6_10" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingThree">
                                <div class="panel-body p-4">
                                        <div class="container container-table">
      

                            <div class="table-wrapper">
                                <div class="container">
                                
                                </div>
                        
                                <div class="container scroll">
                                    <table class="table" cellspacing="0">
                                            <thead>
                                            <tr class="table-heads ">                                            
                                            <th class="head-item mbr-fonts-style display-7" style="width: 40%">ITEM NAME</th>
                                            <th class="head-item mbr-fonts-style display-7" style="width: 20%">PRICE</th>
                                            <th class="head-item mbr-fonts-style display-7" style="width: 20%">DELETE</th>
                                            <th class="head-item mbr-fonts-style display-7" style="width: 20%">UPDATE</th></tr>
                                            </thead>
    
                                            <tbody>
                                            <c:forEach var = "item" items = "${items.get(11)}"> 
                                            <tr> 
                                                    <td class="body-item mbr-fonts-style display-7">${item.itemName}</td>
                                                    <td class="body-item mbr-fonts-style display-7">${item.price}</td>
                                                    <td class="body-item mbr-fonts-style display-7">
                                                        <div class="mbr-section-btn align-left">
                                                            <a class="btn btn-secondary display-4" href="/shop/deleteItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">DELETE</a>
                                                        </div>
                                                    </td>
                                                    <td class="body-item mbr-fonts-style display-7">
                                                            <div class="mbr-section-btn align-left">
                                                                <a class="btn btn-warning display-4" href="/shop/updateItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">UPDATE</a>
                                                            </div>
                                                    </td>
                                            </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                </div>
                                <div class="container table-info-container">
                                
                                </div>
                            </div>
                            </div></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>

<section class="toggle1 cid-qZU5C3urAY" id="toggle1-10">

    

    
        <div class="container">
            <div class="media-container-row">
                <div class="col-12 col-md-12">
                    <div class="section-head text-center space30">
                       
                    </div>
                    <div class="clearfix"></div>
                    <div id="bootstrap-toggle" class="toggle-panel accordionStyles tab-content">
                        
                        
                        <div class="card">
                            <div class="card-header" role="tab" id="headingOne">
                                <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse1_11" aria-expanded="false" aria-controls="collapse1">
                                    <h4 class="mbr-fonts-style display-5">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>Desserts</h4>
                                </a>
                            </div>
                            <div id="collapse1_11" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingOne">
                                <div class="panel-body p-4">
                                        <div class="container container-table">
      

                                <div class="table-wrapper">
                                    <div class="container">
                                    
                                    </div>
                            
                                    <div class="container scroll">
                                        <table class="table" cellspacing="0">
                                                <thead>
                                                <tr class="table-heads ">                                            
                                                <th class="head-item mbr-fonts-style display-7" style="width: 40%">ITEM NAME</th>
                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">PRICE</th>
                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">DELETE</th>
                                                <th class="head-item mbr-fonts-style display-7" style="width: 20%">UPDATE</th></tr>
                                                </thead>
        
                                                <tbody> 
                                                <c:forEach var = "item" items = "${items.get(12)}">
                                                <tr> 
                                                        <td class="body-item mbr-fonts-style display-7">${item.itemName}</td>
                                                        <td class="body-item mbr-fonts-style display-7">${item.price}</td>
                                                        <td class="body-item mbr-fonts-style display-7">
                                                            <div class="mbr-section-btn align-left">
                                                                <a class="btn btn-secondary display-4" href="/shop/deleteItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">DELETE</a>
                                                            </div>
                                                        </td>
                                                        <td class="body-item mbr-fonts-style display-7">
                                                                <div class="mbr-section-btn align-left">
                                                                    <a class="btn btn-warning display-4" href="/shop/updateItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">UPDATE</a>
                                                                </div>
                                                        </td>
                                                </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                    </div>
                                    <div class="container table-info-container">
                                    
                                    </div>
                                </div>
                                </div></div>
                            </div>
                        </div>
                        
                        <div class="card">
                            <div class="card-header" role="tab" id="headingTwo">
                                <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#accordion" data-core="" href="#collapse2_11" aria-expanded="false" aria-controls="collapse2">
                                    <h4 class="mbr-fonts-style display-5">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>&nbsp;Milk Shakes</h4>
                                </a>

                            </div>
                            <div id="collapse2_11" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingTwo">
                                <div class="panel-body p-4">
                                        <div class="container container-table">
      

                        <div class="table-wrapper">
                            <div class="container">
                            
                            </div>
                    
                            <div class="container scroll">
                                <table class="table" cellspacing="0">
                                        <thead>
                                        <tr class="table-heads ">                                            
                                        <th class="head-item mbr-fonts-style display-7" style="width: 40%">ITEM NAME</th>
                                        <th class="head-item mbr-fonts-style display-7" style="width: 20%">PRICE</th>
                                        <th class="head-item mbr-fonts-style display-7" style="width: 20%">DELETE</th>
                                        <th class="head-item mbr-fonts-style display-7" style="width: 20%">UPDATE</th></tr>
                                        </thead>

                                        <tbody> 
                                        <c:forEach var = "item" items = "${items.get(13)}">
                                        <tr> 
                                                <td class="body-item mbr-fonts-style display-7">${item.itemName}</td>
                                                <td class="body-item mbr-fonts-style display-7">${item.price}</td>
                                                <td class="body-item mbr-fonts-style display-7">
                                                    <div class="mbr-section-btn align-left">
                                                        <a class="btn btn-secondary display-4" href="/shop/deleteItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">DELETE</a>
                                                    </div>
                                                </td>
                                                <td class="body-item mbr-fonts-style display-7">
                                                        <div class="mbr-section-btn align-left">
                                                            <a class="btn btn-warning display-4" href="/shop/updateItem?id=${id}&iNo=${item.iNo}" style="padding-top: 12px; padding-bottom: 12px;">UPDATE</a>
                                                        </div>
                                                </td>
                                        </tr>
                                        </c:forEach>
                                        
                                        </tbody>
                                    </table>
                                   
                            </div>
                            <div class="container table-info-container">
                            
                            </div>
                        </div>
                        </div> </div>
                            </div>
                        </div>
                        
                        
                        
                        
                    </div>
                </div>
            </div>
        </div>
</section>
	
	
	
	
	<%@ include file="footer.jsp" %>
</body>
</html>