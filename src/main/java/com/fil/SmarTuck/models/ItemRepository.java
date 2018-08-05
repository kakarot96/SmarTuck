package com.fil.SmarTuck.models;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fil.SmarTuck.models.Item;

@Repository
public interface ItemRepository extends CrudRepository<Item, Integer> {
	public List<Item> findAllByShop(Shop shop);

	public List<Item> findAllByShopAndCategory(Shop shop, String category);

	@Query("select distinct category from Item where shop_id='S111111'")
	public List<String> findByCategory();
}
