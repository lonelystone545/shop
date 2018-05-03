package com.wy.service;

import java.util.List;

import com.wy.pojo.Product;

public interface ProductService {
	
	/**
	 * 查询所有商品
	 * @return
	 */
	public List<Product> getAllProducts();
	
	/**
	 * 查询买家商品
	 * @return
	 */
	public List<Product> getProductsForBuyer(String username);
	
	/**
	 * 查询买家未购买的商品
	 * @param username
	 * @return
	 */
	public List<Product> getUnboughtProducts(String username);
	
	/**
	 * 查询商品的详细内容
	 * @param pid
	 * @return
	 */
	public Product findProductByPid(int pid);
	
	/**
	 * 买家登录后，查询商品详细内容
	 * @param username
	 * @param pid
	 * @return
	 */
	public Product findProductByPidForBuyer(String username, int pid);
	
	/**
	 * 查询卖家商品
	 * @param username
	 * @return
	 */
	public List<Product> getProductsForSeller(String username);
	
	/**
	 * 根据pid查询商品
	 * @param id
	 * @return
	 */
	public Product getProductByPid(int pid);
	
	/**
	 * 删除商品
	 * @param id
	 */
	public void deleteProduct(int id);
	
	/**
	 * 验证商品
	 * @param p
	 * @return
	 */
	public String validateProduct(Product p);
	
	public int insertProduct(Product product);
	
	public void updateProduct(Product product);
	
}
