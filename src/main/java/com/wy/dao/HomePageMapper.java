package com.wy.dao;

import java.util.List;

import com.wy.pojo.Product;

public interface HomePageMapper {
	
	public List<Product> getAllProducts();
	
	public List<Product> getProductsForBuyer(String username);
	
	public List<Product> getUnboughtProducts(String username);
	
	public List<Product> getProductsForSeller(String username);
	
}
