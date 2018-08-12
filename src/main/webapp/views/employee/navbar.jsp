<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<section class="menu cid-qZrokjkqJ4" once="menu" id="menu1-3">

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
                    <a href="/employee/homeForward?id=${id}">
                         <img src="assets/images/c1c5a3bb-79cb-41f3-ac69-c6742262eeda-122x122.png" alt="SmarTuck" title="" style="height: 3.8rem;">
                    </a>
                </span>
                <span class="navbar-caption-wrap"><a class="navbar-caption text-white display-4" href="/employee/homeForward?id=${id}">
                        SMARTUCK</a></span>
            </div>
        </div>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav nav-dropdown nav-right" data-app-modern-menu="true"><li class="nav-item">
                    <a class="nav-link link text-white display-4" href="/employee/profile?id=${id}">
                    <span class="mbri-user mbr-iconfont mbr-iconfont-btn"></span>
                        Profile</a></li>
                        
                        <li class="nav-item"><a class="nav-link link text-white display-4" href="/employee/orderHistory?id=${id}">
                <span class="mbri-delivery mbr-iconfont mbr-iconfont-btn"></span>
                        My Orders</a></li>
                
                <li class="nav-item">
                    <a class="nav-link link text-white display-4" href="/employee/logout">
                    <span class="mbri-unlock mbr-iconfont mbr-iconfont-btn"></span>
                    Logout</a>
                </li>
                </ul>
            
        </div>
    </nav>
</section>