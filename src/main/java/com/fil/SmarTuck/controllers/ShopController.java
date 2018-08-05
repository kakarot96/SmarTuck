package com.fil.SmarTuck.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fil.SmarTuck.models.Item;
import com.fil.SmarTuck.models.Order;
import com.fil.SmarTuck.services.ItemServiceImplementation;
import com.fil.SmarTuck.services.OrderServiceImplementation;

@Controller
public class ShopController {

	@Autowired
	private OrderServiceImplementation orderService;
	@Autowired
	private ItemServiceImplementation itemService;
	
	@RequestMapping(value = "/shop/menu", method = RequestMethod.GET)
	public String viewMenu(@RequestParam String id, ModelMap model) {

		List<List<Item>> items = itemService.getItemByCategory(id);
		model.addAttribute("id", id);
		model.addAttribute("items", items);
		return "/shop/menu.jsp";
	}
	
	@RequestMapping(value = "/shop/inventory", method = RequestMethod.GET)  
    public String getInventory(@RequestParam String id,ModelMap map){  
    	
    	List<Item> items=itemService.getAllByShopId(id);

    	map.addAttribute("id",id);
    	map.addAttribute("items",items);
    	
    	return "/shop/inventory.jsp";
        
    } 
    
    @RequestMapping(value = "/shop/update", method = RequestMethod.GET)  
    public String updateItems(@RequestParam String id,@RequestParam List<Item> items,ModelMap map){  
    	
    	itemService.updateItems(items);
    	map.addAttribute(id);
    	return "/shop/inventory.jsp";
        
    } 
    
    @RequestMapping(value = "/shop/currentOrders", method = RequestMethod.GET)		
	public String viewCurrentOrders(@RequestParam String id,@RequestParam String shopId ,ModelMap model) {
		List<List<Order>> allCurrentOrders = new ArrayList<>();
		allCurrentOrders = orderService.getCurrentOrders(id);
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
