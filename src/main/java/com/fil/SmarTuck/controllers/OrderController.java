package com.fil.SmarTuck.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fil.SmarTuck.models.Order;
import com.fil.SmarTuck.services.EmployeeServiceImplementation;
import com.fil.SmarTuck.services.ItemServiceImplementation;
import com.fil.SmarTuck.services.OrderServiceImplementation;
import com.fil.SmarTuck.services.ShopServiceImplementation;

@Controller
public class OrderController {
	@Autowired
	private EmployeeServiceImplementation employeeService;
	@Autowired
	private ShopServiceImplementation shopService;
	@Autowired
	private OrderServiceImplementation orderService;
	@Autowired
	private ItemServiceImplementation itemService;
	
	
	
	@RequestMapping(value = "/shop/currentOrders", method = RequestMethod.GET)		
	public String viewCurrentOrders(@RequestParam String id,@RequestParam String shopId ,ModelMap model) {
		List<List<Order>> allCurrentOrders = new ArrayList<>();
		allCurrentOrders = orderService.getAllByShopIdAndStatus(id, "In the Kitchen");
		model.addAttribute("id", shopId);
		model.addAttribute(id);
		model.addAttribute("currentOrders",allCurrentOrders);
		return "/shop/currentOrders.jsp";
	}	
	
	@RequestMapping(value = "/shop/ordersHistory", method = RequestMethod.GET)		
	public String viewAllOrders(@RequestParam String id, @RequestParam String shopId,ModelMap model) {
		List<List<Order>> allOrders = new ArrayList<>();
		allOrders = orderService.getAllByShopId(id);
		model.addAttribute("id", id);
		model.addAttribute(shopId);
		model.addAttribute("allOrders",allOrders);
		return "/shop/ordersHistory.jsp";
	}	
	
	@RequestMapping(value = "/shop/reportedOrders", method = RequestMethod.GET)		
	public String viewReportedOrders(@RequestParam String id, @RequestParam String shopId,ModelMap model) {
		List<List<Order>> allreportedOrders = new ArrayList<>();
		allreportedOrders = orderService.getAllByShopIdAndStatus(id, "Reported");
		model.addAttribute(shopId);
		model.addAttribute("id", id);
		model.addAttribute("ReportedOrders",allreportedOrders);
		return "/shop/reportedOrders.jsp";
	}	
}
