package com.wy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 购物车
 * @author wy
 *
 */
@Controller
public class ShoppingCartController {
	
	@RequestMapping(value="/shoppingcart")
	public String showShoppingcart() {
		return "shoppingcart";
	}
}
