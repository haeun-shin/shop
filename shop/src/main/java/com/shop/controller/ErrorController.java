package com.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/error/*")
public class ErrorController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@GetMapping
	public String defaultError() {
		logger.info("default Error 발생");
		return "/error/default";
	}
	
	@GetMapping("/notFound")
	public String notFound() {
		logger.info("not Found Error 발생");
		return "/error/notFound";
	}
	
	@GetMapping("/serverError")
	public String serverError() {
		logger.info("server Error 발생");
		return "/error/serverError";
	}
}
