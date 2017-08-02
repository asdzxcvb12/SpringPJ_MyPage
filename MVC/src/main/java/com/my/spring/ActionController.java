package com.my.spring;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class ActionController {
	
	@RequestMapping(value="/testA", method=RequestMethod.GET)
	public String testA(Model model) {
		System.out.println("testA page is running");
		return "mypage/testA";
	}
	
	@RequestMapping(value="/testB", method=RequestMethod.GET)
	public String testB(Model model, @RequestParam("id") String id) {
		System.out.println("after");
		
		String param = "param";
		model.addAttribute(param, id);
		
		return "mypage/testB";
	}
}
