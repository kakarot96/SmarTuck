<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<section class="menu cid-qZSk8rwSQo" once="menu" id="menu1-1t">

    <nav class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <div class="hamburger">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </div>
        </button>
        <div class="menu-logo">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="/shop/homeForward?id=${id}">
                         <img src="assets/images/c1c5a3bb-79cb-41f3-ac69-c6742262eeda-122x122.png" alt="" title="" style="height: 3.8rem;">
                    </a>
                </span>
                <span class="navbar-caption-wrap"><a class="navbar-caption text-white display-4" href="/shop/homeForward?id=${id}">SMARTUCK</a></span>
            </div>
        </div>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav nav-dropdown nav-right" data-app-modern-menu="true">
            		
            		<li class="nav-item">
            		<a class="nav-link link text-white display-4" href="/shop/inventory?id=${id}">
            		<span class="mbri-setting3 mbr-iconfont mbr-iconfont-btn"></span>
                        Inventory</a>
                    </li>
                        
                    <li class="nav-item dropdown">
                    <a class="nav-link link text-white dropdown-toggle display-4" href="#" data-toggle="dropdown-submenu" aria-expanded="false">
                    <span class="mbri-edit mbr-iconfont mbr-iconfont-btn"></span>
                        Menu</a>                        
                    <div class="dropdown-menu">
                    <a class="text-white dropdown-item display-4" href="/shop/menu?id=${id}">Manage Menu</a>
                    <a class="text-white dropdown-item display-4" href="/shop/addItem?id=${id}" aria-expanded="false">Add Item</a>
                    </div>                    
     				</li>
     				
     				<li class="nav-item dropdown">
                    <a class="nav-link link text-white dropdown-toggle display-4" href="#" data-toggle="dropdown-submenu" aria-expanded="false">
                    <span class="mbri-delivery mbr-iconfont mbr-iconfont-btn"></span>
                        Orders</a>
                     <div class="dropdown-menu">
                     <a class="text-white dropdown-item display-4" href="/shop/homeForward?id=${id}">Pending Orders</a>
                     <a class="text-white dropdown-item display-4" href="/shop/currentOrders?id=${id}" aria-expanded="false">Current Orders</a>
                     <a class="text-white dropdown-item display-4" href="/shop/ordersHistory?id=${id}" aria-expanded="false">Order History</a>
                     <a class="text-white dropdown-item display-4" href="/shop/reportedOrders?id=${id}" aria-expanded="false">Reported Orders</a>
                     </div>
                	</li>
                	
	                <li class="nav-item">
	                <a class="nav-link link text-white display-4" href="/shop/logout">
	                <span class="mbri-unlock mbr-iconfont mbr-iconfont-btn"></span>
	                        Log Out</a>
	                </li>
                        
                   </ul>
            
        </div>
    </nav>
</section>