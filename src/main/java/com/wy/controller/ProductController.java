package com.wy.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wy.pojo.JsonResult;
import com.wy.pojo.Product;
import com.wy.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/product_findByPid")
	public String showDetail(int pid, HttpSession session, ModelMap map) {
		//需要区分是否buyer,查询数据库不同
		if("buyer".equals(session.getAttribute("username"))) { 
			map.addAttribute("product", productService.findProductByPidForBuyer("buyer",pid));
		} else {
			map.addAttribute("product", productService.findProductByPid(pid));
		}
		return "product";
	}
	
	/**
	 * 删除功能实现
	 * @param id
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	@ResponseBody
	public JsonResult deleteProduct(int id, HttpSession session) {
		
		//这里需要事务
		if("seller".equals(session.getAttribute("username"))) {
			Product pro = productService.getProductByPid(id);
			String path = pro.getImage();
			if(path != null) {
				String realPath = session.getServletContext().getRealPath("/" + path);
				System.out.println(realPath);
				File file = new File(realPath);
				file.delete();
			}
			productService.deleteProduct(id);
			return new JsonResult(200);
		} else {
			return new JsonResult(500);
		}
		
	}
}
