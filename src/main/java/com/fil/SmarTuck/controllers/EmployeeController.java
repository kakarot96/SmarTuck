package com.fil.SmarTuck.controllers;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fil.SmarTuck.models.Employee;
import com.fil.SmarTuck.models.Item;
import com.fil.SmarTuck.models.Order;
import com.fil.SmarTuck.models.Shop;
import com.fil.SmarTuck.services.EmployeeServiceImplementation;
import com.fil.SmarTuck.services.ItemServiceImplementation;
import com.fil.SmarTuck.services.OrderServiceImplementation;
import com.fil.SmarTuck.services.ShopServiceImplementation;

@Controller
@SessionAttributes("id")
public class EmployeeController {

	@Autowired
	private EmployeeServiceImplementation employeeService;
	@Autowired
	private ShopServiceImplementation shopService;
	@Autowired
	private OrderServiceImplementation orderService;
	@Autowired
	private ItemServiceImplementation itemService;

	@RequestMapping(value = "/employee/menu", method = RequestMethod.GET)
	public String viewMenu(@RequestParam String id, @RequestParam String shopId, ModelMap model) {

		List<List<Item>> items = itemService.getItemByCategory(shopId);
		model.addAttribute("id", id);
		model.addAttribute("shopId", shopId);
		model.addAttribute("items", items);
		return "/employee/menu.jsp";
	}

	@RequestMapping(value = "/employee/profile", method = RequestMethod.GET)
	public String viewProfile(@RequestParam String id, ModelMap model) {
		Employee emp = employeeService.getEmployeeById(id);
		model.addAttribute("id", id);
		model.addAttribute("employee", emp);
		return "/employee/profile.jsp";
	}

	@RequestMapping(value = "/employee/orderHistory", method = RequestMethod.GET)
	public String viewOrderHistory(@RequestParam String id, ModelMap model) {
		List<List<Order>> allOrders = new ArrayList<>();
		allOrders = orderService.getAllByAId(id);
		model.addAttribute("id", id);
		model.addAttribute("orderHistory", allOrders);
		return "/employee/orderHistory.jsp";
	}

	@RequestMapping(value = "/employee/orderInformation", method = RequestMethod.GET) // needs
	// to
	// be
	// changed
	public String viewOrderSummary(@RequestParam String id, @RequestParam String orderId, ModelMap model) {
		List<Order> allItems = new ArrayList<>();
		allItems = orderService.getOrderByOrderId(orderId);
		model.addAttribute("id", id);
		model.addAttribute("orderinformation", allItems);
		return "/employee/orderInformation.jsp";
	}

	@RequestMapping(value = "/employee/orderSummary", method = RequestMethod.GET) // needs
																					// to
																					// be
																					// changed
	public String viewOrderSummary(@RequestParam String id, @RequestParam String shopId,
			@RequestParam List<Order> order, ModelMap model) {
		// List<Order> orders = new ArrayList<>();
		// allOrders = orderService.getAllByAId(id);
		String qtyCheck = orderService.checkItemQuantity(order);
		if (!qtyCheck.equals("Following Items are not in sufficient quantity \n")) {
			List<Item> items = itemService.getAllByShopId(shopId);
			model.addAttribute(items);
			model.addAttribute("id", id);
			model.addAttribute("shopId", shopId);
			model.addAttribute("qtyCheck", qtyCheck);
			return "/employee/menu";

		}

		else {
			model.addAttribute("id", id);
			model.addAttribute("shopId", shopId);
			model.addAttribute("orderSummary", order);
			return "/employee/orderSummary.jsp";
		}

	}

	@RequestMapping(value = "/employee/orderConfirmation", method = RequestMethod.GET)
	public String viewOrderConfirmation(@RequestParam String id, @RequestParam String shopId,
			@RequestParam List<Order> order, @RequestParam String remarks, ModelMap model) {

		String qtyCheck = orderService.checkItemQuantity(order);
		if (!qtyCheck.equals("Following Items are not in sufficient quantity \n")) {
			List<Item> items = itemService.getAllByShopId(shopId);
			model.addAttribute(items);
			model.addAttribute("shopId", shopId);
			model.addAttribute("id", id);
			model.addAttribute("qtyCheck", qtyCheck);
			return "/employee/menu.jsp";
		}
		//orderService.addOrder(order);
		Date orderDate = new Date(System.currentTimeMillis());
		Time orderTime = new Time(System.currentTimeMillis());
		String orderId = orderService.getOrderId(id, orderDate, orderTime);
		orderService.updateOrderId(order, orderId);
		orderService.updateOrderTime(order, orderTime);
		orderService.updateOrderStatus(orderId, "Placed");
		orderService.updateRemarks(order, remarks);
		orderService.updateOrderDate(order, orderDate);
		model.addAttribute("id", id);
		model.addAttribute("shopId", shopId);
		model.addAttribute("orderId", orderId);
		return "/employee/orderConfirmation.jsp";
	}

}
