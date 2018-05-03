package com.wy.dao;

import com.wy.pojo.Product;

public interface ProductMapper {
	
	public Product findProductByPid(int pid);
	
	public Product findProductByPidForBuyer(String username, int pid);
	
	public void deleteProduct(int id);
	
	public Product getProductByPid(int pid);
	
	public int getProductNums();
	
	public void insertProduct(Product product);
	
	public void updateProduct(Product product);
}
