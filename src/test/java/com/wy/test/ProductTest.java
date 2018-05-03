package com.wy.test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wy.pojo.AccountItem;
import com.wy.pojo.BoughtProduct;
import com.wy.pojo.Product;
import com.wy.service.AccountService;
import com.wy.service.BuyService;
import com.wy.service.ProductService;

/**
 * 商品测试
 * @author wy
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring/applicationContext-*"})
public class ProductTest {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private BuyService buyService;
	
	@Test
	public void test1() {
		Product p = productService.findProductByPid(1);
		System.out.println(p.getPname());
	}
	
	@Test
	public void test2() {
		Product p = productService.findProductByPidForBuyer("buyer", 4);
		System.out.println(p.getDetail());
		System.out.println(p.getSummary());
		System.out.println(p.getBoughtPrice());
		System.out.println(p.getNums());
	}
	
	@Test
	public void test3() {
		List<AccountItem> list = accountService.showAccounts("buyer");
		for(AccountItem ai : list) {
			System.out.println(ai.getPname());
		}
	}
	
	@Test
	public void test4() {
		List<BoughtProduct> pros = new ArrayList<>();
		BoughtProduct bp = new BoughtProduct();
		bp.setId(1);
		bp.setNumber(2);
		bp.setPrice(100);
		pros.add(bp);
		BoughtProduct bp1 = new BoughtProduct();
		bp1.setId(1);
		bp1.setNumber(2);
		bp1.setPrice(200);
		pros.add(bp1);
		
		buyService.addOrders(pros, 2);
		
	}
}
