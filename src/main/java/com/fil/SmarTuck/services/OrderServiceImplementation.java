package com.fil.SmarTuck.services;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fil.SmarTuck.models.Order;
import com.fil.SmarTuck.models.OrderRepository;

@Service
public class OrderServiceImplementation implements OrderService {

	@Autowired
	private OrderRepository orderRepository;

	List<Order> orderRecords;
	List<Order> tempOrders;
	List<List<Order>> order;

	@Override
	public List<List<Order>> getAllOrders() {
		orderRecords = new ArrayList<>();
		tempOrders = new ArrayList<>();
		order = new ArrayList<>();
		orderRepository.findAll().forEach(o -> orderRecords.add(o)); // lambda
																		// expression

		int size = orderRecords.size();
		for (int i = 0; i < size; i++) {

			if (i == orderRecords.size() - 1) {
				tempOrders = new ArrayList<>();
				tempOrders.add(orderRecords.get(i));
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
		return order;
	}

	@Override
	public List<List<Order>> getAllByShopId(String shopId) {
		// TODO Auto-generated method stub
		List<List<Order>> allOrders = new ArrayList<>();
		allOrders = getAllOrders();

		List<List<Order>> shopAllOrders = new ArrayList<>();

		for (List<Order> order : allOrders) {
			if (order.get(0).getiNo().getShop().getShopId() == shopId) {
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
	public void updateOrderStatus(String orderId, String status) {
		List<Order> list = orderRepository.findAllByOrderId(orderId);
		for (Order o : list) {
			o.setStatus(status);
		}
		orderRepository.saveAll(list);
	}

	@Override
	public void updateOrderDeliveryTime(String orderId, Time deliveryTime) {
		// TODO Auto-generated method stub
		List<Order> list = orderRepository.findAllByOrderId(orderId);
		for (Order o : list) {
			o.setDeliveryTime(deliveryTime);
		}
		orderRepository.saveAll(list);
	}

	@Override
	public void updateOrderRating(List<Order> list) {
		// TODO Auto-generated method stub
		orderRepository.saveAll(list);
	}

	@Override
	public void updateOrderRatingUsingList(List<Order> list, ArrayList<Integer> ratingList) {
		// TODO Auto-generated method stub
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setRating(ratingList.get(i));
		}
	}

	@Override
	public List<List<Order>> getAllByShopIdAndStatus(String shopId, String status) {
		// TODO Auto-generated method stub

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
		// TODO Auto-generated method stub
		List<Order> allOrders = getOrderByOrderId(orderId);
		int amount = 0;
		for (Order o : allOrders) {
			amount += o.getPrice() * o.getQty();
		}
		return amount;
	}

	@Override
	public List<List<Order>> getAllByAId(String aId) {
		// TODO Auto-generated method stub
		orderRecords = new ArrayList<>();
		tempOrders = new ArrayList<>();
		order = new ArrayList<>();

		orderRepository.findAllByAId(aId).forEach(o -> orderRecords.add(o)); // lambda
																				// expression
		int size = orderRecords.size();
		for (int i = 0; i < size; i++) {

			if (i == orderRecords.size() - 1) {
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
		return order;
	}

	@Override
	public String getOrderId(String aId, Date orderDate, Time orderTime) {
		// TODO Auto-generated method stub
		return aId + orderDate.toString() + orderTime.toString();
	}

	@Override
	public String checkItemQuantity(List<Order> order) {
		// TODO Auto-generated method stub
		String str = "Following Items are not in sufficient quantity \n";
		for (Order o : order) {
			if (o.getQty() - o.getiNo().getQuantity() < 0)
				str += o.getiNo().getItemName() + "\n";

		}

		return str;
	}

	@Override
	public void updateOrderTime(List<Order> order, Time orderTime) {
		// TODO Auto-generated method stub
		for (Order order2 : order) {
			order2.setOrderTime(orderTime);
		}
		orderRepository.saveAll(order);
	}

	@Override
	public void updateOrderId(List<Order> order, String orderId) {
		// TODO Auto-generated method stub
		for (Order order2 : order) {
			order2.setOrderId(orderId);
		}
		orderRepository.saveAll(order);
	}

	@Override
	public void updateRemarks(List<Order> order, String remarks) {
		// TODO Auto-generated method stub
		for (Order order2 : order) {
			order2.setRemarks(remarks);
		}
		orderRepository.saveAll(order);
	}

	public void updateOrderDate(List<Order> order, Date orderDate) {
		// TODO Auto-generated method stub
		for (Order order2 : order) {
			order2.setOrderDate(orderDate);
		}
		orderRepository.saveAll(order);
	}

	@Override
	public List<List<Order>> getCurrentOrders(String id) {
		// TODO Auto-generated method stub
		List<List<Order>> allOrders = new ArrayList<>();
		allOrders = getAllByShopId(id);

		List<List<Order>> currentOrders = new ArrayList<>();

		for (List<Order> order : allOrders) {
			if (order.get(0).getStatus().equals("In the Kitchen") || order.get(0).getStatus().equals("Prepared")) {
				currentOrders.add(order);
			}
		}
		return currentOrders;

	}

}
