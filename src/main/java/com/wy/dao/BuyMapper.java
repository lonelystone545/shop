package com.wy.dao;

import com.wy.pojo.BoughtProduct;
import com.wy.pojo.Orders;

public interface BuyMapper {
	
	public void insertOrdersAndGetId(Orders order);
	
	public void insertOrderItem(BoughtProduct pro);
}
