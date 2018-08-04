package com.fil.SmarTuck.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	@Override
	public void addItem(Item item) {

		itemRepository.save(item);

	}

	public void deleteItem(int id) {

		itemRepository.deleteById(id);
	}




	public List<Item> getAvailableItems(String shopId){

		List<Item> availableItems =new ArrayList<Item>();
		List<Item> tempAvailableItems =new ArrayList<Item>();
		tempAvailableItems=getAllByShopId(shopId);
		
		for (Item item : tempAvailableItems) {
			if(item.getQuantity()>0)availableItems.add(item);
		}
		return availableItems;

	}
	public List<List<Item>> getItemByCategory(String shopId){
		
		
		
		
		List<List<Item>> itemListByCategory=new ArrayList<List<Item>>();
		List<Item> tempList=new ArrayList<>();
		tempList=getAvailableItems(shopId);
		List<Item> Category1=new ArrayList<>();
		List<Item> Category2=new ArrayList<>();
		List<Item> Category3=new ArrayList<>();
		List<Item> Category4=new ArrayList<>();
		List<Item> Category5=new ArrayList<>();
		List<Item> Category6=new ArrayList<>();
		List<Item> Category7=new ArrayList<>();
		List<Item> Category8=new ArrayList<>();
		List<Item> Category9=new ArrayList<>();
		List<Item> Category10=new ArrayList<>();
		List<Item> Category11=new ArrayList<>();
		List<Item> Category12=new ArrayList<>();
		List<Item> Category13=new ArrayList<>();
		List<Item> Category14=new ArrayList<>();

		for(int i =0;i<tempList.size();i++){
			if(tempList.get(i).getCategory().equals("Hot Beverages")){
				Category1.add(tempList.get(i));
			}
			else if(tempList.get(i).getCategory().equals("Smoothies"))
			{
				Category2.add(tempList.get(i));
			}
			else if(tempList.get(i).getCategory().equals("Chiller"))
			{
				Category3.add(tempList.get(i));
			}
			else if(tempList.get(i).getCategory().equals("Mojito"))
			{
				Category4.add(tempList.get(i));
			}
			else if(tempList.get(i).getCategory().equals("Sandwiches"))
			{
				Category5.add(tempList.get(i));
			}
			else if(tempList.get(i).getCategory().equals("Burger"))
			{
				Category6.add(tempList.get(i));
			}
			else if(tempList.get(i).getCategory().equals("Subs"))
			{
				Category7.add(tempList.get(i));
			}
			else if(tempList.get(i).getCategory().equals("Pasta"))
			{
				Category8.add(tempList.get(i));
			}
			else if(tempList.get(i).getCategory().equals("Salad"))
			{
				Category9.add(tempList.get(i));
			}
			else if(tempList.get(i).getCategory().equals("Jiffy Snacks"))
			{
				Category10.add(tempList.get(i));
			}
			else if(tempList.get(i).getCategory().equals("Pizza"))
			{
				Category11.add(tempList.get(i));
			}
			else if(tempList.get(i).getCategory().equals("The Juice Bucket"))
			{
				Category12.add(tempList.get(i));
			}
			else if(tempList.get(i).getCategory().equals("Desserts"))
			{
				Category13.add(tempList.get(i));
			}
			else if(tempList.get(i).getCategory().equals("Milk Shake"))
			{
				Category14.add(tempList.get(i));
			}
			
			itemListByCategory.add(Category1);
			itemListByCategory.add(Category2);
			itemListByCategory.add(Category3);
			itemListByCategory.add(Category4);
			itemListByCategory.add(Category5);
			itemListByCategory.add(Category6);
			itemListByCategory.add(Category7);
			itemListByCategory.add(Category8);
			itemListByCategory.add(Category9);
			itemListByCategory.add(Category10);
			itemListByCategory.add(Category11);
			itemListByCategory.add(Category12);
			itemListByCategory.add(Category13);
			itemListByCategory.add(Category14);
			
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
	public void updateItems(List<Item> items) {
		// TODO Auto-generated method stub
		itemRepository.saveAll(items);
	}


	@Override
	public List<Item> getAllByShopIdAndCategory(String shopId, String category) {
		// TODO Auto-generated method stub
		Shop shop=shopRepository.findByShopId(shopId);
		List<Item> items= itemRepository.findAllByShopAndCategory(shop, category);
		return items;
		
		
	}


	@Override
	public List<String> getAllCategories(String shopId) {
		// TODO Auto-generated method stub
		//Shop shop=shopRepository.findByShopId(shopId);
		List<String> categories=new ArrayList<>();
		categories= itemRepository.findByCategory();
//		for (Item item : items) {
//			categories.add(item.getCategory());
//		}
		
		
		return categories;
	}	
}




