package com.fil.SmarTuck.services;

import java.util.List;
import com.fil.SmarTuck.models.Item;

public interface ItemService {

	public List<Item> getAllItems();

	public Item getItemById(int id);

	public void addItem(Item item);

	public void deleteItem(int id);

	public List<Item> getAllByShopId(String shopId);

	public List<List<Item>> getItemByCategory(String shopId);

	public List<Item> getAvailableItems(String shopId);

	public void updateItems(List<Item> items);
	
	public List<Item> getAllByShopIdAndCategory(String shopId,String category);
	
	public List<String> getAllCategories(String shopId);

}
