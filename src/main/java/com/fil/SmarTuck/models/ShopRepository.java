package com.fil.SmarTuck.models;

import org.springframework.data.repository.CrudRepository;


import com.fil.SmarTuck.models.Shop;  

public interface ShopRepository extends CrudRepository<Shop, Integer>  
{  
	public Shop findByShopId(String shopId);
}  
