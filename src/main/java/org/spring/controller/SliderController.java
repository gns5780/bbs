package org.spring.controller;


import javax.annotation.Resource;

import org.spring.service.SliderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/Slider")
public class SliderController{
	@Resource
	private SliderService service;
	
	@RequestMapping("/insert")
	public String insert() {
		System.out.println("slider_insert");
		return "admin_view/slider";
	}
	@RequestMapping(value = "/insert",method = RequestMethod.POST)
	public String insert(MultipartFile mainslider1,MultipartFile mainslider2,MultipartFile mainslider3,MultipartFile mainslider4) {
		String main1 = mainslider1.getOriginalFilename();
		String main2 = mainslider2.getOriginalFilename();
		String main3 = mainslider3.getOriginalFilename();
		String main4 = mainslider4.getOriginalFilename();
		
		System.out.println(main1);
		System.out.println(main2);
		System.out.println(main3);
		System.out.println(main4);
		if(main1!="") service.mainsliderupload(1,mainslider1);
		if(main2!="") service.mainsliderupload(2,mainslider2);
		if(main3!="") service.mainsliderupload(3,mainslider3);
		if(main4!="") service.mainsliderupload(4,mainslider4);
		
		
		return "redirect:/Item/selectall";
	}
}