package com.wy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wy.dao.BuyMapper;
import com.wy.pojo.BoughtProduct;
import com.wy.pojo.Orders;
import com.wy.pojo.Product;

@Service
public class BuyServiceImpl implements BuyService{
	
	@Autowired
	private BuyMapper buyMapper;

	@Override
	public void addOrders(List<BoughtProduct> pros, int id) {
		//订单总价
		double total = 0;
		for(BoughtProduct p : pros) {
			total += p.getPrice() * p.getNumber();
		}
		Orders order = new Orders(total,id);
		//插入订单表
		buyMapper.insertOrdersAndGetId(order);
		for(BoughtProduct p : pros) {
			p.setOid(order.getOid());
			buyMapper.insertOrderItem(p);
		}
	}
}
