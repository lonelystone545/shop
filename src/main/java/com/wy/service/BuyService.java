package com.wy.service;

import java.util.List;

import com.wy.pojo.BoughtProduct;

/**
 * 订单服务
 * @author wy
 *
 */
public interface BuyService {
	
	public void addOrders(List<BoughtProduct> pros, int id);
}
