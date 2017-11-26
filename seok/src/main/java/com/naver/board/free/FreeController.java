package com.naver.board.free;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class FreeController {
	
	@RequestMapping("/free")
	public void free() {}
	
	
	@RequestMapping("/freeDetailForm.do")
	public void freeDetailForm() {}
	
	@RequestMapping("/freeDetail.do") 
	public String freeDetail() {
		
		return "redirect:/board/freeDetailForm.do";
	}
	
	
	
	
}
