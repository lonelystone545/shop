package com.wy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wy.service.ProductService;

/**
 * 页面跳转
 * @author wy
 *
 */

@Controller
public class HomePageController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/")
	public String showIndex(HttpSession session, ModelMap map) {
		if("buyer".equals(session.getAttribute("username"))) {
			map.addAttribute("products", productService.getProductsForBuyer("buyer"));
		} else if("seller".equals(session.getAttribute("username"))) {
			map.addAttribute("products", productService.getProductsForSeller("seller"));
		} else {
			map.addAttribute("products", productService.getAllProducts());
		}
		return "index";
	}
	
	@RequestMapping(value="/unbought")
	public String showUbought(HttpSession session, ModelMap map) {
		//需检查session中内容是否过期
		if("buyer".equals(session.getAttribute("username"))) {
			map.addAttribute("products", productService.getUnboughtProducts("buyer"));
			return "unbought_index";
		}
		//重新发出请求 作为url进行处理
		return "forward:/";
	}
}

