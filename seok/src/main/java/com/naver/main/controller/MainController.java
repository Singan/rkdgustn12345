package com.naver.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {

	@RequestMapping("/main.do")
	public void main() {}
	
	@RequestMapping("/chatMove.do")
	public void chat() {}
}
