package com.fil.SmarTuck.controllers;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

	
	@RequestMapping(value = "/employee/homeForward", method = {RequestMethod.GET,RequestMethod.POST})
	public String employeeHome(@RequestParam String id,  ModelMap model) {
		List<Shop> shops = shopService.getAllShops();

		model.addAttribute("id", id);
		model.addAttribute("shops", shops);
		return "employee/home.jsp";

	
	}
	
	
	@RequestMapping(value = "/employee/menu", method = RequestMethod.GET)
	public String viewMenu(@RequestParam String id, @RequestParam String shopId, ModelMap model) {
int status=1;
		List<List<Order>> allOrders=orderService.getAllByAId(id);
		for (List<Order> list : allOrders) {
			if(list.get(0).getStatus().equals("Reported") && list.get(0).getiNo().getShop().getShopId().equals(shopId)){
				status=0;break;
			}
		}
		
		if(shopService.getShopById(shopId).getStatus()==0){
			String shopStatus="Shop is currently not Accepting Orders!";
			model.addAttribute("shopStatus", shopStatus);
			model.addAttribute("id", id);
			return "forward:/employee/homeForward";
		}
		
		if(status == 1  ){
			List<List<Item>> items = itemService.getAvailableItems(shopId);

			model.addAttribute("id", id);
			model.addAttribute("shopId", shopId);
			model.addAttribute("items", items);
			return "/employee/menu.jsp";
		}
		
		else{
			
			
			String errorMessage="Clear pending payment";
//			System.out.println(errorMessage);
			model.addAttribute("id", id);			
			
			model.addAttribute("shopId", shopId);
			model.addAttribute("errorMessage", errorMessage);
			
			return "forward:/employee/homeForward";
		}
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
		List<List<Order>> employeeOrders = new ArrayList<>();
		employeeOrders = orderService.getAllByAId(id);
//		for (List<Order> list : employeeOrders) {
//			System.out.println(list);
//		}
		List<Integer> orderAmounts=new ArrayList<>(); 
		for (List<Order> list : employeeOrders) {
			orderAmounts.add(orderService.getAmountByOrder(list));
		}
		
		model.addAttribute("orderAmounts", orderAmounts);
		model.addAttribute("id", id);
		model.addAttribute("orderHistory", employeeOrders);
		return "/employee/orderHistory.jsp";
	}
// for rating
	@RequestMapping(value = "/employee/orderInformation", method = RequestMethod.GET)
	// needs
	// to
	// be
	// changed
	public String viewOrderSummary(@RequestParam String id, @RequestParam String orderId, ModelMap model) {
		List<Order> allItems = new ArrayList<>();
		allItems = orderService.getOrderByOrderId(orderId);
		model.addAttribute("id", id);
		model.addAttribute("orderInformation", allItems);
		return "/employee/orderInformation.jsp";
	}

	
	
	@RequestMapping(value = "/employee/orderSummary", method = RequestMethod.POST) // needs
	// to
	// be
	// changed
	public String viewOrderSummary(@RequestParam String id, @RequestParam String shopId,
			@RequestParam Map<?, ?> mapOrder, ModelMap model) {
		List<Order> orders = new ArrayList<>();
		// allOrders = orderService.getAllByAId(id);
		for (Map.Entry<?, ?> entry : mapOrder.entrySet()) {
			//System.out.print(entry.getKey() + " : ");
			//System.out.println(entry.getValue());
			Object key = entry.getKey();
			Object value = entry.getValue();
			//System.out.println(key+"   "+value);
			
			Integer iValue = 0;
			try {
				iValue = Integer.parseInt((String) value);
			} catch (Exception e) {
				iValue = 0;
			}
			if (iValue != 0) {
				Employee emp = employeeService.getEmployeeById(id);
				Item item = itemService.getItemById(Integer.parseInt((String) key));
				Order oneOrder = new Order(emp, item, iValue);
//				System.out.println(
//						"adding order to the list " + oneOrder.getQty() + " " + oneOrder.getiNo().getItemName());
				orders.add(oneOrder);
			}

		}
		List<String> unavailableItems = orderService.checkItemQuantity(orders);
	
		if(shopService.getShopById(shopId).getStatus()==0){
			String shopStatus="Shop currently unavailable";
			model.addAttribute("shopStatus", shopStatus);
			model.addAttribute("id", id);
			return "forward:/employee/homeForward";
		}
		
		
		
		//aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
		int status=1;
		List<List<Order>> allOrders=orderService.getAllByAId(id);
		for (List<Order> list : allOrders) {
			if(list.get(0).getStatus().equals("Reported") && list.get(0).getiNo().getShop().getShopId().equals(shopId)){
				status=0;break;
			}
		}
		
		if(status==0){
			String errorMessage="Clear pending payment";
//			System.out.println(errorMessage);
			model.addAttribute("id", id);			
			
			model.addAttribute("shopId", shopId);
			model.addAttribute("errorMessage", errorMessage);
			
			return "forward:/employee/homeForward";
		}
		
		
		
		if(unavailableItems.isEmpty()){
			model.addAttribute("id", id);
			model.addAttribute("shopId", shopId);
			model.addAttribute("order", orders);
			int totalAmount=orderService.getAmountByOrder(orders);
			model.addAttribute("totalAmount", totalAmount);
			return "/employee/orderSummary.jsp";
		}
		else{
			//System.out.println("going to menu back");
			List<List<Item>> items = itemService.getItemByCategory(shopId);
			model.addAttribute("items",items);
			model.addAttribute("id", id);
			model.addAttribute("shopId", shopId);
			model.addAttribute("unavailableItems", unavailableItems);
		
			return "/employee/menu.jsp";
		}
		


	}
	
	
	@RequestMapping(value = "/employee/rateOrder", method = RequestMethod.POST) // needs
	// to
	// be
	// changed
	public String rateOrder(@RequestParam String id, @RequestParam String orderId,
			@RequestParam Map<?, ?> mapOrder, ModelMap model) {
		List<Order> orders = orderService.getOrderByOrderId(orderId);
		List<Integer> ratings=new ArrayList<>(); 
		// allOrders = orderService.getAllByAId(id);
		for (Map.Entry<?, ?> entry : mapOrder.entrySet()) {
			//System.out.print(entry.getKey() + " : ");
			//System.out.println(entry.getValue());
			Object key = entry.getKey();
			Object value = entry.getValue();
			Integer iValue = 0;
			try {
				iValue = Integer.parseInt((String) value);
				ratings.add(iValue);
			} catch (Exception e) {
				iValue = 0;
			}
		

		}
		
		for(int i=0;i<orders.size();i++){
			orders.get(i).setRating(ratings.get(i));
			int qty=orders.get(i).getQty();
			int prevCounter=orders.get(i).getiNo().getCounter();
			double prevRating=orders.get(i).getiNo().getRating();
			orders.get(i).getiNo().setCounter(prevCounter+qty);
			double temp=(prevRating*prevCounter+qty*ratings.get(i))/(prevCounter+qty);
			double total = Math.round(temp * 100);
			total=total/100;

			orders.get(i).getiNo().setRating(total);
		}
		
		orderService.updateOrderRating(orders);
		
		model.addAttribute("id", id);
		
		return "redirect:/employee/orderHistory?id="+id;


	}

	@RequestMapping(value = "/employee/orderConfirmation", method = RequestMethod.POST)
	public String viewOrderConfirmation(@RequestParam String id, @RequestParam String shopId,
			@RequestParam Map<?, ?> mapOrder, @RequestParam String remarks, ModelMap model) {
	//	System.out.println("in order confirm controller");
		
		List<Order> orders = new ArrayList<>();
		// allOrders = orderService.getAllByAId(id);
		for (Map.Entry<?, ?> entry : mapOrder.entrySet()) {
			//System.out.print(entry.getKey() + " : ");
			//System.out.println(entry.getValue());
			Object key = entry.getKey();
			Object value = entry.getValue();
			Integer iValue = 0;
			try {
				iValue = Integer.parseInt((String) value);
			} catch (Exception e) {
				iValue = 0;
			}
			if (iValue != 0) {
				Employee emp = employeeService.getEmployeeById(id);
				Item item = itemService.getItemById(Integer.parseInt((String) key));
				Order oneOrder = new Order(emp, item, iValue);
//				System.out.println(
//						"adding order to the list " + oneOrder.getQty() + " " + oneOrder.getiNo().getItemName());
				orders.add(oneOrder);
			}

		}
		
		
		List<String> unavailableItems = orderService.checkItemQuantity(orders);
		if(shopService.getShopById(shopId).getStatus()==0){
			String shopStatus="Shop currently unavailable";
			model.addAttribute("shopStatus", shopStatus);
			model.addAttribute("id", id);
			return "forward:/employee/homeForward";
		}
		
		
		
		//aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
		
		
		
		
		int status=1;
		List<List<Order>> allOrders=orderService.getAllByAId(id);
		for (List<Order> list : allOrders) {
			if(list.get(0).getStatus().equals("Reported") && list.get(0).getiNo().getShop().getShopId().equals(shopId)){
				status=0;break;
			}
		}
		
		if(status==0){
			String errorMessage="Clear pending payment";
//			System.out.println(errorMessage);
			model.addAttribute("id", id);			
			
			model.addAttribute("shopId", shopId);
			model.addAttribute("errorMessage", errorMessage);
			
			return "forward:/employee/homeForward";
		}
		
		
		
		
		
		if (!unavailableItems.isEmpty()) {
			List<Item> items = itemService.getAllByShopId(shopId);
			model.addAttribute("id", id);
			model.addAttribute("shopId", shopId);
			model.addAttribute("items", items);
			model.addAttribute("qtyCheck", unavailableItems);
			return "/employee/menu.jsp";
		}
		// orderService.addOrder(order);
		Date orderDate = new Date(System.currentTimeMillis());
		Time orderTime = new Time(System.currentTimeMillis());
		String orderId = orderService.getOrderId(id, orderDate, orderTime);
		for (Order order2 : orders) {
			order2.setPrice(order2.getiNo().getPrice());
		}
		orderService.addOrder(orders);
		orderService.updateOrderId(orders, orderId);
		orderService.updateOrderTime(orders, orderTime);
		orderService.updateOrderStatus(orderId, "Pending");
		orderService.updateRemarks(orders, remarks);
		orderService.updateOrderDate(orders, orderDate);
	//	orderService.updateItemQuantity(order);
		model.addAttribute("id", id);
		model.addAttribute("shopId", shopId);
		model.addAttribute("orderId", orderId);
		orderService.updateItemQuantity(orders);
		return "/employee/orderConfirmation.jsp";
	}
	

	@RequestMapping(value = "/employee/cancelOrder", method = RequestMethod.GET)
	public String cancelOrder(@RequestParam String id, @RequestParam String orderId ,ModelMap model) {
		String cancelStatus="";
		List<Order> order=orderService.getOrderByOrderId(orderId);
		if(order.get(0).getStatus().equals("Pending") || order.get(0).getStatus().equals("Accepted")){
			
			orderService.updateItemQuantityOnCancel(order);
			orderService.updateOrderStatus(orderId, "Cancelled");
			
		}
		else{
			 cancelStatus="Order already in the kitchen!";
		}
		

		model.addAttribute("id", id);
		model.addAttribute("cancelStatus", cancelStatus);
		
		return "forward:/employee/orderHistory";

	
	}
	
	// For reordering
	
	@RequestMapping(value = "/employee/orderSummary", method = RequestMethod.GET) // needs
	// to
	// be
	// changed
	public String reOrder(@RequestParam String id, @RequestParam String shopId,
			@RequestParam String orderId, ModelMap model) {
		List<Order> orders =orderService.getOrderByOrderId(orderId);
		List<Order> reOrder=new ArrayList<>();
		for(Order order:orders){
			reOrder.add(order);
		}
		
		List<String> unavailableItems = orderService.checkItemQuantity(reOrder);
	
		if(unavailableItems.isEmpty()){
			model.addAttribute("id", id);
			model.addAttribute("shopId", shopId);
			model.addAttribute("order", reOrder);
			int totalAmount=orderService.getAmountByOrder(reOrder);
			model.addAttribute("totalAmount", totalAmount);
			return "/employee/orderSummary.jsp";
		}
		else{
			//System.out.println("going to menu back");
			List<List<Item>> items = itemService.getItemByCategory(shopId);
			model.addAttribute("items",items);
			model.addAttribute("id", id);
//			model.addAttribute("shopId", shopId);
			model.addAttribute("unavailableItems", unavailableItems);
		
			return "/employee/menu.jsp";
		}
		


	}
	@RequestMapping(value = "/employee/logout", method = RequestMethod.GET)
	public String logout() {
		
		return "redirect:/";
		}
	
	
	
}
