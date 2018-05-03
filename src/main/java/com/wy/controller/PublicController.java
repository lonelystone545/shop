package com.wy.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.wy.pojo.JsonResult;
import com.wy.pojo.Product;
import com.wy.service.ProductService;

@Controller
public class PublicController {
	
	@Autowired
	private ProductService productService;
	
	/**
	 * 发布商品
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/public")
	public String publicProduct(HttpSession session) {
		
		if("seller".equals(session.getAttribute("username"))) {
			return "public";
		} else {
			return "forward:/";
		}
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	@ResponseBody
	public JsonResult uploadFile(MultipartFile file, HttpSession session, HttpServletRequest request) {
		JsonResult jsonRes = new JsonResult();
		String path = session.getServletContext().getRealPath("/products");
		System.out.println(path);
		String root = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
		if(file == null || file.isEmpty()) {
			jsonRes.setMessage("文件不能为空");
		} else {
			String fileName = System.currentTimeMillis() + file.getOriginalFilename() ;
			String regex = ".*(.jpg|.JPG|.png|.PNG|.gif|.GIF|.bmp|.BMP|.jpeg|.JPEG)$";
//			if(fileName.endsWith("jpg") || fileName.endsWith("png") || fileName.endsWith("gif")
//					|| fileName.endsWith("bmp") || fileName.endsWith("jpeg")) {
			
			if(fileName.matches(regex)) {
				File newFile = new File(path, fileName);
				try {
					file.transferTo(newFile);
					String s = root +"/products/"+fileName;
					System.out.println("s: " + s);
					jsonRes.setCode(200);
					jsonRes.setResult(s);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				jsonRes.setMessage("格式错误");
			}
		}
		return jsonRes;
	}
	
	@RequestMapping(value="/publicSubmit", method=RequestMethod.POST)
	public String publicProduct(Product product, HttpSession session) {
		if(!"seller".equals(session.getAttribute("username"))) {
			return "forward:/login";
		}
		String message = productService.validateProduct(product);
		if(message != null) {
			session.setAttribute("error", message);
			return "public";
		} else {
			product.setSid(1);
			int pid = productService.insertProduct(product);
			if(pid == 0) {
				session.setAttribute("error", "商品记录信息已满，无法插入");
				return "public";
			} else {
				return "redirect:/publicSuccess?pid=" + pid;
			}
		}
	}
	
	@RequestMapping(value="/publicSuccess")
	public String publicSuccess(int pid, ModelMap map) {
		
		map.addAttribute("pid", pid);
		return "publicSuccess";
	}
	
}
