package com.wy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wy.dao.HomePageMapper;
import com.wy.dao.ProductMapper;
import com.wy.pojo.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private HomePageMapper homePageMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public List<Product> getAllProducts() {
		// TODO Auto-generated method stub
		return homePageMapper.getAllProducts() ;
	}
	
	@Override
	public List<Product> getProductsForBuyer(String username) {
		// TODO Auto-generated method stub
		return homePageMapper.getProductsForBuyer(username);
	}
	
	@Override
	public List<Product> getProductsForSeller(String username) {
		// TODO Auto-generated method stub
		return homePageMapper.getProductsForSeller(username);
	}
	
	@Override
	public List<Product> getUnboughtProducts(String username) {
		// TODO Auto-generated method stub
		return homePageMapper.getUnboughtProducts(username);
	}

	@Override
	public Product findProductByPid(int pid) {
		// TODO Auto-generated method stub
		return productMapper.findProductByPid(pid);
	}

	@Override
	public Product findProductByPidForBuyer(String username, int pid) {
		// TODO Auto-generated method stub
		return productMapper.findProductByPidForBuyer(username, pid);
	}

	@Override
	public void deleteProduct(int id) {
		// TODO Auto-generated method stub
		productMapper.deleteProduct(id);
	}

	@Override
	public Product getProductByPid(int pid) {
		// TODO Auto-generated method stub
		return productMapper.getProductByPid(pid);
	}

	@Override
	public String validateProduct(Product p) {
		
		if(p == null) {
			return "商品不能为空!";
		} else if(p.getPname() == null || p.getPname().length()<2 || p.getPname().length()>80) {
			return "标题长度不符合要求";
		} else if(p.getSummary() == null || p.getSummary().length()<2 || p.getSummary().length() > 140) {
			return "摘要长度不符合要求";
		} else if(p.getDetail() == null || p.getDetail().length()<2 || p.getDetail().length()>1000) {
			return "正文长度不符合要求";
		}
		return null;
	}

	@Override
	public int insertProduct(Product product) {
		
		if(productMapper.getProductNums() > 1000) {
			return 0;
		} else {
			productMapper.insertProduct(product);
			return product.getPid();
		}
	}

	@Override
	public void updateProduct(Product product) {
		// TODO Auto-generated method stub
		productMapper.updateProduct(product);
	}
}
