package com.fil.SmarTuck.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fil.SmarTuck.models.Item;
import com.fil.SmarTuck.models.Order;
import com.fil.SmarTuck.models.Shop;
import com.fil.SmarTuck.services.ItemServiceImplementation;
import com.fil.SmarTuck.services.OrderServiceImplementation;
import com.fil.SmarTuck.services.ShopServiceImplementation;

@Controller
public class ShopController {

	@Autowired
	private OrderServiceImplementation orderService;
	@Autowired
	private ItemServiceImplementation itemService;
	@Autowired
	private ShopServiceImplementation shopService;

	@RequestMapping(value = "/shop/homeForward", method = RequestMethod.GET)
	public String shopHome(@RequestParam String id, ModelMap model) {

		List<List<Order>> pendingOrders = orderService.getPendingOrders(id);

		
		//System.out.println("in homeforward");
		
		for (List<Order> list : pendingOrders) {
			for (Order order : list) {
				//System.out.println(order);
			}
		}
		List<Integer> orderAmounts = new ArrayList<>();
		for (List<Order> list : pendingOrders) {
			orderAmounts.add(orderService.getAmountByOrder(list));
		}
		int shopStatus=shopService.getShopById(id).getStatus();
		model.addAttribute("shopStatus", shopStatus);
		model.addAttribute("orderAmounts", orderAmounts);
		model.addAttribute("pendingOrders", pendingOrders);
		model.addAttribute("id", id);
		return "shop/home.jsp";

	}

	@RequestMapping(value = "/shop/menu", method = RequestMethod.GET)
	public String viewMenu(@RequestParam String id, ModelMap model) {

		List<List<Item>> items = itemService.getItemByCategory(id);
		model.addAttribute("id", id);
		model.addAttribute("items", items);
		return "/shop/menu.jsp";
	}

	@RequestMapping(value = "/shop/updateItem", method = RequestMethod.GET)
	public String updateItem(@RequestParam String id, @RequestParam int iNo, ModelMap map) {
		Item item = itemService.getItemById(iNo);
		map.addAttribute("id", id);
		map.addAttribute("item", item);

		return "/shop/updateItem.jsp";

	}

	@RequestMapping(value = "/shop/updateItemToDB", method = RequestMethod.POST)
	public String updateItemToDB(@RequestParam String id, @RequestParam int iNo, @RequestParam int preparationTime,
			@RequestParam String itemName, @RequestParam int price, ModelMap map) {

		Item item = itemService.getItemById(iNo);
		item.setItemName(itemName.toUpperCase());
		item.setPrice(price);
		item.setPreparationTime(preparationTime);
		List<Item> items = new ArrayList<>();
		items.add(item);
		itemService.updateItems(items);
		map.addAttribute("id", id);

		return "redirect:/shop/menu?id=" + id;

	}

	@RequestMapping(value = "/shop/addItem", method = RequestMethod.GET)
	public String addItem(@RequestParam String id, ModelMap map) {

		map.addAttribute("id", id);

		return "/shop/addItem.jsp";

	}
	@RequestMapping(value = "/shop/addItemToDB", method = RequestMethod.POST)
	public String addItemToDB(@RequestParam String id, @RequestParam int preparationTime, @RequestParam String itemName,
			@RequestParam String category, @RequestParam int quantity, @RequestParam int price, ModelMap map) {
		int numOfItems = itemService.getAllItems().size();

		// System.out.println("number of items is "+ numOfItems);
		// System.out.println(numOfItems+1,itemName+":"+category+":"+quantity+":"+preparationTime+":"+price);
		Item itemTOAdd = new Item(numOfItems + 1, shopService.getShopById(id), category, itemName.toUpperCase(), price,
				quantity, preparationTime, 0, 0);

		itemService.addItem(itemTOAdd);
		map.addAttribute("id", id);

		return "redirect:/shop/menu?id=" + id;

	}
	@RequestMapping(value = "/shop/deleteItem", method = RequestMethod.GET)
	public String deleteItem(@RequestParam String id,@RequestParam int iNo ,ModelMap map) {
		Item item=itemService.getItemById(iNo);
			item.setQuantity(-1);
			List<Item> items=new ArrayList<>();
			items.add(item);
			itemService.updateItems(items);
		map.addAttribute("id", id);

		return "redirect:/shop/menu?id=" + id;

	}



	@RequestMapping(value = "/shop/inventory", method = RequestMethod.GET)
	public String getInventory(@RequestParam String id, ModelMap map) {

		List<List<Item>> items = itemService.getItemByCategory(id);

		map.addAttribute("id", id);
		map.addAttribute("items", items);

		return "/shop/inventory.jsp";

	}

	@RequestMapping(value = "/shop/inventoryUpdate", method = RequestMethod.POST) // changed
																					// 7/8/18
	public String updateItems(@RequestParam String id, @RequestParam Map<?, ?> mapItem, ModelMap map) {
		
		List<Item> items = new ArrayList<>();	
		for (Map.Entry<?, ?> entry : mapItem.entrySet()) {

			Object key = entry.getKey();
			
			Object value = entry.getValue();

			Integer quantity = 0;
			try {
				quantity = Integer.parseInt((String) value);
			} catch (Exception e) {
				quantity = 0;
			}

			if(quantity!=0){
//				System.out.println(key+"   "+quantity);
			Item item = itemService.getItemById(Integer.parseInt((String) key));
			item.setQuantity(quantity);
			//System.out.println(item);
			items.add(item);}

		}

		itemService.updateItems(items);
		map.addAttribute("id", id);
		return "redirect:/shop/inventory?id="+id;

	}

	@RequestMapping(value = "/shop/currentOrders", method = RequestMethod.GET)
	public String viewCurrentOrders(@RequestParam String id, ModelMap model) {
		List<List<Order>> allCurrentOrders = new ArrayList<>();
		allCurrentOrders = orderService.getCurrentOrders(id);
		model.addAttribute("id", id);
		// System.out.println(id);
		// for (List<Order> list : allCurrentOrders) {
		// System.out.println(list);
		// }
		List<Integer> orderAmounts = new ArrayList<>();
		for (List<Order> list : allCurrentOrders) {
			orderAmounts.add(orderService.getAmountByOrder(list));
		}
		model.addAttribute("orderAmounts", orderAmounts);
		model.addAttribute(id);
		model.addAttribute("currentOrders", allCurrentOrders);
		return "/shop/currentOrders.jsp";
	}

	@RequestMapping(value = "/shop/ordersHistory", method = RequestMethod.GET)
	public String viewAllOrders(@RequestParam String id, ModelMap model) {
		List<List<Order>> allOrders = new ArrayList<>();
		allOrders = orderService.getAllByShopId(id);

		List<Integer> orderAmounts = new ArrayList<>();
		for (List<Order> list : allOrders) {
			orderAmounts.add(orderService.getAmountByOrder(list));
		}
		model.addAttribute("id", id);

		model.addAttribute("orderAmounts", orderAmounts);
		model.addAttribute("allOrders", allOrders);
		return "/shop/ordersHistory.jsp";
	}

	@RequestMapping(value = "/shop/reportedOrders", method = RequestMethod.GET)
	public String viewReportedOrders(@RequestParam String id, ModelMap model) {
		List<List<Order>> allreportedOrders = new ArrayList<>();
		allreportedOrders = orderService.getAllByShopIdAndStatus(id, "Reported");
		List<Integer> orderAmounts = new ArrayList<>();

		for (List<Order> list : allreportedOrders) {
			orderAmounts.add(orderService.getAmountByOrder(list));
		}
		model.addAttribute("id", id);
		model.addAttribute("orderAmounts", orderAmounts);
		model.addAttribute("reportedOrders", allreportedOrders);
		return "/shop/reportedOrders.jsp";
	}

	
	@RequestMapping(value = "/shop/acceptOrder", method = RequestMethod.GET)
	public String acceptOrder(@RequestParam String id, @RequestParam String orderId, ModelMap model) {
		
		//List<Order> order=orderService.getOrderByOrderId(orderId);
		orderService.updateOrderStatus(orderId, "Accepted");
		
		model.addAttribute("id", id);
		return "forward:/shop/homeForward";
	}
	
	@RequestMapping(value = "/shop/declineOrder", method = RequestMethod.GET)		//sending mail
	public String declineOrder(@RequestParam String id, @RequestParam String orderId, ModelMap model) {
		orderService.updateOrderStatus(orderId, "Declined");
		List<Order> orderItems = orderService.getOrderByOrderId(orderId);
		String recipientMailId = orderItems.get(0).getaId().getEmail();
		
		ThreadPoolExecutor executor = new ThreadPoolExecutor(10, 10, 1, TimeUnit.SECONDS, new LinkedBlockingQueue<Runnable>());
		executor.execute(new Runnable(){
			@Override
			public void run(){
				//System.out.println("in thread");
				orderService.sendOrderCompletedEmail(recipientMailId, orderId, orderItems);

			}

		});
		model.addAttribute("id", id);
		orderService.updateItemQuantityOnCancel(orderItems);
		return "redirect:/shop/homeForward?id=" + id;

	}
	@RequestMapping(value = "/shop/itkOrder", method = RequestMethod.GET)
	public String itkOrder(@RequestParam String id, @RequestParam String orderId, ModelMap model) {
		orderService.updateOrderStatus(orderId, "In The Kitchen");
		model.addAttribute("id", id);
		return "forward:/shop/homeForward";

	}
	@RequestMapping(value = "/shop/reportOrder", method = RequestMethod.GET)		//sending mail
	public String reportOrder(@RequestParam String id, @RequestParam String orderId, ModelMap model) {
		orderService.updateOrderStatus(orderId, "Reported");
		List<Order> orderItems = orderService.getOrderByOrderId(orderId);
		String recipientMailId = orderItems.get(0).getaId().getEmail();
		
		ThreadPoolExecutor executor = new ThreadPoolExecutor(10, 10, 1, TimeUnit.SECONDS, new LinkedBlockingQueue<Runnable>());
		executor.execute(new Runnable(){
			@Override
			public void run(){
				//System.out.println("in thread");
				orderService.sendOrderCompletedEmail(recipientMailId, orderId, orderItems);

			}

		});
		model.addAttribute("id", id);
		return "redirect:/shop/currentOrders?id=" + id;

	}
	@RequestMapping(value = "/shop/completeOrder", method = RequestMethod.GET)
	public String completeOrder(@RequestParam String id, @RequestParam String orderId, ModelMap model) {
		orderService.updateOrderStatus(orderId, "Completed");
		List<Order> orderItems = orderService.getOrderByOrderId(orderId);
		String recipientMailId = orderItems.get(0).getaId().getEmail();
		
		ThreadPoolExecutor executor = new ThreadPoolExecutor(10, 10, 1, TimeUnit.SECONDS, new LinkedBlockingQueue<Runnable>());
		executor.execute(new Runnable(){
			@Override
			public void run(){
				//System.out.println("in thread");
				orderService.sendOrderCompletedEmail(recipientMailId, orderId, orderItems);

			}

		});
		model.addAttribute("id", id);
		return "redirect:/shop/currentOrders?id=" + id;

	}
	@RequestMapping(value = "/shop/deliverOrder", method = RequestMethod.GET)
	public String deliverOrder(@RequestParam String id, @RequestParam String orderId, ModelMap model) {
		orderService.updateOrderStatus(orderId, "Delivered");
		model.addAttribute("id", id);
		return "forward:/shop/currentOrders";

	}
	@RequestMapping(value = "/shop/unreportOrder", method = RequestMethod.GET)
	public String unreportOrder(@RequestParam String id, @RequestParam String orderId, ModelMap model) {
		orderService.updateOrderStatus(orderId, "Delivered");
		model.addAttribute("id", id);
		return "forward:/shop/reportedOrders";

	}
	@RequestMapping(value = "/shop/toggleStatus", method = RequestMethod.GET)
	public String toggleStatus(@RequestParam String id,  ModelMap model) {
		
		shopService.updateStatusByShopId(id);
		model.addAttribute("id", id);
		return "redirect:/shop/homeForward?id="+id;

	}
	
	@RequestMapping(value = "/shop/logout", method = RequestMethod.GET)
public String logout() {

		return "redirect:/";
	}
}
