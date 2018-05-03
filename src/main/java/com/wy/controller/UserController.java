package com.wy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wy.pojo.JsonResult;
import com.wy.pojo.User;
import com.wy.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * 登录跳转
	 * @return
	 */
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/validate", method=RequestMethod.POST)
	@ResponseBody
	public JsonResult validate(HttpSession session, User user) {
		//用户名 密码不能为空已通过前端js进行校验，否则不会提交表单
		//验证用户名 密码是否正确
		JsonResult loginRes = new JsonResult();
		String res = userService.validateUser(user);
		if(res != null) {
			loginRes.setMessage(res);
		} else {
			loginRes.setCode(200);
			loginRes.setMessage("登录成功");
			session.setAttribute("username", user.getUsername());
		}
		return loginRes;
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("username");
		session.invalidate();
		return "login";
	}
}
