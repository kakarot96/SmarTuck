package com.fil.SmarTuck.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fil.SmarTuck.models.Categories;
import com.fil.SmarTuck.models.Item;
import com.fil.SmarTuck.models.ItemRepository;
import com.fil.SmarTuck.models.Shop;
import com.fil.SmarTuck.models.ShopRepository;

@Service

public class ItemServiceImplementation implements ItemService{
	@Autowired 
	private ItemRepository itemRepository;
	@Autowired
	private ShopRepository shopRepository;
	
	

	public List<Item> getAllItems() {


		List<Item> itemList=new ArrayList<Item>();
		itemRepository.findAll().forEach(i->itemList.add(i));
		return itemList;

	}


	@Override
	public Item getItemById(int id) {

		return itemRepository.findById(id).get();
	}
	
	


	public List<List<Item>> getAvailableItems(String shopId){

		List<List<Item>> tempAvailableItems =new ArrayList<>();
		tempAvailableItems=getItemByCategory(shopId);
		
		List<List<Item>>  availableItems=new ArrayList<>();
		
		
		for (List<Item> list : tempAvailableItems) {
			List<Item> items =new ArrayList<>();
			for (Item item : list) {
				if(item.getQuantity()>0)items.add(item);
			}
			availableItems.add(items);
			
		}
		
		return availableItems;

	}
	
	
	
	public List<List<Item>> getItemByCategory(String shopId){
		
		
		
		
		List<List<Item>> itemListByCategory=new ArrayList<List<Item>>();
		List<Item> tempList=new ArrayList<>();
		String[] catogories=Categories.categories;
		for (String catogory : catogories) {
			tempList= getAllByShopIdAndCategory(shopId, catogory);
			itemListByCategory.add(tempList);
		}
	return itemListByCategory;
}
	

	@Override
	public List<Item> getAllByShopId(String shopId) {
		// TODO Auto-generated method stub
		List<Item> items=new ArrayList<>();
		Shop shop=shopRepository.findByShopId(shopId);
		items=itemRepository.findAllByShop(shop);
		return items; 
	}

	@Override
	public List<Item> getAllByShopIdAndCategory(String shopId, String category) {
		// TODO Auto-generated method stub
		Shop shop=shopRepository.findByShopId(shopId);
		List<Item> items=new ArrayList<>();
		List<Item> tempItems= itemRepository.findAllByShopAndCategory(shop, category);
		for (Item item : tempItems) {
			if(item.getQuantity()>=0)items.add(item);
		}
		return items;
		
		
	}


	@Override
	public List<String> getAllCategories(String shopId) {
		List<String> categories=new ArrayList<>();
		categories= itemRepository.findByCategory();
		return categories;
	}
	
	
	
	
	
	
	
	
	
	@Override
	public void addItem(Item item) {

		itemRepository.save(item);

	}

	public void deleteItem(int id) {

		itemRepository.deleteById(id);
	}




	@Override
	public void updateItems(List<Item> items) {
		// TODO Auto-generated method stub
		itemRepository.saveAll(items);
	}


		
}




