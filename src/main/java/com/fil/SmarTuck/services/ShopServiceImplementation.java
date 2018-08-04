package com.fil.SmarTuck.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fil.SmarTuck.models.Employee;
import com.fil.SmarTuck.models.Item;
import com.fil.SmarTuck.models.Shop;
import com.fil.SmarTuck.models.ShopRepository;

@Service
public class ShopServiceImplementation implements ShopService {
	@Autowired
	private ShopRepository shopRepository;

	@Override
	public List<Shop> getAllShops() {
		// TODO Auto-generated method stub
		List<Shop> shops = new ArrayList<>();
		shopRepository.findAll().forEach(shop -> shops.add(shop));

		return shops;
	}

	@Override
	public Shop getShopById(String shopId) {
		// TODO Auto-generated method stub

		return shopRepository.findByShopId(shopId);
	}

	@Override
	public Boolean validateShop(String shopId, String password) {
		// TODO Auto-generated method stub
		try {
			Shop shop = getShopById(shopId);
			if (shop.getPassword().equals(password))
				return true;
		} catch (Exception e) {
			e.printStackTrace();

		}
		return false;

	}

	@Override
	public List<Item> getItemsByShopId(String shopId) {
		// TODO Auto-generated method stub
		List<Item> items = new ArrayList<>();
		items = shopRepository.findByShopId(shopId).getItems();
		return items;
	}

	@Override
	public void updateStatus(String shopId, int status) {
		// TODO Auto-generated method stub
		Shop shop=getShopById(shopId);
		shop.setStatus(status);
		shopRepository.save(shop);
	}

}
