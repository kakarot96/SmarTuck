package com.fil.SmarTuck.services;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.fil.SmarTuck.models.Item;
import com.fil.SmarTuck.models.ItemRepository;
import com.fil.SmarTuck.models.Order;
import com.fil.SmarTuck.models.OrderRepository;

@Service
public class OrderServiceImplementation implements OrderService {

	@Autowired
	private OrderRepository orderRepository;
	@Autowired
	private ItemRepository itemRepository;
	@Autowired
	private JavaMailSender sender;

	List<Order> orderRecords;
	List<Order> tempOrders;
	List<List<Order>> order;

	@Override
	public List<List<Order>> getAllOrders() {
		List<Order> orderRecords = new ArrayList<>();
		List<Order> tempOrders = new ArrayList<>();
		List<List<Order>> order = new ArrayList<>();
		List<List<Order>> reverseList=new ArrayList<>();

		orderRepository.findAll().forEach(o -> orderRecords.add(o)); // lambda
																		// expression
		int size = orderRecords.size();
		for (int i = 0; i < size; i++) {

			if (i == size - 1) {
				tempOrders.add(orderRecords.get(i));
				order.add(tempOrders);
			} else {

				if (orderRecords.get(i).getOrderId().equals(orderRecords.get(i + 1).getOrderId())) {
					tempOrders.add(orderRecords.get(i));
				} else {
					tempOrders.add(orderRecords.get(i));
					order.add(tempOrders);
					tempOrders = new ArrayList<>();
				}
			}
		}
		
		for(int i=order.size()-1;i>=0;i--)
		{
			reverseList.add(order.get(i));
		}
		
		
		return reverseList;
	}

	@Override
	public List<List<Order>> getAllByShopId(String shopId) {

		List<List<Order>> allOrders = new ArrayList<>();
		allOrders = getAllOrders();
		List<List<Order>> shopAllOrders = new ArrayList<>();

		for (List<Order> order : allOrders) {
			if (order.get(0).getiNo().getShop().getShopId().equals(shopId)) {
				shopAllOrders.add(order);
			}
		}
		return shopAllOrders;
	}

	@Override
	public List<Order> getOrderByOrderId(String orderId) {

		return orderRepository.findAllByOrderId(orderId);
	}

	@Override
	public void addOrder(List<Order> o) { // order can come in multiple rows
		orderRepository.saveAll(o);
	}

	@Override
	public void updateOrderRatingUsingList(List<Order> list, ArrayList<Integer> ratingList) {
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setRating(ratingList.get(i));
		}
	}

	@Override
	public List<List<Order>> getAllByShopIdAndStatus(String shopId, String status) {

		List<List<Order>> allOrders = new ArrayList<>();
		allOrders = getAllByShopId(shopId);

		List<List<Order>> shopAllOrders = new ArrayList<>();

		for (List<Order> order : allOrders) {
			if (order.get(0).getStatus().equals(status)) {
				shopAllOrders.add(order);
			}
		}
		return shopAllOrders;

	}

	@Override
	public int getAmountByOrderId(String orderId) {
		List<Order> allOrders = getOrderByOrderId(orderId);
		int amount = 0;
		for (Order o : allOrders) {
			amount += o.getPrice() * o.getQty();
		}
		return amount;
	}

	@Override
	public List<List<Order>> getAllByAId(String aId) {
		List<List<Order>> allOrders = new ArrayList<>();
		allOrders = getAllOrders();
		List<List<Order>> employeeAllOrders = new ArrayList<>();

		for (List<Order> order : allOrders) {
			if (order.get(0).getaId().getaId().equals(aId)) {
				employeeAllOrders.add(order);
			}
		}
		return employeeAllOrders;
	}

	@Override
	public String getOrderId(String aId, Date orderDate, Time orderTime) {
		// TODO Auto-generated method stub
		String[] date = orderDate.toString().split("-");
		String[] time = orderTime.toString().split(":");
		return aId + "-" + date[0] + date[1] + date[2] + "-" + time[0] + time[1] + time[2];
	}

	@Override
	public List<String> checkItemQuantity(List<Order> order) {
		List<String> unavailableItems = new ArrayList<>();

		for (Order o : order) {
			if (o.getiNo().getQuantity() - o.getQty() < 0) {

				unavailableItems.add(o.getiNo().getItemName());

			}

		}
		return unavailableItems;
	}

	@Override
	public List<List<Order>> getCurrentOrders(String id) {
		List<List<Order>> allOrders = new ArrayList<>();

		allOrders = getAllByShopId(id);

		List<List<Order>> currentOrders = new ArrayList<>();

		for (List<Order> order : allOrders) {
			if (order.get(0).getStatus().equalsIgnoreCase("In The Kitchen")
					|| order.get(0).getStatus().equalsIgnoreCase("Completed")) {
				currentOrders.add(order);
			}
		}
		return currentOrders;

	}

	@Override
	public List<List<Order>> getPendingOrders(String id) {
		List<List<Order>> allOrders = new ArrayList<>();

		allOrders = getAllByShopId(id);

		List<List<Order>> pendingOrders = new ArrayList<>();

		for (List<Order> order : allOrders) {
			if (order.get(0).getStatus().equalsIgnoreCase("Pending")
					|| order.get(0).getStatus().equalsIgnoreCase("Accepted")) {
				pendingOrders.add(order);
			}
		}
		return pendingOrders;

	}

	@Override
	public void updateItemQuantity(List<Order> order) { // added 7/8/2018

		Item item = new Item();

		for (Order o : order) {
			item = o.getiNo();
			item.setQuantity(item.getQuantity() - o.getQty());
			//item.setCounter(item.getCounter() + o.getQty());
			itemRepository.save(item);
		}
	}

	@Override
	public int getAmountByOrder(List<Order> orders) {
		int amount = 0;
		for (Order order : orders) {
			amount += order.getQty() * order.getiNo().getPrice();
		}
		return amount;
	}

	@Override
	public void updateRemarks(List<Order> order, String remarks) {
		for (Order order2 : order) {
			order2.setRemarks(remarks);
		}
		orderRepository.saveAll(order);
	}

	@Override
	public void updateOrderDate(List<Order> order, Date orderDate) {
		for (Order order2 : order) {
			order2.setOrderDate(orderDate);
		}
		orderRepository.saveAll(order);
	}

	@Override
	public void updateOrderTime(List<Order> order, Time orderTime) {
		for (Order order2 : order) {
			order2.setOrderTime(orderTime);
		}
		orderRepository.saveAll(order);
	}

	@Override
	public void updateOrderId(List<Order> order, String orderId) {
		for (Order order2 : order) {
			order2.setOrderId(orderId);
		}
		orderRepository.saveAll(order);
	}

	@Override
	public void updateOrderStatus(String orderId, String status) {
		List<Order> list = orderRepository.findAllByOrderId(orderId);
		for (Order o : list) {
			o.setStatus(status);
		}
		orderRepository.saveAll(list);
	}

	@Override
	public void updateOrderDeliveryTime(String orderId, Time deliveryTime) {
		List<Order> list = orderRepository.findAllByOrderId(orderId);
		for (Order o : list) {
			o.setDeliveryTime(deliveryTime);
		}
		orderRepository.saveAll(list);
	}

	@Override
	public void updateOrderRating(List<Order> list) {
		orderRepository.saveAll(list);
	}

	@Override
	public void sendOrderCompletedEmail(String recipientMailId, String orderId, List<Order> orderItems) {
		// TODO Auto-generated method stub
		MimeMessage message = sender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);
        String orderStatus = orderItems.get(0).getStatus();
        StringBuilder str = new StringBuilder();
        for (Order item : orderItems) {
			str = str.append("\n" + item.getiNo().getItemName());
		}
        try {
            helper.setTo(recipientMailId);
            if(orderStatus.equals("Completed")){
            	helper.setText("Greetings!!! \nYour Order with Order Id: " + orderId + " having items:" + str + "\nhas been " + orderStatus + " by the Shop Vendor.\nPlease visit shop to receive your order.");
            }
            else if(orderStatus.equals("Reported")){
            	helper.setText("Your Order with Order Id: " + orderId + " having items:" + str + "\nhas been " + orderStatus + " by the Shop Vendor.\nYou won't be able to order again until you pay for this order.\nVisit the shop to settle these dues to order online again.");
            }
            else if(orderStatus.equals("Declined")){
            	helper.setText("Your Order with Order Id: " + orderId + " having items:" + str + "\nhas been " + orderStatus + " by the Shop Vendor.\n\nSorry for the inconvenience caused.\nYou can reorder this by visiting order by visiting My orders or you can place a new order all again.");
            }
            helper.setSubject(orderId);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        sender.send(message);
	}
	@Override
	public void updateItemQuantityOnCancel(List<Order> order) {
		// TODO Auto-generated method stub
		Item item = new Item();

		for (Order o : order) {
			item = o.getiNo();
			item.setQuantity(item.getQuantity() + o.getQty());
			//item.setCounter(item.getCounter() + o.getQty());
			itemRepository.save(item);
		}
	}
	
	
	
}
