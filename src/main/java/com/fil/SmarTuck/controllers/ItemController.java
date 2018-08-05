package com.fil.SmarTuck.controllers;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
    
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    
    
//    @RequestMapping(value = "/shop/menu", method = RequestMethod.GET)  
//    public ModelAndView getAllItems(@RequestParam String id,@RequestParam String shopId){  
//    	
//    	logger.debug("Debug message");
//        logger.info("Info message");
//        logger.warn("Warn message");
//        logger.error("Error message");
//    	
//    	
//    	ModelAndView modelAndView=new ModelAndView();
//    	modelAndView.addObject(shopId);
//    	List<List<Item>> items=itemService.getItemByCategory(shopId);
//    	modelAndView.addObject("items",items);
//    	modelAndView.setViewName("/shop/menu.jsp");
//    	return modelAndView;
//        
//    }  
    
//    @RequestMapping(value = "/shop/inventory", method = RequestMethod.GET)  
//    public ModelAndView getInventory(@RequestParam String id,@RequestParam String shopId){  
//    	ModelAndView modelAndView=new ModelAndView();
//    	modelAndView.addObject(shopId);
//    	List<Item> items=itemService.getAllByShopId(id);
//    	modelAndView.addObject("items",items);
//    	modelAndView.setViewName("/shop/inventory.jsp");
//    	return modelAndView;
//        
//    } 
//    
//    @RequestMapping(value = "/shop/update", method = RequestMethod.GET)  
//    public ModelAndView updateItems(@RequestParam String id,@RequestParam String shopId,@RequestParam List<Item> items){  
//    	
//    	itemService.updateItems(items);
//    	ModelAndView modelAndView=new ModelAndView();
//    	modelAndView.addObject(shopId);
//    	modelAndView.setViewName("/shop/inventory.jsp");
//    	return modelAndView;
//        
//    } 

    
}  
