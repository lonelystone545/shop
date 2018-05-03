package com.wy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wy.pojo.AccountItem;
import com.wy.service.AccountService;

/**
 * 账务
 * @author wy
 *
 */
@Controller
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
	@RequestMapping(value="/account")
	public String showAccount(HttpSession session, ModelMap map) {
		
		if("buyer".equals(session.getAttribute("username"))) {
			List<AccountItem> accounts = accountService.showAccounts("buyer");
			double total = 0;
			for(AccountItem ai : accounts) {
				double subtotal = ai.getNums() * ai.getPrice();
				ai.setSubtotal(subtotal);
				total += subtotal;
			}
			map.addAttribute("accountList", accountService.showAccounts("buyer"));
			map.addAttribute("totalPrice",total);
		}
		return "account";
	}
}
