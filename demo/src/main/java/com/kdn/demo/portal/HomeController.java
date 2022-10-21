package com.kdn.demo.portal;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@Autowired
	private HomeService service;

	@RequestMapping(value="/")
	public String list(ModelMap map) {
		List<Map<String, Object>> productList = service.selectELCTMST();
		map.addAttribute("productList", productList);
		
		return "welcome";
	}
	
	@RequestMapping(value="/welcome")
	public String welcome() {
		return "welcome";
	}
}
