package com.ourinfra.web.portal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/power")
public class PowerController {
	
	@Autowired
	private PowerService powerService;
	
	@RequestMapping(value="/")
	public String PowerList() {
		return "/power";
	}
}
