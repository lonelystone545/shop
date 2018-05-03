package com.wy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wy.pojo.BoughtProduct;
import com.wy.pojo.JsonResult;
import com.wy.service.BuyService;

@Controller
public class BuyController {
	
	@Autowired
	private BuyService buyService;
	
	@RequestMapping(value="/buy", method=RequestMethod.POST)
	@ResponseBody
	public JsonResult buy(@RequestBody List<BoughtProduct> boughtProducts, HttpSession session) {
		JsonResult res = new JsonResult();
		if(boughtProducts == null || boughtProducts.isEmpty()) {
			res.setMessage("购物车为空!");
		} else if(!"buyer".equals(session.getAttribute("username"))) {
			res.setMessage("买家请登录");
		} else {
			buyService.addOrders(boughtProducts,1);
			res.setCode(200);
		}
		return res;
	}
}
