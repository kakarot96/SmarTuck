package com.fil.SmarTuck.models;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends CrudRepository<Order, String>{

	public List<Order> findAllByOrderId(String orderId);
	
}
