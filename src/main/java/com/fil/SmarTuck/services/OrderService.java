package com.fil.SmarTuck.services;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import com.fil.SmarTuck.models.Order;

public interface OrderService {

	public List<List<Order>> getAllOrders();

	public List<Order> getOrderByOrderId(String orderId);

	public List<List<Order>> getAllByShopId(String shopId);

	public List<List<Order>> getAllByShopIdAndStatus(String shopId, String status);

	public List<List<Order>> getCurrentOrders(String aId);

	public List<List<Order>> getAllByAId(String aId);

	public int getAmountByOrderId(String orderId);
	
	public int getAmountByOrder(List<Order> orders);

	public String getOrderId(String aId, Date orderDate, Time orderTime);

	public List<String> checkItemQuantity(List<Order> order);
	public void updateItemQuantity(List<Order> order);

	public void addOrder(List<Order> o);

	public void updateOrderStatus(String orderId, String status);

	public void updateOrderDeliveryTime(String orderId, Time deliveryTime);

	public void updateOrderRating(List<Order> list);

	public void updateOrderRatingUsingList(List<Order> list, ArrayList<Integer> ratingList);

	void updateOrderId(List<Order> order, String orderId);

	void updateRemarks(List<Order> order, String remarks);

	void updateOrderTime(List<Order> order, Time orderTime);

	void updateOrderDate(List<Order> order, Date orderDate);

	List<List<Order>> getPendingOrders(String id);
	
	void sendOrderCompletedEmail(String recipientMailId, String orderId, List<Order> orderItems);

	void updateItemQuantityOnCancel(List<Order> order);

}
