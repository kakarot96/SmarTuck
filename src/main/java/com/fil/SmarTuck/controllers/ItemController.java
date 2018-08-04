package com.fil.SmarTuck.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;  
import org.springframework.web.bind.annotation.RequestBody;  
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fil.SmarTuck.models.Employee;
import com.fil.SmarTuck.models.Item;
import com.fil.SmarTuck.models.ItemRepository;
import com.fil.SmarTuck.models.Shop;
import com.fil.SmarTuck.services.ItemService;

import java.util.ArrayList;
import java.util.List;  
import java.util.Optional;  

@Controller  
public class ItemController {  
    @Autowired  
    private ItemService itemService; 
    
    
    @RequestMapping(value = "/shop/menu", method = RequestMethod.GET)  
    public ModelAndView getAllItems(@RequestParam String id){  
    	ModelAndView modelAndView=new ModelAndView();
    	List<Item> items=new ArrayList<>();
    	items= itemService.getAllByShopId(id);
    	for (Item item : items) {
			System.out.println(item.toString());
		}
    	
    	List<String> cat=new ArrayList<>();
    	cat=itemService.getAllCategories(id);
    	
    	System.out.println("categories will be printed");
    	
    	for (String string : cat) {
			System.out.println(string);
		}
    	
    	modelAndView.addObject(items);
    	modelAndView.setViewName("/shop/menu.jsp");
    	return modelAndView;
        
    }  
    
    
//    @RequestMapping("/item/{id}")  
//    public List<Item> getAllItem(@PathVariable(value="id") String id){  
//    	System.out.println(id);
//        return itemService.getAllByShopId(id);  //
//       
//        
//    }     
//    @RequestMapping(value="/add-item", method=RequestMethod.POST)  
//    public void addItem(@RequestBody Item item){  
//        itemService.addItem(item);  
//    }  
//    @RequestMapping(value="/item", method=RequestMethod.GET)  
//    public Optional<Item> getItem(@PathVariable int id){  
//        return itemService.getItemById(id);  
//    }  
//    @RequestMapping(value="/category-item", method=RequestMethod.POST)  
//    public List<List<Item>>getItemByCategory(@RequestBody String shopId ){  
//         
//    	return itemService.getItemByCategory(shopId);
//    }
    
    
    
    
//   @RequestMapping(value="/category-item/{shopId}", method=RequestMethod.GET)  
//  public List<List<Item>>getItemByCategory(@PathVariable(value="shopId") Shop shop ){  
//       
//  	return itemService.getItemByCategory(shop);
//  }
    
}  
