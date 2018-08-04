package com.fil.SmarTuck.services;

import java.util.List;

import com.fil.SmarTuck.models.Item;
import com.fil.SmarTuck.models.Shop;

public interface ShopService {

	public List<Shop> getAllShops();

	public Shop getShopById(String shopId);

	public Boolean validateShop(String shopId, String password);
	
	public List<Item> getItemsByShopId(String shopId);
	
	public void updateStatus(String shopId,int status);
}
