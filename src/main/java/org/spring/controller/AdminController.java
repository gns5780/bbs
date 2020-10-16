package org.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Admin")
public class AdminController {
	
	@RequestMapping("/main")
	public String main() {
		System.out.println("admincontroller");
		return "admin_view/admin_main";
	}
}
