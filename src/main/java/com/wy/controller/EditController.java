package com.wy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wy.pojo.Product;
import com.wy.service.ProductService;

@Controller
public class EditController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/edit")
	public String edit(int pid, HttpSession session, ModelMap map) {
		if("seller".equals(session.getAttribute("username"))) {
			map.addAttribute("product", productService.findProductByPid(pid));
			return "edit";
		} else {
			return "forward:/login";
		}
	}
	
	@RequestMapping(value="/editSubmit", method=RequestMethod.POST)
	public String editSub(Product product, HttpSession session, ModelMap map) {
		
		System.out.println("----------------------");
		if(!"seller".equals(session.getAttribute("username"))) {
			return "forward:/login";
		}
		String mes = productService.validateProduct(product);
		if(mes != null) {
			session.setAttribute("error", mes);
			map.addAttribute("product", product);
			return "edit";
		} else {
			productService.updateProduct(product);
			//使用重定向，防止表单重复提交
			return "redirect:/editSuccess?pid=" + product.getPid();
		}
	}
	
	@RequestMapping(value="/editSuccess")
	public String editSuccess(int pid, ModelMap map, HttpSession session) {
		if("seller".equals(session.getAttribute("username"))) {
			map.addAttribute("pid", pid);
			return "editSuccess";
		} else {
			return "forward:/login";
		}
	}
}
